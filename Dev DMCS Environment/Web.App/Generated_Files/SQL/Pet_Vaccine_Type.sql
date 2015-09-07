/****** Object:  Table [dbo].[Pet_Vaccine_Type]    Script Date: 9/7/2015 11:23:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pet_Vaccine_Type](
  [Vaccine_Type_ID] int IDENTITY(1,1) NOT NULL,
  [Vaccine_Name] varchar(50) NOT NULL,
  [Vaccine_Reactions] varchar(50) NULL,
  [Vaccine_Type] varchar(50) NOT NULL,
  [Vaccine_Description] varchar(MAX) NULL,
 CONSTRAINT [Pet_Vaccine_Type_Vaccine_Type_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Vaccine_Type_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PET_VACCINE_TYPE]    Script Date: 9/7/2015 11:23:06 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PET_VACCINE_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PET_VACCINE_TYPE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PET_VACCINE_TYPE]
           @Vaccine_Type_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Vaccine_Type_ID]
      ,[Vaccine_Name]
      ,[Vaccine_Reactions]
      ,[Vaccine_Type]
      ,[Vaccine_Description]
  FROM [dbo].[Pet_Vaccine_Type]
 WHERE Vaccine_Type_ID = @Vaccine_Type_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PET_VACCINE_TYPE]    Script Date: 9/7/2015 11:23:06 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PET_VACCINE_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PET_VACCINE_TYPE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PET_VACCINE_TYPE]
	  @Vaccine_Name as varchar(50),
	  @Vaccine_Reactions as varchar(50),
	  @Vaccine_Type as varchar(50)
	  @Vaccine_Description as varchar(MAX),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Vaccine_Name = ''
    BEGIN
    SET @Vaccine_Name = null
    END
	  IF @Vaccine_Reactions = ''
    BEGIN
    SET @Vaccine_Reactions = null
    END
	  IF @Vaccine_Type = ''
    BEGIN
    SET @Vaccine_Type = null
    END
	  IF @Vaccine_Description = ''
    BEGIN
    SET @Vaccine_Description = null
    END
	Insert INTO [dbo].[Pet_Vaccine_Type]
           (
            [Vaccine_Name]
           ,[Vaccine_Reactions]
           ,[Vaccine_Type]
           ,[Vaccine_Description]
            )
     VALUES (
            @Vaccine_Name
           ,@Vaccine_Reactions
           ,@Vaccine_Type
           ,@Vaccine_Description
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PET_VACCINE_TYPE]    Script Date: 9/7/2015 11:23:06 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PET_VACCINE_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PET_VACCINE_TYPE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PET_VACCINE_TYPE]
	  @Vaccine_Type_ID as int,
	  @Vaccine_Name as varchar(50),
	  @Vaccine_Reactions as varchar(50),
	  @Vaccine_Type as varchar(50)
	  @Vaccine_Description as varchar(MAX),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Vaccine_Name = ''
    BEGIN
    SET @Vaccine_Name = null
    END
	  IF @Vaccine_Reactions = ''
    BEGIN
    SET @Vaccine_Reactions = null
    END
	  IF @Vaccine_Type = ''
    BEGIN
    SET @Vaccine_Type = null
    END
	  IF @Vaccine_Description = ''
    BEGIN
    SET @Vaccine_Description = null
    END
	UPDATE [dbo].[Pet_Vaccine_Type]
       SET
		   [Vaccine_Name] = @Vaccine_Name,
		   [Vaccine_Reactions] = @Vaccine_Reactions,
		   [Vaccine_Type] = @Vaccine_Type,
		   [Vaccine_Description] = @Vaccine_Description
       WHERE Vaccine_Type_ID = @Vaccine_Type_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PET_VACCINE_TYPE]    Script Date: 9/7/2015 11:23:06 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PET_VACCINE_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PET_VACCINE_TYPE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PET_VACCINE_TYPE]
	@Vaccine_Type_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Pet_Vaccine_Type
	where Vaccine_Type_ID = @Vaccine_Type_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PET_VACCINE_TYPE]    Script Date: 9/7/2015 11:23:06 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PET_VACCINE_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PET_VACCINE_TYPE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PET_VACCINE_TYPE]
	  @Vaccine_Name as varchar(50),
	  @Vaccine_Reactions as varchar(50),
	  @Vaccine_Type as varchar(50)
	  @Vaccine_Description as varchar(MAX),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Vaccine_Name = ''
    BEGIN
    SET @Vaccine_Name = null
    END
	  IF @Vaccine_Reactions = ''
    BEGIN
    SET @Vaccine_Reactions = null
    END
	  IF @Vaccine_Type = ''
    BEGIN
    SET @Vaccine_Type = null
    END
	  IF @Vaccine_Description = ''
    BEGIN
    SET @Vaccine_Description = null
    END
    SELECT [Vaccine_Type_ID] 
      FROM [dbo].[Pet_Vaccine_Type] 
       WHERE ([Vaccine_Name] like @Vaccine_Name)
       AND ([Vaccine_Reactions] like @Vaccine_Reactions or [Vaccine_Reactions] is null)
       AND ([Vaccine_Type] like @Vaccine_Type)
       AND ([Vaccine_Description] like @Vaccine_Description or [Vaccine_Description] is null)
END
GO

