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

-- Create the dept_emp table
CREATE TABLE "Dept_emp" (
    "Emp_no" INT REFERENCES "Employees"("Emp_no"),
    "Dept_no" VARCHAR(4) REFERENCES "Departments"("Dept_no"),
    PRIMARY KEY ("Emp_no", "Dept_no")
);

-- Create the dept_manager table
CREATE TABLE "Dept_manager" (
    "Dept_no" VARCHAR(4) REFERENCES "Departments"("Dept_no"),
    "Emp_no" INT REFERENCES "Employees"("Emp_no"),
    PRIMARY KEY ("Dept_no", "Emp_no")
);

-- Create the salaries table
CREATE TABLE "Salaries" (
    "Emp_no" INT REFERENCES "Employees"("Emp_no"),
    "Salary" INT NOT NULL CHECK ("Salary" > 0),
    PRIMARY KEY ("Emp_no")
);
