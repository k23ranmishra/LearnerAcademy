create table master_login(
user_id varchar2(30) not null primary key, 
first_name varchar2(30) not null, 
last_name varchar2(30) not null, 
password varchar2(30), 
last_login date , 
role varchar2(30));

insert into master_login values
('SystemAdmin',
'System',
'Admin',
'112233'
,sysdate,'ADMIN'
);

commit;

insert into master_login values
('test',
'test',
'Admin',
'test'
,sysdate,'ADMIN'
);

create table master_subject(subject_id  varchar2(30) not null, subject_name   varchar2(50) not null);


create table master_teacher(teacher_id varchar2(30) not null, teacher_name varchar2(50) not null, subject_name varchar2(100)); 

create table master_classes (CLASS_ID varchar2(30) not null , CLASS_NAME varchar2(50) not null, CLASS_TEACHER_NAME varchar2(50) not null);

create table master_student (STUDENT_ID varchar2(30) not null , STUDENT_NAME varchar2(50) not null, CLASS_ASSIGNED varchar2(50) not null);

create table CLASS_SUBJECT_ASSIGNED( CLASS_NAME varchar2(50), SUBJECT_NAME VARCHAR2(50));
 
create table TEACHER_ASSIGNED(TEACHER_NAME VARCHAR2(50), CLASS_NAME VARCHAR2(50));