-- semi-structured/ai-translate-catalog/setup.sql
-- Creates a table with multilingual product descriptions for AI_TRANSLATE demo

USE DATABASE GENAI_LEARNING;
USE SCHEMA PUBLIC;

CREATE OR REPLACE TABLE product_catalog_multilingual (
    product_id    NUMBER AUTOINCREMENT PRIMARY KEY,
    sku           VARCHAR(20),
    category      VARCHAR(50),
    language      VARCHAR(20),
    description   VARCHAR(2000)
);

INSERT INTO product_catalog_multilingual (sku, category, language, description) VALUES
('SKU-001', 'Electronics', 'en', 'High-performance wireless headphones with active noise cancellation and 30-hour battery life. Features premium audio drivers and foldable design for travel.'),
('SKU-001', 'Electronics', 'es', 'Auriculares inalámbricos de alto rendimiento con cancelación de ruido activa y 30 horas de duración de batería. Cuenta con controladores de audio premium y diseño plegable para viajes.'),
('SKU-001', 'Electronics', 'fr', 'Casque sans fil haute performance avec suppression active du bruit et 30 heures d''autonomie. Doté de pilotes audio premium et d''un design pliant pour les voyages.'),
('SKU-001', 'Electronics', 'de', 'Hochleistungs-Funkkopfhörer mit aktiver Geräuschunterdrückung und 30 Stunden Akkulaufzeit. Ausgestattet mit Premium-Audiotreibern und klappbarem Design für Reisen.'),
('SKU-002', 'Kitchen', 'en', 'Stainless steel espresso machine with built-in grinder and 15-bar pump pressure. Makes barista-quality coffee at home in under 60 seconds.'),
('SKU-002', 'Kitchen', 'it', 'Macchina per espresso in acciaio inossidabile con macinacaffè integrato e pressione della pompa a 15 bar. Prepara un caffè di qualità barista a casa in meno di 60 secondi.'),
('SKU-002', 'Kitchen', 'pt', 'Máquina de espresso em aço inoxidável com moedor integrado e pressão de bomba de 15 bar. Prepara café de qualidade de barista em casa em menos de 60 segundos.'),
('SKU-003', 'Sports', 'en', 'Lightweight carbon fiber running shoes with responsive foam midsole. Designed for marathon runners seeking maximum speed with minimal weight.'),
('SKU-003', 'Sports', 'ja', '軽量カーボンファイバー製ランニングシューズ、レスポンシブフォームミッドソール搭載。最大スピードと最小重量を求めるマラソンランナー向けに設計。'),
('SKU-003', 'Sports', 'zh', '轻量碳纤维跑鞋，配备响应式泡沫中底。专为追求最大速度和最小重量的马拉松跑者设计。'),
('SKU-004', 'Home', 'en', 'HEPA air purifier covering up to 500 sq ft. Removes 99.97% of airborne particles including pollen, dust mites, and pet dander. Ultra-quiet operation.'),
('SKU-004', 'Home', 'nl', 'HEPA-luchtreiniger voor ruimtes tot 46 m². Verwijdert 99,97% van de luchtdeeltjes, waaronder pollen, huisstofmijt en huisdierenvacht. Uiterst stille werking.'),
('SKU-004', 'Home', 'pl', 'Oczyszczacz powietrza HEPA do pomieszczeń do 46 m². Usuwa 99,97% cząstek unoszących się w powietrzu, w tym pyłek, roztocza kurzu i sierść zwierząt. Ultracisza praca.'),
('SKU-005', 'Office', 'en', 'Ergonomic office chair with lumbar support, adjustable armrests, and breathable mesh back. Certified for 8-hour daily use by occupational health experts.'),
('SKU-005', 'Office', 'ko', '요추 지지대, 조절 가능한 팔걸이, 통기성 메시 등받이가 있는 인체공학적 사무용 의자. 직업 보건 전문가가 하루 8시간 사용을 인증.'),
('SKU-005', 'Office', 'ar', 'كرسي مكتب مريح مع دعم قطني ومساند ذراع قابلة للتعديل وظهر شبكي قابل للتنفس. معتمد للاستخدام اليومي 8 ساعات من قبل خبراء الصحة المهنية.');

SELECT language, COUNT(*) AS product_count FROM product_catalog_multilingual GROUP BY language ORDER BY language;
