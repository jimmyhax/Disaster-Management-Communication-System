/****** Object:  Table [dbo].[Pet]    Script Date: 9/7/2015 11:22:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pet](
  [Pet_Record_ID] int IDENTITY(1,1) NOT NULL,
  [Pet_Location_Found_ID] int NULL,
  [Pet_Type_ID] int NULL,
  [Pet_Vet_ID] varchar(50) NULL,
  [Pet_License_Tag] varchar(50) NULL,
  [Pet_RFID] varchar(MAX) NULL,
  [Pet_Tatoo_No] varchar(50) NULL,
  [Pet_Name] varchar(50) NOT NULL,
  [Pet_Gender] char(1) NOT NULL,
  [Pet_Color] varchar(50) NOT NULL,
  [Pet_Weight] int NULL,
  [Pet_Description] varchar(MAX) NOT NULL,
  [Pet_Condition] varchar(MAX) NOT NULL,
  [Pet_Status] varchar(MAX) NOT NULL,
  [Pet_Date_Of_Birth] datetime NULL,
  [Pet_Picture] varbinary(MAX) NULL,
  [Pet_Sterilized] char(1) NULL,
  [Date_Modified] datetime NOT NULL,
  [Date_Created] datetime NOT NULL,
 CONSTRAINT [Pet_Pet_Record_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Pet_Record_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PET]    Script Date: 9/7/2015 11:22:59 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PET]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PET]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PET]
           @Pet_Record_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Pet_Record_ID]
      ,[Pet_Location_Found_ID]
      ,[Pet_Type_ID]
      ,[Pet_Vet_ID]
      ,[Pet_License_Tag]
      ,[Pet_RFID]
      ,[Pet_Tatoo_No]
      ,[Pet_Name]
      ,[Pet_Gender]
      ,[Pet_Color]
      ,[Pet_Weight]
      ,[Pet_Description]
      ,[Pet_Condition]
      ,[Pet_Status]
      ,[Pet_Date_Of_Birth]
      ,[Pet_Picture]
      ,[Pet_Sterilized]
      ,[Date_Modified]
      ,[Date_Created]
  FROM [dbo].[Pet]
 WHERE Pet_Record_ID = @Pet_Record_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PET]    Script Date: 9/7/2015 11:22:59 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PET]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PET]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PET]
	  @Pet_Location_Found_ID as int,
	  @Pet_Type_ID as int,
	  @Pet_Vet_ID as varchar(50),
	  @Pet_License_Tag as varchar(50),
	  @Pet_RFID as varchar(MAX),
	  @Pet_Tatoo_No as varchar(50),
	  @Pet_Name as varchar(50),
	  @Pet_Gender as char(1),
	  @Pet_Color as varchar(50),
	  @Pet_Weight as int,
	  @Pet_Description as varchar(MAX),
	  @Pet_Condition as varchar(MAX),
	  @Pet_Status as varchar(MAX),
	  @Pet_Date_Of_Birth as datetime,
	  @Pet_Picture as varbinary(MAX),
	  @Pet_Sterilized as char(1),
	  @Date_Modified as datetime
	  @Date_Created as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Pet_Location_Found_ID = 0
    BEGIN
    SET @Pet_Location_Found_ID = null
    END
	  IF @Pet_Type_ID = 0
    BEGIN
    SET @Pet_Type_ID = null
    END
	  IF @Pet_Vet_ID = ''
    BEGIN
    SET @Pet_Vet_ID = null
    END
	  IF @Pet_License_Tag = ''
    BEGIN
    SET @Pet_License_Tag = null
    END
	  IF @Pet_RFID = ''
    BEGIN
    SET @Pet_RFID = null
    END
	  IF @Pet_Tatoo_No = ''
    BEGIN
    SET @Pet_Tatoo_No = null
    END
	  IF @Pet_Name = ''
    BEGIN
    SET @Pet_Name = null
    END
	  IF @Pet_Gender = ''
    BEGIN
    SET @Pet_Gender = null
    END
	  IF @Pet_Color = ''
    BEGIN
    SET @Pet_Color = null
    END
	  IF @Pet_Weight = 0
    BEGIN
    SET @Pet_Weight = null
    END
	  IF @Pet_Description = ''
    BEGIN
    SET @Pet_Description = null
    END
	  IF @Pet_Condition = ''
    BEGIN
    SET @Pet_Condition = null
    END
	  IF @Pet_Status = ''
    BEGIN
    SET @Pet_Status = null
    END
	  IF @Pet_Date_Of_Birth = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Pet_Date_Of_Birth = null
    END
	  IF @Pet_Picture = 0
    BEGIN
    SET @Pet_Picture = null
    END
	  IF @Pet_Sterilized = ''
    BEGIN
    SET @Pet_Sterilized = null
    END
	  IF @Date_Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Modified = null
    END
	  IF @Date_Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Created = null
    END
	Insert INTO [dbo].[Pet]
           (
            [Pet_Location_Found_ID]
           ,[Pet_Type_ID]
           ,[Pet_Vet_ID]
           ,[Pet_License_Tag]
           ,[Pet_RFID]
           ,[Pet_Tatoo_No]
           ,[Pet_Name]
           ,[Pet_Gender]
           ,[Pet_Color]
           ,[Pet_Weight]
           ,[Pet_Description]
           ,[Pet_Condition]
           ,[Pet_Status]
           ,[Pet_Date_Of_Birth]
           ,[Pet_Picture]
           ,[Pet_Sterilized]
           ,[Date_Modified]
           ,[Date_Created]
            )
     VALUES (
            @Pet_Location_Found_ID
           ,@Pet_Type_ID
           ,@Pet_Vet_ID
           ,@Pet_License_Tag
           ,@Pet_RFID
           ,@Pet_Tatoo_No
           ,@Pet_Name
           ,@Pet_Gender
           ,@Pet_Color
           ,@Pet_Weight
           ,@Pet_Description
           ,@Pet_Condition
           ,@Pet_Status
           ,@Pet_Date_Of_Birth
           ,@Pet_Picture
           ,@Pet_Sterilized
           ,@Date_Modified
           ,@Date_Created
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PET]    Script Date: 9/7/2015 11:22:59 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PET]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PET]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PET]
	  @Pet_Record_ID as int,
	  @Pet_Location_Found_ID as int,
	  @Pet_Type_ID as int,
	  @Pet_Vet_ID as varchar(50),
	  @Pet_License_Tag as varchar(50),
	  @Pet_RFID as varchar(MAX),
	  @Pet_Tatoo_No as varchar(50),
	  @Pet_Name as varchar(50),
	  @Pet_Gender as char(1),
	  @Pet_Color as varchar(50),
	  @Pet_Weight as int,
	  @Pet_Description as varchar(MAX),
	  @Pet_Condition as varchar(MAX),
	  @Pet_Status as varchar(MAX),
	  @Pet_Date_Of_Birth as datetime,
	  @Pet_Picture as varbinary(MAX),
	  @Pet_Sterilized as char(1),
	  @Date_Modified as datetime
	  @Date_Created as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Pet_Location_Found_ID = 0
    BEGIN
    SET @Pet_Location_Found_ID = null
    END
	  IF @Pet_Type_ID = 0
    BEGIN
    SET @Pet_Type_ID = null
    END
	  IF @Pet_Vet_ID = ''
    BEGIN
    SET @Pet_Vet_ID = null
    END
	  IF @Pet_License_Tag = ''
    BEGIN
    SET @Pet_License_Tag = null
    END
	  IF @Pet_RFID = ''
    BEGIN
    SET @Pet_RFID = null
    END
	  IF @Pet_Tatoo_No = ''
    BEGIN
    SET @Pet_Tatoo_No = null
    END
	  IF @Pet_Name = ''
    BEGIN
    SET @Pet_Name = null
    END
	  IF @Pet_Gender = ''
    BEGIN
    SET @Pet_Gender = null
    END
	  IF @Pet_Color = ''
    BEGIN
    SET @Pet_Color = null
    END
	  IF @Pet_Weight = 0
    BEGIN
    SET @Pet_Weight = null
    END
	  IF @Pet_Description = ''
    BEGIN
    SET @Pet_Description = null
    END
	  IF @Pet_Condition = ''
    BEGIN
    SET @Pet_Condition = null
    END
	  IF @Pet_Status = ''
    BEGIN
    SET @Pet_Status = null
    END
	  IF @Pet_Date_Of_Birth = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Pet_Date_Of_Birth = null
    END
	  IF @Pet_Picture = 0
    BEGIN
    SET @Pet_Picture = null
    END
	  IF @Pet_Sterilized = ''
    BEGIN
    SET @Pet_Sterilized = null
    END
	  IF @Date_Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Modified = null
    END
	  IF @Date_Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Created = null
    END
	UPDATE [dbo].[Pet]
       SET
		   [Pet_Location_Found_ID] = @Pet_Location_Found_ID,
		   [Pet_Type_ID] = @Pet_Type_ID,
		   [Pet_Vet_ID] = @Pet_Vet_ID,
		   [Pet_License_Tag] = @Pet_License_Tag,
		   [Pet_RFID] = @Pet_RFID,
		   [Pet_Tatoo_No] = @Pet_Tatoo_No,
		   [Pet_Name] = @Pet_Name,
		   [Pet_Gender] = @Pet_Gender,
		   [Pet_Color] = @Pet_Color,
		   [Pet_Weight] = @Pet_Weight,
		   [Pet_Description] = @Pet_Description,
		   [Pet_Condition] = @Pet_Condition,
		   [Pet_Status] = @Pet_Status,
		   [Pet_Date_Of_Birth] = @Pet_Date_Of_Birth,
		   [Pet_Picture] = @Pet_Picture,
		   [Pet_Sterilized] = @Pet_Sterilized,
		   [Date_Modified] = @Date_Modified,
		   [Date_Created] = @Date_Created
       WHERE Pet_Record_ID = @Pet_Record_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PET]    Script Date: 9/7/2015 11:22:59 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PET]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PET]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PET]
	@Pet_Record_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Pet
	where Pet_Record_ID = @Pet_Record_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PET]    Script Date: 9/7/2015 11:22:59 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PET]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PET]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PET]
	  @Pet_Location_Found_ID as int,
	  @Pet_Type_ID as int,
	  @Pet_Vet_ID as varchar(50),
	  @Pet_License_Tag as varchar(50),
	  @Pet_RFID as varchar(MAX),
	  @Pet_Tatoo_No as varchar(50),
	  @Pet_Name as varchar(50),
	  @Pet_Gender as char(1),
	  @Pet_Color as varchar(50),
	  @Pet_Weight as int,
	  @Pet_Description as varchar(MAX),
	  @Pet_Condition as varchar(MAX),
	  @Pet_Status as varchar(MAX),
	  @Pet_Date_Of_Birth as datetime,
	  @Pet_Picture as varbinary(MAX),
	  @Pet_Sterilized as char(1),
	  @Date_Modified as datetime
	  @Date_Created as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Pet_Location_Found_ID = 0
    BEGIN
    SET @Pet_Location_Found_ID = null
    END
	  IF @Pet_Type_ID = 0
    BEGIN
    SET @Pet_Type_ID = null
    END
	  IF @Pet_Vet_ID = ''
    BEGIN
    SET @Pet_Vet_ID = null
    END
	  IF @Pet_License_Tag = ''
    BEGIN
    SET @Pet_License_Tag = null
    END
	  IF @Pet_RFID = ''
    BEGIN
    SET @Pet_RFID = null
    END
	  IF @Pet_Tatoo_No = ''
    BEGIN
    SET @Pet_Tatoo_No = null
    END
	  IF @Pet_Name = ''
    BEGIN
    SET @Pet_Name = null
    END
	  IF @Pet_Gender = ''
    BEGIN
    SET @Pet_Gender = null
    END
	  IF @Pet_Color = ''
    BEGIN
    SET @Pet_Color = null
    END
	  IF @Pet_Weight = 0
    BEGIN
    SET @Pet_Weight = null
    END
	  IF @Pet_Description = ''
    BEGIN
    SET @Pet_Description = null
    END
	  IF @Pet_Condition = ''
    BEGIN
    SET @Pet_Condition = null
    END
	  IF @Pet_Status = ''
    BEGIN
    SET @Pet_Status = null
    END
	  IF @Pet_Date_Of_Birth = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Pet_Date_Of_Birth = null
    END
	  IF @Pet_Picture = 0
    BEGIN
    SET @Pet_Picture = null
    END
	  IF @Pet_Sterilized = ''
    BEGIN
    SET @Pet_Sterilized = null
    END
	  IF @Date_Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Modified = null
    END
	  IF @Date_Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Created = null
    END
    SELECT [Pet_Record_ID] 
      FROM [dbo].[Pet] 
       WHERE ([Pet_Location_Found_ID] = @Pet_Location_Found_ID or [Pet_Location_Found_ID] is null)
       AND ([Pet_Type_ID] = @Pet_Type_ID or [Pet_Type_ID] is null)
       AND ([Pet_Vet_ID] like @Pet_Vet_ID or [Pet_Vet_ID] is null)
       AND ([Pet_License_Tag] like @Pet_License_Tag or [Pet_License_Tag] is null)
       AND ([Pet_RFID] like @Pet_RFID or [Pet_RFID] is null)
       AND ([Pet_Tatoo_No] like @Pet_Tatoo_No or [Pet_Tatoo_No] is null)
       AND ([Pet_Name] like @Pet_Name)
       AND ([Pet_Gender] = @Pet_Gender)
       AND ([Pet_Color] like @Pet_Color)
       AND ([Pet_Weight] = @Pet_Weight or [Pet_Weight] is null)
       AND ([Pet_Description] like @Pet_Description)
       AND ([Pet_Condition] like @Pet_Condition)
       AND ([Pet_Status] like @Pet_Status)
       AND ([Pet_Date_Of_Birth] = @Pet_Date_Of_Birth or [Pet_Date_Of_Birth] is null)
       AND ([Pet_Picture] = @Pet_Picture or [Pet_Picture] is null)
       AND ([Pet_Sterilized] = @Pet_Sterilized or [Pet_Sterilized] is null)
       AND ([Date_Modified] = @Date_Modified)
       AND ([Date_Created] = @Date_Created)
END
GO

