/*
Top 10 Highest paying Data Analyst Job in India
*/

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
ORDER BY
    annual_average_salary DESC
LIMIT 10