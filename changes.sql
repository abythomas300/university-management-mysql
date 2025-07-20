/*Create Database*/
CREATE DATABASE universityDB

/*- - - SCHEMA DESIGN - - - */
/*departments table*/
CREATE TABLE departments(
	department_id INT AUTO_INCREMENT,
    department_name VARCHAR(255) NOT NULL UNIQUE,
    department_head VARCHAR(255),
    PRIMARY KEY(department_id)
);
/*students table*/
CREATE TABLE students(
 student_id INT AUTO_INCREMENT,
 student_name VARCHAR(255) NOT NULL,
 department INT NOT NULL,
 gender ENUM('Male', 'Female'),
 email VARCHAR(255) UNIQUE,
 dob DATE NOT NULL,
 PRIMARY KEY(student_id),
 FOREIGN KEY(department) REFERENCES departments(department_id)
);
/*instructors table*/
CREATE TABLE instructors(
 instructor_id INT AUTO_INCREMENT,
 instructor_name VARCHAR(255) NOT NULL,
 department INT,
 PRIMARY KEY(instructor_id),
 FOREIGN KEY(department) REFERENCES departments(department_id)
);
/*courses table*/
CREATE TABLE courses(
 course_id INT AUTO_INCREMENT,
 course_name VARCHAR(255) NOT NULL,
 department INT NOT NULL,
 instructor INT,
 PRIMARY KEY(course_id),
 FOREIGN KEY(department) REFERENCES departments(department_id),
 FOREIGN KEY(instructor) REFERENCES instructors(instructor_id)
);
/*class_schedule table*/
CREATE TABLE class_schedule(
 schedule_id INT AUTO_INCREMENT,
 day ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday') NOT NULL,
 course INT,
 classroom INT,
 PRIMARY KEY(schedule_id),
 FOREIGN KEY(course) REFERENCES courses(course_id)
);
/*enrollments table (Junction Table for M:M relation between students and courses)*/
CREATE TABLE enrollments(
 enrollment_id INT AUTO_INCREMENT,
 student_id INT NOT NULL,
 course_id INT NOT NULL,
 enrolled_date DATE,
 PRIMARY KEY(enrollment_id),
 FOREIGN KEY(student_id) REFERENCES students(student_id),
 FOREIGN KEY(course_id) REFERENCES courses(course_id),
 UNIQUE(student_id, course_id) /*To prevent duplicate entires - a record with already existing combination of student_id and course_id will be prevented from entering*/
);