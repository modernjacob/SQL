-- Self Join 

SELECT DISTINCT
  p1.product_name, 
  p1.list_price
FROM 
  products p1
JOIN
  products p2 ON p1.product_id <> p2.product_id
  AND p1.list_price = p2.list_price
ORDER BY product_name;
 
 
-- Join on NULL

SELECT DISTINCT
  c.category_name,
  p.product_id
FROM 
  categories c
LEFT JOIN
  products p ON c.category_id = p.category_id
WHERE product_id IS NULL;
