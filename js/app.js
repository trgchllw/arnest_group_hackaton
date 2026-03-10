'use strict';

/* ===== Supabase ===== */

var SUPABASE_URL = 'https://ivbytlvtltzxhdqinuen.supabase.co';
var SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml2Ynl0bHZ0bHR6eGhkcWludWVuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzI5ODE0ODQsImV4cCI6MjA4ODU1NzQ4NH0.QVo-8icm360MiBpzc-5hJWtzEVNpAV4Yg9V2PY5wkxc';
var sb = supabase.createClient(SUPABASE_URL, SUPABASE_KEY);

/* ===== State ===== */

var scanner = null;
var scanning = false;
var scanCooldown = false;
var historyArr = [];
var allAllergens = [];
var selectedAllergens = JSON.parse(localStorage.getItem('myAllergens') || '[]');
var currentCard = 0;

/* ===== Tabs ===== */

function showPage(id) {
    document.querySelectorAll('.page').forEach(function (p) { p.classList.remove('active'); });
    document.querySelectorAll('.tab').forEach(function (t) { t.classList.remove('active'); });
    document.getElementById('page-' + id).classList.add('active');

    var map = { scan: 'Сканер', allergens: 'Аллергены', cards: 'Карточки' };
    document.querySelectorAll('.tab').forEach(function (t) {
        if (t.textContent.trim() === map[id]) t.classList.add('active');
    });
}

/* ===== Connection ===== */

async function testConnection() {
    var el = document.getElementById('connectionStatus');
    try {
        var r = await sb.from('products').select('*', { count: 'exact', head: true });
        if (r.error) throw r.error;
        el.innerHTML = '<span class="status-dot"></span><span>База: ' + r.count + ' товаров</span>';
    } catch (e) {
        el.innerHTML = '<span class="status-dot error"></span><span>Ошибка подключения</span>';
    }
}

/* ===== Ingredient Fetch (Open Food / Beauty Facts) ===== */

async function fetchIngredients(barcode) {
    var apis = [
        'https://world.openfoodfacts.org/api/v2/product/' + barcode + '.json',
        'https://world.openfoodfacts.org/api/v0/product/' + barcode + '.json',
        'https://world.openbeautyfacts.org/api/v2/product/' + barcode + '.json',
        'https://world.openbeautyfacts.org/api/v0/product/' + barcode + '.json'
    ];

    var bestName = '';

    for (var i = 0; i < apis.length; i++) {
        try {
            var res = await fetch(apis[i], { signal: AbortSignal.timeout(5000) });
            if (!res.ok) continue;

            var data = await res.json();
            if (data.status === 1 && data.product) {
                var p = data.product;
                var name = p.product_name_ru || p.product_name || p.product_name_en || '';
                if (name) bestName = name;

                var ing = p.ingredients_text_en || p.ingredients_text || p.ingredients_text_ru || '';
                if (!ing && p.ingredients && p.ingredients.length) {
                    ing = p.ingredients.map(function (x) { return x.text || x.id || ''; }).join(', ');
                }
                if (ing) return { name: name || bestName, ingredients: ing };
            }
        } catch (e) { /* timeout or network error */ }
    }

    return { name: bestName, ingredients: null };
}

/* ===== Allergen Matching ===== */

function matchAllergens(ingredientsText) {
    if (!ingredientsText) return [];

    var text = ingredientsText.toLowerCase().replace(/\s+/g, ' ');
    var matches = [];

    selectedAllergens.forEach(function (id) {
        var a = allAllergens.find(function (x) { return x.id === id; });
        if (!a) return;

        var inci = a.inci.toLowerCase().trim();
        if (inci && text.indexOf(inci) > -1) {
            matches.push(a);
        }
    });

    return matches;
}

function getTrafficLevel(matches, hasIngredients) {
    if (!hasIngredients) return 'gray';
    if (selectedAllergens.length === 0) return 'green';
    if (matches.length === 0) return 'green';
    if (matches.length <= 2) return 'yellow';
    return 'red';
}

var LEVEL_TEXT = {
    green: 'Безопасно',
    yellow: 'Внимание',
    red: 'Опасно',
    gray: 'Нет данных о составе'
};

