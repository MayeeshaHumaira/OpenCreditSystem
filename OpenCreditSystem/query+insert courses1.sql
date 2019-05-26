create database project;
use project;
--drop database project
--drop table TEACHER
--drop table courseCurriculum

create table STUDENT(
    StudentID varchar(10) NOT NULL PRIMARY KEY,
	St_Name varchar (100) NOT NULL,
	PWord varchar(255) Not null,
	Date_of_Birth Date NOT NULL,
	current_Year int NOT NULL,
	current_Semester int NOT NULL,	
	Department varchar (25) NOT NULL,
	Section varchar (1) NOT NULL,
	St_Address varchar (100) NOT NULL,
	Phone_Number  varchar (11) NOT NULL,
	Email  varchar (100) NOT NULL,	
	Blood_group varchar (5) NOT NULL
	
);
--drop table TEACHER




--drop table PASSEDCOURSES
create table PASSEDCOURSES(
PassedID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
StudentID varchar(10) NOT NULL FOREIGN KEY REFERENCES STUDENT (StudentID),
PassedSemester  Varchar(50) NOT NULL,
Theory1 varchar(255) not null,
Theory2 varchar(255) not null,
Theory3 varchar(255) not null,
Theory4 varchar(255) not null,
Theory5 varchar(255) not null,
Theory6 varchar(255),
Lab1 varchar(255) not null,
Lab2 varchar(255) not null,
Lab3 varchar(255) not null,
Lab4 varchar(255) not null,
Lab5 varchar(255)
);




--relations--

create table student_Course_relation(
StudentID varchar(10) NOT NULL FOREIGN KEY REFERENCES STUDENT (StudentID),
CourseID varchar(10) NOT NULL FOREIGN KEY REFERENCES COURSE (CourseID),
CGPA decimal(7,7) NOT NULL,
Number_of_Students int NOT NULL,
Capacity int NOT NULL check (Capacity<=100)
);





create table student_PassedCourses_relation(
StudentID varchar(10) NOT NULL FOREIGN KEY REFERENCES STUDENT (StudentID),
PassedID int NOT NULL FOREIGN KEY REFERENCES PASSEDCOURSES (PassedID),
--CGPA decimal(7,7) NOT NULL
);


--ALTER TABLE TEACHER
--DROP COLUMN Courses_Taken;

--drop table courseCurriculum
create table courseCurriculum(
	CourseNo varchar(255) primary key not null,
	CourseTitle varchar(255) not null,
	CreditHr float(2) not null,
	CourseType varchar(10) not null,
	CompanionCourse varchar(255),
	Prerequisite1 varchar(255) ,
	Prerequisite2 varchar(255) ,
	Prerequisite3 varchar(255) ,
	Prerequisite4 varchar(255) ,
	Prerequisite5 varchar(255) ,
	Capacity int default 80 ,
	CurrentNoOfStudents int not null default 0
);
--select * from courseCurriculum
--truncate table courseCurriculum

--UPDATING CURRENT NO. OF STUDENTS IN A PARTICULAR COURSE
--UPDATE courseCurriculum
--SET CurrentNoOfStudents=(select CurrentNoOfStudents from courseCurriculum where CourseNo='CSE1203')+1
--WHERE  CourseNo='CSE1203';

---1-1---
insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType) values 
('HUM1108','English Language Sessional',1.5,'LAB'),
('MATH1115','Mathematics',3,'THEORY'),
('PHY1116','Physics Lab',0.75,'LAB'),
('CHEM1115','Chemistry',3,'THEORY'),
('CSE1102','Elementary Structured Programming Lab',1.5,'LAB'),
('CSE1108','Introduction to Computer Systems',1.5,'LAB');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,CompanionCourse) values
('HUM1107','Critical Thinking and Communication',3,'THEORY','HUM1108'),
('PHY1115','Physics',3,'THEORY','PHY1116'),
('CSE1101','Elementary Structured Programming',3,'THEORY','CSE1102');

