/*
Question: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Target skills that offer job security (high demand) and financial benefits (high salaries),
  offering strategic insights for career development in data analysis
*/


-- Solution:

WITH 
    skills_demand AS
(
SELECT
    skills.skill_id,
    skills.skills,
    count(skills_job.job_id) AS demand_count
FROM 
    job_postings_fact AS job_postings
INNER JOIN 
    skills_job_dim AS skills_job ON job_postings.job_id = skills_job.job_id
INNER JOIN
    skills_dim AS skills ON skills_job.skill_id = skills.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills.skill_id
ORDER BY
    demand_count DESC
),

    skills_pay AS  -- WITH statements can be coupled with a ',' delimiter
(
SELECT  
    skills.skill_id,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM
    job_postings_fact AS job_postings
INNER JOIN 
    skills_job_dim AS skills_job ON job_postings.job_id = skills_job.job_id
INNER JOIN
    skills_dim AS skills ON skills_job.skill_id = skills.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN
    skills_pay ON skills_demand.skill_id = skills_pay.skill_id
ORDER BY
    demand_count DESC, 
    avg_salary DESC;


-- re-writing the above query in a concise manner:

SELECT
skills_dim.skill_id,
skills_dim.skills,
count(job_postings.job_id) AS demand_count,
ROUND(AVG(job_postings.salary_year_avg),0) AS avg_salary
FROM
job_postings_fact AS job_postings
INNER JOIN 
    skills_job_dim ON job_postings.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id
HAVING
    count(job_postings.job_id) > 10
ORDER BY
    demand_count DESC,
    avg_salary DESC
LIMIT 25

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------



/*

Previously attempted code (incorrect) for reference of mistakes in logical approach to solve the ask:

WITH top_paying_jobs AS 
(
select 
    job_title_short,
    job_location,
    job_work_from_home,
    job_posted_date::DATE,
    salary_year_avg
from 
    job_postings_fact AS job_postings
INNER JOIN
    skills_job_dim AS skills_job ON job_postings.job_id = skills_job.job_id
INNER JOIN
    skills_dim AS skills ON skills_job.skill_id = skills.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
ORDER BY
    salary_year_avg DESC
)


WITH top_paying_skills AS    -- with statements need not be mentioned again, they can be coupled with a demiliter ','
(
select 
    count(skills_dim.skill_id)
from 
    job_postings_fact AS job_postings
INNER JOIN
    skills_job_dim ON job_postings.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY 
    skill_id
ORDER BY
    skills
)

SELECT
    skills,
    count(top_paying_jobs.job_id) AS skills_count,
    ROUND(average(salary_year_avg,0)) AS avg_salary
FROM
    top_paying_jobs, top_paying_skills
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills
*/

