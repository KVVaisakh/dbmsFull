create table department1
(
depname varchar(20) Primary key,
loca varchar(15),
budget numeric(19,3)
)

create table instructor
(
id integer primary key,
iname varchar(20),
designation varchar(25),
salary numeric(9,2),
depname varchar(10),
foreign key(depname) references department1
)

create table course1
(
ccode varchar(5) primary key,
ctitle varchar(15),
credits integer,
depname varchar(10),
foreign key(depname) references department1
)

create table Section1
(
section_id varchar(5),
ccode varchar(15),
sem varchar(2),
year integer,
romm_no integer,
foreign key(ccode) references course1,
Primary key(section_id,ccode,sem,year)
)

create table Teach1
(
id integer,
section_id varchar(5),
ccode varchar(15),
sem varchar(2),
year integer,
foreign key(id) references instructor,
foreign key(section_id,ccode,sem,year) references Section1,
Primary key(id,section_id,ccode,sem,year)
)

create table Student
(
sid integer primary key,
sname varchar(25),
date_of_birth date,
depname varchar(10),
foreign key(depname) references department1
)

create table Take
(
sid integer,
section_id varchar(5),
ccode varchar(15),
sem varchar(2),
year integer,
grade varchar(2),
foreign key(section_id,ccode,sem,year) references Section1,
foreign key(sid) references Student,
Primary key(sid,section_id,ccode,sem,year)
)
insert into instructor values('1','Dheeraj','Professor',65000,'csc');
insert into instructor values('2','Hariharan','Professor',65000,'goerge');
insert into instructor values('3','Manikishan','Professor',75000,'lolan');
insert into instructor values('4','Abhinav','Professor',60000,'english');
insert into instructor values('5','Bhanu','Professor',60000,'maths');
insert into instructor values('6','Ayushi','Professor',65000,'goerge');
insert into instructor values('7','Neelam','Professor',65000,'maths');
insert into instructor values('8','Ashwathi','Professor',65000,'csc');

insert into course1 values('cs103','Intro to comp',3,'csc');
insert into course1 values('cs206','ML',3,'csc');
insert into course1 values('en103','Advanced eng',3,'english');
insert into course1 values('ma101','Li Algebra',4,'maths');
insert into course1 values('ge201','Geography',2,'goerge');
insert into course1 values('os201','os',2,'csc');



insert into Section1 values('101','cs103','s1',2018,1);
insert into Section1 values('102','cs103','s1',2018,2);
insert into Section1 values('101','en103','s2',2018,3);
insert into Section1 values('104','ge201','s1',2018,4);
insert into Section1 values('104','os201','s1',2018,4);


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
insert into take values(258,104,'ge201','s1',2018,'A');



select * from department1;
drop table instructor;
drop table course1;
drop table student;

select iname,location from instructor,department1 where department1.dname=instructor.depname;
select iname, ctitle from instructor natural join teach1, course1 where teach1.ccode= course1.ccode;

alter table instructor add column gender varchar(2);
update instructor set gender='M';
update instructor set gender='F' where id=6;
update instructor set gender='F' where id=7;
update instructor set gender='F' where id=8;

select iname,ctitle,teach1.ccode from instructor natural join teach1,course1 where instructor.gender='F' and teach1.ccode=course1.ccode;
select ctitle, budget from course1,department1 where department1.dname=course1.depname;
select iname from instructor natural join teach1,course1 where course1.ctitle='os' and course1.ccode=teach1.ccode and teach1.id=instructor.id;
