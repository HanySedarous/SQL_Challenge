
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