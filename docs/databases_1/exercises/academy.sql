-- Opret tabeller
CREATE TABLE teachers (
    teacher_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    teacher_id INT NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Indsæt roller
INSERT INTO roles (role_name) VALUES
('Fuldtid'),
('Deltid'),
('Orlov');

-- Indsæt undervisere
INSERT INTO teachers (first_name, last_name) VALUES
('Lars', 'Pedersen'),
('Mette', 'Jensen');

-- Indsæt kurser
INSERT INTO courses (course_name, teacher_id) VALUES
('DAT2', 1),
('SOFT', 2),
('WEB', 1);

-- Indsæt studerende med roller
INSERT INTO students (first_name, last_name, role_id) VALUES
('Emil', 'Hansen', 1),
('Sofie', 'Nielsen', 2),
('Mads', 'Kristensen', 1),
('Anna', 'Møller', 3),
('Frederik', 'Olsen', 2),
('Julie', 'Andersen', 1);

-- Tilmeld studerende til kurser med karakterer
INSERT INTO enrollments (student_id, course_id, grade) VALUES
(1, 1, '7'), (1, 2, '10'),
(2, 1, '4'), (2, 3, '7'),
(3, 2, '12'), (3, 3, '10'),
(4, 1, '02'), (4, 2, '4'),
(5, 3, '7'), (6, 1, '10');
