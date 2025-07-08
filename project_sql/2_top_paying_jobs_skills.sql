/*
Question: What skills are required for the top-paying software engineer jobs?
- Use the top 10 highest-paying Software Engineer jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
  helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Software Engineer' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

/*
Here's the breakdown of the most demanded skills for software engineers in 2023, based on job postings:

| Skill      | Frequency |
| ---------- | --------- |
| MongoDB    | 6         |
| Python     | 5         |
| JavaScript | 5         |
| TypeScript | 4         |
| AWS        | 4         |
| React      | 4         |
| DynamoDB   | 2         |
| CSS        | 2         |
| Ruby       | 2         |
| Node.js    | 2         |
*/

/*
[
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "salary_year_avg": "225000.0",
    "company_name": "Datavant",
    "skills": "python"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "salary_year_avg": "225000.0",
    "company_name": "Datavant",
    "skills": "javascript"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "salary_year_avg": "225000.0",
    "company_name": "Datavant",
    "skills": "typescript"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "salary_year_avg": "225000.0",
    "company_name": "Datavant",
    "skills": "azure"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "salary_year_avg": "225000.0",
    "company_name": "Datavant",
    "skills": "aws"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "salary_year_avg": "225000.0",
    "company_name": "Datavant",
    "skills": "snowflake"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "salary_year_avg": "225000.0",
    "company_name": "Datavant",
    "skills": "spark"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "salary_year_avg": "225000.0",
    "company_name": "Datavant",
    "skills": "react"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "salary_year_avg": "205000.0",
    "company_name": "SmarterDx",
    "skills": "python"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "salary_year_avg": "205000.0",
    "company_name": "SmarterDx",
    "skills": "elasticsearch"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "salary_year_avg": "205000.0",
    "company_name": "SmarterDx",
    "skills": "dynamodb"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "salary_year_avg": "205000.0",
    "company_name": "SmarterDx",
    "skills": "aws"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "salary_year_avg": "205000.0",
    "company_name": "SmarterDx",
    "skills": "snowflake"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "salary_year_avg": "205000.0",
    "company_name": "SmarterDx",
    "skills": "pandas"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "salary_year_avg": "205000.0",
    "company_name": "SmarterDx",
    "skills": "airflow"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "salary_year_avg": "205000.0",
    "company_name": "SmarterDx",
    "skills": "react"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "salary_year_avg": "205000.0",
    "company_name": "SmarterDx",
    "skills": "graphql"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "salary_year_avg": "205000.0",
    "company_name": "SmarterDx",
    "skills": "node.js"
  },
  {
    "job_id": 365528,
    "job_title": "Engineering",
    "salary_year_avg": "205000.0",
    "company_name": "Huckleberry Labs",
    "skills": "python"
  },
  {
    "job_id": 365528,
    "job_title": "Engineering",
    "salary_year_avg": "205000.0",
    "company_name": "Huckleberry Labs",
    "skills": "aws"
  },
  {
    "job_id": 365528,
    "job_title": "Engineering",
    "salary_year_avg": "205000.0",
    "company_name": "Huckleberry Labs",
    "skills": "gcp"
  },
  {
    "job_id": 1398776,
    "job_title": "Senior Software Engineer, Cluster Scalability",
    "salary_year_avg": "200000.0",
    "company_name": "MongoDB",
    "skills": "mongodb"
  },
  {
    "job_id": 1398776,
    "job_title": "Senior Software Engineer, Cluster Scalability",
    "salary_year_avg": "200000.0",
    "company_name": "MongoDB",
    "skills": "mongodb"
  },
  {
    "job_id": 64759,
    "job_title": "Senior Ruby Engineer - Analytics Platform - $190-210k+",
    "salary_year_avg": "200000.0",
    "company_name": "Orbis",
    "skills": "typescript"
  },
  {
    "job_id": 64759,
    "job_title": "Senior Ruby Engineer - Analytics Platform - $190-210k+",
    "salary_year_avg": "200000.0",
    "company_name": "Orbis",
    "skills": "ruby"
  },
  {
    "job_id": 64759,
    "job_title": "Senior Ruby Engineer - Analytics Platform - $190-210k+",
    "salary_year_avg": "200000.0",
    "company_name": "Orbis",
    "skills": "ruby"
  },
  {
    "job_id": 1231528,
    "job_title": "Senior Software Engineer, Server Security",
    "salary_year_avg": "200000.0",
    "company_name": "MongoDB",
    "skills": "mongodb"
  },
  {
    "job_id": 1231528,
    "job_title": "Senior Software Engineer, Server Security",
    "salary_year_avg": "200000.0",
    "company_name": "MongoDB",
    "skills": "mongodb"
  },
  {
    "job_id": 946351,
    "job_title": "Staff Frontend Engineer",
    "salary_year_avg": "191000.0",
    "company_name": "Webflow",
    "skills": "javascript"
  },
  {
    "job_id": 946351,
    "job_title": "Staff Frontend Engineer",
    "salary_year_avg": "191000.0",
    "company_name": "Webflow",
    "skills": "css"
  },
  {
    "job_id": 946351,
    "job_title": "Staff Frontend Engineer",
    "salary_year_avg": "191000.0",
    "company_name": "Webflow",
    "skills": "react"
  },
  {
    "job_id": 946351,
    "job_title": "Staff Frontend Engineer",
    "salary_year_avg": "191000.0",
    "company_name": "Webflow",
    "skills": "graphql"
  },
  {
    "job_id": 946351,
    "job_title": "Staff Frontend Engineer",
    "salary_year_avg": "191000.0",
    "company_name": "Webflow",
    "skills": "node.js"
  },
  {
    "job_id": 946351,
    "job_title": "Staff Frontend Engineer",
    "salary_year_avg": "191000.0",
    "company_name": "Webflow",
    "skills": "react.js"
  },
  {
    "job_id": 1054268,
    "job_title": "Staff Software Engineer, AI",
    "salary_year_avg": "185000.0",
    "company_name": "Pulley",
    "skills": "python"
  },
  {
    "job_id": 1054268,
    "job_title": "Staff Software Engineer, AI",
    "salary_year_avg": "185000.0",
    "company_name": "Pulley",
    "skills": "javascript"
  },
  {
    "job_id": 1054268,
    "job_title": "Staff Software Engineer, AI",
    "salary_year_avg": "185000.0",
    "company_name": "Pulley",
    "skills": "typescript"
  },
  {
    "job_id": 1054268,
    "job_title": "Staff Software Engineer, AI",
    "salary_year_avg": "185000.0",
    "company_name": "Pulley",
    "skills": "golang"
  },
  {
    "job_id": 182858,
    "job_title": "Senior Software Engineer (Confirmations - System)",
    "salary_year_avg": "184500.0",
    "company_name": "ConsenSys",
    "skills": "javascript"
  },
  {
    "job_id": 182858,
    "job_title": "Senior Software Engineer (Confirmations - System)",
    "salary_year_avg": "184500.0",
    "company_name": "ConsenSys",
    "skills": "typescript"
  },
  {
    "job_id": 182858,
    "job_title": "Senior Software Engineer (Confirmations - System)",
    "salary_year_avg": "184500.0",
    "company_name": "ConsenSys",
    "skills": "react"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "python"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "javascript"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "html"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "css"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "c#"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "mongodb"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "redis"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "mysql"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "elasticsearch"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "mongodb"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "dynamodb"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "couchbase"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "azure"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "aws"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "asp.net"
  }
]
*/