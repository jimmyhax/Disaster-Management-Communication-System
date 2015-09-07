/****** Object:  Table [dbo].[expense]    Script Date: 9/7/2015 11:22:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[expense](
  [expense_id] int IDENTITY(1,1) NOT NULL,
  [case_id] int NOT NULL,
  [client_id] int NOT NULL,
  [date_paid] datetime NOT NULL,
  [expense_amt_paid] money NOT NULL,
  [expense_amt_paid_to] varchar(30) NOT NULL,
 CONSTRAINT [expense_expense_id_pk] PRIMARY KEY CLUSTERED 
(
	[expense_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EXPENSE]    Script Date: 9/7/2015 11:22:21 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EXPENSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EXPENSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EXPENSE]
           @expense_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [expense_id]
      ,[case_id]
      ,[client_id]
      ,[date_paid]
      ,[expense_amt_paid]
      ,[expense_amt_paid_to]
  FROM [dbo].[expense]
 WHERE expense_id = @expense_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_EXPENSE]    Script Date: 9/7/2015 11:22:21 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_EXPENSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_EXPENSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_EXPENSE]
	  @case_id as int,
	  @client_id as int,
	  @date_paid as datetime,
	  @expense_amt_paid as money
	  @expense_amt_paid_to as varchar(30),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @date_paid = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_paid = null
    END
	  IF @expense_amt_paid = 0
    BEGIN
    SET @expense_amt_paid = null
    END
	  IF @expense_amt_paid_to = ''
    BEGIN
    SET @expense_amt_paid_to = null
    END
	Insert INTO [dbo].[expense]
           (
            [case_id]
           ,[client_id]
           ,[date_paid]
           ,[expense_amt_paid]
           ,[expense_amt_paid_to]
            )
     VALUES (
            @case_id
           ,@client_id
           ,@date_paid
           ,@expense_amt_paid
           ,@expense_amt_paid_to
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_EXPENSE]    Script Date: 9/7/2015 11:22:21 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_EXPENSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_EXPENSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_EXPENSE]
	  @expense_id as int,
	  @case_id as int,
	  @client_id as int,
	  @date_paid as datetime,
	  @expense_amt_paid as money
	  @expense_amt_paid_to as varchar(30),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @date_paid = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_paid = null
    END
	  IF @expense_amt_paid = 0
    BEGIN
    SET @expense_amt_paid = null
    END
	  IF @expense_amt_paid_to = ''
    BEGIN
    SET @expense_amt_paid_to = null
    END
	UPDATE [dbo].[expense]
       SET
		   [case_id] = @case_id,
		   [client_id] = @client_id,
		   [date_paid] = @date_paid,
		   [expense_amt_paid] = @expense_amt_paid,
		   [expense_amt_paid_to] = @expense_amt_paid_to
       WHERE expense_id = @expense_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_EXPENSE]    Script Date: 9/7/2015 11:22:21 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_EXPENSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_EXPENSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_EXPENSE]
	@expense_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.expense
	where expense_id = @expense_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_EXPENSE]    Script Date: 9/7/2015 11:22:21 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_EXPENSE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_EXPENSE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_EXPENSE]
	  @case_id as int,
	  @client_id as int,
	  @date_paid as datetime,
	  @expense_amt_paid as money
	  @expense_amt_paid_to as varchar(30),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @date_paid = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_paid = null
    END
	  IF @expense_amt_paid = 0
    BEGIN
    SET @expense_amt_paid = null
    END
	  IF @expense_amt_paid_to = ''
    BEGIN
    SET @expense_amt_paid_to = null
    END
    SELECT [expense_id] 
      FROM [dbo].[expense] 
       WHERE ([case_id] = @case_id)
       AND ([client_id] = @client_id)
       AND ([date_paid] = @date_paid)
       AND ([expense_amt_paid] = @expense_amt_paid)
       AND ([expense_amt_paid_to] like @expense_amt_paid_to)
END
GO

