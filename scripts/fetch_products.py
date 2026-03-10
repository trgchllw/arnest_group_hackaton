#!/usr/bin/env python3
"""Fetch cosmetic products from Open Beauty Facts and generate SQL for Supabase."""

import json
import urllib.request
import urllib.parse
import sys

OBF_URL = "https://world.openbeautyfacts.org/cgi/search.pl"

# Arnest brands first, then other Russian/international cosmetics
BRANDS = [
    "deonica", "menzone", "dockland", "dock land", "prelest", "прелесть",
    "natura siberica", "organic shop", "eveline", "loreal", "garnier",
    "nivea", "rexona", "axe", "dove", "schauma", "head shoulders",
    "чистая линия", "black pearl", "librederm", "floresan"
]

def fetch_brand(brand, page=1):
    params = {
        "action": "process",
        "tagtype_0": "brands",
        "tag_contains_0": "contains",
        "tag_0": brand,
        "json": 1,
        "page_size": 100,
        "page": page
    }
    url = OBF_URL + "?" + urllib.parse.urlencode(params, encoding="utf-8")
    try:
        with urllib.request.urlopen(url, timeout=15) as r:
            return json.loads(r.read().decode())
    except Exception as e:
        print(f"Error fetching {brand}: {e}", file=sys.stderr)
        return {"products": []}

def valid_barcode(code):
    if not code or not isinstance(code, str):
        return False
    # EAN-8 (8 digits) or EAN-13 (13 digits)
    if len(code) not in (8, 13) or not code.isdigit():
        return False
    return True

def main():
    seen = set()
    products = []
    
    for brand in BRANDS:
        for page in range(1, 4):  # up to 3 pages per brand
            data = fetch_brand(brand, page)
            prods = data.get("products", [])
            if not prods:
                break
            for p in prods:
                code = p.get("code", "")
                if not valid_barcode(code) or code in seen:
                    continue
                seen.add(code)
                name = (p.get("product_name_ru") or p.get("product_name") or 
                        p.get("product_name_en") or "Косметический продукт")
                ing = (p.get("ingredients_text_ru") or p.get("ingredients_text") or 
                       p.get("ingredients_text_en") or "")
                # Escape for SQL
                name = name.replace("'", "''")[:200]
                ing = ing.replace("'", "''")[:1500] if ing else ""
                products.append((code, name, ing))
    
    # Add extra Arnest barcodes from known patterns (46001*, 46602*, etc.)
    # Deonica for men Невидимый from OBF - 4600104033407
    extra_arnest = [
        "4600104033407",  # Deonica for men антиперспирант Невидимый
    ]
    for code in extra_arnest:
        if code not in seen:
            seen.add(code)
            products.insert(0, (code, "Deonica for men антиперспирант Невидимый 50мл", 
                "Aqua, Aluminum Chlorohydrate, Steareth-21, PPG-15 Stearyl Ether, Bisabolol, Talc, Parfum, Tetrasodium EDTA, Hydroxyisohexyl 3-cyclohexene Carboxaldehyde, Limonene, Linalool, Coumarine, Citronellol, Citral, Hydroxycitronellal"))
    
    print(f"-- Generated {len(products)} products from Open Beauty Facts")
    print("-- Run this AFTER import_to_supabase.sql (products table must exist)")
    print()
    print("INSERT INTO products (barcode, product_name, ingredients) VALUES")
    rows = []
    for code, name, ing in products[:300]:  # Limit to 300 new
        ing_val = f"'{ing}'" if ing else "NULL"
        rows.append(f"  ('{code}', '{name}', {ing_val})")
    print(",\n".join(rows))
    print("""
ON CONFLICT (barcode) DO UPDATE SET
  product_name = COALESCE(EXCLUDED.product_name, products.product_name),
  ingredients = COALESCE(EXCLUDED.ingredients, products.ingredients);
""")

if __name__ == "__main__":
    main()
