CREATE PROCEDURE `NewStudent` (  
  IN IdUser INT,
  IN FirstName VARCHAR(45),
  IN LastName VARCHAR(45),
  IN Phone VARCHAR(16),
  IN Email VARCHAR(45),
  IN Password VARCHAR(64),
  IN DepartmentShortCode VARCHAR(10),
  IN Id VARCHAR(20),
  IN EntryDate DATE,
  IN ExitDate DATE
)
BEGIN
	INSERT INTO `Users`(
      `IdUser`,
      `Type`,
      `FirstName`,
      `LastName`,
      `Phone`,
      `Email`,
      `Password`
    ) VALUE (
      IdUser,
      'student',
      FirstName,
      LastName,
      Phone,
      Email,
      Password
    );
	INSERT INTO `Students`(
      `IdUser`, 
      `IdDepartment`,
      `Id`,
      `EntryDate`,
      `ExitDate`
    ) VALUE (
      (SELECT @@identity), 
      (SELECT `IdDepartment` FROM `Departments` WHERE `Departments`.`ShortCode`=DepartmentShortCode),
      Id,
      EntryDate,
      ExitDate
    );
END