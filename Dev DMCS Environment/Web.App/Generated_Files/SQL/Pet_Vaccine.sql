/****** Object:  Table [dbo].[Pet_Vaccine]    Script Date: 9/7/2015 11:23:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pet_Vaccine](
  [Pet_Vaccine_ID] int IDENTITY(1,1) NOT NULL,
  [Vaccine_Type_ID] int NOT NULL,
  [Allergies] varchar(MAX) NULL,
  [Current_Medacations] varchar(MAX) NULL,
  [Last_Vaccine_Given] datetime NULL,
  [Date_Time_Stamp] datetime NOT NULL,
 CONSTRAINT [Pet_Vaccine_Pet_Vaccine_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Pet_Vaccine_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PET_VACCINE]    Script Date: 9/7/2015 11:23:04 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PET_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PET_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PET_VACCINE]
           @Pet_Vaccine_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Pet_Vaccine_ID]
      ,[Vaccine_Type_ID]
      ,[Allergies]
      ,[Current_Medacations]
      ,[Last_Vaccine_Given]
      ,[Date_Time_Stamp]
  FROM [dbo].[Pet_Vaccine]
 WHERE Pet_Vaccine_ID = @Pet_Vaccine_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PET_VACCINE]    Script Date: 9/7/2015 11:23:04 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PET_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PET_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PET_VACCINE]
	  @Vaccine_Type_ID as int,
	  @Allergies as varchar(MAX),
	  @Current_Medacations as varchar(MAX),
	  @Last_Vaccine_Given as datetime
	  @Date_Time_Stamp as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Vaccine_Type_ID = 0
    BEGIN
    SET @Vaccine_Type_ID = null
    END
	  IF @Allergies = ''
    BEGIN
    SET @Allergies = null
    END
	  IF @Current_Medacations = ''
    BEGIN
    SET @Current_Medacations = null
    END
	  IF @Last_Vaccine_Given = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Last_Vaccine_Given = null
    END
	  IF @Date_Time_Stamp = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Time_Stamp = null
    END
	Insert INTO [dbo].[Pet_Vaccine]
           (
            [Vaccine_Type_ID]
           ,[Allergies]
           ,[Current_Medacations]
           ,[Last_Vaccine_Given]
           ,[Date_Time_Stamp]
            )
     VALUES (
            @Vaccine_Type_ID
           ,@Allergies
           ,@Current_Medacations
           ,@Last_Vaccine_Given
           ,@Date_Time_Stamp
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PET_VACCINE]    Script Date: 9/7/2015 11:23:04 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PET_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PET_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PET_VACCINE]
	  @Pet_Vaccine_ID as int,
	  @Vaccine_Type_ID as int,
	  @Allergies as varchar(MAX),
	  @Current_Medacations as varchar(MAX),
	  @Last_Vaccine_Given as datetime
	  @Date_Time_Stamp as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Vaccine_Type_ID = 0
    BEGIN
    SET @Vaccine_Type_ID = null
    END
	  IF @Allergies = ''
    BEGIN
    SET @Allergies = null
    END
	  IF @Current_Medacations = ''
    BEGIN
    SET @Current_Medacations = null
    END
	  IF @Last_Vaccine_Given = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Last_Vaccine_Given = null
    END
	  IF @Date_Time_Stamp = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Time_Stamp = null
    END
	UPDATE [dbo].[Pet_Vaccine]
       SET
		   [Vaccine_Type_ID] = @Vaccine_Type_ID,
		   [Allergies] = @Allergies,
		   [Current_Medacations] = @Current_Medacations,
		   [Last_Vaccine_Given] = @Last_Vaccine_Given,
		   [Date_Time_Stamp] = @Date_Time_Stamp
       WHERE Pet_Vaccine_ID = @Pet_Vaccine_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PET_VACCINE]    Script Date: 9/7/2015 11:23:04 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PET_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PET_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PET_VACCINE]
	@Pet_Vaccine_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Pet_Vaccine
	where Pet_Vaccine_ID = @Pet_Vaccine_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PET_VACCINE]    Script Date: 9/7/2015 11:23:04 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PET_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PET_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PET_VACCINE]
	  @Vaccine_Type_ID as int,
	  @Allergies as varchar(MAX),
	  @Current_Medacations as varchar(MAX),
	  @Last_Vaccine_Given as datetime
	  @Date_Time_Stamp as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Vaccine_Type_ID = 0
    BEGIN
    SET @Vaccine_Type_ID = null
    END
	  IF @Allergies = ''
    BEGIN
    SET @Allergies = null
    END
	  IF @Current_Medacations = ''
    BEGIN
    SET @Current_Medacations = null
    END
	  IF @Last_Vaccine_Given = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Last_Vaccine_Given = null
    END
	  IF @Date_Time_Stamp = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Time_Stamp = null
    END
    SELECT [Pet_Vaccine_ID] 
      FROM [dbo].[Pet_Vaccine] 
       WHERE ([Vaccine_Type_ID] = @Vaccine_Type_ID)
       AND ([Allergies] like @Allergies or [Allergies] is null)
       AND ([Current_Medacations] like @Current_Medacations or [Current_Medacations] is null)
       AND ([Last_Vaccine_Given] = @Last_Vaccine_Given or [Last_Vaccine_Given] is null)
       AND ([Date_Time_Stamp] = @Date_Time_Stamp)
END
GO

