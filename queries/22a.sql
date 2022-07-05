WITH production_year_var AS (select random_between_small from random_between_small()) SELECT MIN(cn.name) AS movie_company,
       MIN(mi_idx.info) AS rating,
       MIN(t.title) AS western_violent_movie
FROM company_name AS cn,
     company_type AS ct,
     info_type AS it1,
     info_type AS it2,
     keyword AS k,
     kind_type AS kt,
     movie_companies AS mc,
     movie_info AS mi,
     movie_info_idx AS mi_idx,
     movie_keyword AS mk,
     title AS t
WHERE cn.country_code != (select country_code from company_name order by random() limit 1)  AND it1.info = (select info from info_type order by random() limit 1)  AND it2.info = (select info from info_type order by random() limit 1)  AND k.keyword IN (select keyword from keyword order by random() limit (select * from random_between(10)))  AND kt.kind IN (select kind from kind_type order by random() limit (select * from random_between(10)))  AND mc.note NOT LIKE '%(USA)%'
  AND mc.note LIKE '%(200%)%'
  AND mi.info IN (select info from movie_info order by random() limit (select * from random_between(10)))  AND mi_idx.info < (select info from movie_info_idx order by random() limit 1)  AND t.production_year >(select production_year from title order by random() limit 1)  AND kt.id = t.kind_id
  AND t.id = mi.movie_id
  AND t.id = mk.movie_id
  AND t.id = mi_idx.movie_id
  AND t.id = mc.movie_id
  AND mk.movie_id = mi.movie_id
  AND mk.movie_id = mi_idx.movie_id
  AND mk.movie_id = mc.movie_id
  AND mi.movie_id = mi_idx.movie_id
  AND mi.movie_id = mc.movie_id
  AND mc.movie_id = mi_idx.movie_id
  AND k.id = mk.keyword_id
  AND it1.id = mi.info_type_id
  AND it2.id = mi_idx.info_type_id
  AND ct.id = mc.company_type_id
  AND cn.id = mc.company_id;

