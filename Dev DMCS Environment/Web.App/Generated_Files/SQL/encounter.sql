/****** Object:  Table [dbo].[encounter]    Script Date: 9/7/2015 11:22:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[encounter](
  [encounter_id] int IDENTITY(1,1) NOT NULL,
  [case_id] int NULL,
  [agency_id] int NULL,
  [call_center_id] int NULL,
  [client_id] int NULL,
  [create_date] datetime NOT NULL,
  [close_date] datetime NULL,
  [disaster_id] int NOT NULL,
  [Location_ID] int NULL,
  [Pet_Record_ID] int NULL,
 CONSTRAINT [encounter_encounter_id_pk] PRIMARY KEY CLUSTERED 
(
	[encounter_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ENCOUNTER]    Script Date: 9/7/2015 11:22:15 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ENCOUNTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ENCOUNTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ENCOUNTER]
           @encounter_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [encounter_id]
      ,[case_id]
      ,[agency_id]
      ,[call_center_id]
      ,[client_id]
      ,[create_date]
      ,[close_date]
      ,[disaster_id]
      ,[Location_ID]
      ,[Pet_Record_ID]
  FROM [dbo].[encounter]
 WHERE encounter_id = @encounter_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_ENCOUNTER]    Script Date: 9/7/2015 11:22:15 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_ENCOUNTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_ENCOUNTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_ENCOUNTER]
	  @case_id as int,
	  @agency_id as int,
	  @call_center_id as int,
	  @client_id as int,
	  @create_date as datetime,
	  @close_date as datetime,
	  @disaster_id as int,
	  @Location_ID as int
	  @Pet_Record_ID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @agency_id = 0
    BEGIN
    SET @agency_id = null
    END
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @create_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @create_date = null
    END
	  IF @close_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @close_date = null
    END
	  IF @disaster_id = 0
    BEGIN
    SET @disaster_id = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Pet_Record_ID = 0
    BEGIN
    SET @Pet_Record_ID = null
    END
	Insert INTO [dbo].[encounter]
           (
            [case_id]
           ,[agency_id]
           ,[call_center_id]
           ,[client_id]
           ,[create_date]
           ,[close_date]
           ,[disaster_id]
           ,[Location_ID]
           ,[Pet_Record_ID]
            )
     VALUES (
            @case_id
           ,@agency_id
           ,@call_center_id
           ,@client_id
           ,@create_date
           ,@close_date
           ,@disaster_id
           ,@Location_ID
           ,@Pet_Record_ID
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_ENCOUNTER]    Script Date: 9/7/2015 11:22:15 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_ENCOUNTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_ENCOUNTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_ENCOUNTER]
	  @encounter_id as int,
	  @case_id as int,
	  @agency_id as int,
	  @call_center_id as int,
	  @client_id as int,
	  @create_date as datetime,
	  @close_date as datetime,
	  @disaster_id as int,
	  @Location_ID as int
	  @Pet_Record_ID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @agency_id = 0
    BEGIN
    SET @agency_id = null
    END
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @create_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @create_date = null
    END
	  IF @close_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @close_date = null
    END
	  IF @disaster_id = 0
    BEGIN
    SET @disaster_id = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Pet_Record_ID = 0
    BEGIN
    SET @Pet_Record_ID = null
    END
	UPDATE [dbo].[encounter]
       SET
		   [case_id] = @case_id,
		   [agency_id] = @agency_id,
		   [call_center_id] = @call_center_id,
		   [client_id] = @client_id,
		   [create_date] = @create_date,
		   [close_date] = @close_date,
		   [disaster_id] = @disaster_id,
		   [Location_ID] = @Location_ID,
		   [Pet_Record_ID] = @Pet_Record_ID
       WHERE encounter_id = @encounter_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_ENCOUNTER]    Script Date: 9/7/2015 11:22:15 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_ENCOUNTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_ENCOUNTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_ENCOUNTER]
	@encounter_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.encounter
	where encounter_id = @encounter_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_ENCOUNTER]    Script Date: 9/7/2015 11:22:15 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_ENCOUNTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_ENCOUNTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_ENCOUNTER]
	  @case_id as int,
	  @agency_id as int,
	  @call_center_id as int,
	  @client_id as int,
	  @create_date as datetime,
	  @close_date as datetime,
	  @disaster_id as int,
	  @Location_ID as int
	  @Pet_Record_ID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @agency_id = 0
    BEGIN
    SET @agency_id = null
    END
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @create_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @create_date = null
    END
	  IF @close_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @close_date = null
    END
	  IF @disaster_id = 0
    BEGIN
    SET @disaster_id = null
    END
	  IF @Location_ID = 0
    BEGIN
    SET @Location_ID = null
    END
	  IF @Pet_Record_ID = 0
    BEGIN
    SET @Pet_Record_ID = null
    END
    SELECT [encounter_id] 
      FROM [dbo].[encounter] 
       WHERE ([case_id] = @case_id or [case_id] is null)
       AND ([agency_id] = @agency_id or [agency_id] is null)
       AND ([call_center_id] = @call_center_id or [call_center_id] is null)
       AND ([client_id] = @client_id or [client_id] is null)
       AND ([create_date] = @create_date)
       AND ([close_date] = @close_date or [close_date] is null)
       AND ([disaster_id] = @disaster_id)
       AND ([Location_ID] = @Location_ID or [Location_ID] is null)
       AND ([Pet_Record_ID] = @Pet_Record_ID or [Pet_Record_ID] is null)
END
GO

