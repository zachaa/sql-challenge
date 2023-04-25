CREATE TABLE departments(
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name TEXT NOT NULL
);

CREATE TABLE titles(
    title_id VARCHAR(5) PRIMARY KEY,
    title TEXT NOT NULL
);

CREATE TABLE employees(
    emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name TEXT,
    last_name TEXT,
    sex VARCHAR(1),
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- below 3 tables need to be created after the above 3
CREATE TABLE dept_emp(
    id SERIAL PRIMARY KEY,      -- Employees in a department can change, so we don't want a composite key
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager(
    id SERIAL PRIMARY KEY,      -- Department managers can change, so we don't want a composite key
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries(
    id SERIAL PRIMARY KEY,      -- Salaries can change, so we don't want a composite key
	emp_no INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    salary INT NOT NULL
);