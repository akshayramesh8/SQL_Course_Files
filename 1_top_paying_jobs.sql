/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying data analyst jobs?
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employee 
*/

SELECT
    job_id,
    job_title,
    name AS company,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date::DATE
FROM
    job_postings_fact AS job_postings
LEFT JOIN
    company_dim as company ON company.company_id = job_postings.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10

