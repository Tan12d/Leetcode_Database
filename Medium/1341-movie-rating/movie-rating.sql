(select name results
from Users
where user_id in (select user_id
					from ( select user_id, count(rating) cnt
							from MovieRating
                            group by user_id) t
					where cnt = (select max(cnt)
								from (select user_id, count(rating) cnt
									  from MovieRating
									  group by user_id
									 ) t1
								)
				)
order by name
limit 1
)
union all
(select title results
from Movies
where movie_id in (select movie_id
					from ( select movie_id, avg(rating) avgrt
							from MovieRating
                            where month(created_at) =2 and year(created_at) = 2020
                            group by movie_id) x
					where avgrt = (select max(avgrt)
								   from (select movie_id, avg(rating) avgrt
									     from MovieRating
                                         where month(created_at) =2 and year(created_at) = 2020
									     group by movie_id
										) x1
								  )
				   )
order by title
limit 1
);