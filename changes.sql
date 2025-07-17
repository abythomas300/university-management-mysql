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