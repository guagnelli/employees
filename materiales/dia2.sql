--select basico
SELECT *
FROM   hr.employees;

--seleccionando columnas
SELECT first_name, last_name
FROM   hr.employees;

--operadores aritméticos
SELECT emp_no, salary, salary + 300
FROM   hr.salaries;

--prioridad en operadores aritméticos
SELECT emp_no, salary, 12*salary+100
FROM   hr.salaries;

SELECT emp_no, salary, 12*(salary+100)
FROM   hr.salaries;

--alias en columnas
SELECT first_name, last_name “apellido paterno”
FROM   hr.employees;

--concatenación
SELECT	last_name || first_name AS "Employees"
FROM 	hr.employees;

--caracteres literales
SELECT last_name ||' fué contratado en '||hire_date
       AS "Employee Details"
FROM   hr.employees;

--Where
SELECT last_name, job_id, department_id
FROM   employees
WHERE  last_name = 'Facello' ;

SELECT last_name 
FROM   employees
WHERE  hire_date = '1985-11-21' ;

--operadores
SELECT emp_no salary
FROM   hr.salaries
WHERE  salary <= 3000 ;


SELECT emp_no, salary
FROM   hr.salaries
WHERE  salary BETWEEN 2500 AND 3500 ;

SELECT em_no, last_name
FROM   hr.employees
WHERE  emp_no IN (100, 101, 201) ;

SELECT	first_name
FROM 	hr.employees
WHERE	first_name LIKE 'S%' ;

SELECT last_name
FROM   hr.employees
WHERE  last_name LIKE '_o%' ;

SELECT emp_no, last_name
FROM   employees
WHERE  emp_no >= 10000
	AND    last_name LIKE '%cel%' ;
	
--Only females
SELECT * from hr.employees where gender = 'F';

--salary > 2500
select * from hr.salaries where salary > 2500;

--hired on 1998
select * from hr.employees where hire_date >= '1998-01-01' AND hire_date <= '1998-12-31';

--odering
select * from hr.employees order by gender,first_name;