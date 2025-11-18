WITH skill_demand AS (
    SELECT
        skills_dim.skill_id AS skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.skill_id) AS demand_count
    FROM 
        job_postings_fact
    INNER JOIN 
        skills_job_dim
    ON 
        job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN 
        skills_dim
    ON 
        skills_dim.skill_id = skills_job_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_country = 'India'
    GROUP BY
        skills_dim.skill_id
), average_salary_skill AS (
    SELECT
        skills_dim.skill_id as skill_id,
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
        skills_dim.skill_id
)

SELECT 
    skill_demand.skill_id,
    skill_demand.skills,
    demand_count,
    average_salary 
FROM 
    skill_demand
INNER JOIN 
    average_salary_skill 
ON skill_demand.skill_id = average_salary_skill.skill_id
WHERE demand_count > 10 
ORDER BY
    average_salary DESC

/*

SQL and Python are the most in-demand skills for data analysts right now.
Power BI and Tableau are also very popular because companies rely heavily on dashboards.
Cloud skills like Azure and AWS tend to offer higher salaries, even though demand is lower than SQL/Python.
Spark pays the most because it’s a specialized big-data skill that fewer analysts know.
Excel is still widely required, but it offers the lowest salary because it’s very common.
Overall:
Companies want analysts who know data basics (SQL/Python) + BI tools + some cloud or big-data skills for better pay.

*/