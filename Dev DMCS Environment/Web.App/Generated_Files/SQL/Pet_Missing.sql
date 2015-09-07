/****** Object:  Table [dbo].[Pet_Missing]    Script Date: 9/7/2015 11:23:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pet_Missing](
  [Pet_Missing_ID] int IDENTITY(1,1) NOT NULL,
  [Last_Known_Location_ID] int NOT NULL,
  [Date_Missing] datetime NULL,
  [Date_Reported] datetime NULL,
  [Collar_Description] varchar(50) NULL,
  [Time_Lost] datetime NULL,
  [Lost_Explanation] varchar(MAX) NULL,
  [Length_Owned] int NULL,
  [Reward_Amt] money NULL,
  [Breeder] varchar(50) NULL,
  [Date_Created] datetime NULL,
  [Date_Modified] datetime NULL,
 CONSTRAINT [Pet_Missing_Pet_Missing_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Pet_Missing_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PET_MISSING]    Script Date: 9/7/2015 11:23:02 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PET_MISSING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PET_MISSING]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PET_MISSING]
           @Pet_Missing_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Pet_Missing_ID]
      ,[Last_Known_Location_ID]
      ,[Date_Missing]
      ,[Date_Reported]
      ,[Collar_Description]
      ,[Time_Lost]
      ,[Lost_Explanation]
      ,[Length_Owned]
      ,[Reward_Amt]
      ,[Breeder]
      ,[Date_Created]
      ,[Date_Modified]
  FROM [dbo].[Pet_Missing]
 WHERE Pet_Missing_ID = @Pet_Missing_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PET_MISSING]    Script Date: 9/7/2015 11:23:02 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PET_MISSING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PET_MISSING]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PET_MISSING]
	  @Pet_Missing_ID as int,
	  @Last_Known_Location_ID as int,
	  @Date_Missing as datetime,
	  @Date_Reported as datetime,
	  @Collar_Description as varchar(50),
	  @Time_Lost as datetime,
	  @Lost_Explanation as varchar(MAX),
	  @Length_Owned as int,
	  @Reward_Amt as money,
	  @Breeder as varchar(50),
	  @Date_Created as datetime
	  @Date_Modified as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Last_Known_Location_ID = 0
    BEGIN
    SET @Last_Known_Location_ID = null
    END
	  IF @Date_Missing = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Missing = null
    END
	  IF @Date_Reported = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Reported = null
    END
	  IF @Collar_Description = ''
    BEGIN
    SET @Collar_Description = null
    END
	  IF @Time_Lost = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Time_Lost = null
    END
	  IF @Lost_Explanation = ''
    BEGIN
    SET @Lost_Explanation = null
    END
	  IF @Length_Owned = 0
    BEGIN
    SET @Length_Owned = null
    END
	  IF @Reward_Amt = 0
    BEGIN
    SET @Reward_Amt = null
    END
	  IF @Breeder = ''
    BEGIN
    SET @Breeder = null
    END
	  IF @Date_Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Created = null
    END
	  IF @Date_Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Modified = null
    END
	Insert INTO [dbo].[Pet_Missing]
           (
            [Pet_Missing_ID]
           ,[Last_Known_Location_ID]
           ,[Date_Missing]
           ,[Date_Reported]
           ,[Collar_Description]
           ,[Time_Lost]
           ,[Lost_Explanation]
           ,[Length_Owned]
           ,[Reward_Amt]
           ,[Breeder]
           ,[Date_Created]
           ,[Date_Modified]
            )
     VALUES (
            @Pet_Missing_ID
           ,@Last_Known_Location_ID
           ,@Date_Missing
           ,@Date_Reported
           ,@Collar_Description
           ,@Time_Lost
           ,@Lost_Explanation
           ,@Length_Owned
           ,@Reward_Amt
           ,@Breeder
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PET_MISSING]    Script Date: 9/7/2015 11:23:02 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PET_MISSING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PET_MISSING]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PET_MISSING]
	  @Pet_Missing_ID as int,
	  @Last_Known_Location_ID as int,
	  @Date_Missing as datetime,
	  @Date_Reported as datetime,
	  @Collar_Description as varchar(50),
	  @Time_Lost as datetime,
	  @Lost_Explanation as varchar(MAX),
	  @Length_Owned as int,
	  @Reward_Amt as money,
	  @Breeder as varchar(50),
	  @Date_Created as datetime
	  @Date_Modified as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Last_Known_Location_ID = 0
    BEGIN
    SET @Last_Known_Location_ID = null
    END
	  IF @Date_Missing = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Missing = null
    END
	  IF @Date_Reported = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Reported = null
    END
	  IF @Collar_Description = ''
    BEGIN
    SET @Collar_Description = null
    END
	  IF @Time_Lost = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Time_Lost = null
    END
	  IF @Lost_Explanation = ''
    BEGIN
    SET @Lost_Explanation = null
    END
	  IF @Length_Owned = 0
    BEGIN
    SET @Length_Owned = null
    END
	  IF @Reward_Amt = 0
    BEGIN
    SET @Reward_Amt = null
    END
	  IF @Breeder = ''
    BEGIN
    SET @Breeder = null
    END
	  IF @Date_Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Created = null
    END
	  IF @Date_Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Modified = null
    END
	UPDATE [dbo].[Pet_Missing]
       SET
		   [Last_Known_Location_ID] = @Last_Known_Location_ID,
		   [Date_Missing] = @Date_Missing,
		   [Date_Reported] = @Date_Reported,
		   [Collar_Description] = @Collar_Description,
		   [Time_Lost] = @Time_Lost,
		   [Lost_Explanation] = @Lost_Explanation,
		   [Length_Owned] = @Length_Owned,
		   [Reward_Amt] = @Reward_Amt,
		   [Breeder] = @Breeder,
		   [Date_Created] = @Date_Created,
		   [Date_Modified] = @Date_Modified
       WHERE Pet_Missing_ID = @Pet_Missing_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PET_MISSING]    Script Date: 9/7/2015 11:23:02 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PET_MISSING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PET_MISSING]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PET_MISSING]
	@Pet_Missing_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Pet_Missing
	where Pet_Missing_ID = @Pet_Missing_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PET_MISSING]    Script Date: 9/7/2015 11:23:02 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PET_MISSING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PET_MISSING]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PET_MISSING]
	  @Last_Known_Location_ID as int,
	  @Date_Missing as datetime,
	  @Date_Reported as datetime,
	  @Collar_Description as varchar(50),
	  @Time_Lost as datetime,
	  @Lost_Explanation as varchar(MAX),
	  @Length_Owned as int,
	  @Reward_Amt as money,
	  @Breeder as varchar(50),
	  @Date_Created as datetime
	  @Date_Modified as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Last_Known_Location_ID = 0
    BEGIN
    SET @Last_Known_Location_ID = null
    END
	  IF @Date_Missing = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Missing = null
    END
	  IF @Date_Reported = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Reported = null
    END
	  IF @Collar_Description = ''
    BEGIN
    SET @Collar_Description = null
    END
	  IF @Time_Lost = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Time_Lost = null
    END
	  IF @Lost_Explanation = ''
    BEGIN
    SET @Lost_Explanation = null
    END
	  IF @Length_Owned = 0
    BEGIN
    SET @Length_Owned = null
    END
	  IF @Reward_Amt = 0
    BEGIN
    SET @Reward_Amt = null
    END
	  IF @Breeder = ''
    BEGIN
    SET @Breeder = null
    END
	  IF @Date_Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Created = null
    END
	  IF @Date_Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Date_Modified = null
    END
    SELECT [Pet_Missing_ID] 
      FROM [dbo].[Pet_Missing] 
       WHERE ([Last_Known_Location_ID] = @Last_Known_Location_ID)
       AND ([Date_Missing] = @Date_Missing or [Date_Missing] is null)
       AND ([Date_Reported] = @Date_Reported or [Date_Reported] is null)
       AND ([Collar_Description] like @Collar_Description or [Collar_Description] is null)
       AND ([Time_Lost] = @Time_Lost or [Time_Lost] is null)
       AND ([Lost_Explanation] like @Lost_Explanation or [Lost_Explanation] is null)
       AND ([Length_Owned] = @Length_Owned or [Length_Owned] is null)
       AND ([Reward_Amt] = @Reward_Amt or [Reward_Amt] is null)
       AND ([Breeder] like @Breeder or [Breeder] is null)
       AND ([Date_Created] = @Date_Created or [Date_Created] is null)
       AND ([Date_Modified] = @Date_Modified or [Date_Modified] is null)
END
GO

