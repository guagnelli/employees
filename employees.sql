create schema hr;
/*DROP TABLE IF EXISTS hr.dept_emp,
                     hr.dept_manager,
                     hr.titles,
                     hr.salaries, 
                     hr.employees, 
                     hr.departments;*/

CREATE TABLE hr.employees (
    emp_no      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      char(1)		   NOT null check (gender in( 'M','F')),    
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE hr.departments (
    dept_no     CHAR(4)         NOT NULL,
    dept_name   VARCHAR(40)     NOT NULL,
    PRIMARY key(dept_no),
    UNIQUE (dept_name)
);

CREATE TABLE hr.dept_manager (
   emp_no       INT             NOT NULL,
   dept_no      CHAR(4)         NOT NULL,
   from_date    DATE            NOT NULL,
   to_date      DATE            NOT NULL,
   FOREIGN KEY (emp_no)  REFERENCES hr.employees (emp_no)    ON DELETE CASCADE,
   FOREIGN KEY (dept_no) REFERENCES hr.departments (dept_no) ON DELETE CASCADE,
   PRIMARY KEY (emp_no,dept_no)
); 

CREATE TABLE hr.dept_emp (
    emp_no      INT             NOT NULL,
    dept_no     CHAR(4)         NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    FOREIGN KEY (emp_no)  REFERENCES hr.employees   (emp_no)  ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES hr.departments (dept_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE hr.titles (
    emp_no      INT             NOT NULL,
    title       VARCHAR(50)     NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE,
    FOREIGN KEY (emp_no) REFERENCES hr.employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no,title, from_date)
) 
; 

CREATE TABLE hr.salaries (
    emp_no      INT             NOT NULL,
    salary      INT             NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES hr.employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no, from_date)
) 
; 

CREATE OR REPLACE VIEW hr.dept_emp_latest_date AS
    SELECT emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM hr.dept_emp
    GROUP BY emp_no;

-- shows only the current department for each employee
CREATE OR REPLACE VIEW hr.current_dept_emp AS
    SELECT l.emp_no, dept_no, l.from_date, l.to_date
    FROM hr.dept_emp d
        INNER JOIN hr.dept_emp_latest_date l
        ON d.emp_no=l.emp_no AND d.from_date=l.from_date AND l.to_date = d.to_date;


--\i load_departments.dump 
--\i load_employees.dump 
--\i load_dept_emp.dump 
--\i load_dept_manager.dump 
--\i load_titles.dump 
--\i load_salaries1.dump 
--\i load_salaries2.dump 
--\i load_salaries3.dump 
--\i show_elapsed.sql 