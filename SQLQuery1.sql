--A.Data checking---
---1.Top 5 data---
SELECT TOP 5* FROM ecommercedata

---2.Duplicated Data---
SELECT goods_title_link_jump, goods_title_link_jump_href, rank_title, rank_sub, price, discount, selling_proposition, goods_title_link, COUNT(*) AS duplicate_data
FROM ecommercedata
GROUP BY goods_title_link_jump, goods_title_link_jump_href, rank_title, rank_sub, price, discount, selling_proposition, goods_title_link
HAVING COUNT(*) > 1

---3.Checks the number of NULL values ​​in each column---
SELECT 
    SUM(CASE WHEN goods_title_link_jump IS NULL THEN 1 ELSE 0 END) AS missing_goods_title_link_jump,
    SUM(CASE WHEN goods_title_link_jump_href IS NULL THEN 1 ELSE 0 END) AS missing_goods_title_link_jump_href,
    SUM(CASE WHEN rank_title IS NULL THEN 1 ELSE 0 END) AS missing_rank_title,
    SUM(CASE WHEN rank_sub IS NULL THEN 1 ELSE 0 END) AS missing_rank_sub,
    SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS missing_price,
    SUM(CASE WHEN discount IS NULL THEN 1 ELSE 0 END) AS missing_discount,
    SUM(CASE WHEN selling_proposition IS NULL THEN 1 ELSE 0 END) AS missing_selling_proposition,
    SUM(CASE WHEN goods_title_link IS NULL THEN 1 ELSE 0 END) AS missing_goods_title_link
FROM ecommercedata


--B.Data Cleaning--
---1.change data type and name of colomn---
ALTER TABLE ecommercedata ADD Price_USD DECIMAL(10,2)
ALTER TABLE ecommercedata ADD Discount_Percentage INT

EXEC sp_rename 'ecommercedata.rank_title', 'Best_Seller_Ranking', 'COLUMN';
EXEC sp_rename 'ecommercedata.rank_sub', 'Rank_Category', 'COLUMN';
EXEC sp_rename 'ecommercedata.selling_proposition', 'Sold_Recently', 'COLUMN';

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ecommercedata'

---2.Handle Special Character---
UPDATE ecommercedata
SET Best_Seller_Ranking = 
    TRY_CAST(
        REPLACE(REPLACE(REPLACE(Best_Seller_Ranking, '#', ''), 'Best Sellers', ''), ' ', '') 
        AS INT
    )
WHERE Best_Seller_Ranking IS NOT NULL

UPDATE ecommercedata
SET price = COALESCE(TRY_CAST(REPLACE(price, '$', '') AS DECIMAL(10,2)), 0)

UPDATE ecommercedata
SET discount = REPLACE(REPLACE(discount, '%', ''), '-', '')

UPDATE ecommercedata
SET Sold_Recently = 
    REPLACE(
        REPLACE(Sold_Recently, 'k', '00'), 
        'sold recently', ''
    )
WHERE Sold_Recently LIKE '%k%' OR Sold_Recently LIKE '%sold recently%'

---3. Handle null values---
UPDATE ecommercedata
SET Best_Seller_Ranking = COALESCE(Best_Seller_Ranking, 'Not Ranked'),
    Rank_Category = COALESCE(Rank_Category, 'Not Included'),
    discount = COALESCE(discount, '0'),
    Sold_Recently = COALESCE(Sold_Recently, '0'),
    goods_title_link_jump_href = COALESCE(goods_title_link_jump_href, 'No URL')


---4.Fill the empty goods_title_link_jump with the value from goods_title_link and Drop the Colomn---
UPDATE ecommercedata
SET goods_title_link_jump = goods_title_link
WHERE goods_title_link_jump IS NULL AND goods_title_link IS NOT NULL

---5.Move the value---
UPDATE ecommercedata
SET Price_USD = price

UPDATE ecommercedata
SET Discount_Percentage = discount

--6.Remove duplicate data---
----Checking Before Delete----
WITH CTE AS (
    SELECT *, 
           ROW_NUMBER() OVER (
               PARTITION BY goods_title_link_jump, goods_title_link_jump_href, Best_Seller_Ranking, Rank_Category, Price_USD, Discount_Percentage, Sold_Recently
               ORDER BY (SELECT NULL)
           ) AS row_num
    FROM ecommercedata
)
SELECT * FROM CTE WHERE row_num > 1

WITH CTE AS (
    SELECT *, 
           ROW_NUMBER() OVER (
               PARTITION BY goods_title_link_jump, goods_title_link_jump_href, Best_Seller_Ranking, Rank_Category, Price_USD, Discount_Percentage, Sold_Recently
               ORDER BY (SELECT NULL)
           ) AS row_num
    FROM ecommercedata
)
DELETE FROM ecommercedata
WHERE EXISTS (
    SELECT 1 FROM CTE 
    WHERE CTE.goods_title_link_jump = ecommercedata.goods_title_link_jump 
          AND CTE.goods_title_link_jump_href = ecommercedata.goods_title_link_jump_href
          AND CTE.Best_Seller_Ranking = ecommercedata.Best_Seller_Ranking
          AND CTE.Rank_Category = ecommercedata.Rank_Category
          AND CTE.Price_USD = ecommercedata.Price_USD
          AND CTE.Discount_Percentage = ecommercedata.Discount_Percentage
          AND CTE.Sold_Recently = ecommercedata.Sold_Recently
          AND CTE.row_num > 1
)

---7.Removing unreasonable price---
DELETE FROM ecommercedata WHERE Price_USD < 0.5 OR Price_USD > 5000

---Remove unnecessary columns---
ALTER TABLE ecommercedata
DROP COLUMN price, discount, goods_title_link 
