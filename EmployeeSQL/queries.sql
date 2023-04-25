-- Data Analysis Queries
-- 1. Employee Number, last, first, Sex, Salary
SELECT employees.emp_no
    , employees.last_name
    , employees.first_name
    , employees.sex
    , salaries.salary
FROM employees
INNER JOIN salaries ON
    employees.emp_no = salaries.emp_no;
    -- 300,024 results

-- 2. Employees First, Last, Hire Date for those hired in 1986
SELECT first_name
    , last_name
    , hire_date
FROM employees
WHERE date_part('year', hire_date) = 1986;
    -- 36,150 results


-- 3. Manager, Department Number, Name, employee number, last, first
SELECT dept_manager.dept_no
    , departments.dept_name
    , dept_manager.emp_no
    , employees.first_name
    , employees.last_name
FROM dept_manager
INNER JOIN departments ON
    dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON
    dept_manager.emp_no = employees.emp_no;

-- 4. Department Number for each employee, employee number, last, first, department name
SELECT dept_emp.dept_no
    , dept_emp.emp_no
    , employees.last_name
    , employees.first_name
    , departments.dept_name
FROM dept_emp
INNER JOIN employees ON
    dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON
    dept_emp.dept_no = departments.dept_no;
    -- 331,603 results

-- 5. First, last, sex for each employee where first='Hercules' & last starts with 'B'
SELECT first_name
    , last_name
    , sex
FROM employees
WHERE first_name = 'Hercules'
    AND last_name LIKE 'B%';
    -- 20 results

-- 6. Employees in 'Sales' employee number, last, first
SELECT employees.emp_no
    , employees.last_name
    , employees.first_name
FROM employees
INNER JOIN dept_emp ON
    employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
    departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';
    -- 52,245 results

-- 7. Employees in 'Sales' & 'Development' employee number, last, first, department name
SELECT employees.emp_no
    , employees.last_name
    , employees.first_name
    , departments.dept_name
FROM employees
INNER JOIN dept_emp ON
    employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
    departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');
    -- 137,952 results

-- 8. Frequency counts in descending order of all employee last names
SELECT last_name
    , count(last_name)
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC;
    -- 1,638 different last names
