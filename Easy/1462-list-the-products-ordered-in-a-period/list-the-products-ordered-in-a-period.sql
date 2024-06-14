# Write your MySQL query statement below

with cte as(
select product_id, sum(unit) as unit
from 
(
select product_id, sum(unit) as unit
from Orders
group by product_id, order_date
having month(order_date) = 2
and year(order_date) = 2020
) t
group by product_id
having unit >= 100
)

select product_name, unit
from cte
left join Products
on cte.product_id = Products.product_id;

-- with cte as(
-- select product_id, sum(unit) as unit
-- from 
-- (
-- select product_id, sum(unit) as unit
-- from Orders
-- group by product_id, order_date
-- having monthname(order_date) = 'February'
-- and year(order_date) = 2020
-- ) t
-- group by product_id
-- having unit >= 100
-- )

-- select product_name, unit
-- from cte
-- left join Products
-- on cte.product_id = Products.product_id;