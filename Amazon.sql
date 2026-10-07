-- Run a full analysis on this updated.csv and cleaned_test.csv
-- =============================================
-- FULL ANALYSIS: updated table
-- =============================================

-- 1. Row count and basic overview for 'updated'
SELECT
    'updated' AS table_name,
    COUNT(*) AS total_rows,
    COUNT(DISTINCT c1) AS distinct_c1,
    MIN(c1) AS min_c1,
    MAX(c1) AS max_c1,
    COUNT(DISTINCT c2) AS distinct_c2,
    COUNT(DISTINCT c3) AS distinct_c3,
    COUNT(DISTINCT c4) AS distinct_c4,
    COUNT(DISTINCT c5) AS distinct_c5,
    COUNT(DISTINCT c6) AS distinct_c6,
    COUNT(DISTINCT c7) AS distinct_c7,
    COUNT(DISTINCT c8) AS distinct_c8,
    COUNT(DISTINCT c9) AS distinct_c9,
    COUNT(DISTINCT c10) AS distinct_c10
FROM updated

-- =============================================
-- FULL ANALYSIS: cleaned_test table
-- =============================================

-- 2. Row count and basic overview for 'cleaned_test'
SELECT
    'cleaned_test' AS table_name,
    COUNT(*) AS total_rows,
    COUNT(DISTINCT ID) AS distinct_c1,
    NULL AS min_c1,
    NULL AS max_c1,
    COUNT(DISTINCT Delivery_person_ID) AS distinct_c2,
    COUNT(DISTINCT City) AS distinct_c3,
    COUNT(DISTINCT Type_of_order) AS distinct_c4,
    COUNT(DISTINCT Type_of_vehicle) AS distinct_c5,
    COUNT(DISTINCT Road_traffic_density) AS distinct_c6,
    COUNT(DISTINCT Weather) AS distinct_c7,
    COUNT(DISTINCT Festival) AS distinct_c8,
    COUNT(DISTINCT Vehicle_condition) AS distinct_c9,
    NULL AS distinct_c10
FROM cleaned_test;

-- =============================================
-- DETAILED ANALYSIS: updated table
-- =============================================

-- 3. Sample rows from updated
SELECT *
FROM updated
LIMIT 10;

-- 4. Null/empty value counts for updated
SELECT
    countIf(c2 = '' OR c2 IS NULL) AS null_c2,
    countIf(c3 = '' OR c3 IS NULL) AS null_c3,
    countIf(c4 = '' OR c4 IS NULL) AS null_c4,
    countIf(c5 = '' OR c5 IS NULL) AS null_c5,
    countIf(c6 = '' OR c6 IS NULL) AS null_c6,
    countIf(c7 = '' OR c7 IS NULL) AS null_c7,
    countIf(c8 = '' OR c8 IS NULL) AS null_c8,
    countIf(c9 = '' OR c9 IS NULL) AS null_c9,
    countIf(c10 = '' OR c10 IS NULL) AS null_c10,
    countIf(c11 = '' OR c11 IS NULL) AS null_c11,
    countIf(c12 = '' OR c12 IS NULL) AS null_c12,
    countIf(c13 = '' OR c13 IS NULL) AS null_c13,
    countIf(c14 = '' OR c14 IS NULL) AS null_c14,
    countIf(c15 = '' OR c15 IS NULL) AS null_c15,
    countIf(c16 = '' OR c16 IS NULL) AS null_c16,
    countIf(c17 = '' OR c17 IS NULL) AS null_c17,
    countIf(c18 = '' OR c18 IS NULL) AS null_c18,
    countIf(c19 = '' OR c19 IS NULL) AS null_c19,
    countIf(c20 = '' OR c20 IS NULL) AS null_c20
FROM updated;

-- 5. Distribution of c2 (top values) in updated
SELECT
    c2,
    COUNT(*) AS frequency,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM updated
GROUP BY c2
ORDER BY frequency DESC
LIMIT 20;

-- 6. Distribution of c3 in updated
SELECT
    c3,
    COUNT(*) AS frequency,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM updated
GROUP BY c3
ORDER BY frequency DESC
LIMIT 20;

-- 7. c1 numeric stats for updated
SELECT
    MIN(c1) AS min_val,
    MAX(c1) AS max_val,
    AVG(c1) AS avg_val,
    median(c1) AS median_val,
    stddevPop(c1) AS stddev_val,
    quantile(0.25)(c1) AS q1,
    quantile(0.75)(c1) AS q3
FROM updated;

-- =============================================
-- DETAILED ANALYSIS: cleaned_test table
-- =============================================

-- 8. Sample rows from cleaned_test
SELECT *
FROM cleaned_test
LIMIT 10;

