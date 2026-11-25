-- Session 4 Homework
-- Task 2: Recommend popular products
-- in the same category and by the same author,
-- excluding the purchased product.
--
-- Assumptions:
-- 1. Popularity = total quantity sold.
-- 2. author_id exists in the product table because the task
--    requires recommendations for the same author.
-- 3. 101 represents the purchased product for this example.
--    In the real application, this value should come from the user/order input.

WITH purchased_product AS (
    SELECT
        product_id,
        category_id,
        author_id
    FROM products
    WHERE product_id = 101
)

SELECT
    p.product_id,
    p.product_name,
    SUM(od.quantity) AS total_quantity_sold
FROM products p
JOIN order_details od
    ON p.product_id = od.product_id
CROSS JOIN purchased_product pp
WHERE p.category_id = pp.category_id
  AND p.author_id = pp.author_id
  AND p.product_id <> pp.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_quantity_sold DESC;
