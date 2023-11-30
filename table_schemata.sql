-- Create the departments table
CREATE TABLE "Departments" (
    "Dept_no" VARCHAR(4) NOT NULL,
    "Dept_name" VARCHAR(40) NOT NULL,
    PRIMARY KEY ("Dept_no")
);

-- Create the titles table
CREATE TABLE "Titles" (
    "Title_id" VARCHAR(5) NOT NULL,
    "Title_name" VARCHAR(50) NOT NULL,
    PRIMARY KEY ("Title_id")
);

-- Create the employees table
CREATE TABLE "Employees" (
    "Emp_no" INT NOT NULL,
    "Emp_title_id" VARCHAR(5) NOT NULL,
    "Birth_date" DATE NOT NULL,
    "First_name" VARCHAR(50) NOT NULL,
    "Last_name" VARCHAR(50) NOT NULL,
    "Sex" CHAR(1) NOT NULL CHECK ("Sex" IN ('M', 'F')),
    "Hire_date" DATE NOT NULL,
    PRIMARY KEY ("Emp_no"),
    FOREIGN KEY ("Emp_title_id") REFERENCES "Titles" ("Title_id")
);

-- Create the dept_emp table
CREATE TABLE "Dept_emp" (
    "Emp_no" INT NOT NULL,
    "Dept_no" VARCHAR(4) NOT NULL,
    PRIMARY KEY ("Emp_no", "Dept_no"),
    FOREIGN KEY ("Emp_no") REFERENCES "Employees" ("Emp_no"),
    FOREIGN KEY ("Dept_no") REFERENCES "Departments" ("Dept_no")
);

-- Create the dept_manager table
CREATE TABLE "Dept_manager" (
    "Dept_no" VARCHAR(4) NOT NULL,
    "Emp_no" INT NOT NULL,
    PRIMARY KEY ("Dept_no", "Emp_no"),
    FOREIGN KEY ("Dept_no") REFERENCES "Departments" ("Dept_no"),
    FOREIGN KEY ("Emp_no") REFERENCES "Employees" ("Emp_no")
);

-- Create the salaries table
CREATE TABLE "Salaries" (
    "Emp_no" INT NOT NULL,
    "Salary" INT NOT NULL CHECK ("Salary" > 0),
    PRIMARY KEY ("Emp_no"),
    FOREIGN KEY ("Emp_no") REFERENCES "Employees" ("Emp_no")
);
