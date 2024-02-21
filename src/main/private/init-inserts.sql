
-- register default schools
CALL NewSchool(NULL, 'School of Freshman Division Program', 'SoFDP');
CALL NewSchool(NULL, 'School of Electrical Engineering and Computing', 'SoEEC');
CALL NewSchool(NULL, 'School of Mechanical Materials and Chemical Engineering', 'SoMMCE');

-- register default departments
CALL NewDepartment(NULL, 'SoFDP', 'Pre-Engineering', 'PE');
CALL NewDepartment(NULL, 'SoFDP', 'Applied Science', 'AP');
CALL NewDepartment(NULL, 'SoEEC', 'Computer Science and Engineering', 'CSE');
CALL NewDepartment(NULL, 'SoEEC', 'Software Engineering', 'SE');
CALL NewDepartment(NULL, 'SoEEC', 'Electornics and Communication Engineering', 'ECE');
CALL NewDepartment(NULL, 'SoEEC', 'Electrical Power and Control Engineering', 'EPCE');
CALL NewDepartment(NULL, 'SoMMCE', 'Mechanical Engineering', 'MCE');
CALL NewDepartment(NULL, 'SoMMCE', 'Materials Engineering', 'MTE');
CALL NewDepartment(NULL, 'SoMMCE', 'Chemical Engineering', 'CME');

-- register default courses
CALL NewCourse(NULL, 'CSE', 'Advanced Programming', 'CSEg3301', 'Mandatory');
CALL NewCourse(NULL, 'CSE', 'Probability and Random Process', 'CSEg3302', 'Mandatory');
CALL NewCourse(NULL, 'CSE', 'Fundamentals of Software Engineering', 'CSEg3303', 'Mandatory');
CALL NewCourse(NULL, 'CSE', 'General Psychology and Life Skills', 'CSEg3304', 'Mandatory');
CALL NewCourse(NULL, 'CSE', 'Computer Graphics', 'CSEg3305', 'Elective');
CALL NewCourse(NULL, 'ECE', 'Digital Login Design', 'ECEg3301', 'Mandatory');
CALL NewCourse(NULL, 'ECE', 'Electornic Circuit II', 'ECEg3302', 'Elective');

-- register default classes
CALL NewClass(NULL, 'CSEg3301', YEAR(NOW()), '1st');
CALL NewClass(NULL, 'CSEg3302', YEAR(NOW()), '1st');
CALL NewClass(NULL, 'CSEg3303', YEAR(NOW()), '1st');
CALL NewClass(NULL, 'CSEg3304', YEAR(NOW()), '1st');
CALL NewClass(NULL, 'ECEg3301', YEAR(NOW()), '1st');
CALL NewClass(NULL, 'CSEg3305', YEAR(NOW()), '1st');
CALL NewClass(NULL, 'ECEg3302', YEAR(NOW()), '1st');

-- register admin
CALL NewManager(NULL, NULL, 'Main', 'Manager', '0000000000', 'admin@gmail.com', 'admin', 'admin');
-- register SoEEC CSE manager
CALL NewManager(NULL, 'CSE', 'CSE', 'Manager', '0000000000', 'cse.admin@gmail.com', 'cseadmin', 'dean');
-- register SoEEC CSE teacher
CALL NewTeacher(NULL, 'Natnael', 'Eshetu', '0000000000', 'nati.eshetu@gmail.com', 'natieshetu', 'Lecturer');
-- register SoEEC CSE student
CALL NewStudent(NULL, 'Abel', 'Adane', '0000000000', 'abel.adane@gmail.com', 'abeladane', 'CSE', 'UGR/51001/16', DATE(NOW()), NULL);
-- assign student to class
CALL NewStudentClass(NULL, 'UGR/51001/16', 'CSEg3301', YEAR(NOW()), '1st', 'scheduled');
CALL NewStudentClass(NULL, 'UGR/51001/16', 'CSEg3302', YEAR(NOW()), '1st', 'scheduled');
CALL NewStudentClass(NULL, 'UGR/51001/16', 'CSEg3303', YEAR(NOW()), '1st', 'scheduled');
CALL NewStudentClass(NULL, 'UGR/51001/16', 'CSEg3304', YEAR(NOW()), '1st', 'scheduled');
CALL NewStudentClass(NULL, 'UGR/51001/16', 'ECEg3301', YEAR(NOW()), '1st', 'scheduled');
CALL NewStudentClass(NULL, 'UGR/51001/16', 'CSEg3305', YEAR(NOW()), '1st', 'offered');
CALL NewStudentClass(NULL, 'UGR/51001/16', 'ECEg3302', YEAR(NOW()), '1st', 'offered');
