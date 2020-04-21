CREATE TABLE employees (
    emp_no INT   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    gender VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (
        emp_no,dept_no
     )
);

CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

CREATE TABLE titles (
    emp_no INT   NOT NULL,
    title VARCHAR   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (
        emp_no
     )
);


SELECT emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
FROM employees as emp
	LEFT JOIN salaries as sal
		ON (emp.emp_no = sal.emp_no)


SELECT * FROM employees
WHERE hire_date BETWEEN '1986-01-01' and '1986-12-31'


SELECT dm.dept_no, dp.dept_name, dm.emp_no, em.last_name, em.first_name, dm.to_date
FROM dept_manager as dm
	INNER JOIN departments as dp
		ON(dm.dept_no = dp.dept_no)
	INNER JOIN employees as em
		ON(dm.emp_no = em.emp_no)
		

SELECT  em.emp_no, em.last_name, em.first_name, dp.dept_name
FROM employees as em
	INNER JOIN dept_emp as de 
		ON (em.emp_no = de.emp_no)
	INNER JOIN departments as dp
		ON (de.dept_no = dp.dept_no)


Select * FROM employees
WHERE first_name = 'Hercules'
AND
last_name LIKE 'B%'


SELECT em.emp_no, em.last_name, em.first_name, dp.dept_name
FROM employees as em
	INNER JOIN dept_emp as de
		ON (em.emp_no = de.emp_no)
	INNER JOIN departments as dp
		ON (de.dept_no = dp.dept_no)
WHERE dp.dept_name = 'Sales'


SELECT em.emp_no, em.last_name, em.first_name, dp.dept_name
FROM employees as em
	INNER JOIN dept_emp as de
		ON (em.emp_no = de.emp_no)
	INNER JOIN departments as dp
		ON (de.dept_no = dp.dept_no)
WHERE dp.dept_name = 'Sales' 
OR dp.dept_name = 'Development' 


SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name)

