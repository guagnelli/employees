--To char to_char(timestamp, text)
select to_char(now(),'dd-month-yyyy HH24:MI:SS');
select to_char(485.8, '"Pre:"999" Post:" .999');
select to_char(99150856, '"Matrícula UNAM:"999999999');

--To date to_date(text, text)
select to_date('25 aug 2018','dd mon yyyy');

--empleado contratados en 1997 y 1998
SELECT * 
from hr.employees
where to_char(hire_date,'yyyy') IN ('1997', '1998');

--upper && lower
Select upper('hola mundo');
Select lower('HOLA MUNDO');


