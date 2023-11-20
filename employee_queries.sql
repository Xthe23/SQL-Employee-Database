-- List the employee number, last name, first name, sex, and salary of each employee
SELECT e."Emp_no", e."Last_name", e."First_name", e."Sex", s."Salary"
FROM "Employees" e
JOIN "Salaries" s ON e."Emp_no" = s."Emp_no";

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT "First_name", "Last_name", "Hire_date"
FROM "Employees"
WHERE EXTRACT(YEAR FROM "Hire_date") = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT d."Dept_no", d."Dept_name", e."Emp_no", e."Last_name", e."First_name"
FROM "Dept_manager" m
JOIN "Departments" d ON m."Dept_no" = d."Dept_no"
JOIN "Employees" e ON m."Emp_no" = e."Emp_no";

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT de."Dept_no", e."Emp_no", e."Last_name", e."First_name", d."Dept_name"
FROM "Dept_emp" de
JOIN "Employees" e ON de."Emp_no" = e."Emp_no"
JOIN "Departments" d ON de."Dept_no" = d."Dept_no";

-- List first name, last name, and sex of each employee whose first name is 'Hercules' and whose last name begins with the letter 'B'
SELECT "First_name", "Last_name", "Sex"
FROM "Employees"
WHERE "First_name" = 'Hercules' AND "Last_name" LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT e."Emp_no", e."Last_name", e."First_name"
FROM "Dept_emp" de
JOIN "Employees" e ON de."Emp_no" = e."Emp_no"
JOIN "Departments" d ON de."Dept_no" = d."Dept_no"
WHERE d."Dept_name" = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e."Emp_no", e."Last_name", e."First_name", d."Dept_name"
FROM "Dept_emp" de
JOIN "Employees" e ON de."Emp_no" = e."Emp_no"
JOIN "Departments" d ON de."Dept_no" = d."Dept_no"
WHERE d."Dept_name" IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names
SELECT "Last_name", COUNT(*) AS frequency
FROM "Employees"
GROUP BY "Last_name"
ORDER BY frequency DESC;
