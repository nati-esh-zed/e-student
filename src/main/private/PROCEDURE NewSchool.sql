CREATE PROCEDURE `NewSchool` (  
  IN IdSchool INT,
  IN Name VARCHAR(90),
  IN ShortCode VARCHAR(10)
)
BEGIN
	INSERT INTO `Schools`(
      `IdSchool`,
      `Name`,
      `ShortCode`
    ) VALUE (
      IdSchool,
      Name,
      ShortCode
    );
END