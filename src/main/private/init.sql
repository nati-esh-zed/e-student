-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema estudent
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `estudent` ;

-- -----------------------------------------------------
-- Schema estudent
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `estudent` DEFAULT CHARACTER SET utf8 ;
USE `estudent` ;

-- -----------------------------------------------------
-- Table `estudent`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`Users` (
  `IdUser` INT NOT NULL AUTO_INCREMENT,
  `Type` ENUM('manager', 'teacher', 'student') NOT NULL DEFAULT 'student',
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(16) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`IdUser`),
  UNIQUE INDEX `username_UNIQUE` (`Email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `estudent`.`Schools`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`Schools` (
  `IdSchool` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(90) NOT NULL,
  `ShortCode` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`IdSchool`),
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) VISIBLE,
  UNIQUE INDEX `ShortCode_UNIQUE` (`ShortCode` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `estudent`.`Departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`Departments` (
  `IdDepartment` INT NOT NULL AUTO_INCREMENT,
  `IdSchool` INT NOT NULL,
  `Name` VARCHAR(90) NOT NULL,
  `ShortCode` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`IdDepartment`),
  UNIQUE INDEX `name_UNIQUE` (`Name` ASC) VISIBLE,
  UNIQUE INDEX `code_UNIQUE` (`ShortCode` ASC) VISIBLE,
  INDEX `FK_DEPARTMENT_SCHOOOL_idx` (`IdSchool` ASC) VISIBLE,
  CONSTRAINT `FK_DEPARTMENT_SCHOOOL`
    FOREIGN KEY (`IdSchool`)
    REFERENCES `estudent`.`Schools` (`IdSchool`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `estudent`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`Students` (
  `IdUser` INT NOT NULL,
  `IdDepartment` INT NOT NULL,
  `Id` VARCHAR(20) NOT NULL,
  `EntryDate` DATE NOT NULL,
  `ExitDate` DATE NULL,
  PRIMARY KEY (`IdUser`, `Id`),
  UNIQUE INDEX `id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `FK_STUDENT_DEPARTMENT_idx` (`IdDepartment` ASC) VISIBLE,
  CONSTRAINT `FK_STUDENT_USER`
    FOREIGN KEY (`IdUser`)
    REFERENCES `estudent`.`Users` (`IdUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_STUDENT_DEPARTMENT`
    FOREIGN KEY (`IdDepartment`)
    REFERENCES `estudent`.`Departments` (`IdDepartment`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `estudent`.`Teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`Teachers` (
  `IdUser` INT NOT NULL,
  `Role` ENUM('Lecturer', 'Instructor') NOT NULL DEFAULT 'Lecturer',
  PRIMARY KEY (`IdUser`),
  CONSTRAINT `FK_TEACHER_USER`
    FOREIGN KEY (`IdUser`)
    REFERENCES `estudent`.`Users` (`IdUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `estudent`.`Managers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`Managers` (
  `IdUser` INT NOT NULL,
  `IdDepartment` INT NULL,
  `Role` ENUM('admin', 'dean') NOT NULL DEFAULT 'dean',
  PRIMARY KEY (`IdUser`),
  INDEX `FK_MANAGER_DEPARTMENT_idx` (`IdDepartment` ASC) VISIBLE,
  CONSTRAINT `FK_MANAGER_USER`
    FOREIGN KEY (`IdUser`)
    REFERENCES `estudent`.`Users` (`IdUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_MANAGER_DEPARTMENT`
    FOREIGN KEY (`IdDepartment`)
    REFERENCES `estudent`.`Departments` (`IdDepartment`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `estudent`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`Courses` (
  `IdCourse` INT NOT NULL AUTO_INCREMENT,
  `IdDepartment` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `ShortCode` VARCHAR(10) NOT NULL,
  `Type` ENUM('Mandatory', 'Elective') NOT NULL DEFAULT 'Mandatory',
  PRIMARY KEY (`IdCourse`),
  INDEX `FK_COURSE_DEPARTMENT_idx` (`IdDepartment` ASC) VISIBLE,
  CONSTRAINT `FK_COURSE_DEPARTMENT`
    FOREIGN KEY (`IdDepartment`)
    REFERENCES `estudent`.`Departments` (`IdDepartment`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `estudent`.`TeacherCourses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`TeacherCourses` (
  `IdTeacherCourses` INT NOT NULL AUTO_INCREMENT,
  `IdTeacher` INT NOT NULL,
  `IdCourse` INT NOT NULL,
  PRIMARY KEY (`IdTeacherCourses`),
  UNIQUE INDEX `IdTeacher_IdCourse_UNIQUE` (`IdTeacher` ASC, `IdCourse` ASC) VISIBLE,
  INDEX `FK_TEACHER_COURSES_COURSE_idx` (`IdCourse` ASC) VISIBLE,
  CONSTRAINT `FK_TEACHER_COURSES_TEACHER`
    FOREIGN KEY (`IdTeacher`)
    REFERENCES `estudent`.`Teachers` (`IdUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_TEACHER_COURSES_COURSE`
    FOREIGN KEY (`IdCourse`)
    REFERENCES `estudent`.`Courses` (`IdCourse`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `estudent`.`Classes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`Classes` (
  `IdClass` INT NOT NULL AUTO_INCREMENT,
  `IdCourse` INT NOT NULL,
  `AcademicYear` YEAR NOT NULL,
  `Semester` ENUM('1st', '2nd', 'Extra') NOT NULL,
  PRIMARY KEY (`IdClass`),
  INDEX `FK_CLASS_COURSE_idx` (`IdCourse` ASC) VISIBLE,
  UNIQUE INDEX `IdCourse_AcademicYear_Semester_UNIQUE` (`IdCourse` ASC, `AcademicYear` ASC, `Semester` ASC) VISIBLE,
  CONSTRAINT `FK_CLASS_COURSE`
    FOREIGN KEY (`IdCourse`)
    REFERENCES `estudent`.`Courses` (`IdCourse`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `estudent`.`StudentClasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`StudentClasses` (
  `IdStudentClass` INT NOT NULL AUTO_INCREMENT,
  `IdStudent` INT NOT NULL,
  `IdClass` INT NOT NULL,
  `Status` ENUM('offered', 'scheduled', 'started', 'ended') NULL,
  `ClassBuilding` VARCHAR(45) NULL,
  `ClassRoom` VARCHAR(20) NULL,
  `Attendance` DECIMAL(5,2) NULL,
  `QuizGrade` DECIMAL(5,2) NULL,
  `MidGrade` DECIMAL(5,2) NULL,
  `FinalGrade` DECIMAL(5,2) NULL,
  `AssignmentGrade` DECIMAL(5,2) NULL,
  `ProjectGrade` DECIMAL(5,2) NULL,
  PRIMARY KEY (`IdStudentClass`),
  INDEX `FK_STUDENT_CLASS_STUDENT_idx` (`IdStudent` ASC) VISIBLE,
  INDEX `FK_STUDENT_CLASS_CLASS_idx` (`IdClass` ASC) VISIBLE,
  CONSTRAINT `FK_STUDENT_CLASS_STUDENT`
    FOREIGN KEY (`IdStudent`)
    REFERENCES `estudent`.`Students` (`IdUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_STUDENT_CLASS_CLASS`
    FOREIGN KEY (`IdClass`)
    REFERENCES `estudent`.`Classes` (`IdClass`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `estudent` ;

-- -----------------------------------------------------
-- Placeholder table for view `estudent`.`ViewTeacherUser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`ViewTeacherUser` (`IdUser` INT, `Type` INT, `FirstName` INT, `LastName` INT, `Phone` INT, `Email` INT, `Password` INT, `Role` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudent`.`ViewStudentUserDepartmentSchool`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`ViewStudentUserDepartmentSchool` (`IdUser` INT, `Type` INT, `FirstName` INT, `LastName` INT, `Phone` INT, `Email` INT, `Password` INT, `IdDepartment` INT, `Id` INT, `EntryDate` INT, `ExitDate` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudent`.`ViewStudentUser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`ViewStudentUser` (`IdUser` INT, `Type` INT, `FirstName` INT, `LastName` INT, `Phone` INT, `Email` INT, `Password` INT, `IdDepartment` INT, `Id` INT, `EntryDate` INT, `ExitDate` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudent`.`ViewManagerUser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`ViewManagerUser` (`IdUser` INT, `Type` INT, `FirstName` INT, `LastName` INT, `Phone` INT, `Email` INT, `Password` INT, `IdDepartment` INT, `Role` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudent`.`ViewCourseDepartmentSchool`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`ViewCourseDepartmentSchool` (`IdCourse` INT, `IdDepartment` INT, `Name` INT, `ShortCode` INT, `Type` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudent`.`ViewDepartmentSchool`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`ViewDepartmentSchool` (`IdDepartment` INT, `IdSchool` INT, `DepartmentName` INT, `DepartmentShortCode` INT, `SchoolName` INT, `SchoolShortCode` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudent`.`ViewManagerUserDepartmentSchool`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`ViewManagerUserDepartmentSchool` (`IdUser` INT, `Type` INT, `FirstName` INT, `LastName` INT, `Phone` INT, `Email` INT, `Password` INT, `IdDepartment` INT, `Role` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudent`.`ViewClassCourseDepartmentSchool`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`ViewClassCourseDepartmentSchool` (`IdClass` INT, `IdCourse` INT, `AcademicYear` INT, `Semester` INT, `CourseName` INT, `CourseShortCode` INT, `CourseType` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudent`.`ViewStudentClass`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`ViewStudentClass` (`IdClass` INT, `IdCourse` INT, `AcademicYear` INT, `Semester` INT, `IdUser` INT, `IdDepartment` INT, `Id` INT, `EntryDate` INT, `ExitDate` INT, `IdStudentClass` INT, `IdStudent` INT, `Status` INT, `ClassBuilding` INT, `ClassRoom` INT, `Attendance` INT, `QuizGrade` INT, `MidGrade` INT, `FinalGrade` INT, `AssignmentGrade` INT, `ProjectGrade` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudent`.`ViewStudentClassUser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`ViewStudentClassUser` (`IdClass` INT, `IdCourse` INT, `AcademicYear` INT, `Semester` INT, `IdStudentClass` INT, `IdStudent` INT, `Status` INT, `ClassBuilding` INT, `ClassRoom` INT, `Attendance` INT, `QuizGrade` INT, `MidGrade` INT, `FinalGrade` INT, `AssignmentGrade` INT, `ProjectGrade` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudent`.`ViewStudentClassUserDepartmentSchool`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`ViewStudentClassUserDepartmentSchool` (`IdClass` INT, `IdCourse` INT, `AcademicYear` INT, `Semester` INT, `IdStudentClass` INT, `IdStudent` INT, `Status` INT, `ClassBuilding` INT, `ClassRoom` INT, `Attendance` INT, `QuizGrade` INT, `MidGrade` INT, `FinalGrade` INT, `AssignmentGrade` INT, `ProjectGrade` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudent`.`FullViewStudentClass`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`FullViewStudentClass` (`IdClass` INT, `IdCourse` INT, `AcademicYear` INT, `Semester` INT, `IdStudentClass` INT, `IdStudent` INT, `Status` INT, `ClassBuilding` INT, `ClassRoom` INT, `Attendance` INT, `QuizGrade` INT, `MidGrade` INT, `FinalGrade` INT, `AssignmentGrade` INT, `ProjectGrade` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudent`.`FullViewClass`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`FullViewClass` (`IdClass` INT, `IdCourse` INT, `AcademicYear` INT, `Semester` INT, `CourseName` INT, `CourseShortCode` INT, `CourseType` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudent`.`FullViewDepartment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`FullViewDepartment` (`IdDepartment` INT, `IdSchool` INT, `DepartmentName` INT, `DepartmentShortCode` INT, `SchoolName` INT, `SchoolShortCode` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudent`.`FullViewManager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`FullViewManager` (`IdUser` INT, `Type` INT, `FirstName` INT, `LastName` INT, `Phone` INT, `Email` INT, `Password` INT, `IdDepartment` INT, `Role` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudent`.`FullViewTeacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`FullViewTeacher` (`IdUser` INT, `Type` INT, `FirstName` INT, `LastName` INT, `Phone` INT, `Email` INT, `Password` INT, `Role` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudent`.`FullViewStudent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`FullViewStudent` (`IdUser` INT, `Type` INT, `FirstName` INT, `LastName` INT, `Phone` INT, `Email` INT, `Password` INT, `IdDepartment` INT, `Id` INT, `EntryDate` INT, `ExitDate` INT);

-- -----------------------------------------------------
-- Placeholder table for view `estudent`.`FullViewStudent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `estudent`.`FullViewStudent` (`IdUser` INT, `Type` INT, `FirstName` INT, `LastName` INT, `Phone` INT, `Email` INT, `Password` INT, `IdDepartment` INT, `Id` INT, `EntryDate` INT, `ExitDate` INT);

-- -----------------------------------------------------
-- procedure NewTeacher
-- -----------------------------------------------------

DELIMITER $$
USE `estudent`$$
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure NewManager
-- -----------------------------------------------------

DELIMITER $$
USE `estudent`$$
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure NewSchool
-- -----------------------------------------------------

DELIMITER $$
USE `estudent`$$
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure NewDepartment
-- -----------------------------------------------------

DELIMITER $$
USE `estudent`$$
CREATE PROCEDURE `NewDepartment`(  
  IN IdDepartment INT,
  IN SchoolShortCode VARCHAR(10),
  IN Name VARCHAR(90),
  IN ShortCode VARCHAR(10)
)
READS SQL DATA
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure NewCourse
-- -----------------------------------------------------

DELIMITER $$
USE `estudent`$$
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure NewClass
-- -----------------------------------------------------

DELIMITER $$
USE `estudent`$$
CREATE PROCEDURE `NewClass`(  
  IN IdClass INT,
  IN CourseShortCode VARCHAR(10),
  IN AcademicYear YEAR,
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure NewStudent
-- -----------------------------------------------------

DELIMITER $$
USE `estudent`$$
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure NewStudentClass
-- -----------------------------------------------------

DELIMITER $$
USE `estudent`$$
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `estudent`.`ViewTeacherUser`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudent`.`ViewTeacherUser`;
USE `estudent`;
CREATE  OR REPLACE VIEW `ViewTeacherUser` AS 
	SELECT * FROM `Teachers` 
		NATURAL JOIN `Users`;

-- -----------------------------------------------------
-- View `estudent`.`ViewStudentUserDepartmentSchool`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudent`.`ViewStudentUserDepartmentSchool`;
USE `estudent`;
CREATE  OR REPLACE VIEW `ViewStudentUserDepartmentSchool` AS 
	SELECT * FROM `Students` 
		NATURAL JOIN `Users` 
        NATURAL JOIN `ViewDepartmentSchool`;

-- -----------------------------------------------------
-- View `estudent`.`ViewStudentUser`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudent`.`ViewStudentUser`;
USE `estudent`;
CREATE  OR REPLACE VIEW `ViewStudentUser` AS 
	SELECT * FROM `Students` 
		NATURAL JOIN `Users`;

-- -----------------------------------------------------
-- View `estudent`.`ViewManagerUser`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudent`.`ViewManagerUser`;
USE `estudent`;
CREATE  OR REPLACE VIEW `ViewManagerUser` AS 
	SELECT * FROM `Managers` 
		NATURAL JOIN `Users`;

-- -----------------------------------------------------
-- View `estudent`.`ViewCourseDepartmentSchool`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudent`.`ViewCourseDepartmentSchool`;
USE `estudent`;
CREATE  OR REPLACE VIEW `ViewCourseDepartmentSchool` AS 
	SELECT * FROM `Courses` 
		NATURAL JOIN `ViewDepartmentSchool`;

-- -----------------------------------------------------
-- View `estudent`.`ViewDepartmentSchool`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudent`.`ViewDepartmentSchool`;
USE `estudent`;
CREATE  OR REPLACE VIEW `ViewDepartmentSchool` AS 
	SELECT D.`IdDepartment` AS IdDepartment,
			S.`IdSchool` AS IdSchool,
			D.`Name` AS DepartmentName,
			D.`ShortCode` AS DepartmentShortCode,
			S.`Name` AS SchoolName,
			S.`ShortCode` AS SchoolShortCode
		FROM `Departments` AS D
		INNER JOIN `Schools` AS S ON D.`IdSchool`=S.`IdSchool`;

-- -----------------------------------------------------
-- View `estudent`.`ViewManagerUserDepartmentSchool`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudent`.`ViewManagerUserDepartmentSchool`;
USE `estudent`;
CREATE  OR REPLACE VIEW `ViewManagerUserDepartmentSchool` AS 
	SELECT * FROM `Managers` 
		NATURAL JOIN `Users`
		NATURAL JOIN `ViewDepartmentSchool`;

-- -----------------------------------------------------
-- View `estudent`.`ViewClassCourseDepartmentSchool`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudent`.`ViewClassCourseDepartmentSchool`;
USE `estudent`;
CREATE  OR REPLACE VIEW `ViewClassCourseDepartmentSchool` AS 
	SELECT C.*, 
			K.`Name` AS CourseName,
			K.`ShortCode` AS CourseShortCode, 
			K.`Type` AS CourseType, 
            V.* FROM `Classes` AS C
		INNER JOIN `Courses` AS K ON C.`idCourse`=K.`idCourse`
		NATURAL JOIN `ViewDepartmentSchool` AS V;

-- -----------------------------------------------------
-- View `estudent`.`ViewStudentClass`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudent`.`ViewStudentClass`;
USE `estudent`;
CREATE  OR REPLACE VIEW `ViewStudentClass` AS
	SELECT * FROM `StudentClasses` 
		NATURAL JOIN `Students`
		NATURAL JOIN `Classes`;

-- -----------------------------------------------------
-- View `estudent`.`ViewStudentClassUser`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudent`.`ViewStudentClassUser`;
USE `estudent`;
CREATE  OR REPLACE VIEW `ViewStudentClassUser` AS
	SELECT * FROM `StudentClasses` 
		NATURAL JOIN `ViewStudentUser`
		NATURAL JOIN `Classes`;

-- -----------------------------------------------------
-- View `estudent`.`ViewStudentClassUserDepartmentSchool`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudent`.`ViewStudentClassUserDepartmentSchool`;
USE `estudent`;
CREATE  OR REPLACE VIEW `ViewStudentClassUserDepartmentSchool` AS
	SELECT * FROM `StudentClasses` 
		NATURAL JOIN `ViewStudentUserDepartmentSchool`
		NATURAL JOIN `Classes`;

-- -----------------------------------------------------
-- View `estudent`.`FullViewStudentClass`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudent`.`FullViewStudentClass`;
USE `estudent`;
CREATE  OR REPLACE VIEW `FullViewStudentClass` AS
	SELECT * FROM `StudentClasses` 
		NATURAL JOIN `ViewStudentUserDepartmentSchool`
		NATURAL JOIN `Classes`;

-- -----------------------------------------------------
-- View `estudent`.`FullViewClass`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudent`.`FullViewClass`;
USE `estudent`;
CREATE  OR REPLACE VIEW `FullViewClass` AS 
	SELECT C.*, 
			K.`Name` AS CourseName,
			K.`ShortCode` AS CourseShortCode, 
			K.`Type` AS CourseType, 
            V.* FROM `Classes` AS C
		INNER JOIN `Courses` AS K ON C.`idCourse`=K.`idCourse`
		NATURAL JOIN `ViewDepartmentSchool` AS V;

-- -----------------------------------------------------
-- View `estudent`.`FullViewDepartment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudent`.`FullViewDepartment`;
USE `estudent`;
CREATE  OR REPLACE VIEW `FullViewDepartment` AS 
	SELECT D.`IdDepartment` AS IdDepartment,
			S.`IdSchool` AS IdSchool,
			D.`Name` AS DepartmentName,
			D.`ShortCode` AS DepartmentShortCode,
			S.`Name` AS SchoolName,
			S.`ShortCode` AS SchoolShortCode
		FROM `Departments` AS D
		INNER JOIN `Schools` AS S ON D.`IdSchool`=S.`IdSchool`;

-- -----------------------------------------------------
-- View `estudent`.`FullViewManager`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudent`.`FullViewManager`;
USE `estudent`;
CREATE  OR REPLACE VIEW `FullViewManager` AS 
	SELECT * FROM `Managers` 
		NATURAL JOIN `Users`
		NATURAL JOIN `ViewDepartmentSchool`;

-- -----------------------------------------------------
-- View `estudent`.`FullViewTeacher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudent`.`FullViewTeacher`;
USE `estudent`;
CREATE  OR REPLACE VIEW `FullViewTeacher` AS 
	SELECT * FROM `Teachers` 
		NATURAL JOIN `Users`;

-- -----------------------------------------------------
-- View `estudent`.`FullViewStudent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudent`.`FullViewStudent`;
USE `estudent`;
CREATE  OR REPLACE VIEW `FullViewStudent` AS 
	SELECT * FROM `Students` 
		NATURAL JOIN `Users` 
        NATURAL JOIN `ViewDepartmentSchool`;

-- -----------------------------------------------------
-- View `estudent`.`FullViewStudent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estudent`.`FullViewStudent`;
USE `estudent`;
CREATE  OR REPLACE VIEW `FullViewStudent` AS 
	SELECT * FROM `Students` 
		NATURAL JOIN `Users` 
        NATURAL JOIN `ViewDepartmentSchool`;
CREATE USER 'estudentApp'@'localhost' IDENTIFIED BY 'EStudentApp@4321';

GRANT ALL ON `estudent`.* TO 'estudentApp'@'localhost';
GRANT SELECT, UPDATE ON TABLE estudent.* TO 'estudentApp'@'localhost';
GRANT EXECUTE ON procedure `estudent`.`NewClass` TO 'estudentApp'@'localhost';
GRANT EXECUTE ON procedure `estudent`.`NewCourse` TO 'estudentApp'@'localhost';
GRANT EXECUTE ON procedure `estudent`.`NewDepartment` TO 'estudentApp'@'localhost';
GRANT EXECUTE ON procedure `estudent`.`NewManager` TO 'estudentApp'@'localhost';
GRANT EXECUTE ON procedure `estudent`.`NewSchool` TO 'estudentApp'@'localhost';
GRANT EXECUTE ON procedure `estudent`.`NewTeacher` TO 'estudentApp'@'localhost';
GRANT EXECUTE ON procedure `estudent`.`NewStudent` TO 'estudentApp'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