var LEVEL_SUB = {
    green: 'Совпадений с вашими аллергенами не найдено',
    yellow: 'Обнаружены возможные аллергены',
    red: 'Обнаружено много аллергенов — будьте осторожны!',
    gray: 'Состав не найден ни в базе, ни в Open Food Facts'
};

/* ===== Highlight Ingredients ===== */

function highlightIngredients(text, matches) {
    if (!matches.length) return text;
    var result = text;

    matches.forEach(function (a) {
        var inci = a.inci;
        var re = new RegExp('(' + inci.replace(/[.*+?^${}()|[\]\\]/g, '\\$&') + ')', 'gi');
        result = result.replace(re, '<span class="ing-hit">$1</span>');
    });

    return result;
}

/* ===== Check Barcode (main flow) ===== */

async function checkBarcode(code) {
    if (scanCooldown) return;
    scanCooldown = true;
    setTimeout(function () { scanCooldown = false; }, 2500);

    showLoadingPopup(code);

    var dbRes = await sb.from('products').select('id,barcode,product_name,ingredients').eq('barcode', code).maybeSingle();
    var inDB = !!(dbRes.data);
    var productName = '';
    var ingredients = null;

    if (dbRes.data && dbRes.data.ingredients) {
        productName = dbRes.data.product_name || '';
        ingredients = dbRes.data.ingredients;
    } else {
        var apiRes = await fetchIngredients(code);
        productName = apiRes.name || (dbRes.data && dbRes.data.product_name) || '';
        ingredients = apiRes.ingredients;
    }

    var matches = matchAllergens(ingredients);
    var level = getTrafficLevel(matches, !!ingredients);

    showTrafficResult(code, level, matches, inDB, productName, ingredients);
    addToHistory(code, level, productName, matches);

    if (navigator.vibrate) {
        if (level === 'green') navigator.vibrate([80]);
        else if (level === 'yellow') navigator.vibrate([80, 60, 80]);
        else if (level === 'red') navigator.vibrate([120, 60, 120, 60, 120]);
    }
}

/* ===== Popup Rendering ===== */

function showLoadingPopup(barcode) {
    var c = document.getElementById('resultContent');
    c.innerHTML = '<div class="result-loading"><div class="spinner"></div><span>Анализ состава ' + barcode + '...</span></div>';
    document.getElementById('resultPopup').classList.add('visible');
}

function showTrafficResult(barcode, level, matches, inDB, productName, ingredients) {
    var c = document.getElementById('resultContent');
    var html = '';

    html += '<div class="traffic-light"><div class="tl-row">';
    html += '<div class="tl-dot' + (level === 'red' ? ' on-red' : '') + '">&#10005;</div>';
    html += '<div class="tl-dot' + (level === 'yellow' ? ' on-yellow' : '') + '">&#9888;</div>';
    html += '<div class="tl-dot' + (level === 'green' ? ' on-green' : '') + '">&#10003;</div>';
    if (level === 'gray') html = html.slice(0, -('</div>'.length)) + '<div class="tl-dot on-gray">?</div>';
    html += '</div></div>';

    html += '<div class="result-title ' + level + '">' + LEVEL_TEXT[level] + '</div>';
    html += '<div class="result-subtitle">' + LEVEL_SUB[level] + '</div>';
    html += '<div class="result-barcode">' + barcode + '</div>';

    if (productName) {
        html += '<div class="result-product">' + productName + '</div>';
    }

    html += '<span class="result-db-badge ' + (inDB ? 'yes' : 'no') + '">' + (inDB ? 'Арнест ✓' : 'Не в базе Арнест') + '</span>';

    if (matches.length > 0) {
        html += '<div class="result-matches ' + level + '"><b>Найденные аллергены (' + matches.length + '):</b><div class="match-list">';
        matches.forEach(function (a) {
            html += '<span class="match-tag">' + a.inci + '</span>';
        });
        html += '</div></div>';
    }

    if (selectedAllergens.length === 0 && ingredients) {
        html += '<div style="font-size:.72rem;color:var(--text-dim);margin-bottom:12px">Вы не выбрали аллергены. Перейдите во вкладку «Аллергены» чтобы настроить фильтр.</div>';
    }

    if (ingredients) {
        var highlighted = highlightIngredients(ingredients, matches);
        html += '<div class="result-ingredients">';
        html += '<div class="ing-toggle" onclick="this.nextElementSibling.classList.toggle(\'open\')">Показать полный состав ▾</div>';
        html += '<div class="ing-text">' + highlighted + '</div>';
        html += '</div>';
    }

    html += '<button class="result-close" onclick="closeResult()">Закрыть</button>';
    c.innerHTML = html;
}

