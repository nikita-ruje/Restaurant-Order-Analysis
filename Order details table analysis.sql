-- View the order_details table. What is the date range of the table?
select * from order_details;
select min(order_date) as "Start_date", max(order_date) as "End date"
from order_details;

-- How many orders were made within this date range? 
select count(distinct order_id) as "Orders"
from order_details;

-- How many items were ordered within this date range?
select count(order_details_id) as "Items Ordered"
from order_details;

-- Which orders had the most number of items?
select order_id, count(item_id) as num_of_items
from order_details
group by order_id
order by num_of_items desc;

-- How many orders had more than 12 items?
select count(*) as "No. of Orders > 12" from
(select order_id,count(item_id) as num_of_items
from order_details
group by order_id
having count(item_id)>12) as num_orders;