---1-2---
insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType) values 
('ME1211','Basic Mechanical Engineering',3,'THEORY'),
('CSE1203','Discrete Mathematics',3,'THEORY'),
('EEE1242','Basic Electrical Engineering Lab',1.5,'LAB'),
('ME1214','Engineering Drawing',0.75,'LAB');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,CompanionCourse) values
('EEE1241','Basic Electrical Engineering',3,'THEORY','EEE1242');


insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1) values
('MATH1219','Mathematics-2',3,'THEORY','MATH1115');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1,Prerequisite2) values
('CSE1200','Software Development-1',1.5,'LAB','CSE1101','CSE1102'),
('CSE1206','Object Oriented Programming Lab',1.5,'LAB','CSE1101','CSE1102');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,CompanionCourse,Prerequisite1,Prerequisite2) values
('CSE1205','Object Oriented Programming',3,'THEORY','CSE1206','CSE1101','CSE1102');


---2-1---
insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType) values 
('HUM2109','Society, Ethics and Technology',3,'THEORY'),
('EEE2142','Electronic Devices and Circuits Lab',1.5,'LAB'),
('CSE2106','Digital Logic Design Lab',1.5,'LAB');
insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1) values
('MATH2101','Mathematics-3',3,'THEORY','MATH1219');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1,Prerequisite2) values
('CSE2104','Data Structures Lab',1.5,'LAB','CSE1101','CSE1102'),
('CSE2100','Software Development-2',0.75,'LAB','CSE1205','CSE1206');



insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,CompanionCourse) values
('CSE2105','Digital Logic Design',3,'THEORY','CSE2106');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,CompanionCourse,Prerequisite1) values
('EEE2141','Electronic Devices and Circuits',3,'THEORY','EEE2142','EEE1241');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,CompanionCourse,Prerequisite1,Prerequisite2) values
('CSE2103','Data Structures',3,'THEORY','CSE2104','CSE1101','CSE1102');



---2-2---
insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType) values 
('CSE2202','Numerical Methods Lab',0.75,'LAB');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1) values
('MATH2203','Mathematics-4',3,'THEORY','MATH1115');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1,Prerequisite2) values
('CSE2200','Software Development-3',0.75,'LAB','CSE1205','CSE1206'),
('CSE2208','Algorithms Lab',1.5,'LAB','CSE2103','CSE2104'),
('CSE2214','Assembly Language Programming',1.5,'LAB','CSE1101','CSE1102');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1,Prerequisite2,Prerequisite3,Prerequisite4) values
('CSE2210','Digital Electronics and Pulse Techniques Lab',0.75,'LAB','CSE2105','CSE2106','EEE2141','EEE2142');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,CompanionCourse) values
('CSE2201','Numerical Methods',3,'THEORY','CSE2202'),
('CSE2213','Computer Architecture',3,'THEORY','CSE2214');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,CompanionCourse,Prerequisite1,Prerequisite2) values
('CSE2207','Algorithms',3,'THEORY','CSE2208','CSE2103','CSE2104');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,CompanionCourse,Prerequisite1,Prerequisite2,Prerequisite3,Prerequisite4) values
('CSE2209','Digital Electronics and Pulse Techniques',3,'THEORY','CSE2210','CSE2105','CSE2106','EEE2141','EEE2142');


---3-1---
insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType) values 
('HUM3115','Economics and Accounting',3,'THEORY');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1) values
('CSE3100','Software Development-4',0.75,'LAB','CSE3104');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1,Prerequisite2) values
('CSE3101','Mathematical Analysis for Computer Science',3,'THEORY','CSE1203','MATH2101');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1,Prerequisite2,Prerequisite3) values
('CSE3104','Database Lab',1.5,'LAB','CSE1203','CSE2103','CSE2104');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1,Prerequisite2,Prerequisite3,Prerequisite4) values
('CSE3108','Microprocessors Lab',0.75,'LAB','CSE2105','CSE2106','CSE2213','CSE2214'),
('CSE3110','Digital System Design Lab',0.75,'LAB','CSE2105','CSE2106','CSE2213','CSE2214');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,CompanionCourse,Prerequisite1,Prerequisite2,Prerequisite3) values
('CSE3103','Database',3,'THEORY','CSE3104','CSE1203','CSE2103','CSE2104');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,CompanionCourse,Prerequisite1,Prerequisite2,Prerequisite3,Prerequisite4) values
('CSE3107','Microprocessors',3,'THEORY','CSE3108','CSE2105','CSE2106','CSE2213','CSE2214'),
('CSE3109','Digital System Design',3,'THEORY','CSE3110','CSE2105','CSE2106','CSE2213','CSE2214');

