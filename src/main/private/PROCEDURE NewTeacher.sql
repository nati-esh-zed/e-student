CREATE PROCEDURE `NewTeacher` (  
  IN IdUser INT,
  IN FirstName VARCHAR(45),
  IN LastName VARCHAR(45),
  IN Phone VARCHAR(16),
  IN Email VARCHAR(45),
  IN Password VARCHAR(64),
  IN Role VARCHAR(45)
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
      'teacher',
      FirstName,
      LastName,
      Phone,
      Email,
      Password
    );
	INSERT INTO `Teachers`(
      `IdUser`, 
      `Role`
    ) VALUE (
      (SELECT @@identity), 
      Role
    );
END