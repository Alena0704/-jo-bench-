WITH production_year_var AS (select random_between_small from random_between_small()) SELECT MIN(t.title) AS american_movie
FROM company_type AS ct,
     info_type AS it,
     movie_companies AS mc,
     movie_info AS mi,
     title AS t
WHERE ct.kind = (select kind from company_type order by random() limit 1)  AND mc.note NOT LIKE '%(TV)%'
  AND mc.note LIKE '%(USA)%'
  AND mi.info IN (select info from movie_info order by random() limit (select * from random_between(10)))  AND t.production_year >(select production_year from title order by random() limit 1)  AND t.id = mi.movie_id
  AND t.id = mc.movie_id
  AND mc.movie_id = mi.movie_id
  AND ct.id = mc.company_type_id
  AND it.id = mi.info_type_id;

