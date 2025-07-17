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