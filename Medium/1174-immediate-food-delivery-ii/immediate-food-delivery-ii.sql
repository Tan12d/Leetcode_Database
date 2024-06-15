# Write your MySQL query statement below

select round((count(Status)/(select count(distinct customer_id) from Delivery))*100,2) immediate_percentage
from
(
select 
case
when min(order_date)=min(customer_pref_delivery_date) then "Immediate"
else "Scheduled"
end as Status
from Delivery
group by customer_id
) t
where Status = "Immediate";