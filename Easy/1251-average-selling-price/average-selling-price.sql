# Write your MySQL query statement below

with cte as (
select A.product_id, (A.price * ifnull(B.units,0)) as val, units
from Prices A
left join
UnitsSold B
on A.product_id = B.product_id
where (B.purchase_date is null) or (B.purchase_date >= A.start_date and B.purchase_date <= A.end_date)
), cte1 as (
select product_id, ifnull(round((sum(val)/sum(units)),2),0) as average_price
from cte
group by product_id
)

select * from cte1;