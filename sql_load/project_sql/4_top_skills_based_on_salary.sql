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

/* 
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
*/