function closeResult() {
    document.getElementById('resultPopup').classList.remove('visible');
}

/* ===== History ===== */

function addToHistory(barcode, level, productName, matches) {
    var time = new Date().toLocaleTimeString('ru-RU', { hour: '2-digit', minute: '2-digit', second: '2-digit' });
    historyArr.unshift({ barcode: barcode, level: level, name: productName, matches: matches.length, time: time });

    var list = document.getElementById('historyList');
    var empty = document.getElementById('historyEmpty');
    if (empty) empty.remove();

    var statusLabels = { green: 'Безопасно', yellow: 'Внимание', red: 'Опасно', gray: 'Нет данных' };
    var item = document.createElement('div');
    item.className = 'history-item';

    var nameHtml = productName ? '<div class="history-name">' + productName + '</div>' : '';
    var matchHtml = matches.length > 0 ? ' (' + matches.length + ')' : '';

    item.innerHTML =
        '<span class="history-dot ' + level + '"></span>' +
        '<div class="history-info"><div class="history-barcode">' + barcode + '</div>' + nameHtml +
        '<div class="history-time">' + time + '</div></div>' +
        '<span class="history-status ' + level + '">' + statusLabels[level] + matchHtml + '</span>';

    list.insertBefore(item, list.firstChild);
    document.getElementById('historyCount').textContent = historyArr.length;
}

function checkManualBarcode() {
    var inp = document.getElementById('manualBarcode');
    var c = inp.value.trim();
    if (!c) return;
    checkBarcode(c);
    inp.value = '';
}

/* ===== Scanner ===== */

async function toggleScanner() {
    var btn = document.getElementById('btnScan');

    if (scanning) {
        await stopScanner();
        return;
    }

    btn.disabled = true;
    btn.textContent = 'Запуск камеры...';

    try {
        var ph = document.getElementById('scannerPlaceholder');
        if (ph) ph.remove();

        scanner = new Html5Qrcode('scanner-region');
        await scanner.start(
            { facingMode: 'environment' },
            {
                fps: 10,
                qrbox: function (vw, vh) {
                    var s = Math.min(vw, vh) * .75;
                    return { width: s, height: s * .4 };
                },
                formatsToSupport: [
                    Html5QrcodeSupportedFormats.EAN_13,
                    Html5QrcodeSupportedFormats.EAN_8,
                    Html5QrcodeSupportedFormats.CODE_128,
                    Html5QrcodeSupportedFormats.CODE_39,
                    Html5QrcodeSupportedFormats.UPC_A,
                    Html5QrcodeSupportedFormats.UPC_E
                ]
            },
            function (t) { checkBarcode(t); },
            function () { }
        );

        scanning = true;
        btn.disabled = false;
        btn.className = 'btn btn-stop';
        btn.innerHTML =
            '<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">' +
            '<rect x="6" y="6" width="12" height="12" rx="2"/></svg> Остановить';
    } catch (err) {
        btn.disabled = false;
        btn.textContent = 'Нет доступа к камере';
        setTimeout(function () {
            btn.className = 'btn btn-primary';
            btn.innerHTML =
                '<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">' +
                '<path d="M3 7V5a2 2 0 012-2h2M17 3h2a2 2 0 012 2v2M21 17v2a2 2 0 01-2 2h-2M7 21H5a2 2 0 01-2-2v-2"/></svg> Сканировать';
        }, 2000);
    }
}

async function stopScanner() {
    if (scanner) {
        try { await scanner.stop(); scanner.clear(); } catch (e) { }
        scanner = null;
    }
    scanning = false;

    var btn = document.getElementById('btnScan');
    btn.className = 'btn btn-primary';
    btn.innerHTML =
        '<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">' +
        '<path d="M3 7V5a2 2 0 012-2h2M17 3h2a2 2 0 012 2v2M21 17v2a2 2 0 01-2 2h-2M7 21H5a2 2 0 01-2-2v-2"/></svg> Сканировать';
}

