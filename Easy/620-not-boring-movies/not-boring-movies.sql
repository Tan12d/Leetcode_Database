# Write your MySQL query statement below

# Solution-1

select * 
from Cinema
where id % 2 = 1
and description != "boring"
order by rating desc;



# Solution-2 

