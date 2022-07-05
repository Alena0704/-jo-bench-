WITH production_year_var AS (select random_between_small from random_between_small()) SELECT MIN(t.title) AS movie_title
FROM keyword AS k,
     movie_info AS mi,
     movie_keyword AS mk,
     title AS t
WHERE k.keyword LIKE '%sequel%'
  AND mi.info IN (select info from movie_info order by random() limit (select * from random_between(10)))  AND t.production_year >(select production_year from title order by random() limit 1)  AND t.id = mi.movie_id
  AND t.id = mk.movie_id
  AND mk.movie_id = mi.movie_id
  AND k.id = mk.keyword_id;

