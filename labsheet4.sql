/*drop table Employee cascade;
create table Employee 
(
	employee_id varchar(15), 
	ename varchar(20), 
	date_of_birth date, 
	salary numeric(9,2)
);

insert into Employee (employee_id , ename , date_of_birth , salary) values
('125','Ravi','1995-01-03',10000.4234),
('123','Hari','1995-02-02',20000.6243),
('122','Ram','1949-03-23',30000.5234),
('121','Kishan','1939-04-02',40000.2122),
('120','Roshan','1992-09-01',50000.13774);

select ceiling(salary) from Employee;
select floor(salary) from Employee;
select round(salary,2) from Employee;
select power(salary,2) from Employee;
select lower(ename) from Employee;
select ename,length(ename) from Employee;
select Lpad(ename,15,'*') from Employee;
select Rpad(ename,15,'*') from Employee;
select Ltrim(ename,' ') from Employee;
select Rtrim(ename,' ') from Employee;
select substring(ename,2,3) from Employee;
select to_char(date_of_birth,'dd/month/yyyy') from Employee;
select to_date('20170103','YYYYMMDD');
SELECT to_date('2017 Feb 20','YYYY Mon DD');
select * from Employee where Rtrim(to_char(date_of_birth,'month'),' ')='january';
*/
drop table Department cascade;
create table Department 
(
	depname varchar(15) primary key,
	location varchar, 
	budget numeric(9,0)
);

drop table Instructor cascade;
create table Instructor 
(
	id varchar(15) primary key, 
	iname varchar(15), 
	designation varchar(15), 
	salary numeric(9,0), 
	depname varchar(15),
	foreign key(depname) references Department(depname)
);

drop table Course cascade;
create table Course 
(
	CCode varchar(15) primary key, 
	ctitle varchar(15), 
	credits numeric(9,0), 
	depname varchar(15),
	foreign key(depname) references Department(depname)
);

drop table Section cascade;
create table Section 
(
	section_id varchar(15) primary key, 
	CCode varchar(15), 
	SEM varchar(15), 
	year varchar(15), 
	room_no varchar(15),
	foreign key(CCode) references Course(CCode)
);

drop table Teach cascade;
create table Teach 
(
	id varchar(15) primary key, 
	section_id varchar(15), 
	CCode varchar(15), 
	SEM varchar(15), 
	year varchar(15),
	foreign key(section_id) references Section(section_id),
	foreign key(CCode) references Course(CCode)
);

drop table Student cascade;
create table Student 
(
	Sid varchar(15) primary key, 
	sname varchar(15), 
	date_of_birth date, 
	depname varchar(15),
	foreign key(depname) references Department(depname)
);

drop table Take cascade;
create table Take 
(
	Sid varchar(15), 
	section_id varchar(15), 
	CCode varchar(15), 
	SEM varchar(15), 
	year date, 
	grade varchar(15),
	primary key (Sid,CCode,SEM),
	foreign key(CCode) references Course(CCode),
	foreign key(section_id) references Section(section_id),
	foreign key(Sid) references Student(Sid)
);
