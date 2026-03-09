-- Add product_name and ingredients columns to products table
ALTER TABLE products ADD COLUMN IF NOT EXISTS product_name TEXT;
ALTER TABLE products ADD COLUMN IF NOT EXISTS ingredients TEXT;

-- ======================== DEONICA ANTIPERSPIRANTS ========================

UPDATE products SET product_name='Deonica Яркий Микс антиперспирант спрей 150мл',
ingredients='Isobutane, Propane, Isododecane, Butane, Aluminum Chlorohydrate, C12-15 Alkyl Benzoate, Parfum, Disteardimonium Hectorite, Triethyl Citrate, Propylene Carbonate, Bisabolol, Panthenol, Tocopheryl Acetate'
WHERE barcode='4660222726278';

UPDATE products SET product_name='Deonica Яркий Микс антиперспирант спрей 150мл (вариант)',
ingredients='Isobutane, Propane, Isododecane, Butane, Aluminum Chlorohydrate, C12-15 Alkyl Benzoate, Parfum, Disteardimonium Hectorite, Triethyl Citrate, Propylene Carbonate, Bisabolol, Panthenol, Tocopheryl Acetate'
WHERE barcode='4660222726292';

UPDATE products SET product_name='Deonica Гипоаллергенный антиперспирант спрей 200мл',
ingredients='Isobutane, Cyclopentasiloxane, Aluminum Chlorohydrate, Allantoin, Butane, Propane, Triethyl Citrate, C12-15 Alkyl Benzoate, PPG-14 Butyl Ether, Squalane, Disteardimonium Hectorite, Dimethicone, Dimethiconol, Bisabolol, Propylene Carbonate'
WHERE barcode='4600104029837';

UPDATE products SET product_name='Deonica Невидимый антиперспирант спрей 200мл',
ingredients='Isobutane, Cyclopentasiloxane, Aluminum Chlorohydrate, Butane, Propane, Triethyl Citrate, C12-15 Alkyl Benzoate, PPG-14 Butyl Ether, Disteardimonium Hectorite, Dimethicone, Dimethiconol, Bisabolol, Parfum, Propylene Carbonate, Citronellol, Linalool, Limonene, Butylphenyl Methylpropional'
WHERE barcode='4600104029844';

UPDATE products SET product_name='Deonica Nature Protection for men антиперспирант спрей 200мл',
ingredients='Isobutane, Aqua, Cyclopentasiloxane, PEG/PPG-18/18 Dimethicone, Butane, Propane, Potassium Alum, Triethyl Citrate, Tocopheryl Acetate, Parfum, Limonene, Linalool, Citral'
WHERE barcode='4600104030079';

UPDATE products SET product_name='Deonica Nature Protection for men антиперспирант ролик 50мл',
ingredients='Aqua, Potassium Alum, Steareth-2, Glycerin, Steareth-21, PPG-15 Stearyl Ether, Phenoxyethanol, Ethylhexylglycerine, C12-13 Alkyl Lactate, Parfum, Aluminum Starch Octenylsuccinate, Aloe Barbadensis Leaf Extract'
WHERE barcode='4600104030086';

UPDATE products SET product_name='Deonica Нежность Шелка антиперспирант спрей 200мл',
ingredients='Isobutane, Cyclopentasiloxane, Aluminum Chlorohydrate, Propane, Butane, Triethyl Citrate, C12-15 Alkyl Benzoate, PPG-14 Butyl Ether, Caprylic/Capric Triglyceride, Parfum, Disteardimonium Hectorite, Dimethicone, Dimethiconol, Bisabolol, Propylene Carbonate, Serenoa Serrulata Fruit Extract, Epilobium Angustifolium Extract, Cucurbita Pepo Seed Extract'
WHERE barcode='4600104033704';

-- ======================== DEONICA OTHER VARIANTS ========================

UPDATE products SET product_name='Deonica ОН&ОНА антиперспирант аэрозоль 200мл',
ingredients='Isobutane, Cyclopentasiloxane, Aluminum Chlorohydrate, Allantoin, Butane, Propane, PPG-14 Butyl Ether, C12-15 Alkyl Benzoate, Disteardimonium Hectorite, Dimethicone, Dimethiconol, Squalane, Bisabolol, Propylene Carbonate'
WHERE barcode='4600104033520';

UPDATE products SET product_name='Deonica PRO-Защита антиперспирант спрей 200мл',
ingredients='Isobutane, Cyclopentasiloxane, Aluminum Chlorohydrate, Butane, Propane, Triethyl Citrate, C12-15 Alkyl Benzoate, PPG-14 Butyl Ether, Disteardimonium Hectorite, Dimethicone, Dimethiconol, Bisabolol, Parfum, Propylene Carbonate, Hydroxyisohexyl 3-Cyclohexene Carboxaldehyde, Butylphenyl Methylpropional, Linalool, Citronellol, Benzyl Salicylate'
WHERE barcode='4600104033537';

