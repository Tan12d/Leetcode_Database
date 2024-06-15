# Write your MySQL query statement below

with cte_ as (
    select salary, dense_rank() over(order by salary desc) as rnk
    from Employee
), cte_1 as (
    select salary, rnk, count(rnk) as cnt
    from cte_
    group by rnk, salary
    ), cte_2 as (
     select count(*) as row_cnt
     from cte_1
     where rnk =2
     )
     
select
 case 
  when rnk = 2 and cnt >=1 then salary
  else null
 end as SecondHighestSalary
from cte_1
where rnk = 2 or (select row_cnt from cte_2) = 0;