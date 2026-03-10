#!/bin/bash
# Fetch cosmetic products from Open Beauty Facts and generate SQL
# Uses curl (works without SSL issues)

OBF="https://world.openbeautyfacts.org/cgi/search.pl"
OUT="/tmp/obf_products.json"


# Fetch each brand - ARNEST FIRST (deonica, dockland), then others
mkdir -p /tmp/obf_fetch
cd /tmp/obf_fetch
i=0
for brand in "deonica" "dockland" "dock%20land" "menzone" "prelest" "natura%20siberica" "organic%20shop" "eveline" "loreal" "garnier" "nivea" "rexona" "dove" "schauma" "head%20shoulders"; do
  curl -s "https://world.openbeautyfacts.org/cgi/search.pl?action=process&tagtype_0=brands&tag_contains_0=contains&tag_0=${brand}&json=1&page_size=100" -o "brand_${i}.json"
  i=$((i+1))
done

python3 << 'PYEOF'
import json
import glob
import os

os.chdir("/tmp/obf_fetch")
products = []
seen = set()

for path in sorted(glob.glob("brand_*.json")):
    try:
        with open(path) as f:
            data = json.load(f)
    except:
        continue
    for prod in data.get("products", []):
            code = prod.get("code", "")
            if not code or len(code) not in (8, 13) or not code.isdigit() or code in seen:
                continue
            seen.add(code)
            name = prod.get("product_name_ru") or prod.get("product_name") or prod.get("product_name_en") or "Косметика"
            ing = prod.get("ingredients_text_ru") or prod.get("ingredients_text") or prod.get("ingredients_text_en") or ""
            name = name.replace("'", "''").replace("\\", "\\\\").replace("\n", " ").replace("\r", " ")[:200]
            ing = ing.replace("'", "''").replace("\\", "\\\\").replace("\n", " ").replace("\r", " ")[:1500] if ing else ""
            products.append((code, name, ing))

# Add Arnest products explicitly (OBF has few)
arnest_extra = [
    ("4600104033407", "Deonica for men антиперспирант Невидимый 50мл", "Aqua, Aluminum Chlorohydrate, Steareth-21, PPG-15 Stearyl Ether, Bisabolol, Talc, Parfum, Tetrasodium EDTA, Hydroxyisohexyl 3-cyclohexene Carboxaldehyde, Limonene, Linalool, Coumarine, Citronellol, Citral, Hydroxycitronellal"),
]
for code, name, ing in arnest_extra:
    if code not in seen:
        seen.add(code)
        products.insert(0, (code, name, ing))

print(f"-- {len(products)} cosmetic products from Open Beauty Facts + Arnest")
print("-- Run after import_to_supabase.sql")
print("")
print("INSERT INTO products (barcode, product_name, ingredients) VALUES")
rows = []
for code, name, ing in products[:300]:
    ing_val = f"'{ing}'" if ing else "NULL"
    rows.append(f"  ('{code}', '{name}', {ing_val})")
print(",\n".join(rows))
print("""
ON CONFLICT (barcode) DO UPDATE SET
  product_name = COALESCE(EXCLUDED.product_name, products.product_name),
  ingredients = COALESCE(EXCLUDED.ingredients, products.ingredients);
""")
PYEOF