UPDATE products SET product_name='Deonica Антибактериальный эффект антиперспирант спрей 200мл',
ingredients='Isobutane, Cyclopentasiloxane, Aluminum Chlorohydrate, Butane, Propane, C12-15 Alkyl Benzoate, PPG-14 Butyl Ether, Parfum, Disteardimonium Hectorite, Dimethicone, Dimethiconol, Bisabolol, Propylene Carbonate, 2-Methyl 5-Cyclohexylpentanol, Hexyl Cinnamal, Linalool, Butylphenyl Methylpropional, Benzyl Salicylate'
WHERE barcode='4600104037016';

UPDATE products SET product_name='Deonica Pre-Biotic Эффект антиперспирант спрей 200мл',
ingredients='Isobutane, Butane, Aqua, Aluminum Chlorohydrate, Propane, Cyclopentasiloxane, PEG/PPG-18/18 Dimethicone, Triethyl Citrate, Parfum, Lactobacillus Extract Filtrate, Propylene Glycol, BHT, Butylphenyl Methylpropional, Alpha-Isomethyl-Ionone'
WHERE barcode='4600104035067';

-- ======================== DEONICA TEENS / VEGAN ========================

UPDATE products SET product_name='Deonica For Teens дезодорант спрей',
ingredients='Isobutane, Propane, Isododecane, Butane, Aluminum Chlorohydrate, C12-15 Alkyl Benzoate, Parfum, Disteardimonium Hectorite, Triethyl Citrate, Propylene Carbonate, Bisabolol, Panthenol, Tocopheryl Acetate'
WHERE barcode='4660222726964';

UPDATE products SET product_name='Deonica For Teens дезодорант спрей (вариант 2)',
ingredients='Isobutane, Propane, Isododecane, Butane, Aluminum Chlorohydrate, C12-15 Alkyl Benzoate, Parfum, Disteardimonium Hectorite, Triethyl Citrate, Propylene Carbonate, Bisabolol, Panthenol, Tocopheryl Acetate'
WHERE barcode='4660222726940';

UPDATE products SET product_name='Deonica For Teens дезодорант спрей (вариант 3)',
ingredients='Isobutane, Propane, Isododecane, Butane, Aluminum Chlorohydrate, C12-15 Alkyl Benzoate, Parfum, Disteardimonium Hectorite, Triethyl Citrate, Propylene Carbonate, Bisabolol, Panthenol, Tocopheryl Acetate'
WHERE barcode='4660222726841';

UPDATE products SET product_name='Deonica For Teens дезодорант спрей (вариант 4)',
ingredients='Isobutane, Propane, Isododecane, Butane, Aluminum Chlorohydrate, C12-15 Alkyl Benzoate, Parfum, Disteardimonium Hectorite, Triethyl Citrate, Propylene Carbonate, Bisabolol, Panthenol, Tocopheryl Acetate'
WHERE barcode='4660222726957';

UPDATE products SET product_name='Deonica Vegan Formula дезодорант спрей 150мл',
ingredients='Isobutane, Propane, Isododecane, Butane, Aluminum Chlorohydrate, C12-15 Alkyl Benzoate, Parfum, Disteardimonium Hectorite, Triethyl Citrate, Propylene Carbonate, Bisabolol, Panthenol, Tocopheryl Acetate'
WHERE barcode='4660222720849';

UPDATE products SET product_name='Deonica дезодорант спрей',
ingredients='Isobutane, Propane, Isododecane, Butane, Aluminum Chlorohydrate, C12-15 Alkyl Benzoate, Parfum, Disteardimonium Hectorite, Triethyl Citrate, Propylene Carbonate, Bisabolol, Panthenol, Tocopheryl Acetate'
WHERE barcode='4660222722072';

UPDATE products SET product_name='Deonica антиперспирант спрей',
ingredients='Isobutane, Cyclopentasiloxane, Aluminum Chlorohydrate, Butane, Propane, Triethyl Citrate, C12-15 Alkyl Benzoate, PPG-14 Butyl Ether, Disteardimonium Hectorite, Dimethicone, Dimethiconol, Bisabolol, Parfum, Propylene Carbonate'
WHERE barcode='4660222727817';

UPDATE products SET product_name='Deonica for men антиперспирант 5 Protection спрей 200мл',
ingredients='Isobutane, Aluminum Chlorohydrate, Aqua, Propylene Glycol, PEG/PPG-18/18 Dimethicone, Butane, Propane, Cyclopentasiloxane, Phenoxyethanol, 2-Methyl 5-Cyclohexylpentanol, Parfum, Citronellol, Linalool, Limonene, Butylphenyl Methylpropional, Alpha-Isomethyl-Ionone, Benzyl Benzoate, Citral, Coumarin'
WHERE barcode='4600104030802';

