WITH production_year_var AS (select random_between_small from random_between_small()) SELECT MIN(n.name) AS voicing_actress,
       MIN(t.title) AS jap_engl_voiced_movie
FROM aka_name AS an,
     char_name AS chn,
     cast_info AS ci,
     company_name AS cn,
     info_type AS it,
     movie_companies AS mc,
     movie_info AS mi,
     name AS n,
     role_type AS rt,
     title AS t
WHERE ci.note IN (select note from cast_info order by random() limit (select * from random_between(10)))  AND cn.country_code =(select country_code from company_name order by random() limit 1)  AND it.info = (select info from info_type order by random() limit 1)  AND n.gender =(select gender from name order by random() limit 1)  AND rt.role =(select role from role_type order by random() limit 1)  AND t.production_year >(select production_year from title order by random() limit 1)  AND t.id = mi.movie_id
  AND t.id = mc.movie_id
  AND t.id = ci.movie_id
  AND mc.movie_id = ci.movie_id
  AND mc.movie_id = mi.movie_id
  AND mi.movie_id = ci.movie_id
  AND cn.id = mc.company_id
  AND it.id = mi.info_type_id
  AND n.id = ci.person_id
  AND rt.id = ci.role_id
  AND n.id = an.person_id
  AND ci.person_id = an.person_id
  AND chn.id = ci.person_role_id;

