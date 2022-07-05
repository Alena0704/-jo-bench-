WITH production_year_var AS (select random_between_small from random_between_small()) SELECT MIN(cn.name) AS company_name,
       MIN(lt.link) AS link_type,
       MIN(t.title) AS german_follow_up
FROM company_name AS cn,
production_year_var,      company_type AS ct,
     keyword AS k,
     link_type AS lt,
     movie_companies AS mc,
     movie_info AS mi,
     movie_keyword AS mk,
     movie_link AS ml,
     title AS t
WHERE cn.country_code !=(select country_code from company_name order by random() limit 1)  AND (cn.name LIKE '%Film%'
       OR cn.name LIKE '%Warner%')
  AND ct.kind =(select kind from company_type order by random() limit 1)  AND k.keyword =(select keyword from keyword order by random() limit 1)  AND lt.link LIKE '%follow%'
  AND mc.note IS NULL
  AND mi.info IN (select info from movie_info order by random() limit (select * from random_between(10))) AND production_year between random_between_small and floor(random()* (2019-1 + random_between_small) + random_between_small)  AND lt.id = ml.link_type_id
  AND ml.movie_id = t.id
  AND t.id = mk.movie_id
  AND mk.keyword_id = k.id
  AND t.id = mc.movie_id
  AND mc.company_type_id = ct.id
  AND mc.company_id = cn.id
  AND mi.movie_id = t.id
  AND ml.movie_id = mk.movie_id
  AND ml.movie_id = mc.movie_id
  AND mk.movie_id = mc.movie_id
  AND ml.movie_id = mi.movie_id
  AND mk.movie_id = mi.movie_id
  AND mc.movie_id = mi.movie_id;