UPDATE products SET product_name='Deonica for men Активная защита антиперспирант ролик 200мл',
ingredients='Aqua, Aluminum Zirconium Trichlorohydrex Gly, Steareth-2, Steareth-21, PPG-15 Stearyl Ether, Triethyl Citrate, Bisabolol, Talc, Parfum, Tetrasodium EDTA, Alpha-Isomethyl Ionone'
WHERE barcode='4600104031335';

UPDATE products SET product_name='Deonica for men Активная защита антиперспирант ролик 50мл',
ingredients='Aqua, Aluminum Zirconium Trichlorohydrex Gly, Steareth-2, Steareth-21, PPG-15 Stearyl Ether, Triethyl Citrate, Bisabolol, Talc, Parfum, Tetrasodium EDTA, Alpha-Isomethyl Ionone'
WHERE barcode='4600104031328';

UPDATE products SET product_name='Deonica for men Антибактериальный эффект антиперспирант спрей 200мл',
ingredients='Isobutane, Cyclopentasiloxane, Aluminum Chlorohydrate, Butane, Propane, C12-15 Alkyl Benzoate, PPG-14 Butyl Ether, Parfum, Disteardimonium Hectorite, Dimethicone, Dimethiconol, Bisabolol, Propylene Carbonate, 2-Methyl 5-Cyclohexylpentanol, Hexyl Cinnamal, Linalool, Butylphenyl Methylpropional, Benzyl Salicylate'
WHERE barcode='4600104032714';

UPDATE products SET product_name='Deonica дезодорант спрей',
ingredients='Isobutane, Propane, Isododecane, Butane, Aluminum Chlorohydrate, C12-15 Alkyl Benzoate, Parfum, Disteardimonium Hectorite, Triethyl Citrate, Propylene Carbonate, Bisabolol, Panthenol, Tocopheryl Acetate'
WHERE barcode='4660222721891';

UPDATE products SET product_name='Deonica дезодорант спрей',
ingredients='Isobutane, Propane, Isododecane, Butane, Aluminum Chlorohydrate, C12-15 Alkyl Benzoate, Parfum, Disteardimonium Hectorite, Triethyl Citrate, Propylene Carbonate, Bisabolol, Panthenol, Tocopheryl Acetate'
WHERE barcode='4660222722430';

-- ======================== MENZONE SHAVING & ANTIPERSPIRANTS ========================

UPDATE products SET product_name='Menzone Fast Repair гель для бритья 200мл',
ingredients='Aqua, Triethanolamine, Stearic Acid, Palmitic Acid, Oleth-20, Isopentane, Cocamide DEA, Laureth-23, Glycerin, Glycereth-26, Isobutane, Propylene Glycol, Parfum, Mineral Oil, Hydroxyethylcellulose, Sorbitol, Polyquaternium-7, Allantoin, PEG-90M, D-Limonene, Linalool, Hexyl Cinnamal'
WHERE barcode='4600104029370';

UPDATE products SET product_name='Menzone Energy Shot гель для бритья 200мл',
ingredients='Aqua, Triethanolamine, Stearic Acid, Palmitic Acid, Oleth-20, Isopentane, Cocamide DEA, Laureth-23, Glycerin, Glycereth-26, Isobutane, Propylene Glycol, Parfum, Mineral Oil, Hydroxyethylcellulose, Sorbitol, Polyquaternium-7, Allantoin, PEG-90M, Menthol, D-Limonene, Linalool'
WHERE barcode='4600104029363';

UPDATE products SET product_name='Menzone Fast Repair пена для бритья 200мл',
ingredients='Aqua, Triethanolamine, Isobutane, Stearic Acid, Glycerin, Palmitic Acid, Laureth-23, Propane, Polyquaternium-7, Propylene Glycol, Cocamide MEA, Isopropyl Myristate, Parfum, Allantoin, Benzyl Alcohol, PEG-90M, Butane, Hexyl Cinnamal, Limonene, Linalool'
WHERE barcode='4600104029400';

UPDATE products SET product_name='Menzone пена для бритья 200мл',
ingredients='Aqua, Triethanolamine, Isobutane, Stearic Acid, Glycerin, Palmitic Acid, Laureth-23, Propane, Polyquaternium-7, Propylene Glycol, Cocamide MEA, Isopropyl Myristate, Parfum, Allantoin, Benzyl Alcohol, PEG-90M, Butane, Hexyl Cinnamal, Limonene, Linalool'
WHERE barcode='4600104029394';

UPDATE products SET product_name='Menzone Fast Repair антиперспирант спрей',
ingredients='Isobutane, Aluminum Chlorohydrate, Aqua, Propylene Glycol, PEG/PPG-18/18 Dimethicone, Butane, Propane, Cyclopentasiloxane, Phenoxyethanol, Parfum, Citronellol, Linalool, Limonene'
WHERE barcode='4600104030116';

