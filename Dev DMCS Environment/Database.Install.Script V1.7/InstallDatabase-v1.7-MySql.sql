SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `memberroleadmin` ;
CREATE SCHEMA IF NOT EXISTS `memberroleadmin` DEFAULT CHARACTER SET latin1 ;
USE `memberroleadmin` ;

-- -----------------------------------------------------
-- Table `memberroleadmin`.`actiontokentypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`actiontokentypes` ;

CREATE  TABLE IF NOT EXISTS `memberroleadmin`.`actiontokentypes` (
  `ActionTypeID` INT(11) NOT NULL ,
  `Description` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`ActionTypeID`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `memberroleadmin`.`actiontokens`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`actiontokens` ;

CREATE  TABLE IF NOT EXISTS `memberroleadmin`.`actiontokens` (
  `ActionID` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `ActionType` INT(11) NOT NULL ,
  `Token` VARCHAR(254) NOT NULL ,
  `Email` VARCHAR(254) NOT NULL ,
  `Created` DATETIME NOT NULL ,
  `ReturnURL` VARCHAR(2048) NOT NULL ,
  PRIMARY KEY (`ActionID`) ,
  INDEX `FK_ActionTypes_ID` (`ActionType` ASC) ,
  CONSTRAINT `FK_ActionTokenTypes_ActionTokens`
    FOREIGN KEY (`ActionType` )
    REFERENCES `memberroleadmin`.`actiontokentypes` (`ActionTypeID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `memberroleadmin`.`auditeventsources`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`auditeventsources` ;

