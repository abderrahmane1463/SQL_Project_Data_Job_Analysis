WITH tob_paying_jobs AS (
    SELECT 
    job_id , 
    job_title ,
    salary_year_avg ,
    name as company_name
    FROM
        job_postings_fact 
    LEFT JOIN 
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg is NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)
SELECT 
tob_paying_jobs.*,
skills
from tob_paying_jobs
INNER JOIN skills_job_dim on tob_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC ;

/*
🔍 Skill Frequency Insights
🥇 Most In-Demand Skills

These appear most frequently across job postings:

SQL (8 mentions)
👉 The #1 must-have skill
Used for querying, cleaning, and analyzing data in databases.

Python (7 mentions)
👉 Core skill for data analysis & automation
Often paired with libraries like pandas, numpy, etc.

Tableau (6 mentions)
👉 Leading data visualization tool
Strong demand for dashboarding & reporting.
*/