UPDATE products SET product_name='Menzone Fast Repair антиперспирант 60мл',
ingredients='Isobutane, Aluminum Chlorohydrate, Aqua, Propylene Glycol, PEG/PPG-18/18 Dimethicone, Butane, Propane, Cyclopentasiloxane, Phenoxyethanol, Parfum, Citronellol, Linalool, Limonene'
WHERE barcode='4600104029660';

UPDATE products SET product_name='Menzone Fast Repair бальзам после бритья',
ingredients='Aqua, Ethylhexyl Cocoate, Ethylhexyl Palmitate, Glycerin, Cyclopentasiloxane, Cetearyl Alcohol, Hydroxyethylurea, Glyceryl Stearate, Simmondsia Chinensis Seed Oil, Ceteareth-20, Phenoxyethanol, Ethylhexylglycerin, Panthenol, Allantoin, Propylene Glycol, Parfum, Beeswax, Carbomer, Sodium Hydroxide'
WHERE barcode='4600104029707';

UPDATE products SET product_name='Menzone Макс Свежесть антиперспирант 160мл',
ingredients='Isobutane, Aluminum Chlorohydrate, Aqua, Propylene Glycol, PEG/PPG-18/18 Dimethicone, Butane, Propane, Cyclopentasiloxane, Phenoxyethanol, Parfum, Menthol, Citronellol, Linalool, Limonene'
WHERE barcode='4600104030109';

UPDATE products SET product_name='Menzone Energy Shot антиперспирант 60мл',
ingredients='Isobutane, Aluminum Chlorohydrate, Aqua, Propylene Glycol, PEG/PPG-18/18 Dimethicone, Butane, Propane, Cyclopentasiloxane, Phenoxyethanol, Parfum, Citronellol, Linalool, Limonene'
WHERE barcode='4600104029677';

UPDATE products SET product_name='Menzone Energy Shot лосьон после бритья',
ingredients='Aqua, Alcohol Denat., Glycerin, Propylene Glycol, Parfum, Panthenol, Allantoin, Menthol, Tocopheryl Acetate, Citronellol, Linalool, Limonene'
WHERE barcode='4600104029714';

UPDATE products SET product_name='Deonica for men гель для бритья Мегасвежесть',
ingredients='Aqua, Triethanolamine, Stearic Acid, Palmitic Acid, Oleth-20, Isopentane, Cocamide DEA, Laureth-23, Glycerin, Glycereth-26, Isobutane, Propylene Glycol, Parfum, Mineral Oil, Hydroxyethylcellulose, Sorbitol, Polyquaternium-7, Allantoin, PEG-90M, Menthol, D-Limonene, Linalool'
WHERE barcode='4600104026140';

UPDATE products SET product_name='Deonica for men гель для бритья Экстразащита',
ingredients='Aqua, Triethanolamine, Stearic Acid, Palmitic Acid, Oleth-20, Isopentane, Cocamide DEA, Laureth-23, Glycerin, Glycereth-26, Isobutane, Propylene Glycol, Parfum, Mineral Oil, Hydroxyethylcellulose, Sorbitol, Polyquaternium-7, Allantoin, PEG-90M, D-Limonene, Linalool'
WHERE barcode='4600104026164';

UPDATE products SET product_name='Deonica for men гель для бритья Ультракомфорт',
ingredients='Aqua, Triethanolamine, Stearic Acid, Palmitic Acid, Oleth-20, Isopentane, Cocamide DEA, Laureth-23, Glycerin, Glycereth-26, Isobutane, Propylene Glycol, Parfum, Mineral Oil, Hydroxyethylcellulose, Sorbitol, Polyquaternium-7, Aloe Barbadensis Leaf Extract, Allantoin, PEG-90M, Hexyl Cinnamal, Limonene, Linalool'
WHERE barcode='4600104023774';

-- ======================== DOCK LAND ========================

UPDATE products SET product_name='Dock Land Aqua гель для бритья 200мл',
ingredients='Aqua, Triethanolamine, Stearic Acid, Palmitic Acid, Oleth-20, Isopentane, Cocamide DEA, Laureth-23, Glycerin, Glycereth-26, Isobutane, Propylene Glycol, Parfum, Mineral Oil, Hydroxyethylcellulose, Sorbitol, Polyquaternium-7, Allantoin, PEG-90M, D-Limonene, Linalool, Hexyl Cinnamal'
WHERE barcode='8018067007469';

UPDATE products SET product_name='Dock Land Aqua пена для бритья 200мл',
ingredients='Aqua, Triethanolamine, Isobutane, Stearic Acid, Glycerin, Palmitic Acid, Laureth-23, Propane, Polyquaternium-7, Propylene Glycol, Cocamide MEA, Isopropyl Myristate, Parfum, Allantoin, Benzyl Alcohol, PEG-90M, Butane, Hexyl Cinnamal, Limonene, Linalool'
WHERE barcode='8018067007452';

