create table class(
	id varchar(255) primary key,
	name varchar(255),
	room varchar(255),
);
create table subjects(
	id int primary key,
	name varchar(255),
);
create table students(
	id varchar(255) primary key,
	name varchar(255),
	birthday datetime,
	class_id varchar(255) foreign key references class(id)
);
create table projects(
	students_id varchar(255) foreign key references students(id),
	subjects_id int foreign key references subjects(id),
);
create table transcript(
	id int primary key,
	students_id varchar(255) foreign key references students(id),
	class_id varchar(255) foreign key references class(id),
	point int,
	categorize varchar(255),
);
