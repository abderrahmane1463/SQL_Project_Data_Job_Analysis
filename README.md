<h1 align="center">SQL — Data Analyst Job Market Analysis</h1>

<p align="center">
  <em>Exploring top-paying roles, in-demand skills, and salary drivers in the data analytics job market using PostgreSQL</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/SQL-PostgreSQL-336791?style=flat-square&logo=postgresql&logoColor=white"/>
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=flat-square&logo=postgresql&logoColor=white"/>
  <img src="https://img.shields.io/badge/VS_Code-007ACC?style=flat-square&logo=visualstudiocode&logoColor=white"/>
</p>

---

## Overview

A structured SQL analysis of the global data analyst job market, based on Luke Barousse's public job postings dataset. Five analytical queries answer concrete career questions — from identifying the highest-paying remote roles to finding the optimal skill set that combines high demand with strong compensation.

## Features

- Top 10 highest-paying remote Data Analyst roles (up to $650K/year identified)
- Skill breakdown for top-paying jobs — SQL, Python, and Tableau dominate
- Most in-demand skills ranked by job posting frequency
- Average salary by skill — revealing big-data and cloud tools as the top salary drivers
- Optimal skill strategy: skills ranked by combined demand and pay (demand > 10 postings)

## Tech Stack

| Category | Tools |
|----------|-------|
| Language | SQL |
| Database | PostgreSQL |
| Editor | Visual Studio Code |
| Version Control | Git & GitHub |

## Project Structure

```
SQL_Project_Data_Job_Analysis/
├── sql_load/           # Five SQL query files (one per research question)
└── creating_table_example.sql  # Schema and data load script
```

## Results / Key Insights

- **SQL is the #1 must-have skill** — appearing in 8 of the top 10 highest-paying job postings, confirming its foundational role in data analytics
- **Big data and distributed computing pay the most** — PySpark ($208K avg), Couchbase ($160K), DataRobot ($155K) far outpace traditional BI tools like Excel and Tableau
- **The highest-paying "data analyst" roles are hybrid** — combining data analysis with engineering, cloud, or applied ML skills; pure BI tool expertise is not sufficient for top-tier compensation

---

<p align="center">Made by <a href="https://github.com/abderrahmane1463">Cherfaoui Houssam Abderrahmane</a></p>
