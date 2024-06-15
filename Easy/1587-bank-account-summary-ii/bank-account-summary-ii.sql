with cte as(
    select account, sum(amount) balance
    from Transactions
    group by account
)

select name, balance
from Users 
left join
cte
on Users.account = cte.account
where balance > 10000;