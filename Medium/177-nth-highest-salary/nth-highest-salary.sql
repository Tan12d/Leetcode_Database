# Solution-1

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  declare t_val INT;

    with cte as(
          select N-1 as t
        )

    select t into t_val from cte;

  RETURN (  
      select distinct(salary) from Employee order by salary desc limit t_val , 1  
  );
END

# Solution-2

-- CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
-- BEGIN
--   RETURN (  
--       with cte as(
--        select *, 
--        dense_rank() over(order by salary desc) as Rnk
--        from Employee
--       )

--       select salary 
--       from cte 
--       where Rnk = N
--       limit 1
--   );
-- END

# Solution-3

-- CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
-- BEGIN
-- DECLARE t_val INT;
-- DECLARE cnt INT;

-- -- Calculate the count of distinct ranks
-- SELECT COUNT(DISTINCT Rnk) INTO cnt
-- FROM (
--   SELECT dense_rank() over (ORDER BY salary DESC) as Rnk
--   FROM Employee
-- ) AS cte1;

-- -- Calculate the value of t_val
-- WITH cte AS (
--   SELECT N-1 as t
-- )
-- SELECT t INTO t_val FROM cte;

-- IF cnt >= N THEN 
--   RETURN (
--     -- Select the Nth highest salary
--     SELECT distinct(salary) 
--     FROM Employee 
--     ORDER BY salary DESC 
--     LIMIT t_val, 1
--   );
-- ELSE
--   RETURN NULL;
-- END IF;
-- END

# Solution-4

-- CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
-- BEGIN
--   set N = N-1;
--   RETURN (  
--       SELECT DISTINCT(salary) from Employee order by salary DESC limit N,1
--   );
-- END