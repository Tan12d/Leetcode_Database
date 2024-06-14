with cte2 as(
select a.sales_id, a.name, c.name as company_name
from SalesPerson a
left join 
Orders b
using(sales_id)
left join 
Company c
using(com_id)
)

select distinct name
from cte2
where sales_id not in (select sales_id from cte2 where company_name = "RED");
