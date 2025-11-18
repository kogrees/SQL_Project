/*
Top 5 most in demand Skills for data analyst in India
*/

WITH remote_job_skills AS
(
    SELECT
        skill_id,
        COUNT(*) AS demand_count
    FROM
        skills_job_dim
    INNER JOIN 
        job_postings_fact
    ON 
        job_postings_fact.job_id = skills_job_dim.job_id
    WHERE
        job_postings_fact.job_title_short = 'Data Analyst' AND 
        job_country = 'India'
    GROUP BY
        skill_id
)

SELECT
    skills_dim.skills,
    demand_count
FROM 
    remote_job_skills
INNER JOIN 
    skills_dim
ON 
    skills_dim.skill_id = remote_job_skills.skill_id

ORDER BY demand_count DESC
LIMIT 5;