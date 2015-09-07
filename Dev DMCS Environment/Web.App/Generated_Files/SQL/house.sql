/****** Object:  Table [dbo].[house]    Script Date: 9/7/2015 11:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[house](
  [house_id] int IDENTITY(1,1) NOT NULL,
  [house_name] varchar(50) NOT NULL,
  [house_eligibility] varchar(15) NULL,
  [house_request_date] datetime NOT NULL,
  [house_voucher_amt] money NOT NULL,
  [house_voucher_begin_date] datetime NOT NULL,
  [house_voucher_exp_date] datetime NOT NULL,
  [house_voucher_num] int NOT NULL,
  [house_voucher_schedule] varchar(10) NOT NULL,
  [house_wait_list] int NOT NULL,
 CONSTRAINT [house_house_id_pk] PRIMARY KEY CLUSTERED 
(
	[house_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_HOUSE]    Script Date: 9/7/2015 11:22:24 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_HOUSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_HOUSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_HOUSE]
           @house_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [house_id]
      ,[house_name]
      ,[house_eligibility]
      ,[house_request_date]
      ,[house_voucher_amt]
      ,[house_voucher_begin_date]
      ,[house_voucher_exp_date]
      ,[house_voucher_num]
      ,[house_voucher_schedule]
      ,[house_wait_list]
  FROM [dbo].[house]
 WHERE house_id = @house_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_HOUSE]    Script Date: 9/7/2015 11:22:24 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_HOUSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_HOUSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_HOUSE]
	  @house_name as varchar(50),
	  @house_eligibility as varchar(15),
	  @house_request_date as datetime,
	  @house_voucher_amt as money,
	  @house_voucher_begin_date as datetime,
	  @house_voucher_exp_date as datetime,
	  @house_voucher_num as int,
	  @house_voucher_schedule as varchar(10)
	  @house_wait_list as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @house_name = ''
    BEGIN
    SET @house_name = null
    END
	  IF @house_eligibility = ''
    BEGIN
    SET @house_eligibility = null
    END
	  IF @house_request_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @house_request_date = null
    END
	  IF @house_voucher_amt = 0
    BEGIN
    SET @house_voucher_amt = null
    END
	  IF @house_voucher_begin_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @house_voucher_begin_date = null
    END
	  IF @house_voucher_exp_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @house_voucher_exp_date = null
    END
	  IF @house_voucher_num = 0
    BEGIN
    SET @house_voucher_num = null
    END
	  IF @house_voucher_schedule = ''
    BEGIN
    SET @house_voucher_schedule = null
    END
	  IF @house_wait_list = 0
    BEGIN
    SET @house_wait_list = null
    END
	Insert INTO [dbo].[house]
           (
            [house_name]
           ,[house_eligibility]
           ,[house_request_date]
           ,[house_voucher_amt]
           ,[house_voucher_begin_date]
           ,[house_voucher_exp_date]
           ,[house_voucher_num]
           ,[house_voucher_schedule]
           ,[house_wait_list]
            )
     VALUES (
            @house_name
           ,@house_eligibility
           ,@house_request_date
           ,@house_voucher_amt
           ,@house_voucher_begin_date
           ,@house_voucher_exp_date
           ,@house_voucher_num
           ,@house_voucher_schedule
           ,@house_wait_list
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_HOUSE]    Script Date: 9/7/2015 11:22:24 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_HOUSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_HOUSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_HOUSE]
	  @house_id as int,
	  @house_name as varchar(50),
	  @house_eligibility as varchar(15),
	  @house_request_date as datetime,
	  @house_voucher_amt as money,
	  @house_voucher_begin_date as datetime,
	  @house_voucher_exp_date as datetime,
	  @house_voucher_num as int,
	  @house_voucher_schedule as varchar(10)
	  @house_wait_list as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @house_name = ''
    BEGIN
    SET @house_name = null
    END
	  IF @house_eligibility = ''
    BEGIN
    SET @house_eligibility = null
    END
	  IF @house_request_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @house_request_date = null
    END
	  IF @house_voucher_amt = 0
    BEGIN
    SET @house_voucher_amt = null
    END
	  IF @house_voucher_begin_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @house_voucher_begin_date = null
    END
	  IF @house_voucher_exp_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @house_voucher_exp_date = null
    END
	  IF @house_voucher_num = 0
    BEGIN
    SET @house_voucher_num = null
    END
	  IF @house_voucher_schedule = ''
    BEGIN
    SET @house_voucher_schedule = null
    END
	  IF @house_wait_list = 0
    BEGIN
    SET @house_wait_list = null
    END
	UPDATE [dbo].[house]
       SET
		   [house_name] = @house_name,
		   [house_eligibility] = @house_eligibility,
		   [house_request_date] = @house_request_date,
		   [house_voucher_amt] = @house_voucher_amt,
		   [house_voucher_begin_date] = @house_voucher_begin_date,
		   [house_voucher_exp_date] = @house_voucher_exp_date,
		   [house_voucher_num] = @house_voucher_num,
		   [house_voucher_schedule] = @house_voucher_schedule,
		   [house_wait_list] = @house_wait_list
       WHERE house_id = @house_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_HOUSE]    Script Date: 9/7/2015 11:22:24 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_HOUSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_HOUSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_HOUSE]
	@house_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.house
	where house_id = @house_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_HOUSE]    Script Date: 9/7/2015 11:22:24 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_HOUSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_HOUSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_HOUSE]
	  @house_name as varchar(50),
	  @house_eligibility as varchar(15),
	  @house_request_date as datetime,
	  @house_voucher_amt as money,
	  @house_voucher_begin_date as datetime,
	  @house_voucher_exp_date as datetime,
	  @house_voucher_num as int,
	  @house_voucher_schedule as varchar(10)
	  @house_wait_list as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @house_name = ''
    BEGIN
    SET @house_name = null
    END
	  IF @house_eligibility = ''
    BEGIN
    SET @house_eligibility = null
    END
	  IF @house_request_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @house_request_date = null
    END
	  IF @house_voucher_amt = 0
    BEGIN
    SET @house_voucher_amt = null
    END
	  IF @house_voucher_begin_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @house_voucher_begin_date = null
    END
	  IF @house_voucher_exp_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @house_voucher_exp_date = null
    END
	  IF @house_voucher_num = 0
    BEGIN
    SET @house_voucher_num = null
    END
	  IF @house_voucher_schedule = ''
    BEGIN
    SET @house_voucher_schedule = null
    END
	  IF @house_wait_list = 0
    BEGIN
    SET @house_wait_list = null
    END
    SELECT [house_id] 
      FROM [dbo].[house] 
       WHERE ([house_name] like @house_name)
       AND ([house_eligibility] like @house_eligibility or [house_eligibility] is null)
       AND ([house_request_date] = @house_request_date)
       AND ([house_voucher_amt] = @house_voucher_amt)
       AND ([house_voucher_begin_date] = @house_voucher_begin_date)
       AND ([house_voucher_exp_date] = @house_voucher_exp_date)
       AND ([house_voucher_num] = @house_voucher_num)
       AND ([house_voucher_schedule] like @house_voucher_schedule)
       AND ([house_wait_list] = @house_wait_list)
END
GO

