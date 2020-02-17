//在数据库中创建新成员
CREATE USER SMER IDENTIFIED BY SMER;
//赋予成员权限
GRANT connect,resource
TO SMER;
//连接数据库
conn SMER/SMER;
//创建用户表
create table Users
(
user_id number(11) not null,
user_name varchar2(20) not null,
user_password varchar2(20) not null,
constraint PK_USERS primary key (user_id)
);
//
create table Departments
(
department_id number(11) not null,
department_name varchar2(255) not null,
constraint PK_DEPARTMENTS primary key (department_id)
);

create table Employees
(
employee_id number(11) not null,
employee_name varchar2(255) not null,
department_id number(11) not null,
constraint PK_EMPLOYEES primary key (employee_id)
);

create table Projects
(
project_id number(11) not null,
project_name varchar2(255) not null,
project_type number(2) not null,
show number(1) not null,
calculation_id number(11)，
addorsubtract number(1) not null,
remark varchar2(255)，
constraint PK_PROJECTS primary key (project_id)
);

create table salary_projects(
salary_Project_Id number(2) not null,
salary_project_Name varchar2(255) not null,
constraint PK_SALARY primary key (salary_Project_Id)
);


create table calculations(
calculation_Id number(11) not null,
project_Id number(11) not null,
operator varchar2(1) not null,
operandtwo number(11,3) not null,
constraint PK_calculations primary key (calculation_Id)
);


create table fixed_salarys(
fixed_salary_Id number(11) not null,
project_Id number(11) not null,
employee_Id number(11) not null,
department_Id number(11) not null,
salary number(11),
constraint PK_fixed_salarys primary key (fixed_salary_Id)
);


create table import_projects
(
import_project_id NUMBER(11) not null,
employee_id NUMBER(11) not null,
project_id NUMBER(11) not null,
department_id NUMBER(11) not null,
import_date DATE not null,
import_Info NUMBER(11) not null,
remark varchar2(255),
constraint PK_IMPORT_PROJECTS primary key (import_project_id)
);

create table salary_settlements
(
salary_settlement_id NUMBER(11) not null,
employee_id NUMBER(11) not null,
department_id NUMBER(11) not null,
state NUMBER(11) not null,
import_date DATE not null,
pay_date DATE not null,
true_salary NUMBER(11) not null,
constraint PK_SALARY_SETTLEMENTS primary key (salary_settlement_id)
);

create table salary_settlement_details
(
salary_settlement_id NUMBER(11) not null,
project_id NUMBER(11) not null,
money number(11) not null,
addorsubtract number(1),
constraint PK_SALARY_SETTLEMENT_DETAILS primary key (salary_settlement_id,project_id)
);


alter table employees
add constraint FK_EMPLOYEES_REF_DEPARTMENTS foreign key (department_id)
references departments (department_id);

alter table projects
add constraint FK_PROJECTS_R_SALARYPROJECTS foreign key (project_type)
references salary_projects (salary_project_id);

alter table projects
add constraint FK_PROJECTS_REF_CALCULATIONS foreign key (calculation_id)
references calculations (calculation_id);

alter table calculations
add constraint FK_CALCULATIONS_REF_POJS foreign key (project_id)
references projects (project_id)

alter table fixed_salarys
add constraint FK_F_SALARYS_REF_PROJECTS foreign key (project_id)
references projects (project_id);

alter table fixed_salarys
add constraint FK_FIXED_SALARYS_REF_EMPLOYEES foreign key (employee_id)
references employees (employee_id);

alter table fixed_salarys
add constraint FK_F_SALARYS_REF_DEPARTMENTS foreign key (department_id)
references departments (department_id);

alter table import_projects
add constraint FK_I_PROJECTS_REF_EMPLOYEES foreign key (employee_id)
references employees (employee_id);

alter table import_projects
add constraint FK_I_PROJECTS_REF_PROJECTS foreign key (project_id)
references projects (project_id);

alter table import_projects
add constraint FK_I_PROJECTS_REF_DEPARTMENTS foreign key (department_id)
references departments (department_id);

alter table calculations
add constraint FK_CALCULATIONS_REF_POJS foreign key (project_id)
references projects (project_id)

alter table salary_settlements
add constraint FK_S_SETTLEMENTS_REF_EMPLOYEES foreign key (employee_id)
references employees (employee_id);

alter table salary_settlements
add constraint FK_S_SETTLEMENTS_R_DEPARTMENTS foreign key (department_id)
references departments (department_id);

alter table salary_settlement_details
add constraint FK_S_S_D_REF_S_SETTLEMENTS foreign key (salary_settlement_id)
references salary_settlements (salary_settlement_id);

alter table salary_settlement_details
add constraint FK_S_S_D_REF_IMPORT_PROJECTS foreign key (project_id)
references projects (project_id);

/***************************************************************************************/
//为各个表格创建序列
create sequence departments_seq
minvalue 1
maxvalue 9999999999
start with 1
increment by 1;

create sequence employees_seq
minvalue 1
maxvalue 9999999999
start with 1
increment by 1;

create sequence projects_seq
minvalue 1
maxvalue 9999999999
start with 1
increment by 1;

create sequence calculations_seq
minvalue 1
maxvalue 9999999999
start with 1
increment by 1;

create sequence fixed_salarys_seq
minvalue 1
maxvalue 9999999999
start with 1
increment by 1;

create sequence import_projects_seq
minvalue 1
maxvalue 9999999999
start with 1
increment by 1;

create sequence salary_settlements_seq
minvalue 1
maxvalue 9999999999
start with 1
increment by 1;