-- 9. Null/empty value counts for cleaned_test
SELECT
    countIf(ID = '' OR ID IS NULL) AS null_ID,
    countIf(Delivery_person_ID = '' OR Delivery_person_ID IS NULL) AS null_Delivery_person_ID,
    countIf(City = '' OR City IS NULL) AS null_City,
    countIf(Type_of_order = '' OR Type_of_order IS NULL) AS null_Type_of_order,
    countIf(Type_of_vehicle = '' OR Type_of_vehicle IS NULL) AS null_Type_of_vehicle,
    countIf(Road_traffic_density = '' OR Road_traffic_density IS NULL) AS null_Road_traffic_density,
    countIf(Weather = '' OR Weather IS NULL) AS null_Weather,
    countIf(Festival = '' OR Festival IS NULL) AS null_Festival,
    countIf(Delivery_person_Age IS NULL) AS null_Delivery_person_Age,
    countIf(Delivery_person_Ratings IS NULL) AS null_Delivery_person_Ratings,
    countIf(multiple_deliveries IS NULL) AS null_multiple_deliveries
FROM cleaned_test;

-- 10. City distribution in cleaned_test
SELECT
    City,
    COUNT(*) AS frequency,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM cleaned_test
GROUP BY City
ORDER BY frequency DESC;

-- 11. Type of order distribution in cleaned_test
SELECT
    Type_of_order,
    COUNT(*) AS frequency,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM cleaned_test
GROUP BY Type_of_order
ORDER BY frequency DESC;

-- 12. Type of vehicle distribution in cleaned_test
SELECT
    Type_of_vehicle,
    COUNT(*) AS frequency,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM cleaned_test
GROUP BY Type_of_vehicle
ORDER BY frequency DESC;

-- 13. Road traffic density distribution in cleaned_test
SELECT
    Road_traffic_density,
    COUNT(*) AS frequency,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM cleaned_test
GROUP BY Road_traffic_density
ORDER BY frequency DESC;

-- 14. Weather distribution in cleaned_test
SELECT
    Weather,
    COUNT(*) AS frequency,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM cleaned_test
GROUP BY Weather
ORDER BY frequency DESC;

-- 15. Delivery person age and ratings stats in cleaned_test
SELECT
    MIN(Delivery_person_Age) AS min_age,
    MAX(Delivery_person_Age) AS max_age,
    ROUND(AVG(Delivery_person_Age), 2) AS avg_age,
    ROUND(median(Delivery_person_Age), 2) AS median_age,
    MIN(Delivery_person_Ratings) AS min_rating,
    MAX(Delivery_person_Ratings) AS max_rating,
    ROUND(AVG(Delivery_person_Ratings), 2) AS avg_rating,
    ROUND(median(Delivery_person_Ratings), 2) AS median_rating
FROM cleaned_test;

-- 16. Vehicle condition distribution in cleaned_test
SELECT
    Vehicle_condition,
    COUNT(*) AS frequency,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM cleaned_test
GROUP BY Vehicle_condition
ORDER BY Vehicle_condition;

-- 17. Festival vs non-festival order counts in cleaned_test
SELECT
    Festival,
    COUNT(*) AS total_orders,
    ROUND(AVG(Delivery_person_Ratings), 2) AS avg_rating,
    ROUND(AVG(multiple_deliveries), 2) AS avg_multiple_deliveries
FROM cleaned_test
GROUP BY Festival
ORDER BY Festival;

-- 18. Orders by City and Traffic Density in cleaned_test
SELECT
    City,
    Road_traffic_density,
    COUNT(*) AS order_count,
    ROUND(AVG(Delivery_person_Ratings), 2) AS avg_rating
FROM cleaned_test
GROUP BY City, Road_traffic_density
ORDER BY City, order_count DESC;

-- 19. Orders over time (by date) in cleaned_test
SELECT
    toDate(Order_Date) AS order_day,
    COUNT(*) AS daily_orders,
    ROUND(AVG(Delivery_person_Ratings), 2) AS avg_rating
FROM cleaned_test
GROUP BY order_day
ORDER BY order_day;

-- 20. Geographic spread (lat/lon bounding box) in cleaned_test
SELECT
    MIN(Restaurant_latitude) AS min_rest_lat,
    MAX(Restaurant_latitude) AS max_rest_lat,
    MIN(Restaurant_longitude) AS min_rest_lon,
    MAX(Restaurant_longitude) AS max_rest_lon,
    MIN(Delivery_location_latitude) AS min_del_lat,
    MAX(Delivery_location_latitude) AS max_del_lat,
    MIN(Delivery_location_longitude) AS min_del_lon,
    MAX(Delivery_location_longitude) AS max_del_lon
FROM cleaned_test;