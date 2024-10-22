CREATE TABLE course (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    teacher_id INT
);

CREATE TABLE student (
    id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

CREATE TABLE teacher (
    id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

CREATE TABLE student_course (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

SELECT 
    student.id, 
    student.first_name, 
    student.last_name, 
    student_course.course_id
FROM 
    student
INNER JOIN 
    student_course 
ON 
    student.id = student_course.student_id;

SELECT 
    course.id, 
    course.name, 
    teacher.first_name, 
    teacher.last_name
FROM 
    course
INNER JOIN 
    teacher 
ON 
    course.teacher_id = teacher.id;

SELECT 
    course.id, 
    course.name, 
    student_course.student_id
FROM 
    course
INNER JOIN 
    student_course 
ON 
    course.id = student_course.course_id;

SELECT 
    student.first_name, 
    student.last_name
FROM 
    student
INNER JOIN 
    student_course 
ON 
    student.id = student_course.student_id
INNER JOIN 
    course 
ON 
    student_course.course_id = course.id
WHERE 
    course.name = 'Database design';

SELECT 
    course.name
FROM 
    course
INNER JOIN 
    teacher 
ON 
    course.teacher_id = teacher.id
WHERE 
    teacher.first_name = 'Taylah' 
    AND teacher.last_name = 'Booker';

SELECT 
    first_name, 
    last_name, 
    'Student' AS role
FROM 
    student
WHERE 
    last_name LIKE 'B%'

UNION

SELECT 
    first_name, 
    last_name, 
    'Teacher' AS role
FROM 
    teacher
WHERE 
    last_name LIKE 'B%';

