WITH production_year_var AS (select random_between_small from random_between_small()) SELECT MIN(mi_idx.info) AS rating,
       MIN(t.title) AS movie_title
FROM info_type AS it,
     keyword AS k,
     movie_info_idx AS mi_idx,
     movie_keyword AS mk,
     title AS t
WHERE it.info =(select info from info_type order by random() limit 1)  AND k.keyword LIKE '%sequel%'
  AND mi_idx.info > (select info from movie_info_idx order by random() limit 1)  AND t.production_year >(select production_year from title order by random() limit 1)  AND t.id = mi_idx.movie_id
  AND t.id = mk.movie_id
  AND mk.movie_id = mi_idx.movie_id
  AND k.id = mk.keyword_id
  AND it.id = mi_idx.info_type_id;

