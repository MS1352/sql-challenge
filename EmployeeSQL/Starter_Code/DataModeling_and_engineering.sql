-- creating the database
CREATE DATABASE employee_db;

-- creating tables
CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(10) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL CHECK (sex IN ('M', 'F')),
    hire_date DATE NOT NULL
);

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE departments (
    dept_no CHAR(4) PRIMARY KEY,
    dept_name VARCHAR(255) NOT NULL
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no CHAR(4) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no CHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


-- importing CSV files
COPY titles FROM 'C:\Program Files\PostgreSQL\data\titles.csv' DELIMITER ',' CSV HEADER;
SET datestyle = 'MDY';

COPY employees FROM 'C:\Program Files\PostgreSQL\data\employees.csv' DELIMITER ',' CSV HEADER;

COPY salaries FROM 'C:\Program Files\PostgreSQL\data\salaries.csv' DELIMITER ',' CSV HEADER;

COPY departments FROM 'C:\Program Files\PostgreSQL\data\departments.csv' DELIMITER ',' CSV HEADER;

COPY dept_emp FROM 'C:\Program Files\PostgreSQL\data\dept_emp.csv' DELIMITER ',' CSV HEADER;

COPY dept_manager FROM 'C:\Program Files\PostgreSQL\data\dept_manager.csv' DELIMITER ',' CSV HEADER;