/* ===== Allergens ===== */

var CATS = ['Все', 'EU 26', 'Расширенные', 'Консерванты', 'ПАВ', 'Латекс/смолы'];
var activeCat = 'Все';

async function loadAllergens() {
    try {
        var r = await sb.from('allergens').select('*').order('id');
        if (r.error) throw r.error;
        allAllergens = r.data;
        renderCatTabs();
        renderAllergens();
        updateMyCount();
    } catch (e) {
        document.getElementById('allergenList').innerHTML = '<div class="history-empty">Ошибка загрузки аллергенов</div>';
    }
}

function renderCatTabs() {
    var el = document.getElementById('catTabs');
    el.innerHTML = '';

    CATS.forEach(function (c) {
        var b = document.createElement('button');
        b.className = 'cat-tab' + (c === activeCat ? ' active' : '');
        b.textContent = c;
        b.onclick = function () { activeCat = c; renderCatTabs(); renderAllergens(); };
        el.appendChild(b);
    });
}

function filterAllergens() {
    renderAllergens();
}

function renderAllergens() {
    var q = document.getElementById('allergenSearch').value.toLowerCase();
    var list = document.getElementById('allergenList');
    list.innerHTML = '';

    var items = allAllergens.filter(function (a) {
        var matchCat = activeCat === 'Все' || a.category === activeCat;
        var matchQ = !q || a.name_ru.toLowerCase().indexOf(q) > -1 || a.inci.toLowerCase().indexOf(q) > -1;
        return matchCat && matchQ;
    });

    if (!items.length) {
        list.innerHTML = '<div class="history-empty">Ничего не найдено</div>';
        return;
    }

    items.forEach(function (a) {
        var on = selectedAllergens.indexOf(a.id) > -1;
        var d = document.createElement('div');
        d.className = 'allergen-item';
        d.innerHTML =
            '<div class="allergen-check' + (on ? ' on' : '') + '">&#10003;</div>' +
            '<div><div class="allergen-name">' + a.name_ru + '</div>' +
            '<div class="allergen-inci">' + a.inci + (a.cas ? ' &middot; CAS ' + a.cas : '') + '</div></div>';
        d.onclick = function () { toggleAllergen(a.id); };
        list.appendChild(d);
    });
}

function toggleAllergen(id) {
    var i = selectedAllergens.indexOf(id);
    if (i > -1) selectedAllergens.splice(i, 1);
    else selectedAllergens.push(id);

    localStorage.setItem('myAllergens', JSON.stringify(selectedAllergens));
    renderAllergens();
    updateMyCount();
}

function updateMyCount() {
    document.getElementById('myAllergenCount').textContent = selectedAllergens.length;
}

/* ===== Education Cards ===== */

