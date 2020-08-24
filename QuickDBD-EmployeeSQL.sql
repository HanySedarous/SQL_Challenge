
CREATE TABLE "dept" (
    "dept_no" int   NOT NULL,
    "dept_name" varchar(255)   NOT NULL,
    CONSTRAINT "pk_dept" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" int   NOT NULL,
    CONSTRAINT "dept_emp" PRIMARY KEY (
        "emp_no"
     )
);

#drop table "dept_manager"
CREATE TABLE "dept_manager" (
    "dept_no" varchar(255)   NOT NULL,
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no"
     )
);



CREATE TABLE "data_employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar(255)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(255)   NOT NULL,
    "last_name" varchar(255)   NOT NULL,
    "sex" varchar(255)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_data_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "data_salaries" (
    "emp_no" int   NOT NULL,
    "salary" varchar(255)   NOT NULL,
    CONSTRAINT "pk_data_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "data_titles" (
    "title_id" varchar(255)   NOT NULL,
    "title" varchar(255)   NOT NULL,
    CONSTRAINT "pk_data_titles" PRIMARY KEY (
        "title_id"
     )
);
----------------------------------------------------------------------------------------------------
#1. List the following details of each employee: employee number, last name, first name, sex, and salary.

select data_employees.emp_no, data_employees.last_name, data_employees.first_name, data_salaries.salary
from data_employees, data_salaries
where data_employees.emp_no = data_salaries.emp_no;

---------------------------------------------------------------------------------------------------
#2. List first name, last name, and hire date for employees who were hired in 1986.

 select first_name, last_name, hire_date
 from data_employees
 where hire_date > '1985-12-31' and hire_date < '1987-01-01'
----------------------------------------------------------------------------------------------------- 
 # 3 
 
 select dept_manager.dept_no, dept.dept_name, dept_manager.emp_no, data_employees.last_name, data_employees.first_name
		FROM dept_manager, dept, data_employees 
		WHERE dept_manager.dept_no = dept.dept_no and dept_manager.emp_no = data_employees.emp_no

#3. List the manager of each department with the following information: department number, department name, the manager
------------------------------------------------------------------------------------------------
#4. List the department of each employee with the following information: employee number,
last name, first name, and department name.

create table Depatrment as
(select dept_emp.emp_no, data_employees.last_name, data_employees.first_name, dept.dept_name, ROW_NUMBER() 
OVER (PARTITION BY data_employees.emp_no  ) row_num
	
from dept_emp, data_employees, dept_manager, dept
where dept_emp.emp_no = data_employees.emp_no and dept_manager.dept_no = dept.dept_no)

DELETE FROM Depatrment
WHERE row_num > 1;
	
------------------------------------------------------------------------------------------------

#5. List first name, last name, and sex for employees whose first name is "Hercules" 
and last names begin with "B."

select first_name, last_name, sex
from data_employees
where first_name = 'Hercules' and last_name LIKE 'B%';
-----------------------------------------------------------------------------

#6. List all employees in the Sales department, 
including their employee number, last name, first name, and department name.

select dept_emp.emp_no, data_employees.last_name, data_employees.first_name, dept.dept_name
FROM dept_emp, data_employees, dept



#7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

#8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.


