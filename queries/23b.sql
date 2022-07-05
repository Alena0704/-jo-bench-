WITH production_year_var AS (select random_between_small from random_between_small()) SELECT MIN(kt.kind) AS movie_kind,
       MIN(t.title) AS complete_nerdy_internet_movie
FROM complete_cast AS cc,
     comp_cast_type AS cct1,
     company_name AS cn,
     company_type AS ct,
     info_type AS it1,
     keyword AS k,
     kind_type AS kt,
     movie_companies AS mc,
     movie_info AS mi,
     movie_keyword AS mk,
     title AS t
WHERE cct1.kind = (select kind from comp_cast_type order by random() limit 1)  AND cn.country_code = (select country_code from company_name order by random() limit 1)  AND it1.info = (select info from info_type order by random() limit 1)  AND k.keyword IN (select keyword from keyword order by random() limit (select * from random_between(10)))  AND kt.kind IN (select kind from kind_type order by random() limit (select * from random_between(10)))  AND mi.note LIKE '%internet%'
  AND mi.info LIKE 'USA:% 200%'
  AND t.production_year >(select production_year from title order by random() limit 1)  AND kt.id = t.kind_id
  AND t.id = mi.movie_id
  AND t.id = mk.movie_id
  AND t.id = mc.movie_id
  AND t.id = cc.movie_id
  AND mk.movie_id = mi.movie_id
  AND mk.movie_id = mc.movie_id
  AND mk.movie_id = cc.movie_id
  AND mi.movie_id = mc.movie_id
  AND mi.movie_id = cc.movie_id
  AND mc.movie_id = cc.movie_id
  AND k.id = mk.keyword_id
  AND it1.id = mi.info_type_id
  AND cn.id = mc.company_id
  AND ct.id = mc.company_type_id
  AND cct1.id = cc.status_id;

