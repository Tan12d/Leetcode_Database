# Write your MySQL query statement below

with cte as(
select distinct product_id
from Products
), cte1 as (
select product_id, new_price, change_date
from Products
where trim(change_date) = '2019-08-16' or trim(change_date) < '2019-08-16'
),cte2 as (
select b.product_id, ifnull(a.new_price,10) price, change_date, dense_rank() over(partition by product_id order by trim(a.change_date) desc) rnk
from cte1 a
right join
cte b
on a.product_id = b.product_id
)

select product_id, sum(price) price
from 
(select product_id, sum(price) price
from cte2
group by rnk, price, product_id
having rnk=1) t
group by product_id;