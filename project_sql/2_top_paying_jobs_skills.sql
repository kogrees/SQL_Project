/*
Top 10 Highest paying Data Analyst Job in India and the Demanding Skills for the role 
*/

WITH top_paying_jobs AS 
(
    SELECT 
        job_id,
        job_title AS "Title",
        --job_title_short,
        job_location AS "Location",
        job_via AS "Via",
        job_schedule_type AS "Employment Type",
        job_posted_date::DATE AS "Posted Date",
        -- salary_year_avg,
        -- salary_year_avg * 83 AS salary_year_avg_in_rupees
        to_char(salary_year_avg * 88.69, '99,99,99,999') AS annual_average_salary
        -- Converting the annual salary from USD to INR (₹) for India-based roles
        -- and formatting the result using the Indian numbering system for readability.

    FROM
        job_postings_fact

    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_country = 'India'

)

SELECT 
    skills_dim.Skills,
    top_paying_jobs."Title",
    annual_average_salary,
    top_paying_jobs."Location",
    top_paying_jobs."Posted Date"
    
FROM
    top_paying_jobs
INNER JOIN 
    skills_job_dim
ON 
    top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN  
    skills_dim
ON 
    skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    annual_average_salary  DESC


/*

The Foundation: SQL, Excel, and Python
SQL is the most required skill, appearing in 46 postings, underscoring the absolute necessity of database 
querying for high-paying data roles.

Excel (39 postings) and Python (36 postings) complete the top three. Excel remains crucial for quick 
analysis and reporting, while Python is essential for advanced statistical modeling and automation.

2. Visualization Tools are Highly Valued
Tableau (20 postings) and Power BI (17 postings) are the most popular data visualization tools, indicating 
that translating complex data into actionable insights for stakeholders is a core responsibility.

3. Cloud and Big Data Expertise
Skills related to cloud computing and big data processing, such as Azure (15), AWS (12), Spark (11), 
and Oracle (11), are present in the top 10. This suggests that top-paying roles often involve 
working with large datasets and cloud-based data infrastructure, moving beyond simple desktop analysis.

*/