/****** Object:  Table [dbo].[person]    Script Date: 9/7/2015 11:22:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[person](
  [person_id] int IDENTITY(1,1) NOT NULL,
  [Resource_ID] int NULL,
  [address_id] int NOT NULL,
  [address_id2] int NULL,
  [birthdate] datetime NULL,
  [certification_number] varchar(50) NULL,
  [f_name] varchar(MAX) NOT NULL,
  [m_initial] char(1) NULL,
  [l_name] varchar(MAX) NOT NULL,
  [gender] char(1) NULL,
  [person_type] char(1) NOT NULL,
  [phone_primary] varchar(11) NULL,
  [phone_secondary] varchar(11) NULL,
  [email] varchar(50) NULL,
  [ssn] int NULL,
  [Maiden_Name] varchar(50) NULL,
  [Visa_Issue_Date] datetime NULL,
  [Visa_Expire_Date] datetime NULL,
  [Visa_Selected_Value_B1] int NULL,
  [Visa_Selected_Value_B2] int NULL,
  [Visa_Selected_Value_K1] int NULL,
  [Visa_Selected_Value_K3] int NULL,
  [Visa_Selected_Value_L1] int NULL,
  [Visa_Selected_Value_L2] int NULL,
  [Visa_Selected_Value_H4] int NULL,
  [Visa_Selected_Value_F1] int NULL,
  [Visa_Selected_Value_J1] int NULL,
  [Visa_Selected_Value_M1] int NULL,
  [Visa_Selected_Value_H_1B] int NULL,
  [Visa_Selected_Value_H_2B] int NULL,
  [Visa_Selected_Value_B_2] int NULL,
  [Visa_Selected_Value_Schengen] int NULL,
  [Perm_Resident_Alien_Resid_Date] datetime NULL,
  [Perm_Resident_Alien_Expire_Date] datetime NULL,
  [Perm_Resident_Alien_A_number] int NULL,
  [Perm_Resident_Alien_USCIS_number] int NULL,
  [Perm_Resident_Alien_Birth_Country] varchar(50) NULL,
  [Perm_Resident_Alien_Category] varchar(50) NULL,
  [Driver_State_ID] varchar(15) NULL,
  [Citizenship] varchar(3) NULL,
  [Marital_Status] char(1) NULL,
  [Minor_Children] int NULL,
 CONSTRAINT [person_person_id_pk] PRIMARY KEY CLUSTERED 
(
	[person_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO
SET ANSI_PADDING OFF
GO
/*************************************************/
/****** FK TEMPLATE - NEEDS ACCURATE DATA - ******/
/*************************************************/
/**********    ALTER TABLE [dbo].[THIS_tableName]  WITH CHECK ADD  CONSTRAINT [NAME_OF_CONSTRAINT] FOREIGN KEY([FK_ON_THIS_TABLE])    **********/
/**********    REFERENCES [dbo].[OTHER_tableName] ([OTHER_TABLE_FK])    **********/
/**********    GO    **********/
/**********    ALTER TABLE [dbo].[THIS_tableName] CHECK CONSTRAINT [NAME_OF_CONSTRAINT]    **********/
/**********    GO    **********/
/***********************************************************/
/*************************************************/
/****** - SELECT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PERSON]    Script Date: 9/7/2015 11:22:58 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PERSON]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PERSON]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PERSON]
           @person_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [person_id]
      ,[Resource_ID]
      ,[address_id]
      ,[address_id2]
      ,[birthdate]
      ,[certification_number]
      ,[f_name]
      ,[m_initial]
      ,[l_name]
      ,[gender]
      ,[person_type]
      ,[phone_primary]
      ,[phone_secondary]
      ,[email]
      ,[ssn]
      ,[Maiden_Name]
      ,[Visa_Issue_Date]
      ,[Visa_Expire_Date]
      ,[Visa_Selected_Value_B1]
      ,[Visa_Selected_Value_B2]
      ,[Visa_Selected_Value_K1]
      ,[Visa_Selected_Value_K3]
      ,[Visa_Selected_Value_L1]
      ,[Visa_Selected_Value_L2]
      ,[Visa_Selected_Value_H4]
      ,[Visa_Selected_Value_F1]
      ,[Visa_Selected_Value_J1]
      ,[Visa_Selected_Value_M1]
      ,[Visa_Selected_Value_H_1B]
      ,[Visa_Selected_Value_H_2B]
      ,[Visa_Selected_Value_B_2]
      ,[Visa_Selected_Value_Schengen]
      ,[Perm_Resident_Alien_Resid_Date]
      ,[Perm_Resident_Alien_Expire_Date]
      ,[Perm_Resident_Alien_A_number]
      ,[Perm_Resident_Alien_USCIS_number]
      ,[Perm_Resident_Alien_Birth_Country]
      ,[Perm_Resident_Alien_Category]
      ,[Driver_State_ID]
      ,[Citizenship]
      ,[Marital_Status]
      ,[Minor_Children]
  FROM [dbo].[person]
 WHERE person_id = @person_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PERSON]    Script Date: 9/7/2015 11:22:58 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PERSON]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PERSON]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PERSON]
	  @Resource_ID as int,
	  @address_id as int,
	  @address_id2 as int,
	  @birthdate as datetime,
	  @certification_number as varchar(50),
	  @f_name as varchar(MAX),
	  @m_initial as char(1),
	  @l_name as varchar(MAX),
	  @gender as char(1),
	  @person_type as char(1),
	  @phone_primary as varchar(11),
	  @phone_secondary as varchar(11),
	  @email as varchar(50),
	  @ssn as int,
	  @Maiden_Name as varchar(50),
	  @Visa_Issue_Date as datetime,
	  @Visa_Expire_Date as datetime,
	  @Visa_Selected_Value_B1 as int,
	  @Visa_Selected_Value_B2 as int,
	  @Visa_Selected_Value_K1 as int,
	  @Visa_Selected_Value_K3 as int,
	  @Visa_Selected_Value_L1 as int,
	  @Visa_Selected_Value_L2 as int,
	  @Visa_Selected_Value_H4 as int,
	  @Visa_Selected_Value_F1 as int,
	  @Visa_Selected_Value_J1 as int,
	  @Visa_Selected_Value_M1 as int,
	  @Visa_Selected_Value_H_1B as int,
	  @Visa_Selected_Value_H_2B as int,
	  @Visa_Selected_Value_B_2 as int,
	  @Visa_Selected_Value_Schengen as int,
	  @Perm_Resident_Alien_Resid_Date as datetime,
	  @Perm_Resident_Alien_Expire_Date as datetime,
	  @Perm_Resident_Alien_A_number as int,
	  @Perm_Resident_Alien_USCIS_number as int,
	  @Perm_Resident_Alien_Birth_Country as varchar(50),
	  @Perm_Resident_Alien_Category as varchar(50),
	  @Driver_State_ID as varchar(15),
	  @Citizenship as varchar(3),
	  @Marital_Status as char(1)
	  @Minor_Children as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Resource_ID = 0
    BEGIN
    SET @Resource_ID = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @address_id2 = 0
    BEGIN
    SET @address_id2 = null
    END
	  IF @birthdate = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @birthdate = null
    END
	  IF @certification_number = ''
    BEGIN
    SET @certification_number = null
    END
	  IF @f_name = ''
    BEGIN
    SET @f_name = null
    END
	  IF @m_initial = ''
    BEGIN
    SET @m_initial = null
    END
	  IF @l_name = ''
    BEGIN
    SET @l_name = null
    END
	  IF @gender = ''
    BEGIN
    SET @gender = null
    END
	  IF @person_type = ''
    BEGIN
    SET @person_type = null
    END
	  IF @phone_primary = ''
    BEGIN
    SET @phone_primary = null
    END
	  IF @phone_secondary = ''
    BEGIN
    SET @phone_secondary = null
    END
	  IF @email = ''
    BEGIN
    SET @email = null
    END
	  IF @ssn = 0
    BEGIN
    SET @ssn = null
    END
	  IF @Maiden_Name = ''
    BEGIN
    SET @Maiden_Name = null
    END
	  IF @Visa_Issue_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Visa_Issue_Date = null
    END
	  IF @Visa_Expire_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Visa_Expire_Date = null
    END
	  IF @Visa_Selected_Value_B1 = 0
    BEGIN
    SET @Visa_Selected_Value_B1 = null
    END
	  IF @Visa_Selected_Value_B2 = 0
    BEGIN
    SET @Visa_Selected_Value_B2 = null
    END
	  IF @Visa_Selected_Value_K1 = 0
    BEGIN
    SET @Visa_Selected_Value_K1 = null
    END
	  IF @Visa_Selected_Value_K3 = 0
    BEGIN
    SET @Visa_Selected_Value_K3 = null
    END
	  IF @Visa_Selected_Value_L1 = 0
    BEGIN
    SET @Visa_Selected_Value_L1 = null
    END
	  IF @Visa_Selected_Value_L2 = 0
    BEGIN
    SET @Visa_Selected_Value_L2 = null
    END
	  IF @Visa_Selected_Value_H4 = 0
    BEGIN
    SET @Visa_Selected_Value_H4 = null
    END
	  IF @Visa_Selected_Value_F1 = 0
    BEGIN
    SET @Visa_Selected_Value_F1 = null
    END
	  IF @Visa_Selected_Value_J1 = 0
    BEGIN
    SET @Visa_Selected_Value_J1 = null
    END
	  IF @Visa_Selected_Value_M1 = 0
    BEGIN
    SET @Visa_Selected_Value_M1 = null
    END
	  IF @Visa_Selected_Value_H_1B = 0
    BEGIN
    SET @Visa_Selected_Value_H_1B = null
    END
	  IF @Visa_Selected_Value_H_2B = 0
    BEGIN
    SET @Visa_Selected_Value_H_2B = null
    END
	  IF @Visa_Selected_Value_B_2 = 0
    BEGIN
    SET @Visa_Selected_Value_B_2 = null
    END
	  IF @Visa_Selected_Value_Schengen = 0
    BEGIN
    SET @Visa_Selected_Value_Schengen = null
    END
	  IF @Perm_Resident_Alien_Resid_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Perm_Resident_Alien_Resid_Date = null
    END
	  IF @Perm_Resident_Alien_Expire_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Perm_Resident_Alien_Expire_Date = null
    END
	  IF @Perm_Resident_Alien_A_number = 0
    BEGIN
    SET @Perm_Resident_Alien_A_number = null
    END
	  IF @Perm_Resident_Alien_USCIS_number = 0
    BEGIN
    SET @Perm_Resident_Alien_USCIS_number = null
    END
	  IF @Perm_Resident_Alien_Birth_Country = ''
    BEGIN
    SET @Perm_Resident_Alien_Birth_Country = null
    END
	  IF @Perm_Resident_Alien_Category = ''
    BEGIN
    SET @Perm_Resident_Alien_Category = null
    END
	  IF @Driver_State_ID = ''
    BEGIN
    SET @Driver_State_ID = null
    END
	  IF @Citizenship = ''
    BEGIN
    SET @Citizenship = null
    END
	  IF @Marital_Status = ''
    BEGIN
    SET @Marital_Status = null
    END
	  IF @Minor_Children = 0
    BEGIN
    SET @Minor_Children = null
    END
	Insert INTO [dbo].[person]
           (
            [Resource_ID]
           ,[address_id]
           ,[address_id2]
           ,[birthdate]
           ,[certification_number]
           ,[f_name]
           ,[m_initial]
           ,[l_name]
           ,[gender]
           ,[person_type]
           ,[phone_primary]
           ,[phone_secondary]
           ,[email]
           ,[ssn]
           ,[Maiden_Name]
           ,[Visa_Issue_Date]
           ,[Visa_Expire_Date]
           ,[Visa_Selected_Value_B1]
           ,[Visa_Selected_Value_B2]
           ,[Visa_Selected_Value_K1]
           ,[Visa_Selected_Value_K3]
           ,[Visa_Selected_Value_L1]
           ,[Visa_Selected_Value_L2]
           ,[Visa_Selected_Value_H4]
           ,[Visa_Selected_Value_F1]
           ,[Visa_Selected_Value_J1]
           ,[Visa_Selected_Value_M1]
           ,[Visa_Selected_Value_H_1B]
           ,[Visa_Selected_Value_H_2B]
           ,[Visa_Selected_Value_B_2]
           ,[Visa_Selected_Value_Schengen]
           ,[Perm_Resident_Alien_Resid_Date]
           ,[Perm_Resident_Alien_Expire_Date]
           ,[Perm_Resident_Alien_A_number]
           ,[Perm_Resident_Alien_USCIS_number]
           ,[Perm_Resident_Alien_Birth_Country]
           ,[Perm_Resident_Alien_Category]
           ,[Driver_State_ID]
           ,[Citizenship]
           ,[Marital_Status]
           ,[Minor_Children]
            )
     VALUES (
            @Resource_ID
           ,@address_id
           ,@address_id2
           ,@birthdate
           ,@certification_number
           ,@f_name
           ,@m_initial
           ,@l_name
           ,@gender
           ,@person_type
           ,@phone_primary
           ,@phone_secondary
           ,@email
           ,@ssn
           ,@Maiden_Name
           ,@Visa_Issue_Date
           ,@Visa_Expire_Date
           ,@Visa_Selected_Value_B1
           ,@Visa_Selected_Value_B2
           ,@Visa_Selected_Value_K1
           ,@Visa_Selected_Value_K3
           ,@Visa_Selected_Value_L1
           ,@Visa_Selected_Value_L2
           ,@Visa_Selected_Value_H4
           ,@Visa_Selected_Value_F1
           ,@Visa_Selected_Value_J1
           ,@Visa_Selected_Value_M1
           ,@Visa_Selected_Value_H_1B
           ,@Visa_Selected_Value_H_2B
           ,@Visa_Selected_Value_B_2
           ,@Visa_Selected_Value_Schengen
           ,@Perm_Resident_Alien_Resid_Date
           ,@Perm_Resident_Alien_Expire_Date
           ,@Perm_Resident_Alien_A_number
           ,@Perm_Resident_Alien_USCIS_number
           ,@Perm_Resident_Alien_Birth_Country
           ,@Perm_Resident_Alien_Category
           ,@Driver_State_ID
           ,@Citizenship
           ,@Marital_Status
           ,@Minor_Children
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PERSON]    Script Date: 9/7/2015 11:22:58 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PERSON]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PERSON]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PERSON]
	  @person_id as int,
	  @Resource_ID as int,
	  @address_id as int,
	  @address_id2 as int,
	  @birthdate as datetime,
	  @certification_number as varchar(50),
	  @f_name as varchar(MAX),
	  @m_initial as char(1),
	  @l_name as varchar(MAX),
	  @gender as char(1),
	  @person_type as char(1),
	  @phone_primary as varchar(11),
	  @phone_secondary as varchar(11),
	  @email as varchar(50),
	  @ssn as int,
	  @Maiden_Name as varchar(50),
	  @Visa_Issue_Date as datetime,
	  @Visa_Expire_Date as datetime,
	  @Visa_Selected_Value_B1 as int,
	  @Visa_Selected_Value_B2 as int,
	  @Visa_Selected_Value_K1 as int,
	  @Visa_Selected_Value_K3 as int,
	  @Visa_Selected_Value_L1 as int,
	  @Visa_Selected_Value_L2 as int,
	  @Visa_Selected_Value_H4 as int,
	  @Visa_Selected_Value_F1 as int,
	  @Visa_Selected_Value_J1 as int,
	  @Visa_Selected_Value_M1 as int,
	  @Visa_Selected_Value_H_1B as int,
	  @Visa_Selected_Value_H_2B as int,
	  @Visa_Selected_Value_B_2 as int,
	  @Visa_Selected_Value_Schengen as int,
	  @Perm_Resident_Alien_Resid_Date as datetime,
	  @Perm_Resident_Alien_Expire_Date as datetime,
	  @Perm_Resident_Alien_A_number as int,
	  @Perm_Resident_Alien_USCIS_number as int,
	  @Perm_Resident_Alien_Birth_Country as varchar(50),
	  @Perm_Resident_Alien_Category as varchar(50),
	  @Driver_State_ID as varchar(15),
	  @Citizenship as varchar(3),
	  @Marital_Status as char(1)
	  @Minor_Children as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Resource_ID = 0
    BEGIN
    SET @Resource_ID = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @address_id2 = 0
    BEGIN
    SET @address_id2 = null
    END
	  IF @birthdate = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @birthdate = null
    END
	  IF @certification_number = ''
    BEGIN
    SET @certification_number = null
    END
	  IF @f_name = ''
    BEGIN
    SET @f_name = null
    END
	  IF @m_initial = ''
    BEGIN
    SET @m_initial = null
    END
	  IF @l_name = ''
    BEGIN
    SET @l_name = null
    END
	  IF @gender = ''
    BEGIN
    SET @gender = null
    END
	  IF @person_type = ''
    BEGIN
    SET @person_type = null
    END
	  IF @phone_primary = ''
    BEGIN
    SET @phone_primary = null
    END
	  IF @phone_secondary = ''
    BEGIN
    SET @phone_secondary = null
    END
	  IF @email = ''
    BEGIN
    SET @email = null
    END
	  IF @ssn = 0
    BEGIN
    SET @ssn = null
    END
	  IF @Maiden_Name = ''
    BEGIN
    SET @Maiden_Name = null
    END
	  IF @Visa_Issue_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Visa_Issue_Date = null
    END
	  IF @Visa_Expire_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Visa_Expire_Date = null
    END
	  IF @Visa_Selected_Value_B1 = 0
    BEGIN
    SET @Visa_Selected_Value_B1 = null
    END
	  IF @Visa_Selected_Value_B2 = 0
    BEGIN
    SET @Visa_Selected_Value_B2 = null
    END
	  IF @Visa_Selected_Value_K1 = 0
    BEGIN
    SET @Visa_Selected_Value_K1 = null
    END
	  IF @Visa_Selected_Value_K3 = 0
    BEGIN
    SET @Visa_Selected_Value_K3 = null
    END
	  IF @Visa_Selected_Value_L1 = 0
    BEGIN
    SET @Visa_Selected_Value_L1 = null
    END
	  IF @Visa_Selected_Value_L2 = 0
    BEGIN
    SET @Visa_Selected_Value_L2 = null
    END
	  IF @Visa_Selected_Value_H4 = 0
    BEGIN
    SET @Visa_Selected_Value_H4 = null
    END
	  IF @Visa_Selected_Value_F1 = 0
    BEGIN
    SET @Visa_Selected_Value_F1 = null
    END
	  IF @Visa_Selected_Value_J1 = 0
    BEGIN
    SET @Visa_Selected_Value_J1 = null
    END
	  IF @Visa_Selected_Value_M1 = 0
    BEGIN
    SET @Visa_Selected_Value_M1 = null
    END
	  IF @Visa_Selected_Value_H_1B = 0
    BEGIN
    SET @Visa_Selected_Value_H_1B = null
    END
	  IF @Visa_Selected_Value_H_2B = 0
    BEGIN
    SET @Visa_Selected_Value_H_2B = null
    END
	  IF @Visa_Selected_Value_B_2 = 0
    BEGIN
    SET @Visa_Selected_Value_B_2 = null
    END
	  IF @Visa_Selected_Value_Schengen = 0
    BEGIN
    SET @Visa_Selected_Value_Schengen = null
    END
	  IF @Perm_Resident_Alien_Resid_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Perm_Resident_Alien_Resid_Date = null
    END
	  IF @Perm_Resident_Alien_Expire_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Perm_Resident_Alien_Expire_Date = null
    END
	  IF @Perm_Resident_Alien_A_number = 0
    BEGIN
    SET @Perm_Resident_Alien_A_number = null
    END
	  IF @Perm_Resident_Alien_USCIS_number = 0
    BEGIN
    SET @Perm_Resident_Alien_USCIS_number = null
    END
	  IF @Perm_Resident_Alien_Birth_Country = ''
    BEGIN
    SET @Perm_Resident_Alien_Birth_Country = null
    END
	  IF @Perm_Resident_Alien_Category = ''
    BEGIN
    SET @Perm_Resident_Alien_Category = null
    END
	  IF @Driver_State_ID = ''
    BEGIN
    SET @Driver_State_ID = null
    END
	  IF @Citizenship = ''
    BEGIN
    SET @Citizenship = null
    END
	  IF @Marital_Status = ''
    BEGIN
    SET @Marital_Status = null
    END
	  IF @Minor_Children = 0
    BEGIN
    SET @Minor_Children = null
    END
	UPDATE [dbo].[person]
       SET
		   [Resource_ID] = @Resource_ID,
		   [address_id] = @address_id,
		   [address_id2] = @address_id2,
		   [birthdate] = @birthdate,
		   [certification_number] = @certification_number,
		   [f_name] = @f_name,
		   [m_initial] = @m_initial,
		   [l_name] = @l_name,
		   [gender] = @gender,
		   [person_type] = @person_type,
		   [phone_primary] = @phone_primary,
		   [phone_secondary] = @phone_secondary,
		   [email] = @email,
		   [ssn] = @ssn,
		   [Maiden_Name] = @Maiden_Name,
		   [Visa_Issue_Date] = @Visa_Issue_Date,
		   [Visa_Expire_Date] = @Visa_Expire_Date,
		   [Visa_Selected_Value_B1] = @Visa_Selected_Value_B1,
		   [Visa_Selected_Value_B2] = @Visa_Selected_Value_B2,
		   [Visa_Selected_Value_K1] = @Visa_Selected_Value_K1,
		   [Visa_Selected_Value_K3] = @Visa_Selected_Value_K3,
		   [Visa_Selected_Value_L1] = @Visa_Selected_Value_L1,
		   [Visa_Selected_Value_L2] = @Visa_Selected_Value_L2,
		   [Visa_Selected_Value_H4] = @Visa_Selected_Value_H4,
		   [Visa_Selected_Value_F1] = @Visa_Selected_Value_F1,
		   [Visa_Selected_Value_J1] = @Visa_Selected_Value_J1,
		   [Visa_Selected_Value_M1] = @Visa_Selected_Value_M1,
		   [Visa_Selected_Value_H_1B] = @Visa_Selected_Value_H_1B,
		   [Visa_Selected_Value_H_2B] = @Visa_Selected_Value_H_2B,
		   [Visa_Selected_Value_B_2] = @Visa_Selected_Value_B_2,
		   [Visa_Selected_Value_Schengen] = @Visa_Selected_Value_Schengen,
		   [Perm_Resident_Alien_Resid_Date] = @Perm_Resident_Alien_Resid_Date,
		   [Perm_Resident_Alien_Expire_Date] = @Perm_Resident_Alien_Expire_Date,
		   [Perm_Resident_Alien_A_number] = @Perm_Resident_Alien_A_number,
		   [Perm_Resident_Alien_USCIS_number] = @Perm_Resident_Alien_USCIS_number,
		   [Perm_Resident_Alien_Birth_Country] = @Perm_Resident_Alien_Birth_Country,
		   [Perm_Resident_Alien_Category] = @Perm_Resident_Alien_Category,
		   [Driver_State_ID] = @Driver_State_ID,
		   [Citizenship] = @Citizenship,
		   [Marital_Status] = @Marital_Status,
		   [Minor_Children] = @Minor_Children
       WHERE person_id = @person_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PERSON]    Script Date: 9/7/2015 11:22:58 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PERSON]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PERSON]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PERSON]
	@person_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.person
	where person_id = @person_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PERSON]    Script Date: 9/7/2015 11:22:58 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PERSON]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PERSON]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PERSON]
	  @Resource_ID as int,
	  @address_id as int,
	  @address_id2 as int,
	  @birthdate as datetime,
	  @certification_number as varchar(50),
	  @f_name as varchar(MAX),
	  @m_initial as char(1),
	  @l_name as varchar(MAX),
	  @gender as char(1),
	  @person_type as char(1),
	  @phone_primary as varchar(11),
	  @phone_secondary as varchar(11),
	  @email as varchar(50),
	  @ssn as int,
	  @Maiden_Name as varchar(50),
	  @Visa_Issue_Date as datetime,
	  @Visa_Expire_Date as datetime,
	  @Visa_Selected_Value_B1 as int,
	  @Visa_Selected_Value_B2 as int,
	  @Visa_Selected_Value_K1 as int,
	  @Visa_Selected_Value_K3 as int,
	  @Visa_Selected_Value_L1 as int,
	  @Visa_Selected_Value_L2 as int,
	  @Visa_Selected_Value_H4 as int,
	  @Visa_Selected_Value_F1 as int,
	  @Visa_Selected_Value_J1 as int,
	  @Visa_Selected_Value_M1 as int,
	  @Visa_Selected_Value_H_1B as int,
	  @Visa_Selected_Value_H_2B as int,
	  @Visa_Selected_Value_B_2 as int,
	  @Visa_Selected_Value_Schengen as int,
	  @Perm_Resident_Alien_Resid_Date as datetime,
	  @Perm_Resident_Alien_Expire_Date as datetime,
	  @Perm_Resident_Alien_A_number as int,
	  @Perm_Resident_Alien_USCIS_number as int,
	  @Perm_Resident_Alien_Birth_Country as varchar(50),
	  @Perm_Resident_Alien_Category as varchar(50),
	  @Driver_State_ID as varchar(15),
	  @Citizenship as varchar(3),
	  @Marital_Status as char(1)
	  @Minor_Children as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Resource_ID = 0
    BEGIN
    SET @Resource_ID = null
    END
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @address_id2 = 0
    BEGIN
    SET @address_id2 = null
    END
	  IF @birthdate = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @birthdate = null
    END
	  IF @certification_number = ''
    BEGIN
    SET @certification_number = null
    END
	  IF @f_name = ''
    BEGIN
    SET @f_name = null
    END
	  IF @m_initial = ''
    BEGIN
    SET @m_initial = null
    END
	  IF @l_name = ''
    BEGIN
    SET @l_name = null
    END
	  IF @gender = ''
    BEGIN
    SET @gender = null
    END
	  IF @person_type = ''
    BEGIN
    SET @person_type = null
    END
	  IF @phone_primary = ''
    BEGIN
    SET @phone_primary = null
    END
	  IF @phone_secondary = ''
    BEGIN
    SET @phone_secondary = null
    END
	  IF @email = ''
    BEGIN
    SET @email = null
    END
	  IF @ssn = 0
    BEGIN
    SET @ssn = null
    END
	  IF @Maiden_Name = ''
    BEGIN
    SET @Maiden_Name = null
    END
	  IF @Visa_Issue_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Visa_Issue_Date = null
    END
	  IF @Visa_Expire_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Visa_Expire_Date = null
    END
	  IF @Visa_Selected_Value_B1 = 0
    BEGIN
    SET @Visa_Selected_Value_B1 = null
    END
	  IF @Visa_Selected_Value_B2 = 0
    BEGIN
    SET @Visa_Selected_Value_B2 = null
    END
	  IF @Visa_Selected_Value_K1 = 0
    BEGIN
    SET @Visa_Selected_Value_K1 = null
    END
	  IF @Visa_Selected_Value_K3 = 0
    BEGIN
    SET @Visa_Selected_Value_K3 = null
    END
	  IF @Visa_Selected_Value_L1 = 0
    BEGIN
    SET @Visa_Selected_Value_L1 = null
    END
	  IF @Visa_Selected_Value_L2 = 0
    BEGIN
    SET @Visa_Selected_Value_L2 = null
    END
	  IF @Visa_Selected_Value_H4 = 0
    BEGIN
    SET @Visa_Selected_Value_H4 = null
    END
	  IF @Visa_Selected_Value_F1 = 0
    BEGIN
    SET @Visa_Selected_Value_F1 = null
    END
	  IF @Visa_Selected_Value_J1 = 0
    BEGIN
    SET @Visa_Selected_Value_J1 = null
    END
	  IF @Visa_Selected_Value_M1 = 0
    BEGIN
    SET @Visa_Selected_Value_M1 = null
    END
	  IF @Visa_Selected_Value_H_1B = 0
    BEGIN
    SET @Visa_Selected_Value_H_1B = null
    END
	  IF @Visa_Selected_Value_H_2B = 0
    BEGIN
    SET @Visa_Selected_Value_H_2B = null
    END
	  IF @Visa_Selected_Value_B_2 = 0
    BEGIN
    SET @Visa_Selected_Value_B_2 = null
    END
	  IF @Visa_Selected_Value_Schengen = 0
    BEGIN
    SET @Visa_Selected_Value_Schengen = null
    END
	  IF @Perm_Resident_Alien_Resid_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Perm_Resident_Alien_Resid_Date = null
    END
	  IF @Perm_Resident_Alien_Expire_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Perm_Resident_Alien_Expire_Date = null
    END
	  IF @Perm_Resident_Alien_A_number = 0
    BEGIN
    SET @Perm_Resident_Alien_A_number = null
    END
	  IF @Perm_Resident_Alien_USCIS_number = 0
    BEGIN
    SET @Perm_Resident_Alien_USCIS_number = null
    END
	  IF @Perm_Resident_Alien_Birth_Country = ''
    BEGIN
    SET @Perm_Resident_Alien_Birth_Country = null
    END
	  IF @Perm_Resident_Alien_Category = ''
    BEGIN
    SET @Perm_Resident_Alien_Category = null
    END
	  IF @Driver_State_ID = ''
    BEGIN
    SET @Driver_State_ID = null
    END
	  IF @Citizenship = ''
    BEGIN
    SET @Citizenship = null
    END
	  IF @Marital_Status = ''
    BEGIN
    SET @Marital_Status = null
    END
	  IF @Minor_Children = 0
    BEGIN
    SET @Minor_Children = null
    END
    SELECT [person_id] 
      FROM [dbo].[person] 
       WHERE ([Resource_ID] = @Resource_ID or [Resource_ID] is null)
       AND ([address_id] = @address_id)
       AND ([address_id2] = @address_id2 or [address_id2] is null)
       AND ([birthdate] = @birthdate or [birthdate] is null)
       AND ([certification_number] like @certification_number or [certification_number] is null)
       AND ([f_name] like @f_name)
       AND ([m_initial] = @m_initial or [m_initial] is null)
       AND ([l_name] like @l_name)
       AND ([gender] = @gender or [gender] is null)
       AND ([person_type] = @person_type)
       AND ([phone_primary] like @phone_primary or [phone_primary] is null)
       AND ([phone_secondary] like @phone_secondary or [phone_secondary] is null)
       AND ([email] like @email or [email] is null)
       AND ([ssn] = @ssn or [ssn] is null)
       AND ([Maiden_Name] like @Maiden_Name or [Maiden_Name] is null)
       AND ([Visa_Issue_Date] = @Visa_Issue_Date or [Visa_Issue_Date] is null)
       AND ([Visa_Expire_Date] = @Visa_Expire_Date or [Visa_Expire_Date] is null)
       AND ([Visa_Selected_Value_B1] = @Visa_Selected_Value_B1 or [Visa_Selected_Value_B1] is null)
       AND ([Visa_Selected_Value_B2] = @Visa_Selected_Value_B2 or [Visa_Selected_Value_B2] is null)
       AND ([Visa_Selected_Value_K1] = @Visa_Selected_Value_K1 or [Visa_Selected_Value_K1] is null)
       AND ([Visa_Selected_Value_K3] = @Visa_Selected_Value_K3 or [Visa_Selected_Value_K3] is null)
       AND ([Visa_Selected_Value_L1] = @Visa_Selected_Value_L1 or [Visa_Selected_Value_L1] is null)
       AND ([Visa_Selected_Value_L2] = @Visa_Selected_Value_L2 or [Visa_Selected_Value_L2] is null)
       AND ([Visa_Selected_Value_H4] = @Visa_Selected_Value_H4 or [Visa_Selected_Value_H4] is null)
       AND ([Visa_Selected_Value_F1] = @Visa_Selected_Value_F1 or [Visa_Selected_Value_F1] is null)
       AND ([Visa_Selected_Value_J1] = @Visa_Selected_Value_J1 or [Visa_Selected_Value_J1] is null)
       AND ([Visa_Selected_Value_M1] = @Visa_Selected_Value_M1 or [Visa_Selected_Value_M1] is null)
       AND ([Visa_Selected_Value_H_1B] = @Visa_Selected_Value_H_1B or [Visa_Selected_Value_H_1B] is null)
       AND ([Visa_Selected_Value_H_2B] = @Visa_Selected_Value_H_2B or [Visa_Selected_Value_H_2B] is null)
       AND ([Visa_Selected_Value_B_2] = @Visa_Selected_Value_B_2 or [Visa_Selected_Value_B_2] is null)
       AND ([Visa_Selected_Value_Schengen] = @Visa_Selected_Value_Schengen or [Visa_Selected_Value_Schengen] is null)
       AND ([Perm_Resident_Alien_Resid_Date] = @Perm_Resident_Alien_Resid_Date or [Perm_Resident_Alien_Resid_Date] is null)
       AND ([Perm_Resident_Alien_Expire_Date] = @Perm_Resident_Alien_Expire_Date or [Perm_Resident_Alien_Expire_Date] is null)
       AND ([Perm_Resident_Alien_A_number] = @Perm_Resident_Alien_A_number or [Perm_Resident_Alien_A_number] is null)
       AND ([Perm_Resident_Alien_USCIS_number] = @Perm_Resident_Alien_USCIS_number or [Perm_Resident_Alien_USCIS_number] is null)
       AND ([Perm_Resident_Alien_Birth_Country] like @Perm_Resident_Alien_Birth_Country or [Perm_Resident_Alien_Birth_Country] is null)
       AND ([Perm_Resident_Alien_Category] like @Perm_Resident_Alien_Category or [Perm_Resident_Alien_Category] is null)
       AND ([Driver_State_ID] like @Driver_State_ID or [Driver_State_ID] is null)
       AND ([Citizenship] like @Citizenship or [Citizenship] is null)
       AND ([Marital_Status] = @Marital_Status or [Marital_Status] is null)
       AND ([Minor_Children] = @Minor_Children or [Minor_Children] is null)
END
GO

