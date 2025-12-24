SELECT job_posted_date
FROM job_postings_fact 
LIMIT 10;

SELECT job_title_short as title , 
job_location as location ,
job_posted_date  as date 
from job_postings_fact  
limit 10 ;

SELECT job_title_short as title , 
job_location as location ,
job_posted_date :: date as date 
from job_postings_fact 
limit 10; 

SELECT job_title_short as title , 
job_location as location ,
job_posted_date at time zone 'UTC' at time zone 'EST'  as date_time 
from job_postings_fact  
limit 10 ;

SELECT job_title_short as title , 
job_location as location ,
job_posted_date at time zone 'UTC' at time zone 'EST'  as date_time ,
EXTRACT(MONTH from job_posted_date ) as date_month ,
EXTRACT(year from job_posted_date ) as date_year
from job_postings_fact  
limit 10 ;

select 
    count(job_id) as job_posted_count, 
    EXTRACT(MONTH from job_posted_date) as month 
from job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY MONTH 
ORDER BY      job_posted_count DESC;


SELECT 
    job_schedule_type ,
    avg(salary_hour_avg) as avg_salary_hour ,  
    avg(salary_year_avg) as avg_salary_year 
from job_postings_fact
WHERE job_posted_date > '2023-06-01'
GROUP by job_schedule_type ; 

SELECT 
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month,
    COUNT(job_id) AS posting_count
FROM 
    job_postings_fact
WHERE 
    EXTRACT(YEAR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') = 2023
GROUP BY 
    month
ORDER BY 
    month;

SELECT DISTINCT
    company_dim.name
FROM 
    job_postings_fact
INNER JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_health_insurance = TRUE 
    AND EXTRACT(QUARTER FROM job_posted_date) = 2
    AND EXTRACT(YEAR FROM job_posted_date) = 2023;



Create table january_jobs as 
select * 
from job_postings_fact 
WHERE EXTRACT(month from job_posted_date) = 1 ;

Create table february_jobs as 
select * 
from job_postings_fact 
WHERE EXTRACT(month from job_posted_date) = 2;

Create table march_jobs as 
select * 
from job_postings_fact 
WHERE EXTRACT(month from job_posted_date) = 3;




select
count(job_id) as numbers_of_jobs , 
case 
when job_location = 'Anywhere' then 'remote'
when job_location = 'New York, NY' then 'local'
else 'onsite'
end as location_category 
from job_postings_fact 
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category  
ORDER BY numbers_of_jobs DESC ;


select *
from (select *
    from job_postings_fact 
    WHERE EXTRACT(month from job_posted_date) = 1
)
as january_jobs



with january_jobs as ( 
    select * 
    from job_postings_fact 
    WHERE EXTRACT(month from job_posted_date) = 1
)
select * 
from january_jobs



select name ,
company_id  
from company_dim 
WHERE company_id in (
    select company_id
    from
    job_postings_fact
    WHERE job_no_degree_mention = TRUE
    order BY company_id
)


with company_job_count as (
    select company_id ,
    count(*) as total_jobs
    from job_postings_fact
    GROUP BY company_id
)
select company_dim.name as company_name ,
company_job_count.total_jobs 
from company_dim
left join company_job_count on company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs DESC ; 

with remote_job_skills as (
    select 
        skill_id ,
        count(*) as skill_coount
    from 
        skills_job_dim as skills_to_job
    INNER JOIN job_postings_fact as job_postings on job_postings.job_id = skills_to_job.job_id
    where job_postings.job_work_from_home = TRUE and 
        job_postings.job_title_short = 'Data Analyst'
    GROUP BY skill_id
)
select 
skills.skill_id , skills as skill_name , skill_coount
 from remote_job_skills
INNER join skills_dim as skills on skills.skill_id = remote_job_skills.skill_id
ORDER BY skill_coount DESC
limit 5 ;

select 
job_title_short ,
company_id ,
job_location 
from january_jobs

UNION all

select 
job_title_short ,
company_id ,
job_location 
from february_jobs

UNION all

select 
job_title_short ,
company_id ,
job_location 
from march_jobs ;

select
quarter1_job_posting.job_title_short ,
quarter1_job_posting.job_location ,
quarter1_job_posting.job_via ,
quarter1_job_posting.job_posted_date :: date ,
quarter1_job_posting.salary_year_avg
from (
    select * 
    from january_jobs 
    UNION all
    select * 
    from february_jobs
    UNION all
    select *
    from march_jobs
) as quarter1_job_posting
where quarter1_job_posting.salary_year_avg > 70000 and 
    quarter1_job_posting.job_title_short = 'Data Analyst'
ORDER BY quarter1_job_posting.salary_year_avg DESC ;