var CARDS = [
    { img: 'assets/card-skin-types.png', title: "Как узнать свой тип кожи", body: "В косметологии различают <b>4 типа кожи</b>:<br><br><b>Сухая:</b> стянутость, шелушения, зуд. Нужно мягкое умывание и жирный крем.<br><br><b>Жирная:</b> блеск, расширенные поры, склонность к прыщам. Без спирта в составе, мягкое умывание, AHA/BHA кислоты раз в неделю.<br><br><b>Комбинированная:</b> жирный блеск в Т-зоне, сухость на щеках. Сыворотки и кремы с увлажняющими компонентами.<br><br><b>Нормальная:</b> чистые поры, равномерный тон, гладкая кожа.<br><br><b>Чувствительная</b> — краснота, зуд, жжение, сыпь. При акне обратитесь к косметологу." },
    { img: 'assets/card-skin-care.png', title: "Правила ухода за кожей лица", body: "Очищать кожу <b>дважды в день</b> — утром и перед сном.<br><br><b>1. Умывание:</b> гель или пенка. Макияж сначала снимать мицеллярной водой или гидрофильным маслом, затем пенкой.<br><br><b>2. Тонизирование:</b> сыворотка или тонер для увлажнения и восстановления pH баланса. Наносить чистыми руками лёгкими движениями.<br><br><b>3. Крем:</b> закрывает поры после ухода, защищает от потери влаги и шелушения." },
    { img: 'assets/card-spf.png', title: "Уровни SPF", body: "SPF — солнцезащитный фактор. Защищает от UVB лучей и пигментных пятен.<br><br><b>SPF 2–15 (низкий):</b> для тёмной или загорелой кожи, короткое время на солнце.<br><br><b>SPF 15–30 (средний):</b> повседневное использование, умеренное время на улице.<br><br><b>SPF 30–50 (высокий):</b> чувствительная кожа, пляж, горы.<br><br><b>SPF 50+ (очень высокий):</b> тропики, высокогорье, очень светлая кожа.<br><br><b>Физический SPF</b> — отражает лучи, 3–4 часа, для чувствительной кожи.<br><b>Химический SPF</b> — впитывает лучи, 8–9 часов, легче по текстуре." },
    { img: 'assets/card-child-allergy.png', title: "Уход за кожей ребёнка с аллергией", body: "При атопическом дерматите важно <b>восстановить кожный барьер</b>.<br><br><b>Купание:</b> тёплая вода не выше 34°C, отфильтрованная от хлора. После — увлажнить кожу.<br><br><b>Моющие средства:</b> только с безопасным составом, утверждённые врачом.<br><br><b>Одежда:</b> хлопок, шёлк, микрофибра.<br><br><b>Влажность:</b> поддерживать 60% в помещении.<br><br><b>Диета:</b> часто назначается параллельно врачом." },
    { img: 'assets/card-clothing.png', title: "Выбор одежды и постельного белья", body: "Неправильные ткани вызывают раздражение и нарушают терморегуляцию.<br><br><b>Лучшие материалы:</b><br>• Хлопок — дышащий, гипоаллергенный<br>• Лён — воздухопроницаемый, мягчеет после стирки<br>• Шёлк — гладкий, для чувствительной кожи<br>• Бамбук — антибактериальный, впитывает влагу<br><br><b>Постель:</b> натуральные ткани без агрессивной обработки. Стирка при высокой температуре, замена раз в 2–3 года." },
    { img: 'assets/card-winter.png', title: "Защита кожи зимой", body: "Мороз, ветер и перепады температур — испытание для кожи.<br><br><b>Главное правило:</b> наносить защитный крем за <b>30–60 минут</b> до выхода.<br><br><b>Кремы:</b> плотные, жирные, с маслами (вазелин, ланолин, масло ши, воск).<br><br><b>Избегать:</b> кремов с гиалуроновой кислотой, глицерином, водой (замёрзнут). Спирта, ментола, камфоры.<br><br><b>Для детей:</b> специальные кремы «от ветра и непогоды» за 30–40 мин до прогулки.<br><br><b>После возвращения:</b> не растирать кожу, дать согреться, умыться тёплой водой, нанести пантенол." },
    { img: 'assets/card-oral.png', title: "Гигиена полости рта при чувствительности", body: "При стоматитах, аллергии, химиотерапии слизистая рта очень уязвима.<br><br><b>Щётка:</b> только мягкая (Soft) или ультрамягкая. Электрическая — деликатный режим.<br><br><b>Паста без:</b> SLS, отдушек, ментола, спирта, отбеливающих. Выбирать с алоэ, ромашкой, пантенолом.<br><br><b>Техника:</b> минимальное давление, выметающие движения от десны к краю.<br><br><b>Ополаскиватели:</b> без спирта. Хлоргексидин — курсами.<br><br><b>Питание:</b> избегать острого, кислого, горячего, твёрдого." },
    { img: 'assets/card-sunscreen.png', title: "Солнцезащита для чувствительной кожи", body: "Защита от солнца <b>обязательна круглый год</b>.<br><br><b>SPF 30–50</b> достаточно для ежедневной защиты. Ищите пометку <b>UVA в кружке, PA+++ или Broad Spectrum</b>.<br><br><b>Физические фильтры</b> (оксид цинка, диоксид титана) — не раздражают, работают сразу. Идеальны для чувствительной кожи, детей, атопиков.<br><br><b>Химические фильтры</b> — легче, но чаще вызывают аллергию. Избегать.<br><br><b>Количество:</b> 1–1.5 мл для лица, 30 мл для тела.<br><br><b>Очерёдность:</b> очищение → увлажнение → солнцезащита." },
    { img: 'assets/card-shower.png', title: "Средства для душа — критерии выбора", body: "<b>Обычное мыло — исключить.</b> pH 9–11 разрушает защитный слой кожи.<br><br><b>Гели для душа:</b> выбирать с pH 5.5 и мягкими ПАВ. Избегать SLS/SLES, отдушек, красителей, спирта.<br><br><b>Масла для душа</b> (гель-масло, крем-душ) — лучший выбор для сухой и чувствительной кожи.<br><br><b>Синдеты:</b> твёрдые бруски с нейтральным pH, альтернатива мылу.<br><br><b>Красный список:</b> SLS/SLES, отдушки (parfum), красители, спирт, агрессивные консерванты, эфирные масла." },
    { img: 'assets/card-bathing.png', title: "Купание и душ — температура, время, мочалки", body: "<b>Температура:</b> тёплая, 33–37°C. Горячая вода сушит и раздражает.<br><br><b>Время:</b> душ 5–10 мин, ванна до 15 мин. Дольше — вредно.<br><br><b>Средства:</b> мягкие pH-нейтральные гели, масла, детские пенки без отдушек.<br><br><b>Мочалки:</b> мягкие (махровая варежка, губка из целлюлозы). Не тереть, не каждый день.<br><br><b>Полотенца:</b> мягкие, махровые. Промакивать, не тереть.<br><br><b>После купания:</b> в течение 3 минут нанести увлажняющий крем (эмолент) на влажную кожу." }
];