UPDATE products SET product_name='Dock Land Regular дезодорант спрей 150мл',
ingredients='Isobutane, Propane, Isododecane, Butane, Aluminum Chlorohydrate, C12-15 Alkyl Benzoate, Parfum, Disteardimonium Hectorite, Triethyl Citrate, Propylene Carbonate, Bisabolol, Panthenol, Tocopheryl Acetate'
WHERE barcode='4650056498878';

UPDATE products SET product_name='Dock Land гель для бритья',
ingredients='Aqua, Triethanolamine, Stearic Acid, Palmitic Acid, Oleth-20, Isopentane, Cocamide DEA, Laureth-23, Glycerin, Glycereth-26, Isobutane, Propylene Glycol, Parfum, Mineral Oil, Hydroxyethylcellulose, Sorbitol, Polyquaternium-7, Allantoin, PEG-90M, D-Limonene, Linalool, Hexyl Cinnamal'
WHERE barcode='8018067007681';

UPDATE products SET product_name='Dock Land пена для бритья',
ingredients='Aqua, Triethanolamine, Isobutane, Stearic Acid, Glycerin, Palmitic Acid, Laureth-23, Propane, Polyquaternium-7, Propylene Glycol, Cocamide MEA, Isopropyl Myristate, Parfum, Allantoin, Benzyl Alcohol, PEG-90M, Butane, Hexyl Cinnamal, Limonene, Linalool'
WHERE barcode='8018067007667';

UPDATE products SET product_name='Dock Land бальзам после бритья',
ingredients='Aqua, Ethylhexyl Cocoate, Ethylhexyl Palmitate, Glycerin, Cyclopentasiloxane, Cetearyl Alcohol, Hydroxyethylurea, Glyceryl Stearate, Ceteareth-20, Phenoxyethanol, Ethylhexylglycerin, Panthenol, Allantoin, Propylene Glycol, Parfum, Beeswax, Carbomer, Sodium Hydroxide'
WHERE barcode='8018067007674';

UPDATE products SET product_name='Dock Land лосьон после бритья',
ingredients='Aqua, Alcohol Denat., Glycerin, Propylene Glycol, Parfum, Panthenol, Allantoin, Menthol, Tocopheryl Acetate, Citronellol, Linalool, Limonene'
WHERE barcode='8018067007650';

-- ======================== ПРЕЛЕСТЬ HAIR PRODUCTS ========================

UPDATE products SET product_name='Прелесть PRO мусс "Эффект памяти" с.с.ф.',
ingredients='Aqua, Isobutane, VP/VA Copolymer, Polyquaternium-16, Propane, Butane, Sodium Benzoate, Panthenol, Propylene Glycol, PEG-40 Hydrogenated Castor Oil, Amodimethicone, Trideceth-12, Cetrimonium Chloride, Benzophenone-4, Punica Granatum Fruit Extract, Cereus Grandiflorus Flower Extract, Camellia Sinensis Leaf Extract, Vitis Vinifera Seed Oil, Prunus Amygdalus Dulcis Extract, Bambusa Vulgaris Extract, Parfum, Limonene, Linalool, Butylphenyl Methylpropional'
WHERE barcode='4600104028687';

UPDATE products SET product_name='Прелесть лак для волос "С эффектом памяти"',
ingredients='Alcohol Denat., Isobutane, VA/Crotonates Copolymer, Propane, Butane, Aminomethyl Propanol, Panthenol, Benzophenone-4, Parfum, Limonene, Linalool'
WHERE barcode='4600104027475';

UPDATE products SET product_name='Прелесть PRO спрей-трансформер "Эффект памяти" с.ф.',
ingredients='Aqua, Isobutane, VP/VA Copolymer, Polyquaternium-16, Propane, Butane, Sodium Benzoate, Panthenol, Propylene Glycol, PEG-40 Hydrogenated Castor Oil, Amodimethicone, Trideceth-12, Cetrimonium Chloride, Benzophenone-4, Parfum, Limonene, Linalool'
WHERE barcode='4600104027499';

UPDATE products SET product_name='Прелесть PRO лак "Кератинотерапия Expert Collection" э.с.ф.',
ingredients='Alcohol Denat., Isobutane, VA/Crotonates Copolymer, Propane, Butane, Aminomethyl Propanol, Panthenol, Hydrolyzed Keratin, Benzophenone-4, Parfum, Limonene, Linalool'
WHERE barcode='4600104028878';

