CREATE PROCEDURE `NewClass`(  
  IN IdClass INT,
  IN CourseShortCode VARCHAR(10),
  IN AcademicYear DATE,
  IN Semester ENUM('1st', '2nd', 'Extra')
)
BEGIN
	INSERT INTO `Classes`(
      `IdClass`,
      `IdCourse`,
      `AcademicYear`,
      `Semester`
    ) VALUE (
      IdClass,
      (SELECT `IdCourse` FROM `Courses` WHERE `Courses`.`ShortCode`=CourseShortCode),
      AcademicYear,
      Semester
    );
END