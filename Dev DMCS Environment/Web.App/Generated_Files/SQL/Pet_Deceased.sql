/****** Object:  Table [dbo].[Pet_Deceased]    Script Date: 9/7/2015 11:23:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pet_Deceased](
  [Pet_Deceased_ID] int IDENTITY(1,1) NOT NULL,
  [Date_Deceased] datetime NOT NULL,
  [Location_ID] int NULL,
  [Funeral] varchar(50) NULL,
  [Cemetary_Name] varchar(50) NULL,
  [Deceased_Type] varchar(50) NOT NULL,
  [Date_Created] datetime NULL,
  [Date_Modified] datetime NULL,
 CONSTRAINT [Pet_Deceased_Pet_Deceased_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Pet_Deceased_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PET_DECEASED]    Script Date: 9/7/2015 11:23:01 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PET_DECEASED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PET_DECEASED]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PET_DECEASED]
           @Pet_Deceased_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Pet_Deceased_ID]
      ,[Date_Deceased]
      ,[Location_ID]
      ,[Funeral]
      ,[Cemetary_Name]
      ,[Deceased_Type]
      ,[Date_Created]
      ,[Date_Modified]
  FROM [dbo].[Pet_Deceased]
 WHERE Pet_Deceased_ID = @Pet_Deceased_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PET_DECEASED]    Script Date: 9/7/2015 11:23:01 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PET_DECEASED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PET_DECEASED]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PET_DECEASED]
	  @Pet_Deceased_ID as int,
	  @Date_Deceased as datetime,
	  @Location_ID as int,
	  @Funeral as varchar(50),
	  @Cemetary_Name as varchar(50),
	  @Deceased_Type as varchar(50),
	  @Date_Created as datetime
	  @Date_Modified as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Date_Deceased = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Deceased = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Funeral = ''
    BEGIN
    SET @Funeral = null
    END
	  IF @Cemetary_Name = ''
    BEGIN
    SET @Cemetary_Name = null
    END
	  IF @Deceased_Type = ''
    BEGIN
    SET @Deceased_Type = null
    END
	  IF @Date_Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Created = null
    END
	  IF @Date_Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Modified = null
    END
	Insert INTO [dbo].[Pet_Deceased]
           (
            [Pet_Deceased_ID]
           ,[Date_Deceased]
           ,[Location_ID]
           ,[Funeral]
           ,[Cemetary_Name]
           ,[Deceased_Type]
           ,[Date_Created]
           ,[Date_Modified]
            )
     VALUES (
            @Pet_Deceased_ID
           ,@Date_Deceased
           ,@Location_ID
           ,@Funeral
           ,@Cemetary_Name
           ,@Deceased_Type
           ,@Date_Created
           ,@Date_Modified
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PET_DECEASED]    Script Date: 9/7/2015 11:23:01 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PET_DECEASED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PET_DECEASED]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PET_DECEASED]
	  @Pet_Deceased_ID as int,
	  @Date_Deceased as datetime,
	  @Location_ID as int,
	  @Funeral as varchar(50),
	  @Cemetary_Name as varchar(50),
	  @Deceased_Type as varchar(50),
	  @Date_Created as datetime
	  @Date_Modified as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Date_Deceased = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Deceased = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Funeral = ''
    BEGIN
    SET @Funeral = null
    END
	  IF @Cemetary_Name = ''
    BEGIN
    SET @Cemetary_Name = null
    END
	  IF @Deceased_Type = ''
    BEGIN
    SET @Deceased_Type = null
    END
	  IF @Date_Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Created = null
    END
	  IF @Date_Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Modified = null
    END
	UPDATE [dbo].[Pet_Deceased]
       SET
		   [Date_Deceased] = @Date_Deceased,
		   [Location_ID] = @Location_ID,
		   [Funeral] = @Funeral,
		   [Cemetary_Name] = @Cemetary_Name,
		   [Deceased_Type] = @Deceased_Type,
		   [Date_Created] = @Date_Created,
		   [Date_Modified] = @Date_Modified
       WHERE Pet_Deceased_ID = @Pet_Deceased_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PET_DECEASED]    Script Date: 9/7/2015 11:23:01 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PET_DECEASED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PET_DECEASED]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PET_DECEASED]
	@Pet_Deceased_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Pet_Deceased
	where Pet_Deceased_ID = @Pet_Deceased_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PET_DECEASED]    Script Date: 9/7/2015 11:23:01 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PET_DECEASED]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PET_DECEASED]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PET_DECEASED]
	  @Date_Deceased as datetime,
	  @Location_ID as int,
	  @Funeral as varchar(50),
	  @Cemetary_Name as varchar(50),
	  @Deceased_Type as varchar(50),
	  @Date_Created as datetime
	  @Date_Modified as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Date_Deceased = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Deceased = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Funeral = ''
    BEGIN
    SET @Funeral = null
    END
	  IF @Cemetary_Name = ''
    BEGIN
    SET @Cemetary_Name = null
    END
	  IF @Deceased_Type = ''
    BEGIN
    SET @Deceased_Type = null
    END
	  IF @Date_Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Created = null
    END
	  IF @Date_Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Modified = null
    END
    SELECT [Pet_Deceased_ID] 
      FROM [dbo].[Pet_Deceased] 
       WHERE ([Date_Deceased] = @Date_Deceased)
       AND ([Location_ID] = @Location_ID or [Location_ID] is null)
       AND ([Funeral] like @Funeral or [Funeral] is null)
       AND ([Cemetary_Name] like @Cemetary_Name or [Cemetary_Name] is null)
       AND ([Deceased_Type] like @Deceased_Type)
       AND ([Date_Created] = @Date_Created or [Date_Created] is null)
       AND ([Date_Modified] = @Date_Modified or [Date_Modified] is null)
END
GO