UPDATE products SET product_name='Прелесть PRO мусс "Кератинотерапия Expert Collection" э.с.ф.',
ingredients='Aqua, Isobutane, VP/VA Copolymer, Polyquaternium-16, Propane, Butane, Sodium Benzoate, Panthenol, Propylene Glycol, PEG-40 Hydrogenated Castor Oil, Hydrolyzed Keratin, Amodimethicone, Trideceth-12, Cetrimonium Chloride, Benzophenone-4, Parfum, Limonene, Linalool'
WHERE barcode='4600104028885';

UPDATE products SET product_name='Прелесть PRO спрей-лак "Кератинотерапия" с.ф.',
ingredients='Aqua, Isobutane, VP/VA Copolymer, Polyquaternium-16, Propane, Butane, Sodium Benzoate, Panthenol, Propylene Glycol, Hydrolyzed Keratin, Benzophenone-4, Parfum, Limonene, Linalool'
WHERE barcode='4600104029776';

UPDATE products SET product_name='Прелесть PRO лак "Эффект ламинирования" э.с.ф. 300мл',
ingredients='Alcohol Denat., Isobutane, VA/Crotonates Copolymer, Propane, Butane, Aminomethyl Propanol, Panthenol, Benzophenone-4, Vitis Vinifera Seed Oil, Parfum, Limonene, Linalool'
WHERE barcode='4600104027123';

UPDATE products SET product_name='Прелесть БИО мусс Жизненная сила зеленый чай с.ф. 160мл',
ingredients='Aqua, Isobutane, VP/VA Copolymer, Propane, Butane, Sodium Benzoate, Panthenol, Propylene Glycol, PEG-40 Hydrogenated Castor Oil, Camellia Sinensis Leaf Extract, Parfum, Limonene, Linalool'
WHERE barcode='4600104020414';

UPDATE products SET product_name='Прелесть БИО мусс Природный блеск с.ф. 160мл',
ingredients='Aqua, Isobutane, VP/VA Copolymer, Propane, Butane, Sodium Benzoate, Panthenol, Propylene Glycol, PEG-40 Hydrogenated Castor Oil, Parfum, Limonene, Linalool'
WHERE barcode='4600104020407';

UPDATE products SET product_name='Прелесть БИО лак для волос Морские минералы 210мл',
ingredients='Alcohol Denat., Isobutane, VA/Crotonates Copolymer, Propane, Butane, Aminomethyl Propanol, Panthenol, Benzophenone-4, Maris Sal, Parfum, Limonene, Linalool'
WHERE barcode='4600104020391';

UPDATE products SET product_name='Прелесть БИО мусс Морские минералы с.с.ф. 160мл',
ingredients='Aqua, Isobutane, VP/VA Copolymer, Propane, Butane, Sodium Benzoate, Panthenol, Propylene Glycol, PEG-40 Hydrogenated Castor Oil, Maris Sal, Parfum, Limonene, Linalool'
WHERE barcode='4600104020339';

UPDATE products SET product_name='Прелесть БИО лак Жизненная сила зеленый чай с.ф. 160мл',
ingredients='Alcohol Denat., Isobutane, VA/Crotonates Copolymer, Propane, Butane, Aminomethyl Propanol, Panthenol, Benzophenone-4, Camellia Sinensis Leaf Extract, Parfum, Limonene, Linalool'
WHERE barcode='4600104020360';

UPDATE products SET product_name='Прелесть БИО гель для волос Жизненная сила с.ф. 250мл',
ingredients='Aqua, VP/VA Copolymer, Carbomer, Triethanolamine, Panthenol, Propylene Glycol, PEG-40 Hydrogenated Castor Oil, Camellia Sinensis Leaf Extract, Phenoxyethanol, Ethylhexylglycerin, Parfum, Limonene, Linalool'
WHERE barcode='4600104020827';

UPDATE products SET product_name='Прелесть Классик лак экстракт женьшеня с.ф. 200мл',
ingredients='Alcohol Denat., Isobutane, VA/Crotonates Copolymer, Propane, Butane, Aminomethyl Propanol, Panthenol, Benzophenone-4, Panax Ginseng Root Extract, Parfum'
WHERE barcode='4600104004698';

UPDATE products SET product_name='Прелесть Классик лак экстракт женьшеня UV-фильтр 200мл',
ingredients='Alcohol Denat., Isobutane, VA/Crotonates Copolymer, Propane, Butane, Aminomethyl Propanol, Panthenol, Benzophenone-4, Panax Ginseng Root Extract, Parfum'
WHERE barcode='4600104004704';

UPDATE products SET product_name='Прелесть Классик мусс с.ф. 200мл',
ingredients='Aqua, Isobutane, VP/VA Copolymer, Propane, Butane, Sodium Benzoate, Panthenol, Propylene Glycol, PEG-40 Hydrogenated Castor Oil, Parfum, Limonene, Linalool'
WHERE barcode='4600104004728';

