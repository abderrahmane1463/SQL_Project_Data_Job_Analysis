# SQL for Data Analytics 🚀

This repository contains my work and notes from the **"SQL for Data Analytics – Learn SQL in 4 Hours"** course by **Luke Barousse** on YouTube.

The goal of this project is to demonstrate my understanding of **SQL concepts used in real-world data analytics**, including querying, filtering, aggregations, joins, subqueries, and analytical thinking.

---

## 📚 Course Information

- **Course Title:** SQL for Data Analytics – Learn SQL in 4 Hours  
- **Instructor:** Luke Barousse  
- **Platform:** YouTube  
- **Focus:** SQL for data analysis and business insights  

---


## 📌 Topics Covered

- SELECT & WHERE
- ORDER BY, LIMIT
- Aggregate Functions (COUNT, SUM, AVG, MIN, MAX)
- GROUP BY & HAVING
- JOINs (INNER, LEFT, RIGHT)
- Subqueries
- Common Table Expressions (CTEs)
- Data cleaning with SQL
- Analytical queries for business use cases

---


 

 # 📊 Introduction
This project dives into the data job market, specifically focusing on Data Analyst roles. It explores the top-paying jobs, the most in-demand skills, and the intersection where high demand meets high salary in the field of data analytics.
You can view my specific SQL queries here: [Project_SQL Folder](/sql_load/)

 # 🔍 Background
This project was driven by a desire to navigate the data science industry more effectively. It explores five key questions:
1. What are the highest-paying roles for my job title?
2. What skills are required for these top-paying roles?
3. What are the most in-demand skills for my role?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn (high demand + high pay)?


 # 🛠️ Tools I Used
- **SQL**: The backbone of my analysis, allowing me to query the database and unearth critical insights.

- **PostgreSQL**: The chosen database management system for handling the job posting data.
- **Visual Studio Code**: My primary editor for database management and writing SQL scripts.
- **Git & GitHub**: Essential for version control and sharing my SQL scripts and analysis professionally

# 📈 The Analysis
The bulk of this project is broken down into five key SQL queries:
1. Top Paying Data Analyst Jobs
To identify the top 10 highest-paying roles that are available remotely.
``` sql
SELECT 
job_id , 
job_title ,
job_location , 
job_schedule_type , 
salary_year_avg ,
name as company_name,
job_posted_date
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
LIMIT 10 ;
```
Insight: Top-paying roles often reach salaries up to $650,000.

2. Skills for Top Paying Jobs
Identifying the skills required for the roles found in the first query.
``` sql 
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

```
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

3. Most In-Demand Skills
Finding the most frequently mentioned skills in job postings. 
``` sql 
select 
skills , 
count(skills_job_dim.job_id) as demand_count
from job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND 
job_work_from_home = TRUE
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;
```
4. Top Skills Based on Salary
Exploring the average salary associated with specific skills.
``` sql
select 
skills , 
round(avg(salary_year_avg)) as avg_salary
from job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND 
job_work_from_home = TRUE and 
salary_year_avg is NOT NULL
GROUP BY skills
ORDER BY avg_salary  DESC
LIMIT 25;
```
🔥 1. Big Data & Distributed Computing = Highest Pay
Top examples:
PySpark ($208K) 🥇
Databricks ($141K)
Scala ($125K)
Airflow ($126K)

📌 Trend:
Data analysts who can work with large-scale data pipelines and distributed systems earn significantly more.

💡 Insight:
These skills blur the line between Data Analyst and Data Engineer, which explains the salary premium.

☁️ 2. Cloud & Infrastructure Skills Are Strong Salary Boosters
Examples:
Kubernetes ($132K)
GCP ($122K)
Linux ($136K)
Elasticsearch ($145K)

📌 Trend:
Analysts with cloud + infrastructure knowledge are paid more than “Excel/SQL-only” analysts.

💡 Companies value analysts who understand how data is stored, processed, and deployed.

🧠 3. Machine Learning Tools Increase Pay (Even for Analysts)
Examples:
DataRobot ($155K)
Scikit-learn ($125K)
Watson ($160K)

📌 Trend:
Analysts involved in predictive analytics and ML-assisted decision-making earn higher salaries.

💡 You don’t need to be a Data Scientist — applied ML knowledge already boosts pay.

🐍 4. Python Ecosystem Dominates High Salaries
Examples:
Pandas ($151K)
NumPy ($143K)
Jupyter ($152K)

📌 Trend:
Python is the highest-paying analysis ecosystem, especially when used beyond basic scripts.

💡 Python + Big Data / ML = premium compensation.

🧩 5. DevOps & Collaboration Tools Appear in High-Pay Roles
Examples:
GitLab ($154K)
Bitbucket ($189K)
Jenkins ($125K)
Atlassian ($131K)

📌 Trend:
High-paying analyst roles expect software engineering practices.

💡 These roles usually sit in product, platform, or analytics engineering teams.

🧪 6. Databases & Search Systems Still Matter
Examples:
PostgreSQL ($124K)
Couchbase ($160K)
Elasticsearch ($145K)

📌 Trend:
Advanced data storage & retrieval knowledge is highly rewarded.

💡 Especially valuable for real-time analytics and large datasets.

📈 7. High Pay = Hybrid Roles, Not Traditional Analysts
What’s missing from the top 25?
Excel
Power BI
Tableau

📌 Key Insight:
The highest-paying “data analyst” jobs are actually hybrid roles:
Data Analyst + Engineer
Data Analyst + ML
Data Analyst + Cloud

🧠 One-Sentence Executive Summary
Top-paying data analyst roles favor engineers’ tools, big data platforms, cloud infrastructure, and applied machine learning over traditional BI tools.

5. Most Optimal Skills
Combining demand and salary data to find the best skills to learn
``` sql
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
```

# 💡 What I Learned
• Analytical Wizardry: Mastered complex queries, including CTEs and subqueries.

• Data Aggregation: Used GROUP BY and aggregation functions to summarize large datasets.

• Database Management: Learned to create, modify, and load data into local tables.

# 🏁 Conclusions

• Top Skills: SQL remains the #1 skill for 
data analysts.

• Market Trends: Specialized skills in Big Data and Cloud Computing are major salary drivers.

• Optimal Strategy: Focusing on high-demand skills like SQL and Python while specializing in cloud tools is key,.

