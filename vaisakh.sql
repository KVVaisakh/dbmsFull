
Drop table course ;
Drop table instructor ;
Drop table department ;
Drop table student_123 ;

create table department 
( 
	dept_name varchar(20),
	building varchar(15),
	budget numeric(12,2),
	primary key (dept_name)
);

create table course
(
	course_id varchar(7),
	title varchar(50),
	dept_name varchar(20),
	credits numeric(2,0),
	primary key (course_id),
	foreign key (dept_name) references department
);

create table instructor
(
	id varchar(5),
	name varchar(20) not null,
	dept_name varchar(20),
	salary numeric(8,2),
	primary key(ID),
	foreign key (dept_name) references department
);

insert into department (dept_name,building,budget) values
('Comp. Sci.','Taylor',100000),
('Biology','Watson',90000),
('Elec. Eng','Taylor',85000),
('Music','Packard',80000),
('History','Painter',50000),
('Physics','Watson',1000),
('Finance','Painter',1000);

insert into instructor(id,name,dept_name,salary) values 
('22222','Einstein','Physics',95000), 
('12121','Wu','Finance',90000),
('32343','El Said','History',60000),
('45565','katz','Comp. Sci.',75000),
('98345','kim','Elec. Eng',80000),
('76766','crick','Biology',72000),
('10101','srinivasan','Comp. Sci.',65000);

insert into course(course_id,title,dept_name,credits) values
('BIO-101','Intro to Bio','Biology',4),
('BIO-301','Genetics','Biology',4),
('BIO-399','Computational','Biology',3),
('CS-319','Intro. to Computer Science','Comp. Sci.',4),
('PHY-101','Physical Principles','Physics',4),
('MU-199','Musical Video Production','Music',3),
('HIS-351','World History','History',3);



select * from department;
select * from course where dept_name='Comp. Sci.';
update course set credits=2 where course_id='BIO-101';
select * from course where credits=3;
delete from course where credits<3;
select * from course;

create table students (Rollnumber varchar(10), Name varchar(25), State varchar(10));
insert into students values 
('1', 'vaisakh', 'Kerala'), 
('2', 'rohan', 'Mumbai'), 
('3', 'karan', 'New York'), 
('4', 'shriamrut', 'Karnataka'), 
('5', 'kanishk', 'Rajasthan'), 
('6', 'ravi', 'Paris'), 
('10', 'hari', 'Chennai'), 
('11', 'krishnan', 'Kerala'), 
('12', 'navaneth', 'Kerala'), 
('13', 'Kishore', 'Kerala'), 
('14', 'Krishnan', 'Kerala'), 
('15', 'phani', 'Kerala');
select * from students;
alter table students add column CGPA numeric(3,1);
update students set CGPA = 0;
update students set CGPA=9.5 where Rollnumber='6';
select * from students;
ALTER TABLE students ADD COLUMN tuition_fee numeric(9,2);
ALTER TABLE students ADD COLUMN bus_fee numeric(9,2);
select * from students;
ALTER TABLE students DROP COLUMN bus_fee;
select * from students;
ALTER TABLE students
	ALTER COLUMN State TYPE varchar(80),
	ALTER COLUMN Name TYPE varchar(30);
select * from students;
alter table students rename column state to state_1; 
select * from students;
alter table students rename to student_123;
select * from student_123;

