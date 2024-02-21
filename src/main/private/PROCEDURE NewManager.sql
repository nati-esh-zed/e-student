CREATE PROCEDURE `NewManager` (  
  IN IdUser INT,
  IN DepartmentShortCode VARCHAR(10),
  IN FirstName VARCHAR(45),
  IN LastName VARCHAR(45),
  IN Phone VARCHAR(16),
  IN Email VARCHAR(45),
  IN Password VARCHAR(64),
  IN Role ENUM('admin','dean')
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
      'manager',
      FirstName,
      LastName,
      Phone,
      Email,
      Password
    );
	INSERT INTO `Managers`(
      `IdUser`, 
      `IdDepartment`,
      `Role`
    ) VALUE (
      (SELECT @@identity), 
      (SELECT `IdDepartment` FROM `Departments` WHERE `Departments`.`ShortCode`=DepartmentShortCode LIMIT 1),
      Role
    );
END