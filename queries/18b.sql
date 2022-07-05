WITH production_year_var AS (select random_between_small from random_between_small()) SELECT MIN(mi.info) AS movie_budget,
       MIN(mi_idx.info) AS movie_votes,
       MIN(t.title) AS movie_title
FROM cast_info AS ci,
production_year_var,      info_type AS it1,
     info_type AS it2,
     movie_info AS mi,
     movie_info_idx AS mi_idx,
     name AS n,
     title AS t
WHERE ci.note IN (select note from cast_info order by random() limit (select * from random_between(10)))  AND it1.info = (select info from info_type order by random() limit 1)  AND it2.info = (select info from info_type order by random() limit 1)  AND mi.info IN (select info from movie_info order by random() limit (select * from random_between(10)))  AND mi.note IS NULL
  AND mi_idx.info > (select info from movie_info order by random() limit 1)  AND n.gender IS NOT NULL
  AND n.gender = (select gender from name order by random() limit 1) AND production_year between random_between_small and floor(random()* (2019-1 + random_between_small) + random_between_small)  AND t.id = mi.movie_id
  AND t.id = mi_idx.movie_id
  AND t.id = ci.movie_id
  AND ci.movie_id = mi.movie_id
  AND ci.movie_id = mi_idx.movie_id
  AND mi.movie_id = mi_idx.movie_id
  AND n.id = ci.person_id
  AND it1.id = mi.info_type_id
  AND it2.id = mi_idx.info_type_id;

