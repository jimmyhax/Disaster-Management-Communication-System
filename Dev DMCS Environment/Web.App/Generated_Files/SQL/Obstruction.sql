/****** Object:  Table [dbo].[Obstruction]    Script Date: 9/7/2015 11:22:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Obstruction](
  [Obstruction_ID] int IDENTITY(1,1) NOT NULL,
  [Evacuation_Area_ID] int NOT NULL,
  [Location_ID] int NOT NULL,
  [Date_Reported] datetime NOT NULL,
  [Expected_Recovery_Date] datetime NULL,
  [Type] varchar(15) NOT NULL,
  [Severity] varchar(15) NOT NULL,
 CONSTRAINT [Obstruction_Obstruction_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Obstruction_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_OBSTRUCTION]    Script Date: 9/7/2015 11:22:53 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_OBSTRUCTION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_OBSTRUCTION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_OBSTRUCTION]
           @Obstruction_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Obstruction_ID]
      ,[Evacuation_Area_ID]
      ,[Location_ID]
      ,[Date_Reported]
      ,[Expected_Recovery_Date]
      ,[Type]
      ,[Severity]
  FROM [dbo].[Obstruction]
 WHERE Obstruction_ID = @Obstruction_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_OBSTRUCTION]    Script Date: 9/7/2015 11:22:53 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_OBSTRUCTION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_OBSTRUCTION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_OBSTRUCTION]
	  @Evacuation_Area_ID as int,
	  @Location_ID as int,
	  @Date_Reported as datetime,
	  @Expected_Recovery_Date as datetime,
	  @Type as varchar(15)
	  @Severity as varchar(15),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Date_Reported = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Reported = null
    END
	  IF @Expected_Recovery_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Expected_Recovery_Date = null
    END
	  IF @Type = ''
    BEGIN
    SET @Type = null
    END
	  IF @Severity = ''
    BEGIN
    SET @Severity = null
    END
	Insert INTO [dbo].[Obstruction]
           (
            [Evacuation_Area_ID]
           ,[Location_ID]
           ,[Date_Reported]
           ,[Expected_Recovery_Date]
           ,[Type]
           ,[Severity]
            )
     VALUES (
            @Evacuation_Area_ID
           ,@Location_ID
           ,@Date_Reported
           ,@Expected_Recovery_Date
           ,@Type
           ,@Severity
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_OBSTRUCTION]    Script Date: 9/7/2015 11:22:53 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_OBSTRUCTION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_OBSTRUCTION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_OBSTRUCTION]
	  @Obstruction_ID as int,
	  @Evacuation_Area_ID as int,
	  @Location_ID as int,
	  @Date_Reported as datetime,
	  @Expected_Recovery_Date as datetime,
	  @Type as varchar(15)
	  @Severity as varchar(15),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Date_Reported = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Reported = null
    END
	  IF @Expected_Recovery_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Expected_Recovery_Date = null
    END
	  IF @Type = ''
    BEGIN
    SET @Type = null
    END
	  IF @Severity = ''
    BEGIN
    SET @Severity = null
    END
	UPDATE [dbo].[Obstruction]
       SET
		   [Evacuation_Area_ID] = @Evacuation_Area_ID,
		   [Location_ID] = @Location_ID,
		   [Date_Reported] = @Date_Reported,
		   [Expected_Recovery_Date] = @Expected_Recovery_Date,
		   [Type] = @Type,
		   [Severity] = @Severity
       WHERE Obstruction_ID = @Obstruction_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_OBSTRUCTION]    Script Date: 9/7/2015 11:22:53 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_OBSTRUCTION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_OBSTRUCTION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_OBSTRUCTION]
	@Obstruction_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Obstruction
	where Obstruction_ID = @Obstruction_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_OBSTRUCTION]    Script Date: 9/7/2015 11:22:53 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_OBSTRUCTION]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_OBSTRUCTION]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_OBSTRUCTION]
	  @Evacuation_Area_ID as int,
	  @Location_ID as int,
	  @Date_Reported as datetime,
	  @Expected_Recovery_Date as datetime,
	  @Type as varchar(15)
	  @Severity as varchar(15),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Date_Reported = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Reported = null
    END
	  IF @Expected_Recovery_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Expected_Recovery_Date = null
    END
	  IF @Type = ''
    BEGIN
    SET @Type = null
    END
	  IF @Severity = ''
    BEGIN
    SET @Severity = null
    END
    SELECT [Obstruction_ID] 
      FROM [dbo].[Obstruction] 
       WHERE ([Evacuation_Area_ID] = @Evacuation_Area_ID)
       AND ([Location_ID] = @Location_ID)
       AND ([Date_Reported] = @Date_Reported)
       AND ([Expected_Recovery_Date] = @Expected_Recovery_Date or [Expected_Recovery_Date] is null)
       AND ([Type] like @Type)
       AND ([Severity] like @Severity)
END
GO

