-- View the menu_items table and write a query to find the number of items on the menu
select * from menu_items;
select count(*) from menu_items;

-- What are the least and most expensive items on the menu? as "Most Expensive" as "Least Expensive"
SELECT item_name, price
FROM menu_items 
WHERE price = (SELECT MAX(price) FROM menu_items)
   OR price = (SELECT MIN(price) FROM menu_items)
order by price desc;

-- How many Italian dishes are on the menu? 
select * from menu_items
where category = "Italian";
-- 
-- What are the least and most expensive Italian dishes on the menu?
select item_name,price from menu_items
where category = "Italian" and
price IN ( 
			(select Max(price) from menu_items where category = "Italian"),(select Min(price) from menu_items where category = "Italian")
		)
order by price desc;

-- How many dishes are in each category? 
select category, count(menu_item_id) as "No. of dishes"
from menu_items
group by category;

-- What is the average dish price within each category?
select category, round(avg(price),2) as "Average Price"
from menu_items
group by category;

