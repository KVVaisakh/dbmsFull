drop table Department cascade;
drop table Instructor cascade;
drop table Course cascade;
drop table Section cascade;
drop table Teach cascade;
drop table Student cascade;
drop table Take cascade;*/
create table Department 
(
	depname varchar(15) primary key,
	location varchar, 
	budget numeric(9,0)
);

create table Instructor 
(
	id varchar(15) primary key, 
	iname varchar(15), 
	designation varchar(15), 
	salary numeric(9,0), 
	depname varchar(15),
	foreign key(depname) references Department(depname)
);

create table Course 
(
	CCode varchar(15) primary key, 
	ctitle varchar(15), 
	credits numeric(9,0), 
	depname varchar(15),
	foreign key(depname) references Department(depname)
);

create table Section 
(
	section_id varchar(15), 
	CCode varchar(15), 
	SEM varchar(15), 
	year varchar(15), 
	room_no varchar(15),
	primary key(section_id,CCode,SEM,year),
	foreign key(CCode) references Course(CCode)
);

create table Teach 
(
	id varchar(15), 
	section_id varchar(15), 
	CCode varchar(15), 
	SEM varchar(15), 
	year varchar(15),
	primary key(id,section_id,CCode,SEM,year),
	foreign key(section_id,CCode,SEM,year) references Section(section_id,CCode,SEM,year),
);

create table Student 
(
	Sid varchar(15) primary key, 
	sname varchar(15), 
	date_of_birth date, 
	depname varchar(15),
	foreign key(depname) references Department(depname)
);

create table Take 
(
	Sid varchar(15), 
	section_id varchar(15), 
	CCode varchar(15), 
	SEM varchar(15), 
	year date, 
	grade varchar(15),
	primary key (Sid,section_id,CCode,SEM,year),
	foreign key(section_id,CCode,SEM,year) references Section(section_id,CCode,SEM,year),
	foreign key(Sid) references Student(Sid)
);

insert into Instructor values('1','RAM','ASS.Professor',65000,'CSE');
insert into Instructor values('2','RAVI','Lecture',65000,'EEE');
insert into Instructor values('3','HARI','ASS.Professor',75000,'ECE');
insert into Instructor values('4','KRISHNAN','Lecture',60000,'ME');
insert into Instructor values('5','SHIV','Professor',60000,'ARCH');
insert into Instructor values('6','DURGA','Lecture',65000,'CSE');
insert into Instructor values('7','PARVATI','Professor',65000,'EEE');
insert into Instructor values('8','SARASVATI','Professor',65000,'ME');

insert into Course values('cse103','Intro to comp',3,'CSE');
insert into Course values('cse206','ML',3,'CSE');
insert into Course values('eee103','Advanced eee',3,'EEE');
insert into Course values('me101','thermodynamics',4,'ME');
insert into Course values('arch201','cad',2,'ARCH');
insert into Course values('ece201','semiconductors',2,'ECE');



insert into Section values('101','cs103','s1',2018,1);
insert into Section values('102','cs103','s1',2018,2);
insert into Section values('101','en103','s2',2018,3);
insert into Section values('104','ge201','s1',2018,4);
insert into Section values('104','os201','s1',2018,4);


insert into teach1 values(1,'101','cs103','s1',2018);
insert into teach1 values(3,'101','cs103','s1',2018);
insert into teach1 values(4,'101','en103','s2',2018);
insert into teach1 values(6,'104','ge201','s1',2018);
insert into teach1 values(1,'104','os201','s1',2018);


insert into student values(256,'Sreshta','6-5-1999','csc');
insert into student values(257,'Abhiram','6-25-1999','english');
insert into student values(258,'Vinay','6-9-1999','goerge');
insert into student values(259,'Venkatesh','4-19-1999','maths');

insert into take values(256,101,'cs103','s1',2018,'A+');
insert into take values(257,101,'en103','s2',2018,'A+');
insert into take values(258,104,'ge201','s1',2018,'A');*/
