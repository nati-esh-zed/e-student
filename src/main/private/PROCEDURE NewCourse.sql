CREATE PROCEDURE `NewCourse`(  
  IN IdCourse INT,
  IN DepartmentShortCode VARCHAR(10),
  IN Name VARCHAR(90),
  IN ShortCode VARCHAR(10),
  IN Type ENUM('Mandatory', 'Elective')
)
BEGIN
	INSERT INTO `Courses`(
      `IdCourse`,
      `IdDepartment`,
      `Name`,
      `ShortCode`,
      `Type`
    ) VALUE (
      IdCourse,
      (SELECT `IdDepartment` FROM `Departments` WHERE `Departments`.`ShortCode`=DepartmentShortCode),
      Name,
      ShortCode,
      Type
    );
END