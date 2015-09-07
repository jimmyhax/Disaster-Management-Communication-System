/****** Object:  Table [dbo].[debt]    Script Date: 9/7/2015 11:22:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[debt](
  [debt_id] int IDENTITY(1,1) NOT NULL,
  [amt_paid] money NOT NULL,
  [case_id] int NOT NULL,
  [client_id] int NOT NULL,
  [creditor_name] varchar(50) NOT NULL,
  [debt_amt] money NOT NULL,
  [item_purchased] varchar(30) NOT NULL,
  [last_payment_date] datetime NOT NULL,
  [purchase_date] datetime NOT NULL,
  [value_amt] money NOT NULL,
 CONSTRAINT [debt_debt_id_pk] PRIMARY KEY CLUSTERED 
(
	[debt_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DEBT]    Script Date: 9/7/2015 11:22:02 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DEBT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DEBT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DEBT]
           @debt_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [debt_id]
      ,[amt_paid]
      ,[case_id]
      ,[client_id]
      ,[creditor_name]
      ,[debt_amt]
      ,[item_purchased]
      ,[last_payment_date]
      ,[purchase_date]
      ,[value_amt]
  FROM [dbo].[debt]
 WHERE debt_id = @debt_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_DEBT]    Script Date: 9/7/2015 11:22:02 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_DEBT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_DEBT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_DEBT]
	  @amt_paid as money,
	  @case_id as int,
	  @client_id as int,
	  @creditor_name as varchar(50),
	  @debt_amt as money,
	  @item_purchased as varchar(30),
	  @last_payment_date as datetime,
	  @purchase_date as datetime
	  @value_amt as money,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @amt_paid = 0
    BEGIN
    SET @amt_paid = null
    END
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @creditor_name = ''
    BEGIN
    SET @creditor_name = null
    END
	  IF @debt_amt = 0
    BEGIN
    SET @debt_amt = null
    END
	  IF @item_purchased = ''
    BEGIN
    SET @item_purchased = null
    END
	  IF @last_payment_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @last_payment_date = null
    END
	  IF @purchase_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @purchase_date = null
    END
	  IF @value_amt = 0
    BEGIN
    SET @value_amt = null
    END
	Insert INTO [dbo].[debt]
           (
            [amt_paid]
           ,[case_id]
           ,[client_id]
           ,[creditor_name]
           ,[debt_amt]
           ,[item_purchased]
           ,[last_payment_date]
           ,[purchase_date]
           ,[value_amt]
            )
     VALUES (
            @amt_paid
           ,@case_id
           ,@client_id
           ,@creditor_name
           ,@debt_amt
           ,@item_purchased
           ,@last_payment_date
           ,@purchase_date
           ,@value_amt
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_DEBT]    Script Date: 9/7/2015 11:22:02 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_DEBT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_DEBT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_DEBT]
	  @debt_id as int,
	  @amt_paid as money,
	  @case_id as int,
	  @client_id as int,
	  @creditor_name as varchar(50),
	  @debt_amt as money,
	  @item_purchased as varchar(30),
	  @last_payment_date as datetime,
	  @purchase_date as datetime
	  @value_amt as money,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @amt_paid = 0
    BEGIN
    SET @amt_paid = null
    END
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @creditor_name = ''
    BEGIN
    SET @creditor_name = null
    END
	  IF @debt_amt = 0
    BEGIN
    SET @debt_amt = null
    END
	  IF @item_purchased = ''
    BEGIN
    SET @item_purchased = null
    END
	  IF @last_payment_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @last_payment_date = null
    END
	  IF @purchase_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @purchase_date = null
    END
	  IF @value_amt = 0
    BEGIN
    SET @value_amt = null
    END
	UPDATE [dbo].[debt]
       SET
		   [amt_paid] = @amt_paid,
		   [case_id] = @case_id,
		   [client_id] = @client_id,
		   [creditor_name] = @creditor_name,
		   [debt_amt] = @debt_amt,
		   [item_purchased] = @item_purchased,
		   [last_payment_date] = @last_payment_date,
		   [purchase_date] = @purchase_date,
		   [value_amt] = @value_amt
       WHERE debt_id = @debt_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_DEBT]    Script Date: 9/7/2015 11:22:02 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_DEBT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_DEBT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_DEBT]
	@debt_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.debt
	where debt_id = @debt_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_DEBT]    Script Date: 9/7/2015 11:22:02 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_DEBT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_DEBT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_DEBT]
	  @amt_paid as money,
	  @case_id as int,
	  @client_id as int,
	  @creditor_name as varchar(50),
	  @debt_amt as money,
	  @item_purchased as varchar(30),
	  @last_payment_date as datetime,
	  @purchase_date as datetime
	  @value_amt as money,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @amt_paid = 0
    BEGIN
    SET @amt_paid = null
    END
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @creditor_name = ''
    BEGIN
    SET @creditor_name = null
    END
	  IF @debt_amt = 0
    BEGIN
    SET @debt_amt = null
    END
	  IF @item_purchased = ''
    BEGIN
    SET @item_purchased = null
    END
	  IF @last_payment_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @last_payment_date = null
    END
	  IF @purchase_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @purchase_date = null
    END
	  IF @value_amt = 0
    BEGIN
    SET @value_amt = null
    END
    SELECT [debt_id] 
      FROM [dbo].[debt] 
       WHERE ([amt_paid] = @amt_paid)
       AND ([case_id] = @case_id)
       AND ([client_id] = @client_id)
       AND ([creditor_name] like @creditor_name)
       AND ([debt_amt] = @debt_amt)
       AND ([item_purchased] like @item_purchased)
       AND ([last_payment_date] = @last_payment_date)
       AND ([purchase_date] = @purchase_date)
       AND ([value_amt] = @value_amt)
END
GO

