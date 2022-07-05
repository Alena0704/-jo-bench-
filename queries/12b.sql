WITH production_year_var AS (select random_between_small from random_between_small()) SELECT MIN(mi.info) AS budget,
       MIN(t.title) AS unsuccsessful_movie
FROM company_name AS cn,
     company_type AS ct,
     info_type AS it1,
     info_type AS it2,
     movie_companies AS mc,
     movie_info AS mi,
     movie_info_idx AS mi_idx,
     title AS t
WHERE cn.country_code =(select country_code from company_name order by random() limit 1)  AND ct.kind IS NOT NULL
  AND ct.kind =(select kind from company_type order by random() limit 1)       OR ct.kind = (select kind from company_type order by random() limit 1)  AND it1.info =(select info from info_type order by random() limit 1)  AND it2.info =(select info from info_type order by random() limit 1)  AND t.production_year >(select production_year from title order by random() limit 1)  AND (t.title LIKE 'Birdemic%'
       OR t.title LIKE '%Movie%')
  AND t.id = mi.movie_id
  AND t.id = mi_idx.movie_id
  AND mi.info_type_id = it1.id
  AND mi_idx.info_type_id = it2.id
  AND t.id = mc.movie_id
  AND ct.id = mc.company_type_id
  AND cn.id = mc.company_id
  AND mc.movie_id = mi.movie_id
  AND mc.movie_id = mi_idx.movie_id
  AND mi.movie_id = mi_idx.movie_id;