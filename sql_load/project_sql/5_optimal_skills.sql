with skills_demand AS (
    select 
    skills_dim.skill_id ,
    skills_dim.skills , 
    count(skills_job_dim.job_id) as demand_count
    from job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst' AND 
    job_work_from_home = TRUE and 
    salary_year_avg is NOT NULL
    GROUP BY skills_dim.skill_id

), average_salary as (
    select 
    skills_dim.skill_id ,
    skills_dim.skills , 
    round(avg(salary_year_avg)) as avg_salary
    from job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst' AND 
    job_work_from_home = TRUE and 
    salary_year_avg is NOT NULL
    GROUP BY skills_dim.skill_id

)

select 
skills_demand.skill_id , 
skills_demand.skills ,
demand_count ,
avg_salary 
from 
skills_demand
INNER join average_salary on skills_demand.skill_id = average_salary.skill_id
WHERE demand_count > 10
ORDER BY demand_count DESC , avg_salary DESC
LIMIT 25 ;