UPDATE products SET product_name='Прелесть мусс для укладки волос с.с.ф.',
ingredients='Aqua, Isobutane, VP/VA Copolymer, Propane, Butane, Sodium Benzoate, Panthenol, Propylene Glycol, PEG-40 Hydrogenated Castor Oil, Parfum, Limonene, Linalool'
WHERE barcode='4600104008634';

UPDATE products SET product_name='Прелесть лак для волос 200мл',
ingredients='Alcohol Denat., Isobutane, VA/Crotonates Copolymer, Propane, Butane, Aminomethyl Propanol, Panthenol, Benzophenone-4, Parfum'
WHERE barcode='4600104031984';

UPDATE products SET product_name='Прелесть лак для волос 160мл',
ingredients='Alcohol Denat., Isobutane, VA/Crotonates Copolymer, Propane, Butane, Aminomethyl Propanol, Panthenol, Benzophenone-4, Parfum'
WHERE barcode='4600104010705';

UPDATE products SET product_name='Прелесть PRO бальзам Объем и Питание',
ingredients='Aqua, Cetearyl Alcohol, Quaternium-87, Isopropyl Myristate, Polyquaternium-37, Glyceryl Stearate, Ceteareth-20, Phenoxyethanol, Ethylhexylglycerin, Panthenol, Parfum, Limonene, Linalool'
WHERE barcode='4600104029035';

UPDATE products SET product_name='Прелесть PRO шампунь Абсолютный Блеск',
ingredients='Aqua, Sodium Laureth Sulfate, Cocamidopropyl Betaine, Sodium Chloride, Glycol Distearate, Parfum, Panthenol, Guar Hydroxypropyltrimonium Chloride, Citric Acid, Sodium Benzoate, Phenoxyethanol, Limonene, Linalool'
WHERE barcode='4600104029011';

UPDATE products SET product_name='Прелесть PRO бальзам Абсолютный Блеск 400мл',
ingredients='Aqua, Cetearyl Alcohol, Quaternium-87, Isopropyl Myristate, Polyquaternium-37, Glyceryl Stearate, Ceteareth-20, Phenoxyethanol, Ethylhexylglycerin, Panthenol, Parfum, Limonene, Linalool'
WHERE barcode='4600104029004';

UPDATE products SET product_name='Прелесть PRO маска для волос "Блеск"',
ingredients='Aqua, Cetearyl Alcohol, Quaternium-87, Isopropyl Myristate, Polyquaternium-37, Glyceryl Stearate, Ceteareth-20, Phenoxyethanol, Ethylhexylglycerin, Panthenol, Keratin, Parfum, Limonene, Linalool'
WHERE barcode='4600104028243';

UPDATE products SET product_name='Прелесть PRO шампунь Organic Power',
ingredients='Aqua, Sodium Laureth Sulfate, Cocamidopropyl Betaine, Sodium Chloride, Glycol Distearate, Parfum, Panthenol, Guar Hydroxypropyltrimonium Chloride, Citric Acid, Sodium Benzoate, Phenoxyethanol, Limonene, Linalool'
WHERE barcode='4600104029059';

-- ======================== ПРЕЛЕСТЬ БИО ANTIPERSPIRANTS ========================

UPDATE products SET product_name='Прелесть БИО антиперспирант Прикосновение Свежести 160мл',
ingredients='Isobutane, Aluminum Chlorohydrate, Propane, Cyclopentasiloxane, PPG-14 Butyl Ether, Parfum, Butane, Disteardimonium Hectorite, Propylene Carbonate, Aloe Barbadensis Leaf Juice, Caprylic/Capric Triglyceride, Aqua, BHT, Alpha-Isomethyl Ionone, Benzyl Alcohol, Benzyl Salicylate, Citronellol, Geraniol, Limonene'
WHERE barcode='4600104003462';

UPDATE products SET product_name='Прелесть БИО антиперспирант ролик Свежесть 50мл',
ingredients='Aqua, Aluminum Chlorohydrate, Propylene Glycol, Steareth-2, Steareth-21, PPG-15 Stearyl Ether, Parfum, Phenoxyethanol, Ethylhexylglycerin, Aloe Barbadensis Leaf Juice, Alpha-Isomethyl Ionone, Benzyl Salicylate, Citronellol, Limonene, Linalool'
WHERE barcode='4600104022548';

UPDATE products SET product_name='Прелесть БИО антиперспирант Кристальная Чистота 160мл',
ingredients='Isobutane, Aluminum Chlorohydrate, Propane, Cyclopentasiloxane, PPG-14 Butyl Ether, Parfum, Butane, Disteardimonium Hectorite, Propylene Carbonate, Maris Sal, Aqua, BHT, Alpha-Isomethyl Ionone, Benzyl Alcohol, Benzyl Salicylate, Citronellol, Geraniol, Limonene'
WHERE barcode='4600104003608';

