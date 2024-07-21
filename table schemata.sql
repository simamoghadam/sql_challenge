-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/ccQEEt
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Departments table
CREATE TABLE Departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (dept_no)
);

-- Titles table
CREATE TABLE Titles (
    title_id VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (title_id)
);

-- Employees table
CREATE TABLE Employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date VARCHAR NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date VARCHAR NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (emp_no)
);

-- Dept_emp table
CREATE TABLE Dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
    CONSTRAINT pk_Dept_emp PRIMARY KEY (emp_no, dept_no)
);

-- Dept_manager table
CREATE TABLE Dept_manager (
    dept_no VARCHAR NOT NULL,
    emp_no INT NOT NULL,
    CONSTRAINT pk_Dept_manager PRIMARY KEY (dept_no, emp_no)
);

-- Salaries table
CREATE TABLE Salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (emp_no)
);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY (emp_title_id)
REFERENCES Titles (title_id);

ALTER TABLE Dept_emp ADD CONSTRAINT fk_Dept_emp_emp_no FOREIGN KEY (emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_emp ADD CONSTRAINT fk_Dept_emp_dept_no FOREIGN KEY (dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_dept_no FOREIGN KEY (dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_manager ADD CONSTRAINT fk_Dept_manager_emp_no FOREIGN KEY (emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY (emp_no)
REFERENCES Employees (emp_no);


