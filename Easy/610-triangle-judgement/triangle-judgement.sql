# Write your MySQL query statement below

with cte as(
select x, y, z, (y+z) as x1, (x+z) as y1, (x+y) as z1
from Triangle
)

select x, y , z,
case
 when x1>x and y1>y and z1>z 
  then "Yes"
 else
  "No"
end as triangle
from cte;