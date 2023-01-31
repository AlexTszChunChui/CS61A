.read data.sql


CREATE TABLE average_prices AS
  SELECT category, AVG(MSRP) AS average_price FROM products GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store, item, MIN(price) AS lowest_price FROM inventory GROUP BY item;


CREATE TABLE shopping_list AS
  SELECT b.item AS item, b.store AS store FROM products AS a, lowest_prices AS b WHERE a.name = b.item 
  GROUP BY a.category HAVING MIN(a.MSRP/a.rating);


CREATE TABLE total_bandwidth AS
  SELECT SUM(a.Mbs) AS Mbs FROM stores AS a, shopping_list AS b WHERE b.store = a.store;
  

