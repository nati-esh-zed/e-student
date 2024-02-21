CREATE PROCEDURE `NewDepartment`(  
  IN IdDepartment INT,
  IN SchoolShortCode VARCHAR(10),
  IN Name VARCHAR(90),
  IN ShortCode VARCHAR(10)
)
BEGIN
	INSERT INTO `Departments`(
      `IdDepartment`,
      `IdSchool`,
      `Name`,
      `ShortCode`
    ) VALUE (
      IdDepartment,
      (SELECT `IdSchool` FROM `Schools` WHERE `Schools`.`ShortCode`=SchoolShortCode LIMIT 1),
      Name,
      ShortCode
    );
END