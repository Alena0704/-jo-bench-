WITH production_year_var AS (select random_between_small from random_between_small()) SELECT MIN(n.name) AS cast_member_name,
       MIN(pi.info) AS cast_member_info
FROM aka_name AS an,
production_year_var,      cast_info AS ci,
     info_type AS it,
     link_type AS lt,
     movie_link AS ml,
     name AS n,
     person_info AS pi,
     title AS t
WHERE an.name IS NOT NULL
  AND (an.name LIKE '%a%'
       OR an.name LIKE 'A%')
  AND it.info =(select info from info_type order by random() limit 1)  AND lt.link IN (select link from link_type order by random() limit (select * from random_between(10)))  AND n.name_pcode_cf BETWEEN 'A' AND 'F'
  AND (n.gender=(select gender from name order by random() limit 1)       OR (n.gender = (select gender from name order by random() limit 1)           AND n.name LIKE 'A%'))
  AND pi.note IS NOT NULL
 AND production_year between random_between_small and floor(random()* (2019-1 + random_between_small) + random_between_small)  AND n.id = an.person_id
  AND n.id = pi.person_id
  AND ci.person_id = n.id
  AND t.id = ci.movie_id
  AND ml.linked_movie_id = t.id
  AND lt.id = ml.link_type_id
  AND it.id = pi.info_type_id
  AND pi.person_id = an.person_id
  AND pi.person_id = ci.person_id
  AND an.person_id = ci.person_id
  AND ci.movie_id = ml.linked_movie_id;

