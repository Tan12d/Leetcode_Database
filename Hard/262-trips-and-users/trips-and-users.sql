with cte as(
select request_at, count(status) cnt1
from Trips
where client_id not in (select users_id from Users where banned = "Yes") and driver_id not in (select users_id from Users where banned = "Yes")
group by request_at
), cte1 as(
select request_at, count(status) cnt2
from Trips
where status like "ca%" and client_id not in (select users_id from Users where banned = "Yes") and driver_id not in (select users_id from Users where banned = "Yes")
group by request_at
)

select a.request_at as Day, ifnull(round(cnt2/cnt1,2),0) as "Cancellation Rate"
from cte a
left join
cte1 b
on a.request_at = b.request_at
where a.request_at between '2013-10-01' and '2013-10-03';
