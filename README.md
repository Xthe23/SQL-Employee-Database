# SQL Challenge - Employee Database

## Introduction

This repository contains the SQL code and images showcasing the successful creation and querying of an employee database. The purpose of this challenge was to model data, engineer a database schema, and perform analysis through SQL queries.

## Data Modeling

Below is the Entity Relationship Diagram (ERD) that illustrates the database schema used in this project:

For the complete QuickDBD code, please [click here](https://github.com/Xthe23/sql-challenge/blob/main/quickDBD_ERD_queries.txt)
![Entity Relationship Diagram](https://github.com/Xthe23/sql-challenge/blob/main/Resources/EntityRelationalDiagram.png)

The ERD was created using QuickDBD and represents the structure of the database, including tables, columns, and relationships.

## Data Engineering

The tables were created with the following considerations:

- All required columns are defined for each table.
- Columns are set to the correct data type.
- Primary Keys are set for each table.
- Foreign Keys correctly reference related tables.
- The NOT NULL condition is used on necessary columns.
- Value length for columns is accurately defined.


The `table_schemata.sql` file contains the SQL code used to create the database tables. The tables were created in PostgreSQL with careful consideration for case sensitivity to match the column headers in the provided CSV files.

Below is a snippet of the `table_schemata.sql` file used in this project. 
For the complete code, please [click here](https://github.com/Xthe23/sql-challenge/blob/main/table_schemata.sql).

```SQL
-- Create the departments table
CREATE TABLE "Departments" (
    "Dept_no" VARCHAR(4) PRIMARY KEY NOT NULL,
    "Dept_name" VARCHAR(40) NOT NULL
);

-- Create the titles table
CREATE TABLE "Titles" (
    "Title_id" VARCHAR(5) PRIMARY KEY NOT NULL,
    "Title_name" VARCHAR(50) NOT NULL
);

-- Create the employees table
CREATE TABLE "Employees" (
    "Emp_no" INT PRIMARY KEY NOT NULL,
    "Emp_title_id" VARCHAR(5) REFERENCES "Titles"("Title_id"),
    "Birth_date" DATE NOT NULL,
    "First_name" VARCHAR(50) NOT NULL,
    "Last_name" VARCHAR(50) NOT NULL,
    "Sex" CHAR(1) NOT NULL CHECK ("Sex" IN ('M', 'F')),
    "Hire_date" DATE NOT NULL
);
```

## Data Analysis

A series of SQL queries were written to perform data analysis tasks, such as:

- Listing employees with their salaries.
- Filtering employees hired in a specific year.
- Identifying managers for each department.
- Showing departmental employee rosters.
- Querying employees with specific name attributes.
- Counting the frequency of employee last names.

Each query was tested in pgAdmin4 to ensure correctness and functionality.

Below is a demonstration of the `employee_queries.sql` file used in this project within PgAdmin4. For the complete code, please [click here](https://github.com/Xthe23/sql-challenge/blob/main/employee_queries.sql).

![Query Example](https://github.com/Xthe23/sql-challenge/blob/main/Resources/Screenshot1.png)

## Conclusion

The successful completion of this SQL challenge demonstrates proficiency in data modeling, database schema creation, and SQL querying for data analysis. The resulting database and queries can serve as a foundational reference for similar future projects.

---

For more information on the queries and the process, feel free to explore the SQL files and resources included in this repository.