UPDATE products SET product_name='Прелесть БИО антиперспирант ролик Мягкий уход Хлопок 50мл',
ingredients='Aqua, Aluminum Chlorohydrate, Propylene Glycol, Steareth-2, Steareth-21, PPG-15 Stearyl Ether, Parfum, Phenoxyethanol, Ethylhexylglycerin, Gossypium Herbaceum Extract, Alpha-Isomethyl Ionone, Benzyl Salicylate, Citronellol, Limonene, Linalool'
WHERE barcode='4600104022531';

UPDATE products SET product_name='Прелесть БИО антиперспирант ролик Кристальная Чистота 50мл',
ingredients='Aqua, Aluminum Chlorohydrate, Propylene Glycol, Steareth-2, Steareth-21, PPG-15 Stearyl Ether, Parfum, Phenoxyethanol, Ethylhexylglycerin, Maris Sal, Alpha-Isomethyl Ionone, Benzyl Salicylate, Citronellol, Limonene, Linalool'
WHERE barcode='4600104023446';

UPDATE products SET product_name='Прелесть БИО антиперспирант ролик Сверхзащита 50мл',
ingredients='Aqua, Aluminum Chlorohydrate, Propylene Glycol, Steareth-2, Steareth-21, PPG-15 Stearyl Ether, Parfum, Phenoxyethanol, Ethylhexylglycerin, Alpha-Isomethyl Ionone, Benzyl Salicylate, Citronellol, Limonene, Linalool'
WHERE barcode='4600104022524';

-- ======================== SYMPHONY AIR FRESHENERS ========================

UPDATE products SET product_name='Симфония освежитель воздуха Морской Бриз',
ingredients=NULL WHERE barcode='4600104028991';
UPDATE products SET product_name='Симфония освежитель воздуха Морской Бриз сухой 300мл',
ingredients=NULL WHERE barcode='4600104020650';
UPDATE products SET product_name='Симфония освежитель воздуха Антитабак 300мл',
ingredients=NULL WHERE barcode='4600104020629';
UPDATE products SET product_name='Симфония освежитель воздуха Антитабак',
ingredients=NULL WHERE barcode='4600104028984';
UPDATE products SET product_name='Симфония освежитель воздуха Сочная Ягода 300мл',
ingredients=NULL WHERE barcode='4600104008283';
UPDATE products SET product_name='Симфония освежитель воздуха Яблоневый Цвет',
ingredients=NULL WHERE barcode='4600104030321';
UPDATE products SET product_name='Симфония Премия Лагуна',
ingredients=NULL WHERE barcode='4600104038365';
UPDATE products SET product_name='Симфония Премия Роса',
ingredients=NULL WHERE barcode='4600104038402';

-- ======================== PICNIC INSECT REPELLENTS ========================

UPDATE products SET product_name='Picnic Baby спрей от комаров 120мл',
ingredients=NULL WHERE barcode='4600104007743';
UPDATE products SET product_name='Picnic Family спрей от комаров 120мл',
ingredients=NULL WHERE barcode='4600104021176';
UPDATE products SET product_name='Picnic Super спрей от комаров',
ingredients=NULL WHERE barcode='4600104025235';
UPDATE products SET product_name='Picnic спирали от комаров 10шт',
ingredients=NULL WHERE barcode='4600104025426';
UPDATE products SET product_name='Спрей специальная защита от клещей',
ingredients=NULL WHERE barcode='4606982002900';

-- ======================== TWIST SHOE CARE ========================

UPDATE products SET product_name='Twist крем для обуви 75мл',
ingredients=NULL WHERE barcode='4606982001330';
UPDATE products SET product_name='Twist крем для обуви банка 50мл черный',
ingredients=NULL WHERE barcode='4606982002771';
UPDATE products SET product_name='Twist крем для обуви туба с губкой 75мл черный',
ingredients=NULL WHERE barcode='4606982001316';
UPDATE products SET product_name='Twist Fashion краска для гладкой кожи 300мл черная',
ingredients=NULL WHERE barcode='8594013701631';
UPDATE products SET product_name='Twist Casual пена-растяжитель для обуви',
ingredients=NULL WHERE barcode='4606982003235';
UPDATE products SET product_name='Twist Casual губка для кожи с дозатором',
ingredients=NULL WHERE barcode='4606982003297';
UPDATE products SET product_name='Крем для обуви',
ingredients=NULL WHERE barcode='4650056490414';

-- ======================== REMAINING / UNIDENTIFIED ========================

UPDATE products SET product_name='Deonica спрей 150мл' WHERE barcode='4650056490773' AND product_name IS NULL;
UPDATE products SET product_name='Deonica спрей 150мл' WHERE barcode='4650056490605' AND product_name IS NULL;
UPDATE products SET product_name='Deonica спрей 150мл' WHERE barcode='4650056490704' AND product_name IS NULL;
UPDATE products SET product_name='Deonica продукт' WHERE barcode='4650056493095' AND product_name IS NULL;
