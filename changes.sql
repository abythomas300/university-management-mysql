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

/*- - - SAMPLE DATA INSERTION - - - */
/*departments table*/
INSERT INTO departments (department_id, department_name, department_head) VALUES
(1, 'Computer Science', 'Dr. Ramesh Kumar'),
(2, 'Mechanical Engineering', 'Dr. Anjali Verma'),
(3, 'Electrical Engineering', 'Dr. Sandeep Roy'),
(4, 'Civil Engineering', 'Dr. Meera Joshi'),
(5, 'Mathematics', 'Dr. Alok Shah');
/*instructors table*/
INSERT INTO instructors (instructor_id, instructor_name, department) VALUES
(1, 'Dr. Neha Singh', 1),
(2, 'Dr. Karan Patel', 2),
(3, 'Dr. Priya Das', 3),
(4, 'Dr. Vivek Iyer', 4),
(5, 'Dr. Sheetal Rao', 5);
/*students table*/
INSERT INTO students (student_id, student_name, department, gender, email, dob) VALUES
(1, 'Amit Jain', 1, 'Male', 'amit.jain@example.com', '2001-03-15'),
(2, 'Sneha Roy', 1, 'Female', 'sneha.roy@example.com', '2000-11-22'),
(3, 'Ravi Verma', 2, 'Male', 'ravi.verma@example.com', '2002-01-10'),
(4, 'Pooja Sharma', 2, 'Female', 'pooja.sharma@example.com', '2001-08-09'),
(5, 'Manish Mehta', 3, 'Male', 'manish.mehta@example.com', '1999-12-05'),
(6, 'Tanya Bhatt', 3, 'Female', 'tanya.bhatt@example.com', '2002-06-30'),
(7, 'Harsh Kapoor', 4, 'Male', 'harsh.kapoor@example.com', '2000-02-17'),
(8, 'Nikita Sen', 4, 'Female', 'nikita.sen@example.com', '2001-04-12'),
(9, 'Rohit Goyal', 5, 'Male', 'rohit.goyal@example.com', '2002-09-25'),
(10, 'Kavita Mishra', 5, 'Female', 'kavita.mishra@example.com', '2001-10-19');
/*courses table*/
INSERT INTO courses (course_id, course_name, department, instructor) VALUES
(1, 'Data Structures', 1, 1),
(2, 'Thermodynamics', 2, 2),
(3, 'Power Systems', 3, 3),
(4, 'Structural Analysis', 4, 4),
(5, 'Linear Algebra', 5, 5),
(6, 'Operating Systems', 1, 1),
(7, 'Fluid Mechanics', 2, 2),
(8, 'Control Systems', 3, 3);
/*class_schedule table*/
INSERT INTO class_schedule (schedule_id, day, course, classroom) VALUES
(1, 'Monday', 1, 101),
(2, 'Tuesday', 2, 201),
(3, 'Wednesday', 3, 301),
(4, 'Thursday', 4, 401),
(5, 'Friday', 5, 501),
(6, 'Monday', 6, 102),
(7, 'Wednesday', 7, 202),
(8, 'Friday', 8, 302);
/*enrollments table*/
INSERT INTO enrollments (enrollment_id, student_id, course_id, enrolled_date) VALUES
(1, 1, 1, '2025-07-01'),
(2, 1, 6, '2025-07-01'),
(3, 2, 1, '2025-07-02'),
(4, 2, 5, '2025-07-02'),
(5, 3, 2, '2025-07-03'),
(6, 3, 7, '2025-07-03'),
(7, 4, 2, '2025-07-03'),
(8, 5, 3, '2025-07-04'),
(9, 5, 8, '2025-07-04'),
(10, 6, 3, '2025-07-04'),
(11, 7, 4, '2025-07-05'),
(12, 8, 4, '2025-07-05'),
(13, 9, 5, '2025-07-06'),
(14, 10, 5, '2025-07-06'),
(15, 10, 6, '2025-07-06');
/*Adding phone number field to students table and sample data insertion*/
ALTER TABLE students ADD phone_number VARCHAR(255);
UPDATE students SET phone_number = '+91 9876543210' WHERE student_id = 1;
UPDATE students SET phone_number = '+91 9123456789' WHERE student_id = 2;
UPDATE students SET phone_number = '+91 9988776655' WHERE student_id = 3;
UPDATE students SET phone_number = '+91 9012345678' WHERE student_id = 4;
UPDATE students SET phone_number = '+91 9345678901' WHERE student_id = 5;
UPDATE students SET phone_number = '+91 9765432109' WHERE student_id = 6;
UPDATE students SET phone_number = '+91 9090909090' WHERE student_id = 7;
UPDATE students SET phone_number = '+91 9823456712' WHERE student_id = 8;
UPDATE students SET phone_number = '+91 9445566778' WHERE student_id = 9;
UPDATE students SET phone_number = '+91 9612345670' WHERE student_id = 10;

/*QUERIES - CRUD and JOIN operations*/
/*updating a student's contact information*/
UPDATE students SET phone_number = '+91 9996663332' WHERE student_id = 2;
/*enrolling a student into a course*/
INSERT INTO enrollments (student_id, course_id, enrolled_date) VALUES (1, 5, '2025-07-20');
