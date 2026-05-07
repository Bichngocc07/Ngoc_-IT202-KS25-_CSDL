CREATE DATABASE BT_TH_Ss04;
USE BT_TH_Ss04;
CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL
);
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL
);
CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(150) NOT NULL,
    course_description TEXT,
    total_sessions INT NOT NULL,
    teacher_id INT,
    CONSTRAINT course_teacher FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);
CREATE TABLE Teacher_Course(
	teacher_course_id int primary key auto_increment,
    teacher_id int not null,
    course_id int not null,
    constraint teacher_course_teacher foreign key (teacher_id) references teachers(teacher_id),
    constraint teacher_course_course foreign key (course_id) references course(course_id)
);
CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY auto_increment,
    student_id INT,
    course_id INT,
    enroll_date DATE NOT NULL default(current_date),
    CONSTRAINT enrollment_student FOREIGN KEY (student_id) REFERENCES students(student_id),
    CONSTRAINT enrollment_course FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE score (
    score_id INT PRIMARY KEY auto_increment,
    student_id INT,
    course_id INT,
    midterm_score decimal(2,2),
    final_score decimal(2,2),
    CONSTRAINT score_student FOREIGN KEY (student_id) REFERENCES students(student_id),
    CONSTRAINT score_course FOREIGN KEY (course_id) REFERENCES course(course_id)
);
-- PHẦN 2 -NHẬP DỮ LIỆU BAN ĐẦU
-- 1. Thêm 5 Giảng viên
INSERT INTO Teachers (teacher_id, full_name, email) VALUES
(1, 'Phạm Thị Lan', 'lanpt@hnue.edu.vn'),
(2, 'Hoàng Văn Bắc', 'bachv@gmail.com'),
(3, 'Nguyễn Văn A', 'anv@gmail.com'),
(4, 'Trần Thị B', 'btt@gmail.com'),
(5, 'Lê Văn C', 'clv@gmail.com');

-- 2. Thêm 5 Khóa học
INSERT INTO course (course_id, course_name, course_description, total_sessions, teacher_id) VALUES
(101, 'Lập trình Node.js', 'Học xây dựng Backend với Node.js và Express', 12, 1),
(102, 'Cơ sở dữ liệu SQL', 'Thiết kế và quản trị database chuyên sâu', 10, 2),
(103, 'Xử lý ảnh với Python', 'Sử dụng OpenCV để xử lý hình ảnh', 15, 1),
(104, 'Lập trình PHP', 'Xây dựng website động với PHP/MySQL', 12, 3),
(105, 'Cấu trúc dữ liệu', 'Các thuật toán và cấu trúc dữ liệu cơ bản', 14, 4);

-- 3. Thêm 5 Sinh viên
INSERT INTO students (student_id, full_name, email) VALUES
(202601, 'Nguyễn Bảo Hoàng', 'baohoang@gmail.com'),
(202602, 'Phạm Minh Dương', 'dpm@gmail.com'),
(202603, 'Vũ Thị Engs', 'evut@gmail.com'),
(202604, 'Đỗ Văn Fhet', 'fdovan@gmail.com'),
(202605, 'Bùi Thị Giang', 'gbui@gmail.com');

-- 4. Thêm dữ liệu đăng ký (Enrollment)
INSERT INTO enrollment (student_id, course_id) VALUES
(202601, 101), (202601, 102), 
(202602, 101), (202603, 103), 
(202604, 104);


INSERT INTO score (student_id, course_id, midterm_score, final_score) VALUES
(202601, 101, 8.5, 9.0),
(202601, 102, 7.0, 8.0),
(202602, 101, 6.5, 7.5);
-- PHẦN 3 - CẬP NHẬT DỮ LIỆU 
-- 1. Cập nhật email cho một sinh viên
UPDATE students 
SET email = 'hoang.it.hnue@gmail.com' 
WHERE student_id = 202601;

-- 2. Cập nhật mô tả cho một khóa học
UPDATE course 
SET course_description = 'Khóa học Node.js nâng cao bao gồm triển khai Microservices' 
WHERE course_id = 101;

-- 3. Cập nhật điểm cuối kỳ cho một sinh viên
UPDATE score 
SET final_score = 9.5 
WHERE student_id = 202601 AND course_id = 101;
-- PHẦN IV - XÓA DỮ LIỆU

DELETE FROM score 
WHERE student_id = 202604 AND course_id = 104;

DELETE FROM enrollment 
WHERE student_id = 202604 AND course_id = 104;
-- PHẦN V - TRUY VẤN DỮ LIỆU
-- 1. Lấy danh sách tất cả sinh viên
SELECT * FROM students;

-- 2. Lấy danh sách giảng viên
SELECT * FROM Teachers;

-- 3. Lấy danh sách các khóa học
SELECT * FROM course;

SELECT e.enrollment_id, s.full_name, c.course_name, e.enroll_date
FROM enrollment e
JOIN students s ON e.student_id = s.student_id
JOIN course c ON e.course_id = c.course_id;

SELECT sc.score_id, s.full_name, c.course_name, sc.midterm_score, sc.final_score
FROM score sc
JOIN students s ON sc.student_id = s.student_id
JOIN course c ON sc.course_id = c.course_id;
