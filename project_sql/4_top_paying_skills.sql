/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Software Engineer positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Software Engineer and
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Software Engineer' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
Here are some quick insights and trends from the top 25 highest-paying software engineer skills:

💡 Top Tech Salary Trends

1. Specialized Databases = High Pay

Tools like DynamoDB, Couchbase, Snowflake, Neo4j, MongoDB command top salaries (up to $184k).
Reflects demand for scalable, modern NoSQL and graph databases in big data and real-time systems.

2. Data Engineering & Analytics in Demand

Skills like Airflow, Pandas, Snowflake, Elasticsearch, Looker, Numpy are highly paid.
Indicates strong investment in data pipelines, ML ops, and analytics platforms.

3. Backend Development Remains Lucrative

Languages like C, C++, ASP.NET, ASP.NET Core offer high salaries.
Especially valuable in enterprise, system-level, and high-performance applications.

4. Full-Stack & Front-End Still Strong

Frameworks like React, Angular, TypeScript, JQuery are well-compensated.
Shows continued demand for modern JavaScript and full-stack developers.

5. DevOps & Cloud Skills Boost Earnings

Tools like Ansible, Jenkins, Azure are associated with higher pay.
Emphasizes value in automation and cloud-native development.

6. Legacy Tech Still Pays

Older skills like HTML, Ruby, Oracle still appear in high-paying roles.
Suggests a niche for maintaining or modernizing legacy systems.
*/