/****** Object:  Table [dbo].[job]    Script Date: 9/7/2015 11:22:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[job](
  [job_id] int IDENTITY(1,1) NOT NULL,
  [address_id] int NOT NULL,
  [company_id] int NOT NULL,
  [job_cat_id] int NOT NULL,
  [job_posted_date] datetime NOT NULL,
  [job_status] varchar(10) NOT NULL,
  [job_title] varchar(15) NOT NULL,
  [Work_Classification_Full_time] varchar(15) NOT NULL,
  [Work_Classification_Part_time] varchar(15) NOT NULL,
  [Work_Payment_Freq_Weekly] varchar(15) NOT NULL,
  [Work_Payment_Freq_Bi_Weekly] varchar(15) NOT NULL,
  [Work_Payment_Freq_Monthly] varchar(15) NOT NULL,
  [Work_Payment_Freq_Bi_Monthly] varchar(15) NOT NULL,
 CONSTRAINT [job_job_id_pk] PRIMARY KEY CLUSTERED 
(
	[job_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_JOB]    Script Date: 9/7/2015 11:22:29 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_JOB]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_JOB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_JOB]
           @job_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [job_id]
      ,[address_id]
      ,[company_id]
      ,[job_cat_id]
      ,[job_posted_date]
      ,[job_status]
      ,[job_title]
      ,[Work_Classification_Full_time]
      ,[Work_Classification_Part_time]
      ,[Work_Payment_Freq_Weekly]
      ,[Work_Payment_Freq_Bi_Weekly]
      ,[Work_Payment_Freq_Monthly]
      ,[Work_Payment_Freq_Bi_Monthly]
  FROM [dbo].[job]
 WHERE job_id = @job_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_JOB]    Script Date: 9/7/2015 11:22:29 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_JOB]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_JOB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_JOB]
	  @address_id as int,
	  @company_id as int,
	  @job_cat_id as int,
	  @job_posted_date as datetime,
	  @job_status as varchar(10),
	  @job_title as varchar(15),
	  @Work_Classification_Full_time as varchar(15),
	  @Work_Classification_Part_time as varchar(15),
	  @Work_Payment_Freq_Weekly as varchar(15),
	  @Work_Payment_Freq_Bi_Weekly as varchar(15),
	  @Work_Payment_Freq_Monthly as varchar(15)
	  @Work_Payment_Freq_Bi_Monthly as varchar(15),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @company_id = 0
    BEGIN
    SET @company_id = null
    END
	  IF @job_cat_id = 0
    BEGIN
    SET @job_cat_id = null
    END
	  IF @job_posted_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @job_posted_date = null
    END
	  IF @job_status = ''
    BEGIN
    SET @job_status = null
    END
	  IF @job_title = ''
    BEGIN
    SET @job_title = null
    END
	  IF @Work_Classification_Full_time = ''
    BEGIN
    SET @Work_Classification_Full_time = null
    END
	  IF @Work_Classification_Part_time = ''
    BEGIN
    SET @Work_Classification_Part_time = null
    END
	  IF @Work_Payment_Freq_Weekly = ''
    BEGIN
    SET @Work_Payment_Freq_Weekly = null
    END
	  IF @Work_Payment_Freq_Bi_Weekly = ''
    BEGIN
    SET @Work_Payment_Freq_Bi_Weekly = null
    END
	  IF @Work_Payment_Freq_Monthly = ''
    BEGIN
    SET @Work_Payment_Freq_Monthly = null
    END
	  IF @Work_Payment_Freq_Bi_Monthly = ''
    BEGIN
    SET @Work_Payment_Freq_Bi_Monthly = null
    END
	Insert INTO [dbo].[job]
           (
            [address_id]
           ,[company_id]
           ,[job_cat_id]
           ,[job_posted_date]
           ,[job_status]
           ,[job_title]
           ,[Work_Classification_Full_time]
           ,[Work_Classification_Part_time]
           ,[Work_Payment_Freq_Weekly]
           ,[Work_Payment_Freq_Bi_Weekly]
           ,[Work_Payment_Freq_Monthly]
           ,[Work_Payment_Freq_Bi_Monthly]
            )
     VALUES (
            @address_id
           ,@company_id
           ,@job_cat_id
           ,@job_posted_date
           ,@job_status
           ,@job_title
           ,@Work_Classification_Full_time
           ,@Work_Classification_Part_time
           ,@Work_Payment_Freq_Weekly
           ,@Work_Payment_Freq_Bi_Weekly
           ,@Work_Payment_Freq_Monthly
           ,@Work_Payment_Freq_Bi_Monthly
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_JOB]    Script Date: 9/7/2015 11:22:29 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_JOB]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_JOB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_JOB]
	  @job_id as int,
	  @address_id as int,
	  @company_id as int,
	  @job_cat_id as int,
	  @job_posted_date as datetime,
	  @job_status as varchar(10),
	  @job_title as varchar(15),
	  @Work_Classification_Full_time as varchar(15),
	  @Work_Classification_Part_time as varchar(15),
	  @Work_Payment_Freq_Weekly as varchar(15),
	  @Work_Payment_Freq_Bi_Weekly as varchar(15),
	  @Work_Payment_Freq_Monthly as varchar(15)
	  @Work_Payment_Freq_Bi_Monthly as varchar(15),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @company_id = 0
    BEGIN
    SET @company_id = null
    END
	  IF @job_cat_id = 0
    BEGIN
    SET @job_cat_id = null
    END
	  IF @job_posted_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @job_posted_date = null
    END
	  IF @job_status = ''
    BEGIN
    SET @job_status = null
    END
	  IF @job_title = ''
    BEGIN
    SET @job_title = null
    END
	  IF @Work_Classification_Full_time = ''
    BEGIN
    SET @Work_Classification_Full_time = null
    END
	  IF @Work_Classification_Part_time = ''
    BEGIN
    SET @Work_Classification_Part_time = null
    END
	  IF @Work_Payment_Freq_Weekly = ''
    BEGIN
    SET @Work_Payment_Freq_Weekly = null
    END
	  IF @Work_Payment_Freq_Bi_Weekly = ''
    BEGIN
    SET @Work_Payment_Freq_Bi_Weekly = null
    END
	  IF @Work_Payment_Freq_Monthly = ''
    BEGIN
    SET @Work_Payment_Freq_Monthly = null
    END
	  IF @Work_Payment_Freq_Bi_Monthly = ''
    BEGIN
    SET @Work_Payment_Freq_Bi_Monthly = null
    END
	UPDATE [dbo].[job]
       SET
		   [address_id] = @address_id,
		   [company_id] = @company_id,
		   [job_cat_id] = @job_cat_id,
		   [job_posted_date] = @job_posted_date,
		   [job_status] = @job_status,
		   [job_title] = @job_title,
		   [Work_Classification_Full_time] = @Work_Classification_Full_time,
		   [Work_Classification_Part_time] = @Work_Classification_Part_time,
		   [Work_Payment_Freq_Weekly] = @Work_Payment_Freq_Weekly,
		   [Work_Payment_Freq_Bi_Weekly] = @Work_Payment_Freq_Bi_Weekly,
		   [Work_Payment_Freq_Monthly] = @Work_Payment_Freq_Monthly,
		   [Work_Payment_Freq_Bi_Monthly] = @Work_Payment_Freq_Bi_Monthly
       WHERE job_id = @job_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_JOB]    Script Date: 9/7/2015 11:22:29 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_JOB]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_JOB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_JOB]
	@job_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.job
	where job_id = @job_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_JOB]    Script Date: 9/7/2015 11:22:29 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_JOB]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_JOB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_JOB]
	  @address_id as int,
	  @company_id as int,
	  @job_cat_id as int,
	  @job_posted_date as datetime,
	  @job_status as varchar(10),
	  @job_title as varchar(15),
	  @Work_Classification_Full_time as varchar(15),
	  @Work_Classification_Part_time as varchar(15),
	  @Work_Payment_Freq_Weekly as varchar(15),
	  @Work_Payment_Freq_Bi_Weekly as varchar(15),
	  @Work_Payment_Freq_Monthly as varchar(15)
	  @Work_Payment_Freq_Bi_Monthly as varchar(15),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @company_id = 0
    BEGIN
    SET @company_id = null
    END
	  IF @job_cat_id = 0
    BEGIN
    SET @job_cat_id = null
    END
	  IF @job_posted_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @job_posted_date = null
    END
	  IF @job_status = ''
    BEGIN
    SET @job_status = null
    END
	  IF @job_title = ''
    BEGIN
    SET @job_title = null
    END
	  IF @Work_Classification_Full_time = ''
    BEGIN
    SET @Work_Classification_Full_time = null
    END
	  IF @Work_Classification_Part_time = ''
    BEGIN
    SET @Work_Classification_Part_time = null
    END
	  IF @Work_Payment_Freq_Weekly = ''
    BEGIN
    SET @Work_Payment_Freq_Weekly = null
    END
	  IF @Work_Payment_Freq_Bi_Weekly = ''
    BEGIN
    SET @Work_Payment_Freq_Bi_Weekly = null
    END
	  IF @Work_Payment_Freq_Monthly = ''
    BEGIN
    SET @Work_Payment_Freq_Monthly = null
    END
	  IF @Work_Payment_Freq_Bi_Monthly = ''
    BEGIN
    SET @Work_Payment_Freq_Bi_Monthly = null
    END
    SELECT [job_id] 
      FROM [dbo].[job] 
       WHERE ([address_id] = @address_id)
       AND ([company_id] = @company_id)
       AND ([job_cat_id] = @job_cat_id)
       AND ([job_posted_date] = @job_posted_date)
       AND ([job_status] like @job_status)
       AND ([job_title] like @job_title)
       AND ([Work_Classification_Full_time] like @Work_Classification_Full_time)
       AND ([Work_Classification_Part_time] like @Work_Classification_Part_time)
       AND ([Work_Payment_Freq_Weekly] like @Work_Payment_Freq_Weekly)
       AND ([Work_Payment_Freq_Bi_Weekly] like @Work_Payment_Freq_Bi_Weekly)
       AND ([Work_Payment_Freq_Monthly] like @Work_Payment_Freq_Monthly)
       AND ([Work_Payment_Freq_Bi_Monthly] like @Work_Payment_Freq_Bi_Monthly)
END
GO

