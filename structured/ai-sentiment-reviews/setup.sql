-- structured/ai-sentiment-reviews/setup.sql
-- Creates a table with synthetic product reviews for AI_SENTIMENT demo
-- Synthetic data generated inline — no external download needed

USE DATABASE GENAI_LEARNING;
USE SCHEMA PUBLIC;

CREATE OR REPLACE TABLE product_reviews (
    review_id     NUMBER AUTOINCREMENT PRIMARY KEY,
    product_name  VARCHAR(100),
    category      VARCHAR(50),
    review_text   VARCHAR(2000),
    star_rating   NUMBER(2,1)
);

INSERT INTO product_reviews (product_name, category, review_text, star_rating) VALUES
('Wireless Headphones Pro', 'Electronics', 'Absolutely love these headphones! The sound quality is incredible and the noise cancellation works perfectly. Battery lasts all day. Best purchase I have made this year.', 5.0),
('Wireless Headphones Pro', 'Electronics', 'Decent headphones but the ear cushions started peeling after 3 months. Sound is good but build quality leaves a lot to be desired for the price.', 3.0),
('Wireless Headphones Pro', 'Electronics', 'Complete waste of money. Stopped working after two weeks. Customer service was unhelpful and refused a refund. Avoid at all costs.', 1.0),
('Coffee Maker Deluxe', 'Kitchen', 'This coffee maker changed my mornings. Brews quickly, keeps coffee hot for hours, and the carafe does not drip. Easy to clean too.', 5.0),
('Coffee Maker Deluxe', 'Kitchen', 'It is okay. Makes decent coffee but the hot plate burned the bottom of the pot and gave the coffee a burnt taste after 30 minutes.', 2.5),
('Coffee Maker Deluxe', 'Kitchen', 'Arrived with a cracked carafe. Replacement took 3 weeks to arrive. The machine itself works fine but the customer experience was terrible.', 2.0),
('Running Shoes X200', 'Sports', 'These shoes have transformed my running. Lightweight, excellent cushioning, and my knee pain is completely gone since switching to them.', 5.0),
('Running Shoes X200', 'Sports', 'Good shoes but they run half a size small. Had to return and reorder. Once I got the right size they were comfortable enough.', 3.5),
('Running Shoes X200', 'Sports', 'Fell apart after 6 weeks of regular use. The sole separated from the upper. Very disappointed given the high price point.', 1.5),
('Smart Watch Series 5', 'Electronics', 'Fantastic smartwatch. Accurate health tracking, beautiful display, and the battery easily lasts two days. Looks great too.', 5.0),
('Smart Watch Series 5', 'Electronics', 'The fitness tracking features are unreliable. Heart rate readings are inconsistent and sleep tracking is basically useless.', 2.0),
('Smart Watch Series 5', 'Electronics', 'Good watch overall. App ecosystem is a bit limited compared to competitors but the hardware quality is excellent.', 4.0),
('Office Chair Ergonomic', 'Furniture', 'After years of back pain, this chair has been life-changing. Proper lumbar support and fully adjustable. Worth every penny.', 5.0),
('Office Chair Ergonomic', 'Furniture', 'Assembly instructions were confusing and a bolt was missing from the box. Once assembled it is comfortable but the process was frustrating.', 3.0),
('Office Chair Ergonomic', 'Furniture', 'Chair wobbles slightly and the armrests do not lock properly. For this price I expected better quality control.', 2.5),
('Blender UltraMix', 'Kitchen', 'Powerful motor, easy to clean, and the smoothies come out perfectly smooth every time. Great value for money.', 4.5),
('Blender UltraMix', 'Kitchen', 'Motor burned out after 8 months of daily use. The warranty replacement process was smooth but I expected it to last longer.', 2.0),
('Yoga Mat Premium', 'Sports', 'Non-slip, thick enough for joint support, and easy to clean. Has not lost its grip even after months of use.', 4.5),
('Yoga Mat Premium', 'Sports', 'The mat smells strongly of rubber and the smell has not faded after two weeks of airing out. Performance is fine but the odour is unpleasant.', 3.0),
('Desk Lamp LED', 'Office', 'Perfect brightness levels, easy on the eyes during long work sessions, and the USB charging port is a great touch.', 4.5),
('Desk Lamp LED', 'Office', 'The dimmer switch stopped working after a month. The lamp itself still works but only at full brightness which is too harsh at night.', 2.5),
('Mechanical Keyboard', 'Electronics', 'Best keyboard I have ever typed on. Satisfying key feel, great build quality, and the RGB lighting is a nice bonus.', 5.0),
('Mechanical Keyboard', 'Electronics', 'One of the keys is slightly louder than the others which is distracting in a quiet office. Otherwise a quality product.', 3.5),
('Portable Speaker', 'Electronics', 'Impressive sound for its size. Waterproof, great battery life, and pairs instantly via Bluetooth. Perfect for outdoor use.', 4.5),
('Portable Speaker', 'Electronics', 'The charging port is poorly designed and the cable does not sit securely. Randomly disconnects during charging.', 2.0),
('Air Purifier HEPA', 'Home', 'Noticeably cleaner air in my apartment. My allergies have improved significantly since I started using it. Quiet on low setting.', 5.0),
('Air Purifier HEPA', 'Home', 'Works well but the filter replacement cost is very high. Factor that into the total cost of ownership before buying.', 3.5),
('Gaming Mouse Pro', 'Electronics', 'Incredibly precise, comfortable grip, and the side buttons are well-placed. My gaming performance has measurably improved.', 5.0),
('Gaming Mouse Pro', 'Electronics', 'Left click started double-clicking after 4 months. A known defect apparently. Disappointed for a premium product.', 1.5),
('Instant Pot 7-in-1', 'Kitchen', 'Replaced four kitchen appliances with this one device. Easy to use, fast, and the food turns out consistently great.', 5.0);

SELECT COUNT(*) AS total_reviews FROM product_reviews;
