/****** Object:  Table [dbo].[receipt]    Script Date: 9/7/2015 11:23:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[receipt](
  [Receipt_ID] int IDENTITY(1,1) NOT NULL,
  [Account_ID] int NULL,
  [Check_Num] int NULL,
  [DLN] int NULL,
  [Phone] int NULL,
  [Pay_Type] int NULL,
  [Amount] int NULL,
  [Transfer] bit NULL,
  [Recieve] bit NULL,
 CONSTRAINT [receipt_Receipt_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Receipt_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_RECEIPT]    Script Date: 9/7/2015 11:23:14 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_RECEIPT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_RECEIPT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_RECEIPT]
           @Receipt_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Receipt_ID]
      ,[Account_ID]
      ,[Check_Num]
      ,[DLN]
      ,[Phone]
      ,[Pay_Type]
      ,[Amount]
      ,[Transfer]
      ,[Recieve]
  FROM [dbo].[receipt]
 WHERE Receipt_ID = @Receipt_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_RECEIPT]    Script Date: 9/7/2015 11:23:14 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_RECEIPT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_RECEIPT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_RECEIPT]
	  @Account_ID as int,
	  @Check_Num as int,
	  @DLN as int,
	  @Phone as int,
	  @Pay_Type as int,
	  @Amount as int,
	  @Transfer as bit
	  @Recieve as bit,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Account_ID = 0
    BEGIN
    SET @Account_ID = null
    END
	  IF @Check_Num = 0
    BEGIN
    SET @Check_Num = null
    END
	  IF @DLN = 0
    BEGIN
    SET @DLN = null
    END
	  IF @Phone = 0
    BEGIN
    SET @Phone = null
    END
	  IF @Pay_Type = 0
    BEGIN
    SET @Pay_Type = null
    END
	  IF @Amount = 0
    BEGIN
    SET @Amount = null
    END
	  IF @Transfer = 0
    BEGIN
    SET @Transfer = null
    END
	  IF @Recieve = 0
    BEGIN
    SET @Recieve = null
    END
	Insert INTO [dbo].[receipt]
           (
            [Account_ID]
           ,[Check_Num]
           ,[DLN]
           ,[Phone]
           ,[Pay_Type]
           ,[Amount]
           ,[Transfer]
           ,[Recieve]
            )
     VALUES (
            @Account_ID
           ,@Check_Num
           ,@DLN
           ,@Phone
           ,@Pay_Type
           ,@Amount
           ,@Transfer
           ,@Recieve
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_RECEIPT]    Script Date: 9/7/2015 11:23:14 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_RECEIPT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_RECEIPT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_RECEIPT]
	  @Receipt_ID as int,
	  @Account_ID as int,
	  @Check_Num as int,
	  @DLN as int,
	  @Phone as int,
	  @Pay_Type as int,
	  @Amount as int,
	  @Transfer as bit
	  @Recieve as bit,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Account_ID = 0
    BEGIN
    SET @Account_ID = null
    END
	  IF @Check_Num = 0
    BEGIN
    SET @Check_Num = null
    END
	  IF @DLN = 0
    BEGIN
    SET @DLN = null
    END
	  IF @Phone = 0
    BEGIN
    SET @Phone = null
    END
	  IF @Pay_Type = 0
    BEGIN
    SET @Pay_Type = null
    END
	  IF @Amount = 0
    BEGIN
    SET @Amount = null
    END
	  IF @Transfer = 0
    BEGIN
    SET @Transfer = null
    END
	  IF @Recieve = 0
    BEGIN
    SET @Recieve = null
    END
	UPDATE [dbo].[receipt]
       SET
		   [Account_ID] = @Account_ID,
		   [Check_Num] = @Check_Num,
		   [DLN] = @DLN,
		   [Phone] = @Phone,
		   [Pay_Type] = @Pay_Type,
		   [Amount] = @Amount,
		   [Transfer] = @Transfer,
		   [Recieve] = @Recieve
       WHERE Receipt_ID = @Receipt_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_RECEIPT]    Script Date: 9/7/2015 11:23:14 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_RECEIPT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_RECEIPT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_RECEIPT]
	@Receipt_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.receipt
	where Receipt_ID = @Receipt_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_RECEIPT]    Script Date: 9/7/2015 11:23:14 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_RECEIPT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_RECEIPT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_RECEIPT]
	  @Account_ID as int,
	  @Check_Num as int,
	  @DLN as int,
	  @Phone as int,
	  @Pay_Type as int,
	  @Amount as int,
	  @Transfer as bit
	  @Recieve as bit,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Account_ID = 0
    BEGIN
    SET @Account_ID = null
    END
	  IF @Check_Num = 0
    BEGIN
    SET @Check_Num = null
    END
	  IF @DLN = 0
    BEGIN
    SET @DLN = null
    END
	  IF @Phone = 0
    BEGIN
    SET @Phone = null
    END
	  IF @Pay_Type = 0
    BEGIN
    SET @Pay_Type = null
    END
	  IF @Amount = 0
    BEGIN
    SET @Amount = null
    END
	  IF @Transfer = 0
    BEGIN
    SET @Transfer = null
    END
	  IF @Recieve = 0
    BEGIN
    SET @Recieve = null
    END
    SELECT [Receipt_ID] 
      FROM [dbo].[receipt] 
       WHERE ([Account_ID] = @Account_ID or [Account_ID] is null)
       AND ([Check_Num] = @Check_Num or [Check_Num] is null)
       AND ([DLN] = @DLN or [DLN] is null)
       AND ([Phone] = @Phone or [Phone] is null)
       AND ([Pay_Type] = @Pay_Type or [Pay_Type] is null)
       AND ([Amount] = @Amount or [Amount] is null)
       AND ([Transfer] = @Transfer or [Transfer] is null)
       AND ([Recieve] = @Recieve or [Recieve] is null)
END
GO

