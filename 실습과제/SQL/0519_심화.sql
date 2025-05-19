#다음 컬럼을 가지는 userTBL과 buyTBL을 정의하세요.
#기존에 테이블이 존재하면 삭제함
#userTBL
drop table if exists usertbl;

create table userTBL(
    userID char(8) not null primary key ,
    name varchar(10) not null,
    birthyear int not null
);
#buyTBL
drop table if exists buyTBL;

create table buyTBL(
    num int auto_increment not null primary key,
    userID char(8) not null,
    prodName char(6) not null,
    foreign key (userid) references userTBL(userid)
);
#다음 조건을 만족하는 userTBL 테이블을 정의하세요.
#기존 buyTBL,userTBL을 삭제하세요.
drop table if exists buyTBL,userTBL;

create table userTBL(
    userID char(8) not null primary key ,
    name varchar(10) not null,
    birthyear int not null,
    email char(30) null unique
);
#다음 조건을 만족하는 userTBL 테이블을 정의하세요.
#기존 userTBL을 삭제하세요.
drop table if exists userTBL;

create table userTBL(
    userID char(8) not null primary key ,
    name varchar(10),
    birthyear int check(birthyear>=1900 and birthyear<=2023),
    mobile char(3) not null
);
#다음 조건을 만족하는 userTBL 테이블을 정의하세요.
#기존 userTBL을 삭제하세요.
drop table if exists  userTBL;

create table userTBL(
    userID char(8) not null primary key ,
    name varchar(10) not null,
    birthyear int not null default -1,
    addr char(2) not null default '서울',
    mobile1 char(3) null,
    mobile2 char(8) null,
    height smallint null default 170,
    mDate date null
);
#기본값 추가를 확인할 수 있는 데이터를 추가하세요.
insert into usertbl values ('LHL','이혜리',default,default,'011','1234567',default,'2023.12.12');
insert into usertbl(userID,name) values('KAY','김아영');
insert into usertbl values ('WB','원빈',1982,'대전','019','9876543',176,'2020.5.5');
#앞에서 만든 userTBL에 대해서 다음 조건을 처리하도록 수정하세요.
#mobile1 컬럼을 삭제함
alter table userTBL
drop column mobile1;
#name 컬렴명를 uName으로 변경함
alter table userTBL
change column name uName varchar(20) null;
#기본키를 제거함
alter table userTBL
drop primary key ;
#다음 정보를 가지는 직원 정보를 출력하는 EMPLOYEES_INFO 뷰를 작성하세요
create or replace view employees_info
as
select a.emp_no, a.birth_date, a.first_name,a.last_name,a.gender,a.hire_date,b.from_date as 't_from',b.to_date as 't_to',c.salary,c.from_date as 's_from',c.to_date as 's_to'
from employees a,titles b,salaries c
where a.emp_no = b.emp_no and a.emp_no = c.emp_no;

select *
from employees_info
where emp_no = 10001;
#EMPLOYEES_INFO 뷰에서 재직자의 현재 정보만 출력하세요.
select *
from employees_info
where  t_to = '9999-01-01' and s_to = '9999-01-01';
#다음 정보를 가지는 부서 정보를 출력하는 EMP_DEPT_INFO 뷰를 작성하세요.
create view EMP_DEPT_INFO
as
select b.emp_no, b.dept_no, a.dept_name, b.from_date, b.to_date
from departments a, dept_emp b
where a.dept_no = b.dept_no;

select *
from EMP_DEPT_INFO;
#EMP_DEPT_INFO로 현재 재직자의 부서 정보를 출력하세요.
select *
from EMP_DEPT_INFO
where to_date = '9999-01-01';