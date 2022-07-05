WITH production_year_var AS (select random_between_small from random_between_small()) SELECT MIN(mi.info) AS movie_budget,
       MIN(mi_idx.info) AS movie_votes,
       MIN(n.name) AS writer,
       MIN(t.title) AS complete_gore_movie
FROM complete_cast AS cc,
     comp_cast_type AS cct1,
     comp_cast_type AS cct2,
     cast_info AS ci,
     info_type AS it1,
     info_type AS it2,
     keyword AS k,
     movie_info AS mi,
     movie_info_idx AS mi_idx,
     movie_keyword AS mk,
     name AS n,
     title AS t
WHERE cct1.kind IN (select kind from comp_cast_type order by random() limit (select * from random_between(10)))  AND cct2.kind =(select kind from comp_cast_type order by random() limit 1)  AND ci.note IN (select note from cast_info order by random() limit (select * from random_between(10)))  AND it1.info = (select info from info_type order by random() limit 1)  AND it2.info = (select info from info_type order by random() limit 1)  AND k.keyword IN (select keyword from keyword order by random() limit (select * from random_between(10)))  AND mi.info IN (select info from movie_info order by random() limit (select * from random_between(10)))  AND n.gender = (select gender from name order by random() limit 1)  AND t.production_year >(select production_year from title order by random() limit 1)  AND (t.title LIKE '%Freddy%'
       OR t.title LIKE '%Jason%'
       OR t.title LIKE 'Saw%')
  AND t.id = mi.movie_id
  AND t.id = mi_idx.movie_id
  AND t.id = ci.movie_id
  AND t.id = mk.movie_id
  AND t.id = cc.movie_id
  AND ci.movie_id = mi.movie_id
  AND ci.movie_id = mi_idx.movie_id
  AND ci.movie_id = mk.movie_id
  AND ci.movie_id = cc.movie_id
  AND mi.movie_id = mi_idx.movie_id
  AND mi.movie_id = mk.movie_id
  AND mi.movie_id = cc.movie_id
  AND mi_idx.movie_id = mk.movie_id
  AND mi_idx.movie_id = cc.movie_id
  AND mk.movie_id = cc.movie_id
  AND n.id = ci.person_id
  AND it1.id = mi.info_type_id
  AND it2.id = mi_idx.info_type_id
  AND k.id = mk.keyword_id
  AND cct1.id = cc.subject_id
  AND cct2.id = cc.status_id;

