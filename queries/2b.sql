WITH production_year_var AS (select random_between_small from random_between_small()) SELECT MIN(t.title) AS movie_title
FROM company_name AS cn,
     keyword AS k,
     movie_companies AS mc,
     movie_keyword AS mk,
     title AS t
WHERE cn.country_code =(select country_code from company_name order by random() limit 1)  AND k.keyword =(select keyword from keyword order by random() limit 1)  AND cn.id = mc.company_id
  AND mc.movie_id = t.id
  AND t.id = mk.movie_id
  AND mk.keyword_id = k.id
  AND mc.movie_id = mk.movie_id;

