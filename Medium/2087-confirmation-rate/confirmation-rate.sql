# Write your MySQL query statement below

with a as(
select c.user_id as A, count(c.action) as cnt1,  s.user_id as B
from Confirmations c left outer join  Signups s
on c.user_id = s.user_id
group by A,B
union
select c.user_id as A, count(c.action) as cnt1, s.user_id as B
from Confirmations c right outer join  Signups s
on c.user_id = s.user_id
group by A,B
), b as(
select c.user_id as A, count(c.action) as cnt2, s.user_id as B
from Confirmations c left outer join  Signups s
on c.user_id = s.user_id
where action = "confirmed"
group by A,B
union
select c.user_id as A, count(c.action) as cnt2, s.user_id as B
from Confirmations c right outer join  Signups s
on c.user_id = s.user_id
where action = "confirmed"
group by A,B
), d as(
SELECT COALESCE(a.A, a.B) AS merged_column, COALESCE(cnt2,0)/COALESCE(cnt1, 0) AS cnt1
FROM a left join b
on a.A = b.A and a.B = b.B
union
SELECT COALESCE(a.A, a.B) AS merged_column, COALESCE(cnt2,0)/COALESCE(cnt1, 0) AS cnt1
FROM a right join b
on a.A = b.A and a.B = b.B
), e as (
select merged_column as user_id, coalesce(cnt1,0) as confirmation_rate
from d)

select user_id, round(confirmation_rate,2) as confirmation_rate
from e;