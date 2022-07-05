WITH production_year_var AS (select random_between_small from random_between_small()) SELECT MIN(an.name) AS alternative_name,
       MIN(chn.name) AS character_name,
       MIN(t.title) AS movie
FROM aka_name AS an,
production_year_var,      char_name AS chn,
     cast_info AS ci,
     company_name AS cn,
     movie_companies AS mc,
     name AS n,
     role_type AS rt,
     title AS t
WHERE ci.note IN (select note from cast_info order by random() limit (select * from random_between(10)))  AND cn.country_code =(select country_code from company_name order by random() limit 1)  AND mc.note IS NOT NULL
  AND (mc.note LIKE '%(USA)%'
       OR mc.note LIKE '%(worldwide)%')
  AND n.gender =(select gender from name order by random() limit 1)  AND n.name LIKE '%Ang%'
  AND rt.role =(select role from role_type order by random() limit 1) AND production_year between random_between_small and floor(random()* (2019-1 + random_between_small) + random_between_small)  AND ci.movie_id = t.id
  AND t.id = mc.movie_id
  AND ci.movie_id = mc.movie_id
  AND mc.company_id = cn.id
  AND ci.role_id = rt.id
  AND n.id = ci.person_id
  AND chn.id = ci.person_role_id
  AND an.person_id = n.id
  AND an.person_id = ci.person_id;

