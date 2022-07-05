WITH production_year_var AS (select random_between_small from random_between_small()) SELECT MIN(mc.note) AS production_note,
       MIN(t.title) AS movie_title,
       MIN(t.production_year) AS movie_year
FROM company_type AS ct,
production_year_var,      info_type AS it,
     movie_companies AS mc,
     movie_info_idx AS mi_idx,
     title AS t
WHERE ct.kind = (select note from cast_info order by random() limit 1)  AND it.info = (select info from info_type order by random() limit 1)  AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%'
 AND production_year between random_between_small and floor(random()* (2019-1 + random_between_small) + random_between_small)  AND ct.id = mc.company_type_id
  AND t.id = mc.movie_id
  AND t.id = mi_idx.movie_id
  AND mc.movie_id = mi_idx.movie_id
  AND it.id = mi_idx.info_type_id;

