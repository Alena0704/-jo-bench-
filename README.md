# join-order-benchmark
<p>This repository is a fork of the <a href = 'https://github.com/gregrahn/join-order-benchmark'>original project</a> and <a href = 'https://github.com/danolivo/jo-bench'>another project</a>. Previous version of queries were static, now we have several parameterized conditional expressions. A parametrized expression means us to get a random expression from the given column to belong to the conditional expression.</p>

Repository contains some scripts for quick deploy & run of the benchmark:
    schema.sql - creates the data schema.
    copy.sql - copies data from csv files into the tables. Uses datadir variable to make absolute paths to csv files. Use psql -v to define it.
    functions_for_parametrised.sql - script create necessary functions for parametrised expressions.
    
Extention scripts for creating work space and testing:
    job - run creating schema and insrting datas
    job_test - run test for checking <a href = 'https://github.com/postgrespro/aqo'> AQO </a>. Also it containces some settings.
    
