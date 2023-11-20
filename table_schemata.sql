-- Create the departments table
CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

-- Create the titles table
CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY NOT NULL,
    title_name VARCHAR(50) NOT NULL
);

-- Create the employees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(5) REFERENCES titles(title_id),
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL CHECK (sex IN ('M', 'F')),
    hire_date DATE NOT NULL
);

-- Create the dept_emp table
CREATE TABLE dept_emp (
    emp_no INT REFERENCES employees(emp_no),
    dept_no VARCHAR(4) REFERENCES departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

-- Create the dept_manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR(4) REFERENCES departments(dept_no),
    emp_no INT REFERENCES employees(emp_no),
    PRIMARY KEY (dept_no, emp_no)
);

-- Create the salaries table
CREATE TABLE salaries (
    emp_no INT REFERENCES employees(emp_no),
    salary INT NOT NULL CHECK (salary > 0),
    PRIMARY KEY (emp_no)
);
