--Creating new columns for discount amounts and pricing

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