---3-2---
insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType) values 
('HUM3207','Industrial Law and Safety Management',3,'THEORY'),
('CSE3224','Information System Design and Software Engineering Lab',0.75,'LAB');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1) values
('CSE3211','Data Communication',3,'THEORY','MATH2203');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1,Prerequisite2) values
('CSE3214','Operating System Lab',1.5,'LAB','CSE2103','CSE2104'),
('CSE3216','Microcontroller Based System Design Lab',0.75,'LAB','CSE3107','CSE3108');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1,Prerequisite2,Prerequisite3,Prerequisite4) values
('CSE3200','Software Development-5',0.75,'LAB','CSE1205','CSE1206','CSE3103','CSE3104');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,CompanionCourse,Prerequisite1,Prerequisite2) values
('CSE3213','Operating System',3,'THEORY','CSE3214','CSE2103','CSE2104'),
('CSE3215','Microcontroller Based System Design',3,'THEORY','CSE3216','CSE3107','CSE3108');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,CompanionCourse,Prerequisite1,Prerequisite2,Prerequisite3,Prerequisite4) values
('CSE3223','Information System Design and Software Engineering',3,'THEORY','CSE3224','CSE1205','CSE1206','CSE3103','CSE3104');

---4-1---
insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType) values 
('IPE4111','Industrial Management',3,'THEORY'),
('CSE4100','Project and Thesis-1',3,'THEORY');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1) values
('CSE4102','Computer Networks Lab',1.5,'LAB','CSE3211');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1,Prerequisite2) values
('CSE4126','Distributed Database Systems Lab',0.75,'LAB','CSE3103','CSE3104');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1,Prerequisite2,Prerequisite3) values
('CSE4130','Formal Languages & Compilers Lab',0.75,'LAB','CSE1101','CSE1102','CSE1203');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1,Prerequisite2,Prerequisite3,Prerequisite4) values
('CSE4108','Artificial Intelligence Lab',0.75,'LAB','CSE1203','CSE2207','CSE2208','CSE3101');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,CompanionCourse,Prerequisite1) values
('CSE4101','Computer Networks',3,'THEORY','CSE4102','CSE3211');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,CompanionCourse,Prerequisite1,Prerequisite2) values
('CSE4125','Distributed Database Systems',3,'THEORY','CSE4126','CSE3103','CSE3104');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,CompanionCourse,Prerequisite1,Prerequisite2,Prerequisite3) values
('CSE4129','Formal Languages & Compilers',3,'THEORY','CSE4130','CSE1101','CSE1102','CSE1203');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,CompanionCourse,Prerequisite1,Prerequisite2,Prerequisite3,Prerequisite4) values
('CSE4107','Artificial Intelligence',3,'THEORY','CSE4108','CSE1203','CSE2207','CSE2208','CSE3101');

---4-2---
insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType) values 
('CSE4250','Project and Thesis-2',3,'THEORY'),
('CSE4212','Simulation of Products, Processes & Services Lab',0.75,'LAB'),
('CSE4228','Digital Image Processing Lab',0.75,'LAB'),
('CSE4284','Advanced Algorithms Lab',0.75,'LAB'),
('CSE4226','Network Programming Lab',0.75,'LAB'),
('CSE4232','Multimedia Computing Lab',0.75,'LAB'),
('CSE4238','Soft Computing Lab',0.75,'LAB'),
('CSE4282','Web Computing Lab',0.75,'LAB'),
('CSE4214','Pattern Recognition Lab',0.75,'LAB'),
('CSE4244','Expert & Decision Support Systems Lab',0.75,'LAB'),
('CSE4248','Artificial Neural Networks Lab',0.75,'LAB')
;


insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1) values
('CSE4215','Advanced Computer Architecture',3,'THEORY','CSE2213'),
('CSE4217','Computer Graphics Lab',3,'THEORY','CSE2209'),
('CSE4233','Advanced Microprocessor Architecture',3,'THEORY','CSE3107'),
('CSE4219','Computational Geometry',3,'THEORY','MATH2203'),
('CSE4221','Graph Theory',3,'THEORY','CSE1203');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1,Prerequisite2) values
('CSE4255','Telecommunication',3,'THEORY','CSE3211', 'CSE4101'),
('CSE4241','Digital Signal Processing',3,'THEORY','MATH2101','MATH2203'),
('CSE4223','Computational Complexity Theory',3,'THEORY','CSE3101', 'CSE4129'),
('CSE4245','Parallel Processing',3,'THEORY','CSE2213','CSE3213');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,Prerequisite1,Prerequisite2,Prerequisite3,Prerequisite4,Prerequisite5) values
('CSE4204','Computer Graphics Lab',0.75,'LAB','MATH1115','MATH1219','MATH2203','CSE2101','CSE2102');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,CompanionCourse,Prerequisite1) values
('CSE4231','Multimedia Computing',3,'THEORY','CSE4232','CSE3103'),
('CSE4237','Soft Computing',3,'THEORY','CSE4238','CSE3101'),
('CSE4227','Digital Image Processing',3,'THEORY','CSE4228','CSE4203'),
('CSE4243','Expert & Decision Support Systems',3,'THEORY','CSE4244','CSE4107'),
('CSE4247','Artificial Neural Networks',3,'THEORY','CSE4248','CSE4107'),
('CSE4281','Web Computing',3,'THEORY','CSE4282','CSE4101');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,CompanionCourse,Prerequisite1,Prerequisite2) values
('CSE4211','Simulation of Products, Processes & Services',3,'THEORY','CSE4212', 'MATH2101','CSE3101'),
('CSE4225','Network Programming',3,'THEORY','CSE4226','CSE3211', 'CSE4101'),
('CSE4213','Pattern Recognition',3,'THEORY','CSE4214','MATH2203','CSE4107'),
('CSE4283','Advanced Algorithms',3,'THEORY','CSE4284','CSE2103','CSE2207');

insert into courseCurriculum(CourseNo,CourseTitle,CreditHr,CourseType,CompanionCourse,Prerequisite1,Prerequisite2,Prerequisite3,Prerequisite4,Prerequisite5) values
('CSE4203','Computer Graphics',3,'THEORY','CSE4204','MATH1115','MATH1219','MATH2203','CSE2101','CSE2102');

--drop table CoursesTaken
Create table CoursesTaken(
StudentID varchar(10) NOT NULL PRIMARY KEY,
Theory1 varchar(255) not null,
Theory2 varchar(255) not null,
Theory3 varchar(255) not null,
Theory4 varchar(255) not null,
Theory5 varchar(255) not null,
Theory6 varchar(255),
Lab1 varchar(255) not null,
Lab2 varchar(255) not null,
Lab3 varchar(255) not null,
Lab4 varchar(255) not null,
Lab5 varchar(255)
);
--truncate table CoursesTaken
--truncate table Student
--truncate table passedcourses
--INSERT INTO passed courses table
INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('24','1-1','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');
INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('24','1-2','CSE1101','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');
INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('24','2-1','CSE1101','CSE1203','CSE1102','CSE1206','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');

INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('8','1-1','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');
INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('8','1-2','CSE1101','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');
INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('8','2-1','CSE1101','CSE1203','CSE1102','CSE1206','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');

INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('10','1-1','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');
INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('10','1-2','CSE1101','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');
INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('10','2-1','CSE1101','CSE1203','CSE1102','CSE1206','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');

INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('11','1-1','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');
INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('11','1-2','CSE1101','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');
INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('11','2-1','CSE1101','CSE1203','CSE1102','CSE1206','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');

INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('12','1-1','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');
INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('12','1-2','CSE1101','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');
INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('12','2-1','CSE1101','CSE1203','CSE1102','CSE1206','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');

INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('13','1-1','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');
INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('13','1-2','CSE1101','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');
INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('13','2-1','CSE1101','CSE1203','CSE1102','CSE1206','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');

INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('123','1-1','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');
INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('123','1-2','CSE1101','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');
INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('123','2-1','CSE1101','CSE1203','CSE1102','CSE1206','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');
use project;
INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('24','1-1','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');
INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('160204001','1-1','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');
INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5) VALUES('160204007','1-1','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203','CSE1203');

INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Lab1,Lab2,Lab3,Lab4) VALUES('160204008','1-1','CHEM1115','MATH1115','HUM1107','PHY1115','CSE1101','HUM1108','PHY1116','CSE1102','CSE1108');
INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Lab1,Lab2,Lab3,Lab4) VALUES('160204008','1-2','CHEM1115','MATH1115','HUM1107','PHY1115','CSE1101','HUM1108','PHY1116','Elementary Structured Programming Lab','Introduction to Computer Systems');


INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Lab1,Lab2,Lab3,Lab4) VALUES('160204007','1-1','CHEM1115','MATH1115','HUM1107','PHY1115','CSE1101','HUM1108','PHY1116','CSE1102','CSE1108');
INSERT INTO PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Lab1,Lab2,Lab3,Lab4) VALUES('160204002','1-1','CHEM1115','MATH1115','HUM1107','PHY1115','CSE1101','HUM1108','PHY1116','CSE1102','CSE1108');

--showing selected courses in table
SELECT courseCurriculum.CourseNo, courseCurriculum.CourseTitle,courseCurriculum.CreditHr
FROM CoursesTaken inner join courseCurriculum
on CoursesTaken.Theory1=courseCurriculum.CourseNo
where CoursesTaken.StudentID='10'

---selecting unpassed courses
select CourseNo, CourseTitle, CreditHr
into UnpassedCourses
FROM courseCurriculum
where CourseNo IN( SELECT CourseNo from courseCurriculum where CourseNo NOT IN
	(SELECT Theory1 from PassedCourses where StudentID='24')AND CourseNo  NOT IN
	(SELECT Theory2 from PassedCourses where StudentID='24')AND CourseNo  NOT IN
	(SELECT Theory3 from PassedCourses where StudentID='24')AND CourseNo  NOT IN
	(SELECT Theory4 from PassedCourses where StudentID='24')AND CourseNo  NOT IN
	(SELECT Theory5 from PassedCourses where StudentID='24')AND CourseNo  NOT IN
	(SELECT Theory6 from PassedCourses where StudentID='24')AND CourseNo  NOT IN
	(SELECT Lab1 from PassedCourses where StudentID='24')AND CourseNo  NOT IN
	(SELECT Lab2 from PassedCourses where StudentID='24')AND CourseNo  NOT IN
	(SELECT Lab3 from PassedCourses where StudentID='24')AND CourseNo  NOT IN
	(SELECT Lab4 from PassedCourses where StudentID='24')AND CourseNo  NOT IN
	(SELECT Lab5 from PassedCourses where StudentID='24')
);

