# Write your MySQL query statement below

with cte as(
select customer_id, count(distinct product_key) as cnt
from Customer
group by customer_id
)

select customer_id 
from cte
where cnt = (select count(product_key) from Product);