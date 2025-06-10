SELECT *
FROM products
WHERE properties ->> 'color' = 'red';