---selecting unpassed courses with prerequisite1
select CourseNo, CourseTitle, CreditHr,Prerequisite1
into UnpassedCoursesWithPrereq
FROM courseCurriculum
where CourseNo IN( SELECT CourseNo from courseCurriculum where CourseNo NOT IN
	(SELECT Theory1 from PassedCourses where StudentID='24')AND CourseNo  NOT IN
	(SELECT Theory2 from PassedCourses where StudentID='24')AND CourseNo  NOT IN
	(SELECT Theory3 from PassedCourses where StudentID='24')AND CourseNo  NOT IN
	(SELECT Theory4 from PassedCourses where StudentID='24')AND CourseNo  NOT IN
	(SELECT Theory5 from PassedCourses where StudentID='24')AND CourseNo  NOT IN
	(SELECT Theory6 from PassedCourses where StudentID='24')AND CourseNo  NOT IN
	(SELECT Lab1 from PassedCourses where StudentID='24')AND CourseNo  NOT IN
	(SELECT Lab2 from PassedCourses where StudentID='24')AND CourseNo  NOT IN
	(SELECT Lab3 from PassedCourses where StudentID='24')AND CourseNo  NOT IN
	(SELECT Lab4 from PassedCourses where StudentID='24')AND CourseNo  NOT IN
	(SELECT Lab5 from PassedCourses where StudentID='24')
);

---selecting courses where prequisites were passed
select CourseNo, CourseTitle, CreditHr
into prequisitesPassed
FROM courseCurriculum
where  Prerequisite1 in(SELECT Theory1 from PassedCourses where StudentID='24') or
	   Prerequisite1 in(SELECT Theory2 from PassedCourses where StudentID='24') or
	   Prerequisite1 in(SELECT Theory3 from PassedCourses where StudentID='24')or
	   Prerequisite1 in(SELECT Theory4 from PassedCourses where StudentID='24')or
	   Prerequisite1 in(SELECT Theory5 from PassedCourses where StudentID='24')or
	   Prerequisite1 in(SELECT Theory6 from PassedCourses where StudentID='24')or
	   Prerequisite1 in(SELECT Lab1 from PassedCourses where StudentID='24')or
	   Prerequisite1 in(SELECT Lab2 from PassedCourses where StudentID='24')or
	   Prerequisite1 in(SELECT Lab3 from PassedCourses where StudentID='24')or
	   Prerequisite1 in(SELECT Lab4 from PassedCourses where StudentID='24')or
	   Prerequisite1 in(SELECT Lab5 from PassedCourses where StudentID='24')	  
	  UNION

select CourseNo, CourseTitle, CreditHr
FROM courseCurriculum
where  Prerequisite2 in(SELECT Theory1 from PassedCourses where StudentID='24') or
	   Prerequisite2 in(SELECT Theory2 from PassedCourses where StudentID='24') or
	   Prerequisite2 in(SELECT Theory3 from PassedCourses where StudentID='24')or
	   Prerequisite2 in(SELECT Theory4 from PassedCourses where StudentID='24')or
	   Prerequisite2 in(SELECT Theory5 from PassedCourses where StudentID='24')or
	   Prerequisite2 in(SELECT Theory6 from PassedCourses where StudentID='24')or
	   Prerequisite2 in(SELECT Lab1 from PassedCourses where StudentID='24')or
	   Prerequisite2 in(SELECT Lab2 from PassedCourses where StudentID='24')or
	   Prerequisite2 in(SELECT Lab3 from PassedCourses where StudentID='24')or
	   Prerequisite2 in(SELECT Lab4 from PassedCourses where StudentID='24')or
	   Prerequisite2 in(SELECT Lab5 from PassedCourses where StudentID='24')	  
	  UNION
select CourseNo, CourseTitle, CreditHr
FROM courseCurriculum
where  Prerequisite3 in(SELECT Theory1 from PassedCourses where StudentID='24') or
	   Prerequisite3 in(SELECT Theory2 from PassedCourses where StudentID='24') or
	   Prerequisite3 in(SELECT Theory3 from PassedCourses where StudentID='24')or
	   Prerequisite3 in(SELECT Theory4 from PassedCourses where StudentID='24')or
	   Prerequisite3 in(SELECT Theory5 from PassedCourses where StudentID='24')or
	   Prerequisite3 in(SELECT Theory6 from PassedCourses where StudentID='24')or
	   Prerequisite3 in(SELECT Lab1 from PassedCourses where StudentID='24')or
	   Prerequisite3 in(SELECT Lab2 from PassedCourses where StudentID='24')or
	   Prerequisite3 in(SELECT Lab3 from PassedCourses where StudentID='24')or
	   Prerequisite3 in(SELECT Lab4 from PassedCourses where StudentID='24')or
	   Prerequisite3 in(SELECT Lab5 from PassedCourses where StudentID='24')	  
	  UNION