function renderCards() {
    var track = document.getElementById('cardsTrack');
    var dots = document.getElementById('cardsDots');
    track.innerHTML = '';
    dots.innerHTML = '';

    CARDS.forEach(function (c, i) {
        var d = document.createElement('div');
        d.className = 'edu-card';
        d.innerHTML = '<img src="' + c.img + '" alt="" class="edu-card-img">' +
            '<h3>' + c.title + '</h3><div class="edu-body">' + c.body + '</div>';
        track.appendChild(d);

        var dot = document.createElement('div');
        dot.className = 'cards-dot' + (i === 0 ? ' active' : '');
        dots.appendChild(dot);
    });

    updateCardPos();
}

function updateCardPos() {
    document.getElementById('cardsTrack').style.transform = 'translateX(-' + currentCard * 100 + '%)';
    document.querySelectorAll('.cards-dot').forEach(function (d, i) {
        d.className = 'cards-dot' + (i === currentCard ? ' active' : '');
    });
    document.getElementById('prevBtn').disabled = currentCard === 0;
    document.getElementById('nextBtn').disabled = currentCard === CARDS.length - 1;
}

function prevCard() {
    if (currentCard > 0) { currentCard--; updateCardPos(); }
}

function nextCard() {
    if (currentCard < CARDS.length - 1) { currentCard++; updateCardPos(); }
}

/* ===== Swipe support ===== */

(function () {
    var wrap = document.querySelector('.cards-wrap');
    var startX = 0, diff = 0, dragging = false;

    wrap.addEventListener('touchstart', function (e) {
        startX = e.touches[0].clientX;
        dragging = true;
        diff = 0;
        document.getElementById('cardsTrack').style.transition = 'none';
    });

    wrap.addEventListener('touchmove', function (e) {
        if (!dragging) return;
        diff = e.touches[0].clientX - startX;
        var pct = -currentCard * 100 + diff / wrap.offsetWidth * 100;
        document.getElementById('cardsTrack').style.transform = 'translateX(' + pct + '%)';
    });

    wrap.addEventListener('touchend', function () {
        dragging = false;
        document.getElementById('cardsTrack').style.transition = 'transform .3s ease';
        if (diff < -40 && currentCard < CARDS.length - 1) currentCard++;
        else if (diff > 40 && currentCard > 0) currentCard--;
        updateCardPos();
    });
})();

/* ===== Init ===== */

document.getElementById('manualBarcode').addEventListener('keydown', function (e) {
    if (e.key === 'Enter') checkManualBarcode();
});

testConnection();
loadAllergens();
renderCards();