CREATE  TABLE IF NOT EXISTS `memberroleadmin`.`auditeventsources` (
  `SourceID` INT(11) NOT NULL ,
  `Description` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`SourceID`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `memberroleadmin`.`auditeventtypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`auditeventtypes` ;

CREATE  TABLE IF NOT EXISTS `memberroleadmin`.`auditeventtypes` (
  `TypeID` INT(11) NOT NULL ,
  `Description` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`TypeID`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `memberroleadmin`.`auditevents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`auditevents` ;

CREATE  TABLE IF NOT EXISTS `memberroleadmin`.`auditevents` (
  `EventID` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `EventSource` INT(11) NOT NULL ,
  `EventType` INT(11) NOT NULL ,
  `Description` VARCHAR(2000) NOT NULL ,
  `MemberEmail` VARCHAR(255) NOT NULL ,
  `Details` TEXT NULL DEFAULT NULL ,
  `IPAddress` VARCHAR(64) NOT NULL ,
  `Created` DATETIME NOT NULL ,
  PRIMARY KEY (`EventID`) ,
  INDEX `FK_AuditEventSources_ID` (`EventSource` ASC) ,
  INDEX `FK_AuditEventTypes_ID` (`EventType` ASC) ,
  CONSTRAINT `FK_AuditEventSources_AuditEvents`
    FOREIGN KEY (`EventSource` )
    REFERENCES `memberroleadmin`.`auditeventsources` (`SourceID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_AuditEventTypes_AuditEvents`
    FOREIGN KEY (`EventType` )
    REFERENCES `memberroleadmin`.`auditeventtypes` (`TypeID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `memberroleadmin`.`languages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`languages` ;

CREATE  TABLE IF NOT EXISTS `memberroleadmin`.`languages` (
  `LanguageID` INT(11) NOT NULL ,
  `Code` VARCHAR(3) NOT NULL ,
  `EnglishName` VARCHAR(128) NOT NULL ,
  `NativeName` VARCHAR(128) NULL DEFAULT NULL ,
  `IsEnabled` INT(11) NOT NULL ,
  PRIMARY KEY (`LanguageID`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `memberroleadmin`.`memberattempttypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`memberattempttypes` ;

CREATE  TABLE IF NOT EXISTS `memberroleadmin`.`memberattempttypes` (
  `MemberAttemptTypeID` INT(11) NOT NULL ,
  `AttemptTypeDescription` VARCHAR(1024) NOT NULL ,
  PRIMARY KEY (`MemberAttemptTypeID`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `memberroleadmin`.`members`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`members` ;

CREATE  TABLE IF NOT EXISTS `memberroleadmin`.`members` (
  `MemberID` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(128) NOT NULL ,
  `Email` VARCHAR(128) NOT NULL ,
  `Password` VARCHAR(128) NOT NULL ,
  `Avatar` VARCHAR(64) NULL DEFAULT NULL ,
  `IsEnable` INT(11) NOT NULL ,
  `IsBuiltIn` INT(11) NOT NULL ,
  `LastLogin` DATETIME NULL DEFAULT NULL ,
  `Created` DATETIME NOT NULL ,
  `Modified` DATETIME NULL DEFAULT NULL ,
  `TimeZoneID` VARCHAR(64) NULL DEFAULT NULL ,
  PRIMARY KEY (`MemberID`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `memberroleadmin`.`memberattempts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`memberattempts` ;

CREATE  TABLE IF NOT EXISTS `memberroleadmin`.`memberattempts` (
  `AttemptID` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `MemberID` BIGINT(20) NOT NULL ,
  `AttemptType` INT(11) NOT NULL ,
  `Attempts` INT(11) NOT NULL ,
  `Created` DATETIME NOT NULL ,
  `Modified` DATETIME NULL DEFAULT NULL ,
  `IsAttemptValid` INT(11) NOT NULL ,
  PRIMARY KEY (`AttemptID`) ,
  INDEX `FK_MeberAttemptTypes_ID` (`AttemptType` ASC) ,
  INDEX `FK_Members_ID` (`MemberID` ASC) ,
  CONSTRAINT `FK_MeberAttemptTypes_MeberAttempts`
    FOREIGN KEY (`AttemptType` )
    REFERENCES `memberroleadmin`.`memberattempttypes` (`MemberAttemptTypeID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Members_MeberAttempts`
    FOREIGN KEY (`MemberID` )
    REFERENCES `memberroleadmin`.`members` (`MemberID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `memberroleadmin`.`profilefieldtypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`profilefieldtypes` ;

CREATE  TABLE IF NOT EXISTS `memberroleadmin`.`profilefieldtypes` (
  `FieldTypeID` INT(11) NOT NULL ,
  `FieldTypeName` VARCHAR(64) NOT NULL ,
  `FieldTypeDescription` VARCHAR(1028) NULL DEFAULT NULL ,
  `FieldTypeSize` INT(11) NOT NULL ,
  PRIMARY KEY (`FieldTypeID`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `memberroleadmin`.`profilefieldgroups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`profilefieldgroups` ;

CREATE  TABLE IF NOT EXISTS `memberroleadmin`.`profilefieldgroups` (
  `FieldGroupID` INT(11) NOT NULL AUTO_INCREMENT ,
  `FieldGroupName` VARCHAR(64) NOT NULL ,
  `FieldGroupDescription` VARCHAR(1024) NOT NULL ,
  `OrderID` INT(11) NOT NULL ,
  `IsActive` INT(11) NOT NULL DEFAULT '0' ,
  `AdminUseOnly` INT(11) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`FieldGroupID`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `memberroleadmin`.`profilefields`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`profilefields` ;

CREATE  TABLE IF NOT EXISTS `memberroleadmin`.`profilefields` (
  `FieldID` INT(11) NOT NULL AUTO_INCREMENT ,
  `FieldTypeID` INT(11) NOT NULL ,
  `FieldName` VARCHAR(64) NOT NULL ,
  `Comment` TEXT NULL DEFAULT NULL ,
  `PossibleValues` TEXT NULL DEFAULT NULL ,
  `TextSelectValue` VARCHAR(64) NULL DEFAULT NULL ,
  `IsMandatory` INT(11) NOT NULL ,
  `ShowInSignUp` INT(11) NOT NULL ,
  `FieldGroupID` INT(11) NOT NULL ,
  `OrderID` INT(11) NOT NULL ,
  `Created` DATETIME NOT NULL ,
  `Modified` DATETIME NULL DEFAULT NULL ,
  `SortValues` INT(11) NULL DEFAULT NULL ,
  `IsActive` INT(11) NOT NULL DEFAULT '0' ,
  `AdminUseOnly` INT(11) NOT NULL DEFAULT '0' ,
  `VerticalLayout` INT(11) NOT NULL DEFAULT '0' ,
  `Encrypted` INT(11) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`FieldID`) ,
  INDEX `IND_ProfileFields_ProfileFieldTypes` (`FieldTypeID` ASC) ,
  INDEX `IND_ProfileFields_ProfileFieldGroups` (`FieldGroupID` ASC) ,
  CONSTRAINT `FK_ProfileFields_ProfileFieldTypes`
    FOREIGN KEY (`FieldTypeID` )
    REFERENCES `memberroleadmin`.`profilefieldtypes` (`FieldTypeID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ProfileFields_ProfileFieldGroups`
    FOREIGN KEY (`FieldGroupID` )
    REFERENCES `memberroleadmin`.`profilefieldgroups` (`FieldGroupID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `memberroleadmin`.`memberprofilefields`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`memberprofilefields` ;

CREATE  TABLE IF NOT EXISTS `memberroleadmin`.`memberprofilefields` (
  `ProfileFieldID` INT(11) NOT NULL AUTO_INCREMENT ,
  `MemberID` BIGINT(20) NOT NULL ,
  `FieldID` INT(11) NOT NULL ,
  `FieldValue` TEXT NOT NULL ,
  `Created` DATETIME NOT NULL ,
  `Modified` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`ProfileFieldID`) ,
  INDEX `FK_MemberProfileFields_Members1` (`MemberID` ASC) ,
  INDEX `FK_ProfileFields_MemberProfileFields` (`FieldID` ASC) ,
  CONSTRAINT `FK_ProfileFields_MemberProfileFields`
    FOREIGN KEY (`FieldID` )
    REFERENCES `memberroleadmin`.`profilefields` (`FieldID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Members_MemberProfileFields`
    FOREIGN KEY (`MemberID` )
    REFERENCES `memberroleadmin`.`members` (`MemberID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `memberroleadmin`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`roles` ;

CREATE  TABLE IF NOT EXISTS `memberroleadmin`.`roles` (
  `RoleID` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(128) NOT NULL ,
  `IsBuiltIn` INT(11) NOT NULL ,
  `backColor` VARCHAR(24) NOT NULL ,
  `ForeColor` VARCHAR(24) NOT NULL ,
  `Settings` VARCHAR(4000) NULL DEFAULT NULL ,
  `Created` DATETIME NOT NULL ,
  `Modified` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`RoleID`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `memberroleadmin`.`memberroles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`memberroles` ;

CREATE  TABLE IF NOT EXISTS `memberroleadmin`.`memberroles` (
  `MemberID` BIGINT(20) NOT NULL ,
  `RoleID` BIGINT(20) NOT NULL ,
  `Created` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`MemberID`, `RoleID`) ,
  INDEX `MemberID` (`MemberID` ASC) ,
  INDEX `RoleID` (`RoleID` ASC) ,
  CONSTRAINT `FK_Members_MemberRoles`
    FOREIGN KEY (`MemberID` )
    REFERENCES `memberroleadmin`.`members` (`MemberID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Roles_MemberRoles`
    FOREIGN KEY (`RoleID` )
    REFERENCES `memberroleadmin`.`roles` (`RoleID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `memberroleadmin`.`membertokens`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`membertokens` ;

CREATE  TABLE IF NOT EXISTS `memberroleadmin`.`membertokens` (
  `MemberTokenID` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `MemberID` BIGINT(20) NOT NULL ,
  `Token` VARCHAR(254) NOT NULL ,
  `GeneratedBy` VARCHAR(64) NOT NULL ,
  `Created` DATETIME NOT NULL ,
  `Modified` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`MemberTokenID`) ,
  INDEX `FK_Members_Token_ID` (`MemberID` ASC) ,
  CONSTRAINT `FK_Members_Token_ID`
    FOREIGN KEY (`MemberID` )
    REFERENCES `memberroleadmin`.`members` (`MemberID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `memberroleadmin`.`parametertypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`parametertypes` ;

CREATE  TABLE IF NOT EXISTS `memberroleadmin`.`parametertypes` (
  `TypeID` INT(11) NOT NULL ,
  `TypeName` VARCHAR(128) NOT NULL ,
  `TypeSize` INT(11) NOT NULL ,
  PRIMARY KEY (`TypeID`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `memberroleadmin`.`parameters`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`parameters` ;

CREATE  TABLE IF NOT EXISTS `memberroleadmin`.`parameters` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(256) NOT NULL ,
  `Value` TEXT NULL DEFAULT NULL ,
  `MemberID` BIGINT(20) NOT NULL ,
  `Created` DATETIME NOT NULL ,
  `TypeID` INT(11) NOT NULL ,
  `Modified` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`ID`) ,
  INDEX `FK_ParametrTypes_Parametrs` (`TypeID` ASC) ,
  CONSTRAINT `FK_ParametrTypes_Parametrs`
    FOREIGN KEY (`TypeID` )
    REFERENCES `memberroleadmin`.`parametertypes` (`TypeID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- -----------------------------------------------------
-- Table `memberroleadmin`.`domains`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`domains`  ;

CREATE TABLE `memberroleadmin`.`domains` (
  `DomainID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(256) NOT NULL,
  `Description` longtext,
  `Created` datetime NOT NULL,
  `Modified` datetime DEFAULT NULL,
  PRIMARY KEY (`DomainID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- -----------------------------------------------------
-- Table `memberroleadmin`.`roleprofilefields`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`roleprofilefields` ;

CREATE TABLE `memberroleadmin`.`roleprofilefields` (
  `RoleFieldID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleID` bigint(20) NOT NULL,
  `ProfileFieldID` int(11) NOT NULL,
  PRIMARY KEY (`RoleFieldID`),
  KEY `RoleID` (`RoleID`),
  KEY `FieldID` (`ProfileFieldID`),
  CONSTRAINT `FK_RoleProfileFields_Roles` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`RoleID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_RoleProfileFields_ProfileFields` FOREIGN KEY (`ProfileFieldID`) REFERENCES `profilefields` (`FieldID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- -----------------------------------------------------
-- Table `memberroleadmin`.`domainprofilefields`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`domainprofilefields` ;

CREATE TABLE `memberroleadmin`.`domainprofilefields` (
  `DomainFieldID` int(11) NOT NULL AUTO_INCREMENT,
  `DomainID` int(11) NOT NULL,
  `ProfileFieldID` int(11) NOT NULL,
  PRIMARY KEY (`DomainFieldID`),
  KEY `DomainID` (`DomainID`),
  KEY `FieldID` (`ProfileFieldID`),
  CONSTRAINT `FK_DomainProfileFields_Domains` FOREIGN KEY (`DomainID`) REFERENCES `domains` (`DomainID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_DomainProfileFields_ProfileFields` FOREIGN KEY (`ProfileFieldID`) REFERENCES `profilefields` (`FieldID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------
-- Table `memberroleadmin`.`memberdomains`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`memberdomains` ;

CREATE TABLE `memberroleadmin`.`memberdomains` (
  `MemberDomainID` int(11) NOT NULL AUTO_INCREMENT,
  `MemberID` bigint(20) NOT NULL,
  `DomainID` int(11) NOT NULL,
  PRIMARY KEY (`MemberDomainID`),
  KEY `MemberID` (`MemberID`),
  KEY `DomainID` (`DomainID`),
  CONSTRAINT `FK_MemberDomains_Members` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_MemberDomains_Domains` FOREIGN KEY (`DomainID`) REFERENCES `domains` (`DomainID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------
-- Table `memberroleadmin`.`membersocialnetworks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`membersocialnetworks` ;

CREATE TABLE `memberroleadmin`.`membersocialnetworks` (
  `MemberSocialNetworkID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MemberID` bigint(20) NOT NULL,
  `SocialNetworkID` int(11) NOT NULL,
  `SocialNetworkUserID` text NOT NULL,
  `SocialNetworkUserEmail` varchar(100) DEFAULT NULL,
  `SocialNetworkUserName` varchar(100) DEFAULT NULL,
  `AccessToken` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`MemberSocialNetworkID`),
  KEY `MemberID` (`MemberID`),
  CONSTRAINT `FK_MemberSocialNetworks_Members` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------
-- Table `memberroleadmin`.`authmembertickets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `memberroleadmin`.`authmembertickets` ;

CREATE TABLE `memberroleadmin`.`authmembertickets`(
  `AuthMemberTicketID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MemberID` bigint(20) NOT NULL, 
  `IssueDate` DATETIME NOT NULL, 
  `Expiration` DATETIME NOT NULL ,
  `IsPersistent` int(11) NOT NULL,    
  `Token` varchar(128) DEFAULT NULL,  
  PRIMARY KEY (`AuthMemberTicketID`),    
  UNIQUE KEY `Token_UNIQUE` (`Token`),    
  KEY `MemberID` (`MemberID`),    
  CONSTRAINT `FK_AuthMemberTickets_Members` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*
SELECT
    constraint_name,
    table_name
FROM
    information_schema.table_constraints
WHERE
    constraint_type = 'FOREIGN KEY'
AND table_schema = DATABASE()
ORDER BY
    constraint_name;
*/

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO `memberroleadmin`.`Members` (`MemberID`, `Name`, `Email`, `Password`, `Avatar`, `IsEnable`, `IsBuiltIn`, `LastLogin`, `Created`, `Modified`, `TimeZoneID`) VALUES (1, N'Admin', N'admin@demo.com', N'767172637656486A3444756A6644794C34763231464B50425745513D', NULL, 0, 1, NOW(), NOW(), NOW(), N'FLE Standard Time');
INSERT INTO `memberroleadmin`.`Members` (`MemberID`, `Name`, `Email`, `Password`, `Avatar`, `IsEnable`, `IsBuiltIn`, `LastLogin`, `Created`, `Modified`, `TimeZoneID`) VALUES (2, N'Example Site', N'example@demo.com', N'72633957716A5052616B664A4767476D737859356C783343706C733D', NULL, 0, 0, NULL, NOW(), NOW(), NULL);
INSERT INTO `memberroleadmin`.`Members` (`MemberID`, `Name`, `Email`, `Password`, `Avatar`, `IsEnable`, `IsBuiltIn`, `LastLogin`, `Created`, `Modified`, `TimeZoneID`) VALUES (3, N'Viewer', N'viewer@demo.com', N'49384E2B7457394D59315279474D747631633350623178784343303D', NULL, 0, 0, NOW(), NOW(), NOW(), NULL);
INSERT INTO `memberroleadmin`.`Members` (`MemberID`, `Name`, `Email`, `Password`, `Avatar`, `IsEnable`, `IsBuiltIn`, `LastLogin`, `Created`, `Modified`, `TimeZoneID`) VALUES (4, N'Editor', N'editor@demo.com', N'4A37316C385361494C46396978512F4E413865572B754A376E64553D', NULL, 0, 0, NOW(), NOW(), NOW(), NULL);
INSERT INTO `memberroleadmin`.`Members` (`MemberID`, `Name`, `Email`, `Password`, `Avatar`, `IsEnable`, `IsBuiltIn`, `LastLogin`, `Created`, `Modified`, `TimeZoneID`) VALUES (5, N'Demo', N'demo@demo.com', N'6E34353976784532496D716B66367A6B454952782B3239576664343D', NULL, 0, 0, NULL, NOW(), NOW(), NULL);

INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (1, N'ACE', N'Achinese', N'Bahsa Aceh', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (2, N'ACH', N'Acoli', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (3, N'ADA', N'Adangme', N'adangb?', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (4, N'AFA', N'Afro-Asiatic (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (5, N'AFH', N'Afrihili (Artificial language)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (6, N'AFR', N'Afrikaans', N'Afrikaans', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (7, N'AJM', N'Aljamia', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (8, N'AKK', N'Akkadian', N'akkadu, lisanum akkaditum', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (9, N'ALB', N'Albanian', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (10, N'ALE', N'Aleut', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (11, N'ALG', N'Algonquian languages', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (12, N'AMH', N'Amharic', N'????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (13, N'ANG', N'English, Old (ca. 450-1100)', N'Englisc', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (14, N'APA', N'Apache languages', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (15, N'ARA', N'Arabic', N'???????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (16, N'ARC', N'Aramaic', N'?????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (17, N'ARM', N'Armenian', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (18, N'ARN', N'Araucanian', N'mapudungun, mapuchedungun', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (19, N'ARP', N'Arapaho', N'Hinono''eitiit', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (20, N'ART', N'Artificial (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (21, N'ARW', N'Arawak', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (22, N'ASM', N'Assamese', N'???????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (23, N'ATH', N'Athapascan languages', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (24, N'AVA', N'Avaric', N'???? ????, ???????? ????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (25, N'AVE', N'Avestan', N'avesta', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (26, N'AWA', N'Awadhi', N'????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (27, N'AYM', N'Aymara', N'aymar aru', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (28, N'AZE', N'Azerbaijani', N'Az?rbaycanca', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (29, N'BAD', N'Banda', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (30, N'BAI', N'Bamileke languages', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (31, N'BAK', N'Bashkir', N'??????? ????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (32, N'BAL', N'Baluchi', N'?????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (33, N'BAM', N'Bambara', N'bamanankan', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (34, N'BAN', N'Balinese', N'Basa Bali', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (35, N'BAQ', N'Basque', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (36, N'BAS', N'Basa', N'?asaa', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (37, N'BAT', N'Baltic (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (38, N'BEJ', N'Beja', N'??????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (39, N'BEL', N'Byelorussian', N'?????????? ????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (40, N'BEM', N'Bemba', N'ichiBemba', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (41, N'BEN', N'Bengali', N'?????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (42, N'BER', N'Berber languages', N'Tamazight / Tamazi?t', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (43, N'BHO', N'Bhojpuri', N'???????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (44, N'BIK', N'Bikol', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (45, N'BIN', N'Bini', N'Edo', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (46, N'BLA', N'Siksika', N'siksika,  ????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (47, N'BRA', N'Braj', N'???? ????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (48, N'BRE', N'Breton', N'brezhoneg', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (49, N'BUG', N'Buginese', N'', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (50, N'BUL', N'Bulgarian', N'????????? ????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (51, N'BUR', N'Burmese', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (52, N'CAD', N'Caddo', N'Hasi:nay', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (53, N'CAI', N'Central American Indian (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (54, N'CAM', N'Khmer', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (55, N'CAR', N'Carib', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (56, N'CAT', N'Catalan', N'catala / valencia', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (57, N'CAU', N'Caucasian (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (58, N'CEB', N'Cebuano', N'Sinugboanon', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (59, N'CEL', N'Celtic languages', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (60, N'CHA', N'Chamorro', N'Chamoru', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (61, N'CHB', N'Chibcha', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (62, N'CHE', N'Chechen', N'??????? ????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (63, N'CHG', N'Chagatai', N'?????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (64, N'CHI', N'Chinese', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (65, N'CHN', N'Chinook jargon', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (66, N'CHO', N'Choctaw', N'Chahta Anumpa', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (67, N'CHR', N'Cherokee', N'???', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (68, N'CHU', N'Church Slavic', N'????? ??????????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (69, N'CHV', N'Chuvash', N'????? ?????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (70, N'CHY', N'Cheyenne', N'Tsehest', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (71, N'COP', N'Coptic', N'', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (72, N'COR', N'Cornish', N'Kernewek', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (73, N'CPE', N'Creoles and Pidgins, English', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (74, N'CPF', N'Creoles and Pidgins, French', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (75, N'CPP', N'Creoles and Pidgins, Portuguese', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (76, N'CRE', N'Cree', N'???????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (77, N'CRP', N'Creoles and Pidgins (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (78, N'CUS', N'Cushitic (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (79, N'CZE', N'Czech', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (80, N'DAK', N'Dakota', N'Lakhota', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (81, N'DAN', N'Danish', N'dansk', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (82, N'DEL', N'Delaware', N'Lenape', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (83, N'DIN', N'Dinka', N'Thu??ja?', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (84, N'DOI', N'Dogri', N'?????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (85, N'DRA', N'Dravidian (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (86, N'DUA', N'Duala', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (87, N'DUM', N'Dutch, Middle ca. 1050-1350', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (88, N'DUT', N'Dutch', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (89, N'DYU', N'Dyula', N'Julakan', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (90, N'EFI', N'Efik', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (91, N'EGY', N'Egyptian', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (92, N'EKA', N'Ekajuk', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (93, N'ELX', N'Elamite', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (94, N'ENG', N'English', N'English', 1);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (95, N'ENM', N'English, Middle (1100-1500)', N'English', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (96, N'ESK', N'Eskimo', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (97, N'ESP', N'Esperanto', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (98, N'EST', N'Estonian', N'eesti keel', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (99, N'ETH', N'Ethiopic', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (100, N'EWE', N'Ewe', N'???gb?', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (101, N'EWO', N'Ewondo', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (102, N'FAN', N'Fang', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (103, N'FAR', N'Faroese', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (104, N'FAT', N'Fanti', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (105, N'FIJ', N'Fijian', N'vosa Vakaviti', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (106, N'FIN', N'Finnish', N'suomi, suomen kieli', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (107, N'FIU', N'Finno-Ugrian (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (108, N'FON', N'Fon', N'F?ngbe', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (109, N'FRE', N'French', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (110, N'FRI', N'Friesian', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (111, N'FRM', N'French, Middle (ca. 1400-1600)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (112, N'FRO', N'French, Old (ca. 842-1400)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (113, N'FUL', N'Fula', N'Fulfulde, Pulaar, Pular', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (114, N'GAA', N'G?', N'Ga', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (115, N'GAE', N'Gaelic (Scots)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (116, N'GAG', N'Gallegan', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (117, N'GAL', N'Oromo', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (118, N'GAY', N'Gayo', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (119, N'GEM', N'Germanic (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (120, N'GEO', N'Georgian', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (121, N'GER', N'German', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (122, N'GIL', N'Gilbertese', N'taetae ni Kiribati', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (123, N'GMH', N'German, Middle High ca.1050-1500', N'diutisk', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (124, N'GOH', N'German, Old High ca.750-1050', N'diutisc', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (125, N'GON', N'Gondi', N'Gondi', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (126, N'GOT', N'Gothic', N'', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (127, N'GRB', N'Grebo', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (128, N'GRC', N'Greek, Ancient (to 1453)', N'????????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (129, N'GRE', N'Greek, Modern (1453- )', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (130, N'GUA', N'Guarani', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (131, N'GUJ', N'Gujarati', N'???????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (132, N'HAI', N'Haida', N'X_aat Kil', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (133, N'HAU', N'Hausa', N'Hausanci, ??????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (134, N'HAW', N'Hawaiian', N'‘Olelo Hawai‘i', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (135, N'HEB', N'Hebrew', N'????????, ?????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (136, N'HER', N'Herero', N'Otjiherero', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (137, N'HIL', N'Hiligaynon', N'Ilonggo', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (138, N'HIM', N'Himachali', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (139, N'HIN', N'Hindi', N'??????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (140, N'HMO', N'Hiri Motu', N'Hiri Motu', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (141, N'HUN', N'Hungarian', N'magyar', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (142, N'HUP', N'Hupa', N'Na:tinixwe Mixine:whe', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (143, N'IBA', N'Iban', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (144, N'IBO', N'Igbo', N'Igbo', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (145, N'ICE', N'Icelandic', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (146, N'IJO', N'Ijo', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (147, N'ILO', N'Iloko', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (148, N'INC', N'Indic (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (149, N'IND', N'Indonesian', N'Bahasa Indonesia', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (150, N'INE', N'Indo-European (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (151, N'INT', N'Interlingua', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (152, N'IRA', N'Iranian (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (153, N'IRI', N'Irish', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (154, N'IRO', N'Iroquoian languages', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (155, N'ITA', N'Italian', N'italiano', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (156, N'JAV', N'Javanese', N'basa Jawa', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (157, N'JPN', N'Japanese', N'??? (????)', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (158, N'JPR', N'Judeo-Persian', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (159, N'JRB', N'Judeo-Arabic', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (160, N'KAA', N'Kara-Kalpak', N'?????????? ????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (161, N'KAB', N'Kabyle', N'Taqbaylit', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (162, N'KAC', N'Kachin', N'Jingpho, Marip', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (163, N'KAM', N'Kamba', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (164, N'KAN', N'Kannada', N'?????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (165, N'KAR', N'Karen', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (166, N'KAS', N'Kashmiri', N'?????, ?????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (167, N'KAU', N'Kanuri', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (168, N'KAW', N'Kawi', N'Bha?a Kawi', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (169, N'KAZ', N'Kazakh', N'????? ????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (170, N'KHA', N'Khasi', N'Khasi', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (171, N'KHI', N'Khoisan (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (172, N'KHO', N'Khotanese', N'ancient', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (173, N'KIK', N'Kikuyu', N'Gikuyu', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (174, N'KIN', N'Kinyarwanda', N'Ikinyarwanda', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (175, N'KIR', N'Kirghiz', N'?????? ????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (176, N'KOK', N'Konkani', N'??????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (177, N'KON', N'Kongo', N'Kikongo', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (178, N'KOR', N'Korean', N'??? (???), ??? (???)', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (179, N'KPE', N'Kpelle', N'kpele', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (180, N'KRO', N'Kru', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (181, N'KRU', N'Kurukh', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (182, N'KUA', N'Kuanyama', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (183, N'KUR', N'Kurdish', N'Kurdi', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (184, N'KUS', N'Kusaie', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (185, N'KUT', N'Kutenai', N'Ktunaxa', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (186, N'LAD', N'Ladino', N'?''?????-??????????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (187, N'LAH', N'Lahnd', N'??????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (188, N'LAM', N'Lamba', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (189, N'LAN', N'Langue d''oc (post-1500)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (190, N'LAO', N'Lao', N'???????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (191, N'LAP', N'Lapp', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (192, N'LAT', N'Latin', N'latine, lingua Latina', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (193, N'LAV', N'Latvian', N'latviesu valoda', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (194, N'LIN', N'Lingala', N'lingala', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (195, N'LIT', N'Lithuanian', N'lietuviu kalba', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (196, N'LOL', N'Mongo', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (197, N'LOZ', N'Lozi', N'siLozi', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (198, N'LUB', N'Luba-Katanga', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (199, N'LUG', N'Ganda', N'Luganda', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (200, N'LUI', N'Luiseno', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (201, N'LUN', N'Lunda', N'chiLunda', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (202, N'LUO', N'Luo (Kenya and Tanzania)', N'Dholuo', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (203, N'MAC', N'Macedonian', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (204, N'MAD', N'Madurese', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (205, N'MAG', N'Magahi', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (206, N'MAH', N'Marshall', N'Kajin M?ajel', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (207, N'MAI', N'Maithili', N'??????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (208, N'MAK', N'Makasar', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (209, N'MAL', N'Malayalam', N'??????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (210, N'MAN', N'Mandingo', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (211, N'MAO', N'Maori', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (212, N'MAP', N'Austronesian (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (213, N'MAR', N'Marathi', N'?????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (214, N'MAS', N'Masai', N'?l Maa', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (215, N'MAX', N'Manx', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (216, N'MAY', N'Malay', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (217, N'MEN', N'Mende', N'M?nde', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (218, N'MIC', N'Micmac', N'Mikmaq, Mi''gmaq', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (219, N'MIN', N'Minangkabau', N'Baso Minangkabau', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (220, N'MIS', N'Miscellaneous (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (221, N'MKH', N'Mon-Khmer (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (222, N'MLA', N'Malagasy', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (223, N'MLT', N'Maltese', N'Malti', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (224, N'MNI', N'Manipuri', N'?????????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (225, N'MNO', N'Manobo languages', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (226, N'MOH', N'Mohawk', N'Kanien’keha', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (227, N'MOL', N'Moldavian', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (228, N'MON', N'Mongolian', N'?????? ???', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (230, N'MUL', N'Multiple languages', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (231, N'MUN', N'Munda (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (232, N'MUS', N'Creek', N'Maskoki, Mvskoke empunakv', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (233, N'MWR', N'Marwari', N'????????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (234, N'MYN', N'Mayan languages', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (235, N'NAH', N'Aztec', N'nahuatl, nawatlahtolli', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (236, N'NAI', N'North American Indian (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (237, N'NAV', N'Navajo', N'Dine bizaad, Dinek''ehji', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (238, N'NDE', N'Ndebele (Zimbabwe)', N'isiNdebele', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (239, N'NDO', N'Ndonga', N'Owambo', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (240, N'NEP', N'Nepali', N'??????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (241, N'NEW', N'Newari', N'Nepal Bhasa', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (242, N'NIC', N'Niger-Kordofanian (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (243, N'NIU', N'Niuean', N'ko e vagahau Niue, faka-Niue', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (244, N'NOR', N'Norwegian', N'norsk', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (245, N'NSO', N'Northern Sotho', N'Sesotho sa Leboa, Sepedi', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (246, N'NUB', N'Nubian languages', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (247, N'NYA', N'Nyanja', N'chiChewa, chinyanja', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (248, N'NYM', N'Nyamwezi', N'Kinyamwezi', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (249, N'NYN', N'Nyankole', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (250, N'NYO', N'Nyoro', N'Runyoro', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (251, N'NZI', N'Nzimav', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (252, N'OJI', N'Ojibwa', N'???????? (Anishinaabemowin)', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (253, N'ORI', N'Oriya', N'?????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (254, N'OSA', N'Osage', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (255, N'OSS', N'Ossetic', N'???? ?????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (256, N'OTA', N'Turkish, Ottoman', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (257, N'OTO', N'Otomian languages', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (258, N'PAA', N'Papuan-Australian (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (259, N'PAG', N'Pangasinan', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (260, N'PAL', N'Pahlavi', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (261, N'PAM', N'Pampanga', N'Kapampangan', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (262, N'PAN', N'Panjabi', N'??????, ??????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (263, N'PAP', N'Papiamento', N'Papiamentu', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (264, N'PAU', N'Palauan', N'tekoi ra Belau', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (265, N'PEO', N'Old Persian (ca. 600-400 B.C.)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (266, N'PER', N'Persian', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (267, N'PLI', N'Pali', N'????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (268, N'POL', N'Polish', N'polski', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (269, N'PON', N'Ponape', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (270, N'POR', N'Portuguese', N'portugues', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (271, N'PRA', N'Prakrit languages', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (272, N'PRO', N'Provencal, Old (to 1500)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (273, N'PUS', N'Pushto', N'????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (274, N'QUE', N'Quechua', N'Runa Simi, Kichwa', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (275, N'RAJ', N'Rajasthani', N'?????????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (276, N'RAR', N'Rarotongan', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (277, N'ROA', N'Romance (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (278, N'ROH', N'Raeto-Romance', N'rumantsch grischun', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (279, N'ROM', N'Romany', N'rromani chib, Romani sib, Romano', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (280, N'RUM', N'Romanian', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (281, N'RUN', N'Rundi', N'Rundi', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (282, N'RUS', N'Russian', N'??????? ????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (283, N'SAD', N'Sandawe', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (284, N'SAG', N'Sango', N'yanga ti sango', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (285, N'SAI', N'South American Indian (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (286, N'SAL', N'Salishan languages', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (287, N'SAM', N'Samaritan Aramaic', N'?????, ?????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (288, N'SAN', N'Sanskrit', N'?????????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (289, N'SAO', N'Samoan', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (290, N'SCC', N'Serbo-Croatian (Cyrillic)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (291, N'SCO', N'Scots', N'Scots leid, Lallans', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (292, N'SCR', N'Serbo-Croatian (Roman)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (293, N'SEL', N'Selkup', N'????????? ???', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (294, N'SEM', N'Semitic (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (295, N'SHN', N'Shan', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (296, N'SHO', N'Shona', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (297, N'SID', N'Sidamo', N'Sidamo ''Afo', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (298, N'SIO', N'Siouan languages', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (299, N'SIT', N'Sino-Tibetan (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (300, N'SLA', N'Slavic (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (301, N'SLO', N'Slovak', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (302, N'SLV', N'Slovenian', N'slovenscina', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (303, N'SND', N'Sindhi', N'????? ?????, ??????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (304, N'SNH', N'Sinhalese', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (305, N'SOM', N'Somali', N'Soomaaliga, af Soomaali', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (306, N'SON', N'Songhai', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (307, N'SPA', N'Spanish', N'espanol, castellano', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (308, N'SRR', N'Serer', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (309, N'SSO', N'Sotho', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (310, N'SUK', N'Sukuma', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (311, N'SUN', N'Sundanese', N'basa Sunda', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (312, N'SUS', N'Susu', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (313, N'SUX', N'Sumerian', N'eme-gir', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (314, N'SWA', N'Swahili', N'Kiswahili', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (315, N'SWZ', N'Swazi', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (316, N'SYR', N'Syriac', N'??????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (317, N'TAG', N'Tagalog', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (318, N'TAH', N'Tahitian', N'te reo Tahiti, te reo Ma''ohi', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (319, N'TAJ', N'Tajik', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (320, N'TAM', N'Tamil', N'?????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (321, N'TAR', N'Tatar', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (322, N'TEL', N'Telugu', N'??????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (323, N'TEM', N'Timne', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (324, N'TER', N'Tereno', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (325, N'THA', N'Thai', N'???????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (326, N'TIB', N'Tibetan', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (327, N'TIG', N'Tigre', N'Tigre, Khasa', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (328, N'TIR', N'Tigrinya', N'????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (329, N'TIV', N'Tivi', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (330, N'TLI', N'Tlingit', N'Lingit', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (331, N'TOG', N'Tonga (Nyasa)', N'chiTonga', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (332, N'TON', N'Tonga (Tonga Islands)', N'faka-Tonga', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (333, N'TRU', N'Truk', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (334, N'TSI', N'Tsimshian', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (335, N'TSO', N'Tsonga', N'Xitsonga', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (336, N'TSW', N'Tswana', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (337, N'TUK', N'Turkmen', N'???????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (338, N'TUM', N'Tumbuka', N'chiTumbuka', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (339, N'TUR', N'Turkish', N'Turkce', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (340, N'TUT', N'Altaic (Other)', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (341, N'TWI', N'Twi', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (342, N'UGA', N'Ugaritic', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (343, N'UIG', N'Uighur', N'Uy?urq?, Uygurce, ???????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (344, N'UKR', N'Ukrainian', N'?????????? ????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (345, N'UMB', N'Umbundu', N'umbundu', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (346, N'UND', N'Undetermined', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (347, N'URD', N'Urdu', N'????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (348, N'UZB', N'Uzbek', N'O''zbek, ?????, ??????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (349, N'VAI', N'Vai', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (350, N'VEN', N'Venda', N'Tshiven?a', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (351, N'VIE', N'Vietnamese', N'Ti?ng Vi?t', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (352, N'VOT', N'Votic', N'vadda tseeli', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (353, N'WAK', N'Wakashan languages', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (354, N'WAL', N'Walamo', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (355, N'WAR', N'Waray', N'Winaray, Lineyte-Samarnon', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (356, N'WAS', N'Washo', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (357, N'WEL', N'Welsh', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (358, N'WEN', N'Sorbian languages', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (359, N'WOL', N'Wolof', N'Wolof', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (360, N'XHO', N'Xhosa', N'isiXhosa', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (361, N'YAO', N'Yao', N'Chiyao', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (362, N'YAP', N'Yap', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (363, N'YID', N'Yiddish', N'??????', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (364, N'YOR', N'Yoruba', N'Yoruba', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (365, N'ZAP', N'Zapotec', NULL, 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (366, N'ZEN', N'Zenaga', N'Tu??ungiyya', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (367, N'ZUL', N'Zulu', N'isiZulu', 0);
INSERT INTO `memberroleadmin`.`Languages` (`LanguageID`, `Code`, `EnglishName`, `NativeName`, `IsEnabled`) VALUES (368, N'ZUN', N'Zuni', N'Shiwi', 0);


INSERT INTO `memberroleadmin`.`AuditEventTypes` (`TypeID`, `Description`) VALUES (1, N'Default');
INSERT INTO `memberroleadmin`.`AuditEventTypes` (`TypeID`, `Description`) VALUES (2, N'Info');
INSERT INTO `memberroleadmin`.`AuditEventTypes` (`TypeID`, `Description`) VALUES (3, N'Success');
INSERT INTO `memberroleadmin`.`AuditEventTypes` (`TypeID`, `Description`) VALUES (4, N'Warning');
INSERT INTO `memberroleadmin`.`AuditEventTypes` (`TypeID`, `Description`) VALUES (5, N'Error');
INSERT INTO `memberroleadmin`.`AuditEventSources` (`SourceID`, `Description`) VALUES (1, N'App');
INSERT INTO `memberroleadmin`.`AuditEventSources` (`SourceID`, `Description`) VALUES (2, N'System');
INSERT INTO `memberroleadmin`.`AuditEventSources` (`SourceID`, `Description`) VALUES (3, N'API');
INSERT INTO `memberroleadmin`.`ActionTokenTypes` (`ActionTypeID`, `Description`) VALUES (1, N'Self-Activation');
INSERT INTO `memberroleadmin`.`ActionTokenTypes` (`ActionTypeID`, `Description`) VALUES (2, N'Password Reset');
INSERT INTO `memberroleadmin`.`MemberAttemptTypes` (`MemberAttemptTypeID`, `AttemptTypeDescription`) VALUES (1, N'Login Password Failed');
INSERT INTO `memberroleadmin`.`ProfileFieldGroups` (`FieldGroupID`, `FieldGroupName`, `FieldGroupDescription`, `OrderID`, `IsActive`, `AdminUseOnly`) VALUES (1, N'Personal', N'', 1, 1, 0);
INSERT INTO `memberroleadmin`.`ProfileFieldGroups` (`FieldGroupID`, `FieldGroupName`, `FieldGroupDescription`, `OrderID`, `IsActive`, `AdminUseOnly`) VALUES (2, N'Payments', N'', 2, 1, 0);
INSERT INTO `memberroleadmin`.`ProfileFieldGroups` (`FieldGroupID`, `FieldGroupName`, `FieldGroupDescription`, `OrderID`, `IsActive`, `AdminUseOnly`) VALUES (3, N'Geo Information', N'', 3, 0, 0);
INSERT INTO `memberroleadmin`.`ParameterTypes` (`TypeID`, `TypeName`, `TypeSize`) VALUES (1, N'ShortString', 64);
INSERT INTO `memberroleadmin`.`ParameterTypes` (`TypeID`, `TypeName`, `TypeSize`) VALUES (2, N'LongString', 512);
INSERT INTO `memberroleadmin`.`ParameterTypes` (`TypeID`, `TypeName`, `TypeSize`) VALUES (3, N'SmallInteger', 3);
INSERT INTO `memberroleadmin`.`ParameterTypes` (`TypeID`, `TypeName`, `TypeSize`) VALUES (4, N'Bool', 4);
INSERT INTO `memberroleadmin`.`ParameterTypes` (`TypeID`, `TypeName`, `TypeSize`) VALUES (5, N'RadioInteger', 2);
INSERT INTO `memberroleadmin`.`ParameterTypes` (`TypeID`, `TypeName`, `TypeSize`) VALUES (6, N'BigString', 4096);
INSERT INTO `memberroleadmin`.`Roles` (`RoleID`, `Name`, `IsBuiltIn`, `BackColor`, `ForeColor`, `Settings`, `Created`, `Modified`) VALUES (1, N'Admins', 1, N'c32113', N'White', N'People who care about role and member management', NOW(), NOW());
INSERT INTO `memberroleadmin`.`Roles` (`RoleID`, `Name`, `IsBuiltIn`, `BackColor`, `ForeColor`, `Settings`, `Created`, `Modified`) VALUES (2, N'Editor', 0, N'1d4d14', N'White', N'Who has permission to edit something', NOW(), NOW());
INSERT INTO `memberroleadmin`.`Roles` (`RoleID`, `Name`, `IsBuiltIn`, `BackColor`, `ForeColor`, `Settings`, `Created`, `Modified`) VALUES (3, N'Viewer', 0, N'0d5e96', N'White', N'Who has permission to view something', NOW(), NOW());
INSERT INTO `memberroleadmin`.`Roles` (`RoleID`, `Name`, `IsBuiltIn`, `BackColor`, `ForeColor`, `Settings`, `Created`, `Modified`) VALUES (4, N'Blocked', 1, N'740711', N'White', N'Blocked members for some reason', NOW(), NOW());
INSERT INTO `memberroleadmin`.`Roles` (`RoleID`, `Name`, `IsBuiltIn`, `BackColor`, `ForeColor`, `Settings`, `Created`, `Modified`) VALUES (5, N'Self Registered', 1, N'86cc71', N'White', N'Members which registered independently via public UI ', NOW(), NOW());
INSERT INTO `memberroleadmin`.`Roles` (`RoleID`, `Name`, `IsBuiltIn`, `BackColor`, `ForeColor`, `Settings`, `Created`, `Modified`) VALUES (6, N'Not Activated', 1, N'e75560', N'White', N'Members which are not activated using notification email', NOW(), NOW());
INSERT INTO `memberroleadmin`.`Roles` (`RoleID`, `Name`, `IsBuiltIn`, `BackColor`, `ForeColor`, `Settings`, `Created`, `Modified`) VALUES (7, N'API Members', 1, N'3aa0df', N'White', N'Members which use API for some purposes ', NOW(), NOW());
INSERT INTO `memberroleadmin`.`Roles` (`RoleID`, `Name`, `IsBuiltIn`, `BackColor`, `ForeColor`, `Settings`, `Created`, `Modified`) VALUES (8, N'Self Activated', 1, N'35a220', N'White', N'Members which activated their accounts', NOW(), NOW());
INSERT INTO `memberroleadmin`.`Roles` (`RoleID`, `Name`, `IsBuiltIn`, `BackColor`, `ForeColor`, `Settings`, `Created`, `Modified`) VALUES (9, N'A-SocialSignIn', 1, N'1973cc', N'White', N'Members which signed in via Social Networks', NOW(),NOW());
INSERT INTO `memberroleadmin`.`Roles` (`RoleID`, `Name`, `IsBuiltIn`, `BackColor`, `ForeColor`, `Settings`, `Created`, `Modified`) VALUES (10, N'Twitter', 1, N'40afe5', N'White', N'Members which signed in via Twitter', NOW(),NOW()); 
INSERT INTO `memberroleadmin`.`Roles` (`RoleID`, `Name`, `IsBuiltIn`, `BackColor`, `ForeColor`, `Settings`, `Created`, `Modified`) VALUES (11, N'Facebook', 1, N'425a9f', N'White', N'Members which signed in via Facebook',  NOW(),NOW());
INSERT INTO `memberroleadmin`.`Roles` (`RoleID`, `Name`, `IsBuiltIn`, `BackColor`, `ForeColor`, `Settings`, `Created`, `Modified`) VALUES (12, N'Google', 1, N'4763e2', N'White', N'Members which signed in via Google',  NOW(),NOW());
INSERT INTO `memberroleadmin`.`Roles` (`RoleID`, `Name`, `IsBuiltIn`, `BackColor`, `ForeColor`, `Settings`, `Created`, `Modified`) VALUES (13, N'Yahoo', 1, N'9400b1', N'White', N'Members which signed in via Yahoo',  NOW(),NOW());
INSERT INTO `memberroleadmin`.`Roles` (`RoleID`, `Name`, `IsBuiltIn`, `BackColor`, `ForeColor`, `Settings`, `Created`, `Modified`) VALUES (14, N'Live Journal', 1, N'7796c0', N'White', N'Members which signed in via Live Journal', NOW(),NOW());
INSERT INTO `memberroleadmin`.`Roles` (`RoleID`, `Name`, `IsBuiltIn`, `BackColor`, `ForeColor`, `Settings`, `Created`, `Modified`) VALUES (15, N'Blogger', 1, N'eb6413', N'White', N'Members which signed in via Blogger', NOW(),NOW());
INSERT INTO `memberroleadmin`.`Roles` (`RoleID`, `Name`, `IsBuiltIn`, `BackColor`, `ForeColor`, `Settings`, `Created`, `Modified`) VALUES (16, N'OpenID', 1, N'f7931e', N'White', N'Members which signed in via OpenID', NOW(),NOW());
INSERT INTO `memberroleadmin`.`Roles` (`RoleID`, `Name`, `IsBuiltIn`, `BackColor`, `ForeColor`, `Settings`, `Created`, `Modified`) VALUES (17, N'My OpenID', 1, N'64b653', N'White', N'Members which signed in via myOpenID', NOW(),NOW());
INSERT INTO `memberroleadmin`.`Roles` (`RoleID`, `Name`, `IsBuiltIn`, `BackColor`, `ForeColor`, `Settings`, `Created`, `Modified`) VALUES (18, N'LDAP', 1, N'328cbd', N'White', N'Members which signed in via LDAP Directory', NOW(),NOW());
INSERT INTO `memberroleadmin`.`ProfileFieldTypes` (`FieldTypeID`, `FieldTypeName`, `FieldTypeDescription`, `FieldTypeSize`) VALUES (1, N'String', N'Free style string (Max length is 32 chars)', 32);
INSERT INTO `memberroleadmin`.`ProfileFieldTypes` (`FieldTypeID`, `FieldTypeName`, `FieldTypeDescription`, `FieldTypeSize`) VALUES (2, N'StringMultiline', N'Free style long string  (Max length is 2048 chars)', 2048);
INSERT INTO `memberroleadmin`.`ProfileFieldTypes` (`FieldTypeID`, `FieldTypeName`, `FieldTypeDescription`, `FieldTypeSize`) VALUES (3, N'Number', N'Free style number', 10);
INSERT INTO `memberroleadmin`.`ProfileFieldTypes` (`FieldTypeID`, `FieldTypeName`, `FieldTypeDescription`, `FieldTypeSize`) VALUES (4, N'SingleSelectList', N'Single select from list of values', 0);
INSERT INTO `memberroleadmin`.`ProfileFieldTypes` (`FieldTypeID`, `FieldTypeName`, `FieldTypeDescription`, `FieldTypeSize`) VALUES (5, N'MultiSelectList', N'Multiple select from list of values', 0);
INSERT INTO `memberroleadmin`.`ProfileFieldTypes` (`FieldTypeID`, `FieldTypeName`, `FieldTypeDescription`, `FieldTypeSize`) VALUES (6, N'CheckBox', N'Checkbox', 0);
INSERT INTO `memberroleadmin`.`ProfileFieldTypes` (`FieldTypeID`, `FieldTypeName`, `FieldTypeDescription`, `FieldTypeSize`) VALUES (7, N'RadioBoxGroup', N'Radio box group', 0);
INSERT INTO `memberroleadmin`.`ProfileFieldTypes` (`FieldTypeID`, `FieldTypeName`, `FieldTypeDescription`, `FieldTypeSize`) VALUES (8, N'ComboBox', N'String from the dropdown list', 0);
INSERT INTO `memberroleadmin`.`ProfileFields` (`FieldID`, `FieldTypeID`, `FieldName`, `Comment`, `PossibleValues`, `TextSelectValue`, `IsMandatory`, `ShowInSignUp`, `FieldGroupID`, `OrderID`, `Created`, `Modified`, `SortValues`, `IsActive`, `AdminUseOnly`, `VerticalLayout`) VALUES (63, 1, N'First name', N'First name as in passport', NULL, NULL, 1, 1, 1, 1, NOW(), NULL, 1, 1, 0, 0);
INSERT INTO `memberroleadmin`.`ProfileFields` (`FieldID`, `FieldTypeID`, `FieldName`, `Comment`, `PossibleValues`, `TextSelectValue`, `IsMandatory`, `ShowInSignUp`, `FieldGroupID`, `OrderID`, `Created`, `Modified`, `SortValues`, `IsActive`, `AdminUseOnly`, `VerticalLayout`) VALUES (64, 1, N'Family name', N'Family name  as in passport', NULL, NULL, 1, 1, 1, 2, NOW(), NULL, 1, 1, 0, 0);
INSERT INTO `memberroleadmin`.`ProfileFields` (`FieldID`, `FieldTypeID`, `FieldName`, `Comment`, `PossibleValues`, `TextSelectValue`, `IsMandatory`, `ShowInSignUp`, `FieldGroupID`, `OrderID`, `Created`, `Modified`, `SortValues`, `IsActive`, `AdminUseOnly`, `VerticalLayout`) VALUES (65, 1, N'Birth Date', N'Please use the following format dd.mm.yyyy', NULL, NULL, 1, 1, 1, 8, NOW(), NULL, 1, 1, 0, 0);
INSERT INTO `memberroleadmin`.`ProfileFields` (`FieldID`, `FieldTypeID`, `FieldName`, `Comment`, `PossibleValues`, `TextSelectValue`, `IsMandatory`, `ShowInSignUp`, `FieldGroupID`, `OrderID`, `Created`, `Modified`, `SortValues`, `IsActive`, `AdminUseOnly`, `VerticalLayout`) VALUES (66, 8, N'Gender', N'Please select your gender', N'Male; Female', N'Please select your option', 1, 1, 1, 3, NOW(), NULL, 1, 1, 0, 0);
INSERT INTO `memberroleadmin`.`ProfileFields` (`FieldID`, `FieldTypeID`, `FieldName`, `Comment`, `PossibleValues`, `TextSelectValue`, `IsMandatory`, `ShowInSignUp`, `FieldGroupID`, `OrderID`, `Created`, `Modified`, `SortValues`, `IsActive`, `AdminUseOnly`, `VerticalLayout`) VALUES (67, 8, N'Country', N'Select your country', N'Andorra; United Arab Emirates; Afghanistan; Antigua and Barbuda; Anguilla;Albania;Armenia;Netherlands Antilles;Angola;Antarctica;Argentina;American Samoa;Austria;Australia;Aruba;Aland Islands;Azerbaijan;Bosnia and Herzegovina;Barbados;Bangladesh;Belgium;Burkina Faso;Bulgaria;Bahrain;Burundi;Benin;Saint Barthelemy;Bermuda;Brunei;Bolivia;Brazil;The Bahamas;Bhutan;Bouvet Island;Botswana;Belarus;Belize;Canada;Cocos (Keeling) Islands;Democratic Republic of the Congo;Central African Republic;Republic of the Congo;Switzerland;Ivory Coast;Cook Islands;Chile;Cameroon;China;Colombia;Costa Rica;Cuba;Cape Verde;Christmas Island;Cyprus;Czech Republic;Germany;Djibouti;Denmark;Dominica;Dominican Republic;Algeria;Ecuador;Estonia;Egypt;Western Sahara;Eritrea;Spain;Ethiopia;Finland;Fiji;Falkland Islands;Micronesia;Faroe Islands;France;Gabon;United Kingdom;Grenada;Georgia;French Guiana;Guernsey;Ghana;Gibraltar;Greenland;The Gambia;Guinea;Guadeloupe;Equatorial Guinea;Greece;South Georgia and South Sandwich Islands;Guatemala;Guam;Guinea-Bissau;Guyana;Hong Kong;Heard Island and McDonald Islands;Honduras;Croatia;Haiti;Hungary;Indonesia;Ireland;Israel;Isle of Man;India;British Indian Ocean Territory;Iraq;Iran;Iceland;Italy;Jersey;Jamaica;Jordan;Japan;Kenya;Kyrgyzstan;Cambodia;Kiribati;Comoros;Saint Kitts and Nevis;North Korea;South Korea;Kuwait;Cayman Islands;Kazakhstan;Laos;Lebanon;Saint Lucia;Liechtenstein;Sri Lanka;Liberia;Lesotho;Lithuania;Luxembourg;Latvia;Libya;Morocco;Monaco;Moldova;Montenegro;Saint Martin;Madagascar;Marshall Islands;Macedonia;Mali;Burma;Mongolia;Macau;Northern Mariana Islands;Martinique;Mauritania;Montserrat;Malta;Mauritius;Maldives;Malawi;Mexico;Malaysia;Mozambique;Namibia;New Caledonia;Niger;Norfolk Island;Nigeria;Nicaragua;Netherlands;Norway;Nepal;Nauru;Niue;New Zealand;Oman;Panama;Peru;French Polynesia;Papua New Guinea;Philippines;Pakistan;Poland;Saint Pierre and Miquelon;Pitcairn Islands;Puerto Rico;Palesinian Territory;Portugal;Palau;Paraguay;Qatar;Reunion;Romania;Serbia;Russian Federation;Rwanda;Saudi Arabia;Solomon Islands;Seychelles;Sudan;Sweden;Singapore;Saint Helena;Slovenia;Svalbard;Slovakia;Sierra Leone;San Marino;Senegal;Somalia;Suriname;Sao Tome and Principe;El Salvador;Syria;Swaziland;Turks and Caicos Islands;Chad;French Southern and Antarctic Lands;Togo;Thailand;Tajikistan;Tokelau;Timor-Leste;Turkmenistan;Tunisia;Tonga;Turkey;Trinidad and Tobago;Tuvalu;Taiwan;Tanzania;Ukraine;Uganda;United States Minor Outlying Islands;United States;Uruguay;Uzbekistan;Vatican City;Saint Vincent and the Grenadines;Venezuela;British Virgin Islands;Virgin Islands;Vietnam;Vanuatu;Wallis and Futuna;Samoa;Yemen;Mayotte;South Africa;Zambia;Zimbabwe', N'Please select your option', 1, 1, 1, 4, NOW(), NULL, 1, 1, 0, 0);
INSERT INTO `memberroleadmin`.`ProfileFields` (`FieldID`, `FieldTypeID`, `FieldName`, `Comment`, `PossibleValues`, `TextSelectValue`, `IsMandatory`, `ShowInSignUp`, `FieldGroupID`, `OrderID`, `Created`, `Modified`, `SortValues`, `IsActive`, `AdminUseOnly`, `VerticalLayout`) VALUES (68, 1, N'City', N'', NULL, NULL, 1, 1, 1, 6, NOW(), NULL, 1, 1, 0, 0);
INSERT INTO `memberroleadmin`.`ProfileFields` (`FieldID`, `FieldTypeID`, `FieldName`, `Comment`, `PossibleValues`, `TextSelectValue`, `IsMandatory`, `ShowInSignUp`, `FieldGroupID`, `OrderID`, `Created`, `Modified`, `SortValues`, `IsActive`, `AdminUseOnly`, `VerticalLayout`) VALUES (69, 1, N'Nationality', N'', NULL, NULL, 1, 1, 1, 7, NOW(), NULL, 1, 1, 0, 0);
INSERT INTO `memberroleadmin`.`ProfileFields` (`FieldID`, `FieldTypeID`, `FieldName`, `Comment`, `PossibleValues`, `TextSelectValue`, `IsMandatory`, `ShowInSignUp`, `FieldGroupID`, `OrderID`, `Created`, `Modified`, `SortValues`, `IsActive`, `AdminUseOnly`, `VerticalLayout`) VALUES (70, 1, N'Phone number', N'', NULL, NULL, 1, 1, 1, 9, NOW(), NULL, 1, 1, 0, 0);
INSERT INTO `memberroleadmin`.`ProfileFields` (`FieldID`, `FieldTypeID`, `FieldName`, `Comment`, `PossibleValues`, `TextSelectValue`, `IsMandatory`, `ShowInSignUp`, `FieldGroupID`, `OrderID`, `Created`, `Modified`, `SortValues`, `IsActive`, `AdminUseOnly`, `VerticalLayout`) VALUES (71, 1, N'Passport number', N'', NULL, NULL, 1, 1, 1, 10, NOW(), NULL, 1, 1, 0, 0);
INSERT INTO `memberroleadmin`.`ProfileFields` (`FieldID`, `FieldTypeID`, `FieldName`, `Comment`, `PossibleValues`, `TextSelectValue`, `IsMandatory`, `ShowInSignUp`, `FieldGroupID`, `OrderID`, `Created`, `Modified`, `SortValues`, `IsActive`, `AdminUseOnly`, `VerticalLayout`) VALUES (73, 1, N'District', N'', NULL, NULL, 1, 1, 1, 5, NOW(), NULL, 1, 1, 0, 0);
INSERT INTO `memberroleadmin`.`ProfileFields` (`FieldID`, `FieldTypeID`, `FieldName`, `Comment`, `PossibleValues`, `TextSelectValue`, `IsMandatory`, `ShowInSignUp`, `FieldGroupID`, `OrderID`, `Created`, `Modified`, `SortValues`, `IsActive`, `AdminUseOnly`, `VerticalLayout`) VALUES (77, 1, N'Emergency Contact Name', N'Emergency Contact Name', NULL, NULL, 1, 1, 1, 11, NOW(), NULL, 1, 1, 0, 0);
INSERT INTO `memberroleadmin`.`ProfileFields` (`FieldID`, `FieldTypeID`, `FieldName`, `Comment`, `PossibleValues`, `TextSelectValue`, `IsMandatory`, `ShowInSignUp`, `FieldGroupID`, `OrderID`, `Created`, `Modified`, `SortValues`, `IsActive`, `AdminUseOnly`, `VerticalLayout`) VALUES (78, 1, N'Emergency Phone Number', N'Emergency Phone Number', NULL, NULL, 1, 1, 1, 12, NOW(), NULL, 1, 1, 0, 0);
INSERT INTO `memberroleadmin`.`ProfileFields` (`FieldID`, `FieldTypeID`, `FieldName`, `Comment`, `PossibleValues`, `TextSelectValue`, `IsMandatory`, `ShowInSignUp`, `FieldGroupID`, `OrderID`, `Created`, `Modified`, `SortValues`, `IsActive`, `AdminUseOnly`, `VerticalLayout`) VALUES (79, 2, N'Additional information', N'', NULL, NULL, 0, 1, 1, 13, NOW(), NULL, 1, 1, 0, 0);
INSERT INTO `memberroleadmin`.`ProfileFields` (`FieldID`, `FieldTypeID`, `FieldName`, `Comment`, `PossibleValues`, `TextSelectValue`, `IsMandatory`, `ShowInSignUp`, `FieldGroupID`, `OrderID`, `Created`, `Modified`, `SortValues`, `IsActive`, `AdminUseOnly`, `VerticalLayout`) VALUES (85, 1, N'Credit Card Number', N'Your Credit Card Number', NULL, NULL, 0, 0, 2, 1, NOW(), NOW(), 1, 1, 0, 0);
INSERT INTO `memberroleadmin`.`ProfileFields` (`FieldID`, `FieldTypeID`, `FieldName`, `Comment`, `PossibleValues`, `TextSelectValue`, `IsMandatory`, `ShowInSignUp`, `FieldGroupID`, `OrderID`, `Created`, `Modified`, `SortValues`, `IsActive`, `AdminUseOnly`, `VerticalLayout`) VALUES (86, 1, N'Bank Account', N'Your bank account number', NULL, NULL, 0, 0, 2, 2, NOW(), NULL, 1, 1, 0, 0);
INSERT INTO `memberroleadmin`.`ProfileFields` (`FieldID`, `FieldTypeID`, `FieldName`, `Comment`, `PossibleValues`, `TextSelectValue`, `IsMandatory`, `ShowInSignUp`, `FieldGroupID`, `OrderID`, `Created`, `Modified`, `SortValues`, `IsActive`, `AdminUseOnly`, `VerticalLayout`) VALUES (87, 1, N'Geo Location', N'Your Geo Location', NULL, NULL, 0, 0, 3, 0, NOW(), NOW(), 1, 1, 0, 0);
INSERT INTO `memberroleadmin`.`ProfileFields` (`FieldID`, `FieldTypeID`, `FieldName`, `Comment`, `PossibleValues`, `TextSelectValue`, `IsMandatory`, `ShowInSignUp`, `FieldGroupID`, `OrderID`, `Created`, `Modified`, `SortValues`, `IsActive`, `AdminUseOnly`, `VerticalLayout`) VALUES (88, 5, N'Which bank do you prefer ?', N'Please select one or more values below', N'City Bank; New-York Bank; EU Credit; First national Bank', N'`No selected items`', 1, 1, 2, 3, NOW(), NOW(), 0, 1, 0, 0);
INSERT INTO `memberroleadmin`.`ProfileFields` (`FieldID`, `FieldTypeID`, `FieldName`, `Comment`, `PossibleValues`, `TextSelectValue`, `IsMandatory`, `ShowInSignUp`, `FieldGroupID`, `OrderID`, `Created`, `Modified`, `SortValues`, `IsActive`, `AdminUseOnly`, `VerticalLayout`) VALUES (89, 7, N'Payment Type', N'Please select your payment type', N'Credit Card; Western Union; Bank Account Transfer', NULL, 1, 1, 2, 5, NOW(), NOW(), 0, 1, 0, 0);
INSERT INTO `memberroleadmin`.`ProfileFields` (`FieldID`, `FieldTypeID`, `FieldName`, `Comment`, `PossibleValues`, `TextSelectValue`, `IsMandatory`, `ShowInSignUp`, `FieldGroupID`, `OrderID`, `Created`, `Modified`, `SortValues`, `IsActive`, `AdminUseOnly`, `VerticalLayout`) VALUES (90, 7, N'Payment Period', N'Please select your payment period', N'1 Month; 6 Months; 1 Year', N'Please select your payment period', 1, 1, 2, 4, NOW(), NOW(), 0, 1, 0, 1);
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (12, N'api-enabled', N'true', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (43, N'api-secret-url', NULL, 1, NOW(), 2, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (3, N'general-admin-email', N'admin@demo.com', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (39, N'general-app-maintenance-enabled', N'false', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (37, N'general-app-maintenance-url', N'Offline', 1, NOW(), 2, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (17, N'general-app-path', N'localhost', 1, NOW(), 2, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (36, N'general-app-secret-admin-url', NULL, 1, NOW(), 2, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (10, N'general-audit-enabled', N'true', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (18, N'general-cookie-name', N'myApplicationCookie', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (13, N'general-domain-name', N'localhost', 1, NOW(), 2, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (49, N'language-public-default', N'ENG', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (30, N'mailserver-smtp-email', N'user@mail.server.com', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (1, N'mailserver-smtp-host', N'mail.server.com', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (5, N'mailserver-smtp-pass', N'mailserver', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (15, N'mailserver-smtp-port', N'25', 1, NOW(), 3, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (16, N'mailserver-smtp-ssl-enabled', N'true', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (4, N'mailserver-smtp-user', N'Admin', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (28, N'registration-mail-domain-restriction', N'1', 1, NOW(), 5, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (29, N'registration-mail-domain-restriction-list', NULL, 1, NOW(), 2, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (24, N'registration-member-activation-to-roles', N'Self Registered; Self Activated; Viewer', 1, NOW(), 2, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (26, N'registration-member-registration-to-roles', N'Self Registered; Not Activated', 1, NOW(), 2, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (23, N'registration-reset-password', N'true', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (21, N'registration-self-activation', N'true', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (20, N'registration-self-registration', N'true', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (32, N'rules-member-mail-bcc', NULL, 1, NOW(), 2, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (34, N'rules-member-mail-bcc-activation', N'false', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (35, N'rules-member-mail-bcc-passworchange', N'false', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (33, N'rules-member-mail-bcc-registration', N'false', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (47, N'rules-password-failed-attempts', N'7', 1, NOW(), 5, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (48, N'rules-password-failed-attempts-redirect', NULL, 1, NOW(), 2, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (44, N'rules-password-failed-roles', N'Blocked', 1, NOW(), 2, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (25, N'rules-redirect-after-login', N'', 1, NOW(), 2, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (31, N'rules-redirect-after-logout', N'', 1, NOW(), 2, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (51, N'rules-redirect-after-sign-up', NULL, 1, NOW(), 2, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (40, N'themes-app-current-name', N'bootstrap', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (50, N'ui-app-fluid', N'false', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (6, N'ui-app-name', N'Role & Member', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (9, N'ui-paging-size', N'40', 1, NOW(), 3, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (52,N'social-blogger-enabled', N'true', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (53,N'social-blogger-roles', N'Blogger; A-SocialSignIn', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (54,N'social-facebook-app-id', N'your App ID', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (55,N'social-facebook-app-secret', N'your App Secret', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (56,N'social-facebook-enabled', N'true', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (57,N'social-facebook-roles', N'Facebook; A-SocialSignIn', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (58,N'social-google-roles', N'Google; A-SocialSignIn', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (59,N'social-goole-enabled', N'true', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (60,N'social-livejournal-enabled', N'true', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (61,N'social-livejournal-roles', N'Live Journal; A-SocialSignIn', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (62,N'social-myopenid-enabled', N'true', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (63,N'social-myopenid-roles', N'My OpenID; A-SocialSignIn', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (64,N'social-openid-enabled', N'true', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (65,N'social-openid-roles', N'OpenID; A-SocialSignIn', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (66,N'social-twitter-consumer-key', N'your app Consumer key', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (67,N'social-twitter-consumer-secret', N'your App Consumer secret', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (68,N'social-twitter-enabled', N'true', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (69,N'social-twitter-roles', N'Twitter; A-SocialSignIn', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (70,N'social-yahoo-enabled', N'true', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (71,N'social-yahoo-roles', N'Yahoo; A-SocialSignIn', 1, NOW(), 1, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (72,N'ldap-add-role-group', N'true', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (73,N'ldap-add-to-roles', N'LDAP; Viewer', 1, NOW(), 2, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (74,N'ldap-domain', N'domain.com', 1, NOW(), 2, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (75,N'ldap-enabled', N'false', 1, NOW(), 4, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (76,N'ldap-path', N'LDAP://domainname.com/DC=domainname,DC=com', 1, NOW(), 2, NOW());
INSERT INTO `memberroleadmin`.`Parameters` (`ID`, `Name`, `Value`, `MemberID`, `Created`, `TypeID`, `Modified`) VALUES (77,N'ldap-use-only', N'false', 1, NOW(), 4, NOW());


INSERT INTO `memberroleadmin`.`MemberTokens` (`MemberTokenID`, `MemberID`, `Token`, `GeneratedBy`, `Created`, `Modified`) VALUES (1, 2, N'HYXMvDsQWhGhbShE7yS1', N'admin@mail.com', NOW(), NULL);
INSERT INTO `memberroleadmin`.`MemberAttempts` (`AttemptID`, `MemberID`, `AttemptType`, `Attempts`, `Created`, `Modified`, `IsAttemptValid`) VALUES (1, 1, 1, 3, NOW(), NOW(), 0);
INSERT INTO `memberroleadmin`.`MemberAttempts` (`AttemptID`, `MemberID`, `AttemptType`, `Attempts`, `Created`, `Modified`, `IsAttemptValid`) VALUES (2, 1, 1, 2, NOW(), NOW(), 0);
INSERT INTO `memberroleadmin`.`MemberAttempts` (`AttemptID`, `MemberID`, `AttemptType`, `Attempts`, `Created`, `Modified`, `IsAttemptValid`) VALUES (3, 1, 1, 2, NOW(), NOW(), 0);
INSERT INTO `memberroleadmin`.`MemberAttempts` (`AttemptID`, `MemberID`, `AttemptType`, `Attempts`, `Created`, `Modified`, `IsAttemptValid`) VALUES (8, 1, 1, 1, NOW(), NOW(), 0);
INSERT INTO `memberroleadmin`.`MemberRoles` (`MemberID`, `RoleID`, `Created`) VALUES (1, 1, NOW());
INSERT INTO `memberroleadmin`.`MemberRoles` (`MemberID`, `RoleID`, `Created`) VALUES (1, 2, NOW());
INSERT INTO `memberroleadmin`.`MemberRoles` (`MemberID`, `RoleID`, `Created`) VALUES (1, 3, NOW());
INSERT INTO `memberroleadmin`.`MemberRoles` (`MemberID`, `RoleID`, `Created`) VALUES (2, 7, NOW());
INSERT INTO `memberroleadmin`.`MemberRoles` (`MemberID`, `RoleID`, `Created`) VALUES (3, 3, NOW());
INSERT INTO `memberroleadmin`.`MemberRoles` (`MemberID`, `RoleID`, `Created`) VALUES (4, 2, NOW());
INSERT INTO `memberroleadmin`.`MemberRoles` (`MemberID`, `RoleID`, `Created`) VALUES (5, 7, NOW());
INSERT INTO `memberroleadmin`.`MemberProfileFields` (`ProfileFieldID`, `MemberID`, `FieldID`, `FieldValue`, `Created`, `Modified`) VALUES (1, 1, 63, N'First name', NOW(), NOW());
INSERT INTO `memberroleadmin`.`MemberProfileFields` (`ProfileFieldID`, `MemberID`, `FieldID`, `FieldValue`, `Created`, `Modified`) VALUES (2, 1, 64, N'Family name', NOW(), NOW());
INSERT INTO `memberroleadmin`.`MemberProfileFields` (`ProfileFieldID`, `MemberID`, `FieldID`, `FieldValue`, `Created`, `Modified`) VALUES (3, 1, 66, N'Male', NOW(), NOW());
INSERT INTO `memberroleadmin`.`MemberProfileFields` (`ProfileFieldID`, `MemberID`, `FieldID`, `FieldValue`, `Created`, `Modified`) VALUES (4, 1, 67, N'Ukraine', NOW(), NOW());
INSERT INTO `memberroleadmin`.`MemberProfileFields` (`ProfileFieldID`, `MemberID`, `FieldID`, `FieldValue`, `Created`, `Modified`) VALUES (5, 1, 73, N'District', NOW(), NOW());
INSERT INTO `memberroleadmin`.`MemberProfileFields` (`ProfileFieldID`, `MemberID`, `FieldID`, `FieldValue`, `Created`, `Modified`) VALUES (6, 1, 68, N'City', NOW(), NOW());
INSERT INTO `memberroleadmin`.`MemberProfileFields` (`ProfileFieldID`, `MemberID`, `FieldID`, `FieldValue`, `Created`, `Modified`) VALUES (7, 1, 69, N'Nationality', NOW(), NOW());
INSERT INTO `memberroleadmin`.`MemberProfileFields` (`ProfileFieldID`, `MemberID`, `FieldID`, `FieldValue`, `Created`, `Modified`) VALUES (8, 1, 65, N'Birth Date', NOW(), NOW());
INSERT INTO `memberroleadmin`.`MemberProfileFields` (`ProfileFieldID`, `MemberID`, `FieldID`, `FieldValue`, `Created`, `Modified`) VALUES (9, 1, 70, N'Phone number', NOW(), NOW());
INSERT INTO `memberroleadmin`.`MemberProfileFields` (`ProfileFieldID`, `MemberID`, `FieldID`, `FieldValue`, `Created`, `Modified`) VALUES (10, 1, 71, N'Passport number', NOW(), NOW());
INSERT INTO `memberroleadmin`.`MemberProfileFields` (`ProfileFieldID`, `MemberID`, `FieldID`, `FieldValue`, `Created`, `Modified`) VALUES (11, 1, 77, N'Emergency', NOW(), NOW());
INSERT INTO `memberroleadmin`.`MemberProfileFields` (`ProfileFieldID`, `MemberID`, `FieldID`, `FieldValue`, `Created`, `Modified`) VALUES (12, 1, 78, N'Emergency', NOW(), NOW());
INSERT INTO `memberroleadmin`.`MemberProfileFields` (`ProfileFieldID`, `MemberID`, `FieldID`, `FieldValue`, `Created`, `Modified`) VALUES (13, 1, 79, N'', NOW(), NOW());
INSERT INTO `memberroleadmin`.`MemberProfileFields` (`ProfileFieldID`, `MemberID`, `FieldID`, `FieldValue`, `Created`, `Modified`) VALUES (14, 1, 85, N'1234-5678-2345-4567', NOW(), NOW());
INSERT INTO `memberroleadmin`.`MemberProfileFields` (`ProfileFieldID`, `MemberID`, `FieldID`, `FieldValue`, `Created`, `Modified`) VALUES (15, 1, 86, N'12346234567', NOW(), NOW());
INSERT INTO `memberroleadmin`.`MemberProfileFields` (`ProfileFieldID`, `MemberID`, `FieldID`, `FieldValue`, `Created`, `Modified`) VALUES (16, 1, 88, N'City Bank,First national Bank', NOW(), NOW());
INSERT INTO `memberroleadmin`.`MemberProfileFields` (`ProfileFieldID`, `MemberID`, `FieldID`, `FieldValue`, `Created`, `Modified`) VALUES (17, 1, 90, N'1 Month', NOW(), NOW());
INSERT INTO `memberroleadmin`.`MemberProfileFields` (`ProfileFieldID`, `MemberID`, `FieldID`, `FieldValue`, `Created`, `Modified`) VALUES (18, 1, 89, N'Western Union', NOW(), NOW());
INSERT INTO `memberroleadmin`.`Domains` (`Name`, `Description`, `Created`, `Modified`) VALUES (N'localhost', N'localhost', NOW(), NULL);

INSERT INTO `memberroleadmin`.`memberdomains`(`MemberDomainID`, `MemberID`, `DomainID`) VALUES (1, 1, 1);
INSERT INTO `memberroleadmin`.`memberdomains`(`MemberDomainID`, `MemberID`, `DomainID`) VALUES (2, 2, 1);
INSERT INTO `memberroleadmin`.`memberdomains`(`MemberDomainID`, `MemberID`, `DomainID`) VALUES (3, 3, 1);
INSERT INTO `memberroleadmin`.`memberdomains`(`MemberDomainID`, `MemberID`, `DomainID`) VALUES (4, 4, 1);
INSERT INTO `memberroleadmin`.`memberdomains`(`MemberDomainID`, `MemberID`, `DomainID`) VALUES (5, 5, 1);