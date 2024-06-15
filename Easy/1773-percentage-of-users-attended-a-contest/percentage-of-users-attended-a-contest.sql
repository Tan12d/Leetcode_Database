# Write your MySQL query statement below

select contest_id, round((count(a.user_id)/(select count(*) from Users))*100,2) as percentage
from Register b
left join
Users a
on b.user_id = a.user_id
group by contest_id
order by percentage desc,
contest_id;