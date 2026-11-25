-- Session 4 Homework
-- Task 1: Search for products containing "camera"
-- in the product name or description.

SELECT
    product_id,
    product_name,
    description
FROM products
WHERE product_name ILIKE '%camera%'
   OR description ILIKE '%camera%';
