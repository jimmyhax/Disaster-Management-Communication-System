/****** Object:  Table [dbo].[income_source]    Script Date: 9/7/2015 11:22:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[income_source](
  [income_source_id] int IDENTITY(1,1) NOT NULL,
  [case_id] int NOT NULL,
  [cash_amt] money NULL,
  [cash_on_hand] char(1) NOT NULL,
  [wages_stopped] char(1) NOT NULL,
  [waiting_on_income] char(1) NOT NULL,
  [recieving_income] char(1) NOT NULL,
  [no_income] char(1) NOT NULL,
  [currently_working] char(1) NOT NULL,
  [laid_off] char(1) NOT NULL,
  [never_worked] char(1) NOT NULL,
  [quit] char(1) NOT NULL,
  [fired] char(1) NOT NULL,
  [sick_leave] char(1) NOT NULL,
  [maternity_leave] char(1) NOT NULL,
  [on_strike] char(1) NOT NULL,
  [trying_to_find_work] char(1) NOT NULL,
  [ckg_acct] char(1) NOT NULL,
  [ckg_balance] money NULL,
  [ckg_bank] varchar(30) NULL,
  [claims] char(1) NOT NULL,
  [claims_memo] text(2147483647) NULL,
  [client_id] int NULL,
  [gifts_amt] money NULL,
  [gifts_inc] char(1) NOT NULL,
  [investments] char(1) NOT NULL,
  [life_ins] char(1) NOT NULL,
  [other_ins] char(1) NOT NULL,
  [pension_amt] money NULL,
  [pension_inc] char(1) NOT NULL,
  [strike_benefits_amt] money NULL,
  [strike_benefits_inc] char(1) NOT NULL,
  [support_amt] money NULL,
  [support_inc] char(1) NOT NULL,
  [SSI_Amt] money NULL,
  [SSI_Inc] char(1) NOT NULL,
  [svgs_acct] char(1) NOT NULL,
  [svgs_balance] money NULL,
  [svgs_bank] varchar(30) NULL,
  [wages_amt] money NULL,
  [wages_inc] char(1) NOT NULL,
 CONSTRAINT [income_source_income_source_id_pk] PRIMARY KEY CLUSTERED 
(
	[income_source_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_INCOME_SOURCE]    Script Date: 9/7/2015 11:22:27 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_INCOME_SOURCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_INCOME_SOURCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_INCOME_SOURCE]
           @income_source_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [income_source_id]
      ,[case_id]
      ,[cash_amt]
      ,[cash_on_hand]
      ,[wages_stopped]
      ,[waiting_on_income]
      ,[recieving_income]
      ,[no_income]
      ,[currently_working]
      ,[laid_off]
      ,[never_worked]
      ,[quit]
      ,[fired]
      ,[sick_leave]
      ,[maternity_leave]
      ,[on_strike]
      ,[trying_to_find_work]
      ,[ckg_acct]
      ,[ckg_balance]
      ,[ckg_bank]
      ,[claims]
      ,[claims_memo]
      ,[client_id]
      ,[gifts_amt]
      ,[gifts_inc]
      ,[investments]
      ,[life_ins]
      ,[other_ins]
      ,[pension_amt]
      ,[pension_inc]
      ,[strike_benefits_amt]
      ,[strike_benefits_inc]
      ,[support_amt]
      ,[support_inc]
      ,[SSI_Amt]
      ,[SSI_Inc]
      ,[svgs_acct]
      ,[svgs_balance]
      ,[svgs_bank]
      ,[wages_amt]
      ,[wages_inc]
  FROM [dbo].[income_source]
 WHERE income_source_id = @income_source_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_INCOME_SOURCE]    Script Date: 9/7/2015 11:22:27 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_INCOME_SOURCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_INCOME_SOURCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_INCOME_SOURCE]
	  @case_id as int,
	  @cash_amt as money,
	  @cash_on_hand as char(1),
	  @wages_stopped as char(1),
	  @waiting_on_income as char(1),
	  @recieving_income as char(1),
	  @no_income as char(1),
	  @currently_working as char(1),
	  @laid_off as char(1),
	  @never_worked as char(1),
	  @quit as char(1),
	  @fired as char(1),
	  @sick_leave as char(1),
	  @maternity_leave as char(1),
	  @on_strike as char(1),
	  @trying_to_find_work as char(1),
	  @ckg_acct as char(1),
	  @ckg_balance as money,
	  @ckg_bank as varchar(30),
	  @claims as char(1),
	  @claims_memo as text,
	  @client_id as int,
	  @gifts_amt as money,
	  @gifts_inc as char(1),
	  @investments as char(1),
	  @life_ins as char(1),
	  @other_ins as char(1),
	  @pension_amt as money,
	  @pension_inc as char(1),
	  @strike_benefits_amt as money,
	  @strike_benefits_inc as char(1),
	  @support_amt as money,
	  @support_inc as char(1),
	  @SSI_Amt as money,
	  @SSI_Inc as char(1),
	  @svgs_acct as char(1),
	  @svgs_balance as money,
	  @svgs_bank as varchar(30),
	  @wages_amt as money
	  @wages_inc as char(1),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @cash_amt = 0
    BEGIN
    SET @cash_amt = null
    END
	  IF @cash_on_hand = ''
    BEGIN
    SET @cash_on_hand = null
    END
	  IF @wages_stopped = ''
    BEGIN
    SET @wages_stopped = null
    END
	  IF @waiting_on_income = ''
    BEGIN
    SET @waiting_on_income = null
    END
	  IF @recieving_income = ''
    BEGIN
    SET @recieving_income = null
    END
	  IF @no_income = ''
    BEGIN
    SET @no_income = null
    END
	  IF @currently_working = ''
    BEGIN
    SET @currently_working = null
    END
	  IF @laid_off = ''
    BEGIN
    SET @laid_off = null
    END
	  IF @never_worked = ''
    BEGIN
    SET @never_worked = null
    END
	  IF @quit = ''
    BEGIN
    SET @quit = null
    END
	  IF @fired = ''
    BEGIN
    SET @fired = null
    END
	  IF @sick_leave = ''
    BEGIN
    SET @sick_leave = null
    END
	  IF @maternity_leave = ''
    BEGIN
    SET @maternity_leave = null
    END
	  IF @on_strike = ''
    BEGIN
    SET @on_strike = null
    END
	  IF @trying_to_find_work = ''
    BEGIN
    SET @trying_to_find_work = null
    END
	  IF @ckg_acct = ''
    BEGIN
    SET @ckg_acct = null
    END
	  IF @ckg_balance = 0
    BEGIN
    SET @ckg_balance = null
    END
	  IF @ckg_bank = ''
    BEGIN
    SET @ckg_bank = null
    END
	  IF @claims = ''
    BEGIN
    SET @claims = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @gifts_amt = 0
    BEGIN
    SET @gifts_amt = null
    END
	  IF @gifts_inc = ''
    BEGIN
    SET @gifts_inc = null
    END
	  IF @investments = ''
    BEGIN
    SET @investments = null
    END
	  IF @life_ins = ''
    BEGIN
    SET @life_ins = null
    END
	  IF @other_ins = ''
    BEGIN
    SET @other_ins = null
    END
	  IF @pension_amt = 0
    BEGIN
    SET @pension_amt = null
    END
	  IF @pension_inc = ''
    BEGIN
    SET @pension_inc = null
    END
	  IF @strike_benefits_amt = 0
    BEGIN
    SET @strike_benefits_amt = null
    END
	  IF @strike_benefits_inc = ''
    BEGIN
    SET @strike_benefits_inc = null
    END
	  IF @support_amt = 0
    BEGIN
    SET @support_amt = null
    END
	  IF @support_inc = ''
    BEGIN
    SET @support_inc = null
    END
	  IF @SSI_Amt = 0
    BEGIN
    SET @SSI_Amt = null
    END
	  IF @SSI_Inc = ''
    BEGIN
    SET @SSI_Inc = null
    END
	  IF @svgs_acct = ''
    BEGIN
    SET @svgs_acct = null
    END
	  IF @svgs_balance = 0
    BEGIN
    SET @svgs_balance = null
    END
	  IF @svgs_bank = ''
    BEGIN
    SET @svgs_bank = null
    END
	  IF @wages_amt = 0
    BEGIN
    SET @wages_amt = null
    END
	  IF @wages_inc = ''
    BEGIN
    SET @wages_inc = null
    END
	Insert INTO [dbo].[income_source]
           (
            [case_id]
           ,[cash_amt]
           ,[cash_on_hand]
           ,[wages_stopped]
           ,[waiting_on_income]
           ,[recieving_income]
           ,[no_income]
           ,[currently_working]
           ,[laid_off]
           ,[never_worked]
           ,[quit]
           ,[fired]
           ,[sick_leave]
           ,[maternity_leave]
           ,[on_strike]
           ,[trying_to_find_work]
           ,[ckg_acct]
           ,[ckg_balance]
           ,[ckg_bank]
           ,[claims]
           ,[claims_memo]
           ,[client_id]
           ,[gifts_amt]
           ,[gifts_inc]
           ,[investments]
           ,[life_ins]
           ,[other_ins]
           ,[pension_amt]
           ,[pension_inc]
           ,[strike_benefits_amt]
           ,[strike_benefits_inc]
           ,[support_amt]
           ,[support_inc]
           ,[SSI_Amt]
           ,[SSI_Inc]
           ,[svgs_acct]
           ,[svgs_balance]
           ,[svgs_bank]
           ,[wages_amt]
           ,[wages_inc]
            )
     VALUES (
            @case_id
           ,@cash_amt
           ,@cash_on_hand
           ,@wages_stopped
           ,@waiting_on_income
           ,@recieving_income
           ,@no_income
           ,@currently_working
           ,@laid_off
           ,@never_worked
           ,@quit
           ,@fired
           ,@sick_leave
           ,@maternity_leave
           ,@on_strike
           ,@trying_to_find_work
           ,@ckg_acct
           ,@ckg_balance
           ,@ckg_bank
           ,@claims
           ,@claims_memo
           ,@client_id
           ,@gifts_amt
           ,@gifts_inc
           ,@investments
           ,@life_ins
           ,@other_ins
           ,@pension_amt
           ,@pension_inc
           ,@strike_benefits_amt
           ,@strike_benefits_inc
           ,@support_amt
           ,@support_inc
           ,@SSI_Amt
           ,@SSI_Inc
           ,@svgs_acct
           ,@svgs_balance
           ,@svgs_bank
           ,@wages_amt
           ,@wages_inc
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_INCOME_SOURCE]    Script Date: 9/7/2015 11:22:27 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_INCOME_SOURCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_INCOME_SOURCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_INCOME_SOURCE]
	  @income_source_id as int,
	  @case_id as int,
	  @cash_amt as money,
	  @cash_on_hand as char(1),
	  @wages_stopped as char(1),
	  @waiting_on_income as char(1),
	  @recieving_income as char(1),
	  @no_income as char(1),
	  @currently_working as char(1),
	  @laid_off as char(1),
	  @never_worked as char(1),
	  @quit as char(1),
	  @fired as char(1),
	  @sick_leave as char(1),
	  @maternity_leave as char(1),
	  @on_strike as char(1),
	  @trying_to_find_work as char(1),
	  @ckg_acct as char(1),
	  @ckg_balance as money,
	  @ckg_bank as varchar(30),
	  @claims as char(1),
	  @claims_memo as text,
	  @client_id as int,
	  @gifts_amt as money,
	  @gifts_inc as char(1),
	  @investments as char(1),
	  @life_ins as char(1),
	  @other_ins as char(1),
	  @pension_amt as money,
	  @pension_inc as char(1),
	  @strike_benefits_amt as money,
	  @strike_benefits_inc as char(1),
	  @support_amt as money,
	  @support_inc as char(1),
	  @SSI_Amt as money,
	  @SSI_Inc as char(1),
	  @svgs_acct as char(1),
	  @svgs_balance as money,
	  @svgs_bank as varchar(30),
	  @wages_amt as money
	  @wages_inc as char(1),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @cash_amt = 0
    BEGIN
    SET @cash_amt = null
    END
	  IF @cash_on_hand = ''
    BEGIN
    SET @cash_on_hand = null
    END
	  IF @wages_stopped = ''
    BEGIN
    SET @wages_stopped = null
    END
	  IF @waiting_on_income = ''
    BEGIN
    SET @waiting_on_income = null
    END
	  IF @recieving_income = ''
    BEGIN
    SET @recieving_income = null
    END
	  IF @no_income = ''
    BEGIN
    SET @no_income = null
    END
	  IF @currently_working = ''
    BEGIN
    SET @currently_working = null
    END
	  IF @laid_off = ''
    BEGIN
    SET @laid_off = null
    END
	  IF @never_worked = ''
    BEGIN
    SET @never_worked = null
    END
	  IF @quit = ''
    BEGIN
    SET @quit = null
    END
	  IF @fired = ''
    BEGIN
    SET @fired = null
    END
	  IF @sick_leave = ''
    BEGIN
    SET @sick_leave = null
    END
	  IF @maternity_leave = ''
    BEGIN
    SET @maternity_leave = null
    END
	  IF @on_strike = ''
    BEGIN
    SET @on_strike = null
    END
	  IF @trying_to_find_work = ''
    BEGIN
    SET @trying_to_find_work = null
    END
	  IF @ckg_acct = ''
    BEGIN
    SET @ckg_acct = null
    END
	  IF @ckg_balance = 0
    BEGIN
    SET @ckg_balance = null
    END
	  IF @ckg_bank = ''
    BEGIN
    SET @ckg_bank = null
    END
	  IF @claims = ''
    BEGIN
    SET @claims = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @gifts_amt = 0
    BEGIN
    SET @gifts_amt = null
    END
	  IF @gifts_inc = ''
    BEGIN
    SET @gifts_inc = null
    END
	  IF @investments = ''
    BEGIN
    SET @investments = null
    END
	  IF @life_ins = ''
    BEGIN
    SET @life_ins = null
    END
	  IF @other_ins = ''
    BEGIN
    SET @other_ins = null
    END
	  IF @pension_amt = 0
    BEGIN
    SET @pension_amt = null
    END
	  IF @pension_inc = ''
    BEGIN
    SET @pension_inc = null
    END
	  IF @strike_benefits_amt = 0
    BEGIN
    SET @strike_benefits_amt = null
    END
	  IF @strike_benefits_inc = ''
    BEGIN
    SET @strike_benefits_inc = null
    END
	  IF @support_amt = 0
    BEGIN
    SET @support_amt = null
    END
	  IF @support_inc = ''
    BEGIN
    SET @support_inc = null
    END
	  IF @SSI_Amt = 0
    BEGIN
    SET @SSI_Amt = null
    END
	  IF @SSI_Inc = ''
    BEGIN
    SET @SSI_Inc = null
    END
	  IF @svgs_acct = ''
    BEGIN
    SET @svgs_acct = null
    END
	  IF @svgs_balance = 0
    BEGIN
    SET @svgs_balance = null
    END
	  IF @svgs_bank = ''
    BEGIN
    SET @svgs_bank = null
    END
	  IF @wages_amt = 0
    BEGIN
    SET @wages_amt = null
    END
	  IF @wages_inc = ''
    BEGIN
    SET @wages_inc = null
    END
	UPDATE [dbo].[income_source]
       SET
		   [case_id] = @case_id,
		   [cash_amt] = @cash_amt,
		   [cash_on_hand] = @cash_on_hand,
		   [wages_stopped] = @wages_stopped,
		   [waiting_on_income] = @waiting_on_income,
		   [recieving_income] = @recieving_income,
		   [no_income] = @no_income,
		   [currently_working] = @currently_working,
		   [laid_off] = @laid_off,
		   [never_worked] = @never_worked,
		   [quit] = @quit,
		   [fired] = @fired,
		   [sick_leave] = @sick_leave,
		   [maternity_leave] = @maternity_leave,
		   [on_strike] = @on_strike,
		   [trying_to_find_work] = @trying_to_find_work,
		   [ckg_acct] = @ckg_acct,
		   [ckg_balance] = @ckg_balance,
		   [ckg_bank] = @ckg_bank,
		   [claims] = @claims,
		   [claims_memo] = @claims_memo,
		   [client_id] = @client_id,
		   [gifts_amt] = @gifts_amt,
		   [gifts_inc] = @gifts_inc,
		   [investments] = @investments,
		   [life_ins] = @life_ins,
		   [other_ins] = @other_ins,
		   [pension_amt] = @pension_amt,
		   [pension_inc] = @pension_inc,
		   [strike_benefits_amt] = @strike_benefits_amt,
		   [strike_benefits_inc] = @strike_benefits_inc,
		   [support_amt] = @support_amt,
		   [support_inc] = @support_inc,
		   [SSI_Amt] = @SSI_Amt,
		   [SSI_Inc] = @SSI_Inc,
		   [svgs_acct] = @svgs_acct,
		   [svgs_balance] = @svgs_balance,
		   [svgs_bank] = @svgs_bank,
		   [wages_amt] = @wages_amt,
		   [wages_inc] = @wages_inc
       WHERE income_source_id = @income_source_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_INCOME_SOURCE]    Script Date: 9/7/2015 11:22:27 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_INCOME_SOURCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_INCOME_SOURCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_INCOME_SOURCE]
	@income_source_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.income_source
	where income_source_id = @income_source_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_INCOME_SOURCE]    Script Date: 9/7/2015 11:22:27 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_INCOME_SOURCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_INCOME_SOURCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_INCOME_SOURCE]
	  @case_id as int,
	  @cash_amt as money,
	  @cash_on_hand as char(1),
	  @wages_stopped as char(1),
	  @waiting_on_income as char(1),
	  @recieving_income as char(1),
	  @no_income as char(1),
	  @currently_working as char(1),
	  @laid_off as char(1),
	  @never_worked as char(1),
	  @quit as char(1),
	  @fired as char(1),
	  @sick_leave as char(1),
	  @maternity_leave as char(1),
	  @on_strike as char(1),
	  @trying_to_find_work as char(1),
	  @ckg_acct as char(1),
	  @ckg_balance as money,
	  @ckg_bank as varchar(30),
	  @claims as char(1),
	  @claims_memo as text,
	  @client_id as int,
	  @gifts_amt as money,
	  @gifts_inc as char(1),
	  @investments as char(1),
	  @life_ins as char(1),
	  @other_ins as char(1),
	  @pension_amt as money,
	  @pension_inc as char(1),
	  @strike_benefits_amt as money,
	  @strike_benefits_inc as char(1),
	  @support_amt as money,
	  @support_inc as char(1),
	  @SSI_Amt as money,
	  @SSI_Inc as char(1),
	  @svgs_acct as char(1),
	  @svgs_balance as money,
	  @svgs_bank as varchar(30),
	  @wages_amt as money
	  @wages_inc as char(1),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @case_id = 0
    BEGIN
    SET @case_id = null
    END
	  IF @cash_amt = 0
    BEGIN
    SET @cash_amt = null
    END
	  IF @cash_on_hand = ''
    BEGIN
    SET @cash_on_hand = null
    END
	  IF @wages_stopped = ''
    BEGIN
    SET @wages_stopped = null
    END
	  IF @waiting_on_income = ''
    BEGIN
    SET @waiting_on_income = null
    END
	  IF @recieving_income = ''
    BEGIN
    SET @recieving_income = null
    END
	  IF @no_income = ''
    BEGIN
    SET @no_income = null
    END
	  IF @currently_working = ''
    BEGIN
    SET @currently_working = null
    END
	  IF @laid_off = ''
    BEGIN
    SET @laid_off = null
    END
	  IF @never_worked = ''
    BEGIN
    SET @never_worked = null
    END
	  IF @quit = ''
    BEGIN
    SET @quit = null
    END
	  IF @fired = ''
    BEGIN
    SET @fired = null
    END
	  IF @sick_leave = ''
    BEGIN
    SET @sick_leave = null
    END
	  IF @maternity_leave = ''
    BEGIN
    SET @maternity_leave = null
    END
	  IF @on_strike = ''
    BEGIN
    SET @on_strike = null
    END
	  IF @trying_to_find_work = ''
    BEGIN
    SET @trying_to_find_work = null
    END
	  IF @ckg_acct = ''
    BEGIN
    SET @ckg_acct = null
    END
	  IF @ckg_balance = 0
    BEGIN
    SET @ckg_balance = null
    END
	  IF @ckg_bank = ''
    BEGIN
    SET @ckg_bank = null
    END
	  IF @claims = ''
    BEGIN
    SET @claims = null
    END
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @gifts_amt = 0
    BEGIN
    SET @gifts_amt = null
    END
	  IF @gifts_inc = ''
    BEGIN
    SET @gifts_inc = null
    END
	  IF @investments = ''
    BEGIN
    SET @investments = null
    END
	  IF @life_ins = ''
    BEGIN
    SET @life_ins = null
    END
	  IF @other_ins = ''
    BEGIN
    SET @other_ins = null
    END
	  IF @pension_amt = 0
    BEGIN
    SET @pension_amt = null
    END
	  IF @pension_inc = ''
    BEGIN
    SET @pension_inc = null
    END
	  IF @strike_benefits_amt = 0
    BEGIN
    SET @strike_benefits_amt = null
    END
	  IF @strike_benefits_inc = ''
    BEGIN
    SET @strike_benefits_inc = null
    END
	  IF @support_amt = 0
    BEGIN
    SET @support_amt = null
    END
	  IF @support_inc = ''
    BEGIN
    SET @support_inc = null
    END
	  IF @SSI_Amt = 0
    BEGIN
    SET @SSI_Amt = null
    END
	  IF @SSI_Inc = ''
    BEGIN
    SET @SSI_Inc = null
    END
	  IF @svgs_acct = ''
    BEGIN
    SET @svgs_acct = null
    END
	  IF @svgs_balance = 0
    BEGIN
    SET @svgs_balance = null
    END
	  IF @svgs_bank = ''
    BEGIN
    SET @svgs_bank = null
    END
	  IF @wages_amt = 0
    BEGIN
    SET @wages_amt = null
    END
	  IF @wages_inc = ''
    BEGIN
    SET @wages_inc = null
    END
    SELECT [income_source_id] 
      FROM [dbo].[income_source] 
       WHERE ([case_id] = @case_id)
       AND ([cash_amt] = @cash_amt or [cash_amt] is null)
       AND ([cash_on_hand] = @cash_on_hand)
       AND ([wages_stopped] = @wages_stopped)
       AND ([waiting_on_income] = @waiting_on_income)
       AND ([recieving_income] = @recieving_income)
       AND ([no_income] = @no_income)
       AND ([currently_working] = @currently_working)
       AND ([laid_off] = @laid_off)
       AND ([never_worked] = @never_worked)
       AND ([quit] = @quit)
       AND ([fired] = @fired)
       AND ([sick_leave] = @sick_leave)
       AND ([maternity_leave] = @maternity_leave)
       AND ([on_strike] = @on_strike)
       AND ([trying_to_find_work] = @trying_to_find_work)
       AND ([ckg_acct] = @ckg_acct)
       AND ([ckg_balance] = @ckg_balance or [ckg_balance] is null)
       AND ([ckg_bank] like @ckg_bank or [ckg_bank] is null)
       AND ([claims] = @claims)
       AND ([claims_memo] like @claims_memo or [claims_memo] is null)
       AND ([client_id] = @client_id or [client_id] is null)
       AND ([gifts_amt] = @gifts_amt or [gifts_amt] is null)
       AND ([gifts_inc] = @gifts_inc)
       AND ([investments] = @investments)
       AND ([life_ins] = @life_ins)
       AND ([other_ins] = @other_ins)
       AND ([pension_amt] = @pension_amt or [pension_amt] is null)
       AND ([pension_inc] = @pension_inc)
       AND ([strike_benefits_amt] = @strike_benefits_amt or [strike_benefits_amt] is null)
       AND ([strike_benefits_inc] = @strike_benefits_inc)
       AND ([support_amt] = @support_amt or [support_amt] is null)
       AND ([support_inc] = @support_inc)
       AND ([SSI_Amt] = @SSI_Amt or [SSI_Amt] is null)
       AND ([SSI_Inc] = @SSI_Inc)
       AND ([svgs_acct] = @svgs_acct)
       AND ([svgs_balance] = @svgs_balance or [svgs_balance] is null)
       AND ([svgs_bank] like @svgs_bank or [svgs_bank] is null)
       AND ([wages_amt] = @wages_amt or [wages_amt] is null)
       AND ([wages_inc] = @wages_inc)
END
GO

