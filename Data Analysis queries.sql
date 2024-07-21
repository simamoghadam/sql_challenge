-- Data Analysis queries

SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;
	
-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees 
JOIN salaries ON employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM departments AS d
JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT 
    de.dept_no AS department_number,
    e.emp_no AS employee_number,
    e.last_name AS last_name,
    e.first_name AS first_name,
    d.dept_name AS department_name
FROM dept_emp AS de
JOIN employees AS e ON de.emp_no = e.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no;


-- List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.


SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';


-- List each employee in the Sales department, including their employee number, last name, and first name.

SELECT 
    e.emp_no AS employee_number,
    e.last_name AS last_name,
    e.first_name AS first_name
FROM 
    employees AS e
WHERE 
    e.emp_no IN (
        SELECT de.emp_no
        FROM dept_emp AS de
        JOIN departments AS d ON de.dept_no = d.dept_no
        WHERE d.dept_name = 'Sales'
    );


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no AS employee_number,
	e.last_name AS last_name,
	e.first_name AS first_name,
	d.dept_name AS department_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');


-- List the frequency counts, in descending order, of all the employee last names

SELECT last_name, COUNT(*) AS frequency_count
FROM employees
GROUP BY last_name
ORDER BY frequency_count DESC;