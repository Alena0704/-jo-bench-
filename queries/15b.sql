WITH production_year_var AS (select random_between_small from random_between_small()) SELECT MIN(mi.info) AS release_date,
       MIN(t.title) AS youtube_movie
FROM aka_title AS at,
production_year_var,      company_name AS cn,
     company_type AS ct,
     info_type AS it1,
     keyword AS k,
     movie_companies AS mc,
     movie_info AS mi,
     movie_keyword AS mk,
     title AS t
WHERE cn.country_code = (select country_code from company_name order by random() limit 1)  AND cn.name = (select name from company_name order by random() limit 1)  AND it1.info = (select info from info_type order by random() limit 1)  AND mc.note LIKE '%(200%)%'
  AND mc.note LIKE '%(worldwide)%'
  AND mi.note LIKE '%internet%'
  AND mi.info LIKE 'USA:% 200%'
 AND t.production_year between random_between_small and floor(random()* (2019-1 + random_between_small) + random_between_small)  AND t.id = at.movie_id
  AND t.id = mi.movie_id
  AND t.id = mk.movie_id
  AND t.id = mc.movie_id
  AND mk.movie_id = mi.movie_id
  AND mk.movie_id = mc.movie_id
  AND mk.movie_id = at.movie_id
  AND mi.movie_id = mc.movie_id
  AND mi.movie_id = at.movie_id
  AND mc.movie_id = at.movie_id
  AND k.id = mk.keyword_id
  AND it1.id = mi.info_type_id
  AND cn.id = mc.company_id
  AND ct.id = mc.company_type_id;

