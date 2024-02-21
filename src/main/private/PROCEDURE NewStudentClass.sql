CREATE PROCEDURE `NewStudentClass` (  
  IN IdStudentClass INT,
  IN StudentId VARCHAR(20),
  IN CourseShortCode VARCHAR(10),
  IN ClassAcademicYear YEAR,
  IN ClassSemester ENUM('1st', '2nd', 'Extra'),
  IN `Status` ENUM('offered', 'scheduled', 'started', 'ended')
)
BEGIN
	INSERT INTO `StudentClasses`(
      `IdStudentClass`,
      `IdStudent`,
      `IdClass`,
      `Status`
    ) VALUE (
      IdStudentClass,
      (SELECT `IdUser` FROM `Students` AS S WHERE S.`Id`=StudentId LIMIT 1),
      (SELECT `IdClass` FROM `Classes` AS C 
        WHERE C.`IdCourse`=(SELECT `IdCourse` FROM `Courses` AS K WHERE K.`ShortCode`=CourseShortCode LIMIT 1)
        AND   C.`AcademicYear`=ClassAcademicYear 
        AND   C.`Semester`=ClassSemester 
        LIMIT 1),
      `Status`
    );
END