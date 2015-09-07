/****** Object:  Table [dbo].[Pet_type]    Script Date: 9/7/2015 11:23:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pet_type](
  [Pet_Type_ID] int IDENTITY(1,1) NOT NULL,
  [Pet_Species] varchar(50) NULL,
  [Pet_Type] varchar(50) NULL,
  [Pet_Breed] varchar(50) NULL,
 CONSTRAINT [Pet_type_Pet_Type_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Pet_Type_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PET_TYPE]    Script Date: 9/7/2015 11:23:03 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PET_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PET_TYPE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PET_TYPE]
           @Pet_Type_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Pet_Type_ID]
      ,[Pet_Species]
      ,[Pet_Type]
      ,[Pet_Breed]
  FROM [dbo].[Pet_type]
 WHERE Pet_Type_ID = @Pet_Type_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PET_TYPE]    Script Date: 9/7/2015 11:23:03 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PET_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PET_TYPE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PET_TYPE]
	  @Pet_Species as varchar(50),
	  @Pet_Type as varchar(50)
	  @Pet_Breed as varchar(50),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Pet_Species = ''
    BEGIN
    SET @Pet_Species = null
    END
	  IF @Pet_Type = ''
    BEGIN
    SET @Pet_Type = null
    END
	  IF @Pet_Breed = ''
    BEGIN
    SET @Pet_Breed = null
    END
	Insert INTO [dbo].[Pet_type]
           (
            [Pet_Species]
           ,[Pet_Type]
           ,[Pet_Breed]
            )
     VALUES (
            @Pet_Species
           ,@Pet_Type
           ,@Pet_Breed
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PET_TYPE]    Script Date: 9/7/2015 11:23:03 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PET_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PET_TYPE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PET_TYPE]
	  @Pet_Type_ID as int,
	  @Pet_Species as varchar(50),
	  @Pet_Type as varchar(50)
	  @Pet_Breed as varchar(50),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Pet_Species = ''
    BEGIN
    SET @Pet_Species = null
    END
	  IF @Pet_Type = ''
    BEGIN
    SET @Pet_Type = null
    END
	  IF @Pet_Breed = ''
    BEGIN
    SET @Pet_Breed = null
    END
	UPDATE [dbo].[Pet_type]
       SET
		   [Pet_Species] = @Pet_Species,
		   [Pet_Type] = @Pet_Type,
		   [Pet_Breed] = @Pet_Breed
       WHERE Pet_Type_ID = @Pet_Type_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PET_TYPE]    Script Date: 9/7/2015 11:23:03 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PET_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PET_TYPE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PET_TYPE]
	@Pet_Type_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Pet_type
	where Pet_Type_ID = @Pet_Type_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PET_TYPE]    Script Date: 9/7/2015 11:23:03 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PET_TYPE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PET_TYPE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PET_TYPE]
	  @Pet_Species as varchar(50),
	  @Pet_Type as varchar(50)
	  @Pet_Breed as varchar(50),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Pet_Species = ''
    BEGIN
    SET @Pet_Species = null
    END
	  IF @Pet_Type = ''
    BEGIN
    SET @Pet_Type = null
    END
	  IF @Pet_Breed = ''
    BEGIN
    SET @Pet_Breed = null
    END
    SELECT [Pet_Type_ID] 
      FROM [dbo].[Pet_type] 
       WHERE ([Pet_Species] like @Pet_Species or [Pet_Species] is null)
       AND ([Pet_Type] like @Pet_Type or [Pet_Type] is null)
       AND ([Pet_Breed] like @Pet_Breed or [Pet_Breed] is null)
END
GO

