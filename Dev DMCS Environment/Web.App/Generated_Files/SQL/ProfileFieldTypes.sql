/****** Object:  Table [dbo].[ProfileFieldTypes]    Script Date: 9/7/2015 11:23:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProfileFieldTypes](
  [FieldTypeID] int IDENTITY(1,1) NOT NULL,
  [FieldTypeName] nvarchar(64) NOT NULL,
  [FieldTypeDescription] nvarchar(1024) NULL,
  [FieldTypeSize] int NOT NULL,
 CONSTRAINT [ProfileFieldTypes_FieldTypeID_pk] PRIMARY KEY CLUSTERED 
(
	[FieldTypeID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PROFILEFIELDTYPES]    Script Date: 9/7/2015 11:23:11 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PROFILEFIELDTYPES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PROFILEFIELDTYPES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PROFILEFIELDTYPES]
           @FieldTypeID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [FieldTypeID]
      ,[FieldTypeName]
      ,[FieldTypeDescription]
      ,[FieldTypeSize]
  FROM [dbo].[ProfileFieldTypes]
 WHERE FieldTypeID = @FieldTypeID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PROFILEFIELDTYPES]    Script Date: 9/7/2015 11:23:11 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PROFILEFIELDTYPES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PROFILEFIELDTYPES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PROFILEFIELDTYPES]
	  @FieldTypeID as int,
	  @FieldTypeName as nvarchar(64),
	  @FieldTypeDescription as nvarchar(1024)
	  @FieldTypeSize as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @FieldTypeName = 0
    BEGIN
    SET @FieldTypeName = null
    END
	  IF @FieldTypeDescription = 0
    BEGIN
    SET @FieldTypeDescription = null
    END
	  IF @FieldTypeSize = 0
    BEGIN
    SET @FieldTypeSize = null
    END
	Insert INTO [dbo].[ProfileFieldTypes]
           (
            [FieldTypeID]
           ,[FieldTypeName]
           ,[FieldTypeDescription]
           ,[FieldTypeSize]
            )
     VALUES (
            @FieldTypeID
           ,@FieldTypeName
           ,@FieldTypeDescription
           ,@FieldTypeSize
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PROFILEFIELDTYPES]    Script Date: 9/7/2015 11:23:11 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PROFILEFIELDTYPES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PROFILEFIELDTYPES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PROFILEFIELDTYPES]
	  @FieldTypeID as int,
	  @FieldTypeName as nvarchar(64),
	  @FieldTypeDescription as nvarchar(1024)
	  @FieldTypeSize as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @FieldTypeName = 0
    BEGIN
    SET @FieldTypeName = null
    END
	  IF @FieldTypeDescription = 0
    BEGIN
    SET @FieldTypeDescription = null
    END
	  IF @FieldTypeSize = 0
    BEGIN
    SET @FieldTypeSize = null
    END
	UPDATE [dbo].[ProfileFieldTypes]
       SET
		   [FieldTypeName] = @FieldTypeName,
		   [FieldTypeDescription] = @FieldTypeDescription,
		   [FieldTypeSize] = @FieldTypeSize
       WHERE FieldTypeID = @FieldTypeID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PROFILEFIELDTYPES]    Script Date: 9/7/2015 11:23:11 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PROFILEFIELDTYPES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PROFILEFIELDTYPES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PROFILEFIELDTYPES]
	@FieldTypeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.ProfileFieldTypes
	where FieldTypeID = @FieldTypeID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PROFILEFIELDTYPES]    Script Date: 9/7/2015 11:23:11 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PROFILEFIELDTYPES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PROFILEFIELDTYPES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PROFILEFIELDTYPES]
	  @FieldTypeName as nvarchar(64),
	  @FieldTypeDescription as nvarchar(1024)
	  @FieldTypeSize as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @FieldTypeName = 0
    BEGIN
    SET @FieldTypeName = null
    END
	  IF @FieldTypeDescription = 0
    BEGIN
    SET @FieldTypeDescription = null
    END
	  IF @FieldTypeSize = 0
    BEGIN
    SET @FieldTypeSize = null
    END
    SELECT [FieldTypeID] 
      FROM [dbo].[ProfileFieldTypes] 
       WHERE ([FieldTypeName] = @FieldTypeName)
       AND ([FieldTypeDescription] = @FieldTypeDescription or [FieldTypeDescription] is null)
       AND ([FieldTypeSize] = @FieldTypeSize)
END
GO

