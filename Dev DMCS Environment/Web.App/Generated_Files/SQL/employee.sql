/****** Object:  Table [dbo].[employee]    Script Date: 9/7/2015 11:22:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employee](
  [employee_id] int IDENTITY(1,1) NOT NULL,
  [member_id] bigint NULL,
  [employee_date_hired] datetime NOT NULL,
  [employee_department] varchar(15) NOT NULL,
  [employee_hours_worked] int NULL,
  [employee_leadership] varchar(30) NOT NULL,
  [employee_motivation] varchar(30) NULL,
  [employee_notes] text(2147483647) NULL,
  [employee_overall] varchar(30) NULL,
  [employee_payrate] money NOT NULL,
  [employee_performance] varchar(30) NULL,
  [employee_quality] varchar(30) NULL,
  [employee_timeliness] varchar(30) NULL,
  [username] varchar(50) NULL,
  [pswd] varchar(15) NULL,
 CONSTRAINT [employee_employee_id_pk] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EMPLOYEE]    Script Date: 9/7/2015 11:22:12 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EMPLOYEE]
           @employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [employee_id]
      ,[member_id]
      ,[employee_date_hired]
      ,[employee_department]
      ,[employee_hours_worked]
      ,[employee_leadership]
      ,[employee_motivation]
      ,[employee_notes]
      ,[employee_overall]
      ,[employee_payrate]
      ,[employee_performance]
      ,[employee_quality]
      ,[employee_timeliness]
      ,[username]
      ,[pswd]
  FROM [dbo].[employee]
 WHERE employee_id = @employee_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_EMPLOYEE]    Script Date: 9/7/2015 11:22:12 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_EMPLOYEE]
	  @employee_id as int,
	  @member_id as bigint,
	  @employee_date_hired as datetime,
	  @employee_department as varchar(15),
	  @employee_hours_worked as int,
	  @employee_leadership as varchar(30),
	  @employee_motivation as varchar(30),
	  @employee_notes as text,
	  @employee_overall as varchar(30),
	  @employee_payrate as money,
	  @employee_performance as varchar(30),
	  @employee_quality as varchar(30),
	  @employee_timeliness as varchar(30),
	  @username as varchar(50)
	  @pswd as varchar(15),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @member_id = 0
    BEGIN
    SET @member_id = null
    END
	  IF @employee_date_hired = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @employee_date_hired = null
    END
	  IF @employee_department = ''
    BEGIN
    SET @employee_department = null
    END
	  IF @employee_hours_worked = 0
    BEGIN
    SET @employee_hours_worked = null
    END
	  IF @employee_leadership = ''
    BEGIN
    SET @employee_leadership = null
    END
	  IF @employee_motivation = ''
    BEGIN
    SET @employee_motivation = null
    END
	  IF @employee_overall = ''
    BEGIN
    SET @employee_overall = null
    END
	  IF @employee_payrate = 0
    BEGIN
    SET @employee_payrate = null
    END
	  IF @employee_performance = ''
    BEGIN
    SET @employee_performance = null
    END
	  IF @employee_quality = ''
    BEGIN
    SET @employee_quality = null
    END
	  IF @employee_timeliness = ''
    BEGIN
    SET @employee_timeliness = null
    END
	  IF @username = ''
    BEGIN
    SET @username = null
    END
	  IF @pswd = ''
    BEGIN
    SET @pswd = null
    END
	Insert INTO [dbo].[employee]
           (
            [employee_id]
           ,[member_id]
           ,[employee_date_hired]
           ,[employee_department]
           ,[employee_hours_worked]
           ,[employee_leadership]
           ,[employee_motivation]
           ,[employee_notes]
           ,[employee_overall]
           ,[employee_payrate]
           ,[employee_performance]
           ,[employee_quality]
           ,[employee_timeliness]
           ,[username]
           ,[pswd]
            )
     VALUES (
            @employee_id
           ,@member_id
           ,@employee_date_hired
           ,@employee_department
           ,@employee_hours_worked
           ,@employee_leadership
           ,@employee_motivation
           ,@employee_notes
           ,@employee_overall
           ,@employee_payrate
           ,@employee_performance
           ,@employee_quality
           ,@employee_timeliness
           ,@username
           ,@pswd
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_EMPLOYEE]    Script Date: 9/7/2015 11:22:12 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_EMPLOYEE]
	  @employee_id as int,
	  @member_id as bigint,
	  @employee_date_hired as datetime,
	  @employee_department as varchar(15),
	  @employee_hours_worked as int,
	  @employee_leadership as varchar(30),
	  @employee_motivation as varchar(30),
	  @employee_notes as text,
	  @employee_overall as varchar(30),
	  @employee_payrate as money,
	  @employee_performance as varchar(30),
	  @employee_quality as varchar(30),
	  @employee_timeliness as varchar(30),
	  @username as varchar(50)
	  @pswd as varchar(15),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @member_id = 0
    BEGIN
    SET @member_id = null
    END
	  IF @employee_date_hired = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @employee_date_hired = null
    END
	  IF @employee_department = ''
    BEGIN
    SET @employee_department = null
    END
	  IF @employee_hours_worked = 0
    BEGIN
    SET @employee_hours_worked = null
    END
	  IF @employee_leadership = ''
    BEGIN
    SET @employee_leadership = null
    END
	  IF @employee_motivation = ''
    BEGIN
    SET @employee_motivation = null
    END
	  IF @employee_overall = ''
    BEGIN
    SET @employee_overall = null
    END
	  IF @employee_payrate = 0
    BEGIN
    SET @employee_payrate = null
    END
	  IF @employee_performance = ''
    BEGIN
    SET @employee_performance = null
    END
	  IF @employee_quality = ''
    BEGIN
    SET @employee_quality = null
    END
	  IF @employee_timeliness = ''
    BEGIN
    SET @employee_timeliness = null
    END
	  IF @username = ''
    BEGIN
    SET @username = null
    END
	  IF @pswd = ''
    BEGIN
    SET @pswd = null
    END
	UPDATE [dbo].[employee]
       SET
		   [member_id] = @member_id,
		   [employee_date_hired] = @employee_date_hired,
		   [employee_department] = @employee_department,
		   [employee_hours_worked] = @employee_hours_worked,
		   [employee_leadership] = @employee_leadership,
		   [employee_motivation] = @employee_motivation,
		   [employee_notes] = @employee_notes,
		   [employee_overall] = @employee_overall,
		   [employee_payrate] = @employee_payrate,
		   [employee_performance] = @employee_performance,
		   [employee_quality] = @employee_quality,
		   [employee_timeliness] = @employee_timeliness,
		   [username] = @username,
		   [pswd] = @pswd
       WHERE employee_id = @employee_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_EMPLOYEE]    Script Date: 9/7/2015 11:22:12 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_EMPLOYEE]
	@employee_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.employee
	where employee_id = @employee_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_EMPLOYEE]    Script Date: 9/7/2015 11:22:12 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_EMPLOYEE]
	  @member_id as bigint,
	  @employee_date_hired as datetime,
	  @employee_department as varchar(15),
	  @employee_hours_worked as int,
	  @employee_leadership as varchar(30),
	  @employee_motivation as varchar(30),
	  @employee_notes as text,
	  @employee_overall as varchar(30),
	  @employee_payrate as money,
	  @employee_performance as varchar(30),
	  @employee_quality as varchar(30),
	  @employee_timeliness as varchar(30),
	  @username as varchar(50)
	  @pswd as varchar(15),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @member_id = 0
    BEGIN
    SET @member_id = null
    END
	  IF @employee_date_hired = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @employee_date_hired = null
    END
	  IF @employee_department = ''
    BEGIN
    SET @employee_department = null
    END
	  IF @employee_hours_worked = 0
    BEGIN
    SET @employee_hours_worked = null
    END
	  IF @employee_leadership = ''
    BEGIN
    SET @employee_leadership = null
    END
	  IF @employee_motivation = ''
    BEGIN
    SET @employee_motivation = null
    END
	  IF @employee_overall = ''
    BEGIN
    SET @employee_overall = null
    END
	  IF @employee_payrate = 0
    BEGIN
    SET @employee_payrate = null
    END
	  IF @employee_performance = ''
    BEGIN
    SET @employee_performance = null
    END
	  IF @employee_quality = ''
    BEGIN
    SET @employee_quality = null
    END
	  IF @employee_timeliness = ''
    BEGIN
    SET @employee_timeliness = null
    END
	  IF @username = ''
    BEGIN
    SET @username = null
    END
	  IF @pswd = ''
    BEGIN
    SET @pswd = null
    END
    SELECT [employee_id] 
      FROM [dbo].[employee] 
       WHERE ([member_id] = @member_id or [member_id] is null)
       AND ([employee_date_hired] = @employee_date_hired)
       AND ([employee_department] like @employee_department)
       AND ([employee_hours_worked] = @employee_hours_worked or [employee_hours_worked] is null)
       AND ([employee_leadership] like @employee_leadership)
       AND ([employee_motivation] like @employee_motivation or [employee_motivation] is null)
       AND ([employee_notes] like @employee_notes or [employee_notes] is null)
       AND ([employee_overall] like @employee_overall or [employee_overall] is null)
       AND ([employee_payrate] = @employee_payrate)
       AND ([employee_performance] like @employee_performance or [employee_performance] is null)
       AND ([employee_quality] like @employee_quality or [employee_quality] is null)
       AND ([employee_timeliness] like @employee_timeliness or [employee_timeliness] is null)
       AND ([username] like @username or [username] is null)
       AND ([pswd] like @pswd or [pswd] is null)
END
GO

