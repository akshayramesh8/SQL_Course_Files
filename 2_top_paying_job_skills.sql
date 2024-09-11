/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills
  helping job seekers understand which skills to develop that align with top salaries
*/


WITH top_paying_jobs AS 
(
    SELECT
        job_id,
        job_title,
        name AS company,
        job_location,
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
)

SELECT
    top_paying_jobs.*, -- this command displays all the columns of the specified table
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;

/*
ChatGPT helps with insights:

Most Common Skills:
- SQL: Mentioned 8 times.
- Python: Mentioned 7 times.
- Tableau: Mentioned 6 times.
- R: Mentioned 4 times.
- Snowflake, Pandas, and Excel: Each mentioned 3 times.

Moderately Common Skills:
Azure, Bitbucket, Go, Oracle, Power BI, Confluence, GitLab, Atlassian, Jira, AWS, and NumPy: Each mentioned 2 times.

Less Common Skills:
Jenkins, SAP, Crystal, Flow, Hadoop, PowerPoint, Jupyter, PySpark, Databricks, and Git: Each mentioned once.

Summary:
- SQL, Python, and Tableau are the most sought-after skills for data analyst roles, indicating a high demand for proficiency in these areas.
- Knowledge of R, Snowflake, Pandas, and Excel is also valuable, though slightly less in demand.
- A diverse set of other skills (like Azure, AWS, Bitbucket, and more) are required but are not as frequently listed, suggesting these are niche skills or specific to certain roles or companies.
This data highlights the importance of SQL and Python as foundational skills for data analysts, with Tableau also being a critical tool for data visualization.
*/

/*
opening the above code as a JSON file helps to display the results against each iteration:

[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company": "AT&T",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company": "Uclahealthcareers",
    "job_location": "Anywhere",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company": "Uclahealthcareers",
    "job_location": "Anywhere",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company": "Uclahealthcareers",
    "job_location": "Anywhere",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company": "Uclahealthcareers",
    "job_location": "Anywhere",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company": "Uclahealthcareers",
    "job_location": "Anywhere",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09",
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company": "Inclusively",
    "job_location": "Anywhere",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07",
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company": "Motional",
    "job_location": "Anywhere",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05",
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company": "Motional",
    "job_location": "Anywhere",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05",
    "skills": "python"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company": "Motional",
    "job_location": "Anywhere",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05",
    "skills": "r"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company": "Motional",
    "job_location": "Anywhere",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05",
    "skills": "git"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company": "Motional",
    "job_location": "Anywhere",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company": "Motional",
    "job_location": "Anywhere",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05",
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company": "Motional",
    "job_location": "Anywhere",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05",
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company": "Motional",
    "job_location": "Anywhere",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05",
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11",
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company": "SmartAsset",
    "job_location": "Anywhere",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11",
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "salary_year_avg": "184000.0",
    "job_posted_date": "2023-06-09",
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "salary_year_avg": "184000.0",
    "job_posted_date": "2023-06-09",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "salary_year_avg": "184000.0",
    "job_posted_date": "2023-06-09",
    "skills": "r"
  }
]
*/