select CourseNo, CourseTitle, CreditHr
FROM courseCurriculum
where  Prerequisite4 in(SELECT Theory1 from PassedCourses where StudentID='24') or
	   Prerequisite4 in(SELECT Theory2 from PassedCourses where StudentID='24') or
	   Prerequisite4 in(SELECT Theory3 from PassedCourses where StudentID='24')or
	   Prerequisite4 in(SELECT Theory4 from PassedCourses where StudentID='24')or
	   Prerequisite4 in(SELECT Theory5 from PassedCourses where StudentID='24')or
	   Prerequisite4 in(SELECT Theory6 from PassedCourses where StudentID='24')or
	   Prerequisite4 in(SELECT Lab1 from PassedCourses where StudentID='24')or
	   Prerequisite4 in(SELECT Lab2 from PassedCourses where StudentID='24')or
	   Prerequisite4 in(SELECT Lab3 from PassedCourses where StudentID='24')or
	   Prerequisite4 in(SELECT Lab4 from PassedCourses where StudentID='24')or
	   Prerequisite4 in(SELECT Lab5 from PassedCourses where StudentID='24')	  
	  UNION
select CourseNo, CourseTitle, CreditHr
FROM courseCurriculum
where  Prerequisite5 in(SELECT Theory1 from PassedCourses where StudentID='24') or
	   Prerequisite5 in(SELECT Theory2 from PassedCourses where StudentID='24') or
	   Prerequisite5 in(SELECT Theory3 from PassedCourses where StudentID='24')or
	   Prerequisite5 in(SELECT Theory4 from PassedCourses where StudentID='24')or
	   Prerequisite5 in(SELECT Theory5 from PassedCourses where StudentID='24')or
	   Prerequisite5 in(SELECT Theory6 from PassedCourses where StudentID='24')or
	   Prerequisite5 in(SELECT Lab1 from PassedCourses where StudentID='24')or
	   Prerequisite5 in(SELECT Lab2 from PassedCourses where StudentID='24')or
	   Prerequisite5 in(SELECT Lab3 from PassedCourses where StudentID='24')or
	   Prerequisite5 in(SELECT Lab4 from PassedCourses where StudentID='24')or
	   Prerequisite5 in(SELECT Lab5 from PassedCourses where StudentID='24');

--inner joining passedPrequisites and unpassedCourse to do intersect's work 
select UnpassedCourses.CourseNo, UnpassedCourses.CourseTitle, UnpassedCourses.CreditHr
into canSelectTheseCourses
from prequisitesPassed inner join UnpassedCourses
on prequisitesPassed.CourseNo=UnpassedCourses.CourseNo

--select * from canSelectTheseCourses;
--select * from UnpassedCourses
--inserting the courses with null prerequisistes
insert into canSelectTheseCourses(CourseNo,CourseTitle,CreditHr)
select UnpassedCoursesWithPrereq.CourseNo,UnpassedCoursesWithPrereq.CourseTitle,UnpassedCoursesWithPrereq.CreditHr from UnpassedCoursesWithPrereq
where UnpassedCoursesWithPrereq.Prerequisite1 is null;

drop table canSelectTheseCourses;
drop table  UnpassedCourses;
drop table UnpassedCoursesWithPrereq;
drop table prequisitesPassed;

insert into PASSEDCOURSES(StudentID,PassedSemester,Theory1,Theory2,Theory3,Theory4,Theory5,Theory6,Lab1,Lab2,Lab3,Lab4,Lab5)
values ();
