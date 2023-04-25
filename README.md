# Challenge 9 - SQL

## Data Modeling
![Entity Relationship Diagram](EmployeeSQL/schema.png)

## Data Engineering
The schemas for creating the six tables in the data base can be found in [schema.sql](EmployeeSQL/schema.sql).

- `dept_no` and `title_id`/`emp_title_id` and `sex` are VARCHARs because they have a fixed length.
- All other strings are TEXT because they could have a variable length
- `first_name`, `last_name`, and `sex` do NOT have 'NOT NULL' as there is no guarantee that a person has a name[^1] even thought it appears all fields in this data have a value.

## Data Analysis


---

## References
[^1]: [Falsehoods Programmers Believe About Names – With Examples](https://shinesolutions.com/2018/01/08/falsehoods-programmers-believe-about-names-with-examples/)
