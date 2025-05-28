-- Combine the menu_items and order_details tables into a single table
select * from order_details o 
left join menu_items m 
on m.menu_item_id = o.item_id; 

-- What were the least and most ordered items? What categories were they in?

select m.item_name,m.category, count(o.order_details_id) as count_of_orders
from order_details o 
left join menu_items m on o.item_id = m.menu_item_id
group by o.item_id
order by count_of_orders desc
limit 1;

select m.item_name,m.category, count(o.order_details_id) as count_of_orders
from order_details o 
left join menu_items m on o.item_id = m.menu_item_id
group by o.item_id
order by count_of_orders
limit 1;


-- What were the TOP 5 ORDERS that spent the most money? Order ids which spent most amount of money

select o.order_id,sum(m.price) as amount_spent
from order_details o 
left join menu_items m on o.item_id = m.menu_item_id
group by o.order_id
order by amount_spent desc
limit 5;

-- View the details of the HIGHEST SPEND ORDER. Which specific items were purchased? i.e the order id who ordered the most items
select m.category,count(o.item_id) as num_of_items,sum(m.price) as amount_spent
from order_details o 
left join menu_items m on o.item_id = m.menu_item_id
where order_id = 440
group by category
order by amount_spent desc;


-- View the details of the top 5 highest spend orders
select o.order_id,m.category,count(o.item_id) as num_of_items,sum(m.price) as amount_spent
from order_details o 
left join menu_items m on o.item_id = m.menu_item_id
where order_id IN (440,2075,1957,330,2675)
group by order_id,category
order by amount_spent desc;
