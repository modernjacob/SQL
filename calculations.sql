-- Creating new columns for discount amounts and pricing

SELECT
  product name,
  list_price,
  discount percent,
  ROUND(list_price * (discount percent * .01), 2) AS discount_amount,
  ROUND(list price - (list_price * (discount_percent * .01)), 2) AS discount_price
FROM
  products
ORDER BY discount_price DESC
LIMIT 5;


-- Calculating totals with quantity

SELECT
  iten_id,
  item_price,
  discount_amount,
  quantity,
  item_price * quantity AS price_total,
  discount_amount * quantity AS discount_total,
  (item_price - discount_amount) * quantity AS item_total
 FROM
  order_items
HAVING item_total > 500
ORDER BY item_total DESC;


-- Grouping sums and grand totals, with rollup
SELECT
  IF(GROUPING(c.category_name) = 1,
    'Grand Total',
    c.category_name) AS category_name,
  IF(GROUPING(p.product_name) = 1,
    'Category Total',
    p.prodct_name) AS product_name,
    SUM(o.product_id) AS total_quantity
FROM
  categories c,
  products p,
  order_items o
WHERE
  c.category_id = p.category_id
  AND p.product_id = o.product_id
GROUP BY category_name, product_name WITH ROLLUP
HAVING GROUPING(c.category) = 1
  OR GROUPING(p.product_name) =1;
  
