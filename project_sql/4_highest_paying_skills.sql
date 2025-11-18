/*Top 10 highest-paying skills for 
Data Analyst jobs in India */

SELECT
    skills,
    ROUND(AVG(salary_year_avg),0) AS average_salary
FROM 
    job_postings_fact
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL 
    AND job_country = 'India'
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 10;


/*

What the data is showing (clean & simple):
Top-paying data analyst roles value strong SQL and database skills, 
especially tools like PostgreSQL, MySQL, and MongoDB.
Engineered-focused skills such as PySpark, Databricks, and Airflow boost salaries 
because they show capability in big data and automation.
Rare and specialized tools like Neo4j and GDPR knowledge also pay well due to low competition.
Overall, companies prefer hybrid data analysts who can handle basic data engineering, 
automation, and cloud workflows.
This shows a clear trend: data analysts are becoming more technical—almost 
“mini data engineers”—and are paid more for these advanced skills.

*/