/****** Object:  Table [dbo].[case_intake]    Script Date: 9/7/2015 11:21:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[case_intake](
  [case_id] int IDENTITY(1,1) NOT NULL,
  [applic_end_date_time] datetime NULL,
  [applic_start_date_time] datetime NOT NULL,
  [circum_emergency_event] varchar(3) NOT NULL,
  [circum_help_request_memo] text(2147483647) NOT NULL,
  [circum_income_stolen] varchar(3) NOT NULL,
  [circum_memo] text(2147483647) NOT NULL,
  [circum_no_income] varchar(3) NOT NULL,
  [circum_not_enough_income] varchar(3) NOT NULL,
  [agency_id] int NULL,
  [call_center_id] int NULL,
 CONSTRAINT [case_intake_case_id_pk] PRIMARY KEY CLUSTERED 
(
	[case_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CASE_INTAKE]    Script Date: 9/7/2015 11:21:57 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CASE_INTAKE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CASE_INTAKE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CASE_INTAKE]
           @case_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [case_id]
      ,[applic_end_date_time]
      ,[applic_start_date_time]
      ,[circum_emergency_event]
      ,[circum_help_request_memo]
      ,[circum_income_stolen]
      ,[circum_memo]
      ,[circum_no_income]
      ,[circum_not_enough_income]
      ,[agency_id]
      ,[call_center_id]
  FROM [dbo].[case_intake]
 WHERE case_id = @case_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_CASE_INTAKE]    Script Date: 9/7/2015 11:21:57 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_CASE_INTAKE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_CASE_INTAKE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_CASE_INTAKE]
	  @applic_end_date_time as datetime,
	  @applic_start_date_time as datetime,
	  @circum_emergency_event as varchar(3),
	  @circum_help_request_memo as text,
	  @circum_income_stolen as varchar(3),
	  @circum_memo as text,
	  @circum_no_income as varchar(3),
	  @circum_not_enough_income as varchar(3),
	  @agency_id as int
	  @call_center_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @applic_end_date_time = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @applic_end_date_time = null
    END
	  IF @applic_start_date_time = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @applic_start_date_time = null
    END
	  IF @circum_emergency_event = ''
    BEGIN
    SET @circum_emergency_event = null
    END
	  IF @circum_income_stolen = ''
    BEGIN
    SET @circum_income_stolen = null
    END
	  IF @circum_no_income = ''
    BEGIN
    SET @circum_no_income = null
    END
	  IF @circum_not_enough_income = ''
    BEGIN
    SET @circum_not_enough_income = null
    END
	  IF @agency_id = 0
    BEGIN
    SET @agency_id = null
    END
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
	Insert INTO [dbo].[case_intake]
           (
            [applic_end_date_time]
           ,[applic_start_date_time]
           ,[circum_emergency_event]
           ,[circum_help_request_memo]
           ,[circum_income_stolen]
           ,[circum_memo]
           ,[circum_no_income]
           ,[circum_not_enough_income]
           ,[agency_id]
           ,[call_center_id]
            )
     VALUES (
            @applic_end_date_time
           ,@applic_start_date_time
           ,@circum_emergency_event
           ,@circum_help_request_memo
           ,@circum_income_stolen
           ,@circum_memo
           ,@circum_no_income
           ,@circum_not_enough_income
           ,@agency_id
           ,@call_center_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_CASE_INTAKE]    Script Date: 9/7/2015 11:21:57 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_CASE_INTAKE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_CASE_INTAKE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_CASE_INTAKE]
	  @case_id as int,
	  @applic_end_date_time as datetime,
	  @applic_start_date_time as datetime,
	  @circum_emergency_event as varchar(3),
	  @circum_help_request_memo as text,
	  @circum_income_stolen as varchar(3),
	  @circum_memo as text,
	  @circum_no_income as varchar(3),
	  @circum_not_enough_income as varchar(3),
	  @agency_id as int
	  @call_center_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @applic_end_date_time = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @applic_end_date_time = null
    END
	  IF @applic_start_date_time = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @applic_start_date_time = null
    END
	  IF @circum_emergency_event = ''
    BEGIN
    SET @circum_emergency_event = null
    END
	  IF @circum_income_stolen = ''
    BEGIN
    SET @circum_income_stolen = null
    END
	  IF @circum_no_income = ''
    BEGIN
    SET @circum_no_income = null
    END
	  IF @circum_not_enough_income = ''
    BEGIN
    SET @circum_not_enough_income = null
    END
	  IF @agency_id = 0
    BEGIN
    SET @agency_id = null
    END
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
	UPDATE [dbo].[case_intake]
       SET
		   [applic_end_date_time] = @applic_end_date_time,
		   [applic_start_date_time] = @applic_start_date_time,
		   [circum_emergency_event] = @circum_emergency_event,
		   [circum_help_request_memo] = @circum_help_request_memo,
		   [circum_income_stolen] = @circum_income_stolen,
		   [circum_memo] = @circum_memo,
		   [circum_no_income] = @circum_no_income,
		   [circum_not_enough_income] = @circum_not_enough_income,
		   [agency_id] = @agency_id,
		   [call_center_id] = @call_center_id
       WHERE case_id = @case_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_CASE_INTAKE]    Script Date: 9/7/2015 11:21:57 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_CASE_INTAKE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_CASE_INTAKE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_CASE_INTAKE]
	@case_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.case_intake
	where case_id = @case_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_CASE_INTAKE]    Script Date: 9/7/2015 11:21:57 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_CASE_INTAKE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_CASE_INTAKE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_CASE_INTAKE]
	  @applic_end_date_time as datetime,
	  @applic_start_date_time as datetime,
	  @circum_emergency_event as varchar(3),
	  @circum_help_request_memo as text,
	  @circum_income_stolen as varchar(3),
	  @circum_memo as text,
	  @circum_no_income as varchar(3),
	  @circum_not_enough_income as varchar(3),
	  @agency_id as int
	  @call_center_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @applic_end_date_time = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @applic_end_date_time = null
    END
	  IF @applic_start_date_time = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @applic_start_date_time = null
    END
	  IF @circum_emergency_event = ''
    BEGIN
    SET @circum_emergency_event = null
    END
	  IF @circum_income_stolen = ''
    BEGIN
    SET @circum_income_stolen = null
    END
	  IF @circum_no_income = ''
    BEGIN
    SET @circum_no_income = null
    END
	  IF @circum_not_enough_income = ''
    BEGIN
    SET @circum_not_enough_income = null
    END
	  IF @agency_id = 0
    BEGIN
    SET @agency_id = null
    END
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
    SELECT [case_id] 
      FROM [dbo].[case_intake] 
       WHERE ([applic_end_date_time] = @applic_end_date_time or [applic_end_date_time] is null)
       AND ([applic_start_date_time] = @applic_start_date_time)
       AND ([circum_emergency_event] like @circum_emergency_event)
       AND ([circum_help_request_memo] like @circum_help_request_memo)
       AND ([circum_income_stolen] like @circum_income_stolen)
       AND ([circum_memo] like @circum_memo)
       AND ([circum_no_income] like @circum_no_income)
       AND ([circum_not_enough_income] like @circum_not_enough_income)
       AND ([agency_id] = @agency_id or [agency_id] is null)
       AND ([call_center_id] = @call_center_id or [call_center_id] is null)
END
GO

