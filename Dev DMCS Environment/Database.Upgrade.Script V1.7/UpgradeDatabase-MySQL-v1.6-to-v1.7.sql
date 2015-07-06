
/*
Run this script on:

        SimpleTools.RoleMemberAdmin.V1.6 -  This database will be modified to synchronize it with:
        SimpleTools.RoleMemberAdmin.v1.7

		You are recommended to back up your database before running this script
*/

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
