with cte as(
select user_id, sum(distance) s
from Rides
group by user_id
)

select name, ifnull(s,0) travelled_distance
from Users a
left join 
cte b
on a.id = b.user_id
order by travelled_distance desc, name;