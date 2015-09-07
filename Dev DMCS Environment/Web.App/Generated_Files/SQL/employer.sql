/****** Object:  Table [dbo].[employer]    Script Date: 9/7/2015 11:22:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employer](
  [emplr_id] int IDENTITY(1,1) NOT NULL,
  [case_id] int NOT NULL,
  [client_id] int NOT NULL,
  [address_id] int NOT NULL,
  [emplr_name] varchar(50) NOT NULL,
  [emplr_phone] varchar(11) NOT NULL,
  [end_date] datetime NULL,
  [strt_date] datetime NOT NULL,
  [term_reason] text(2147483647) NULL,
 CONSTRAINT [employer_emplr_id_pk] PRIMARY KEY CLUSTERED 
(
	[emplr_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EMPLOYER]    Script Date: 9/7/2015 11:22:14 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EMPLOYER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EMPLOYER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EMPLOYER]
           @emplr_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [emplr_id]
      ,[case_id]
      ,[client_id]
      ,[address_id]
      ,[emplr_name]
      ,[emplr_phone]
      ,[end_date]
      ,[strt_date]
      ,[term_reason]
  FROM [dbo].[employer]
 WHERE emplr_id = @emplr_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_EMPLOYER]    Script Date: 9/7/2015 11:22:14 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_EMPLOYER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_EMPLOYER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_EMPLOYER]
	  @case_id as int,
	  @client_id as int,
	  @address_id as int,
	  @emplr_name as varchar(50),
	  @emplr_phone as varchar(11),
	  @end_date as datetime,
	  @strt_date as datetime
	  @term_reason as text,
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
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @emplr_name = ''
    BEGIN
    SET @emplr_name = null
    END
	  IF @emplr_phone = ''
    BEGIN
    SET @emplr_phone = null
    END
	  IF @end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @end_date = null
    END
	  IF @strt_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @strt_date = null
    END
	Insert INTO [dbo].[employer]
           (
            [case_id]
           ,[client_id]
           ,[address_id]
           ,[emplr_name]
           ,[emplr_phone]
           ,[end_date]
           ,[strt_date]
           ,[term_reason]
            )
     VALUES (
            @case_id
           ,@client_id
           ,@address_id
           ,@emplr_name
           ,@emplr_phone
           ,@end_date
           ,@strt_date
           ,@term_reason
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_EMPLOYER]    Script Date: 9/7/2015 11:22:14 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_EMPLOYER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_EMPLOYER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_EMPLOYER]
	  @emplr_id as int,
	  @case_id as int,
	  @client_id as int,
	  @address_id as int,
	  @emplr_name as varchar(50),
	  @emplr_phone as varchar(11),
	  @end_date as datetime,
	  @strt_date as datetime
	  @term_reason as text,
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
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @emplr_name = ''
    BEGIN
    SET @emplr_name = null
    END
	  IF @emplr_phone = ''
    BEGIN
    SET @emplr_phone = null
    END
	  IF @end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @end_date = null
    END
	  IF @strt_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @strt_date = null
    END
	UPDATE [dbo].[employer]
       SET
		   [case_id] = @case_id,
		   [client_id] = @client_id,
		   [address_id] = @address_id,
		   [emplr_name] = @emplr_name,
		   [emplr_phone] = @emplr_phone,
		   [end_date] = @end_date,
		   [strt_date] = @strt_date,
		   [term_reason] = @term_reason
       WHERE emplr_id = @emplr_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_EMPLOYER]    Script Date: 9/7/2015 11:22:14 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_EMPLOYER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_EMPLOYER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_EMPLOYER]
	@emplr_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.employer
	where emplr_id = @emplr_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_EMPLOYER]    Script Date: 9/7/2015 11:22:14 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_EMPLOYER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_EMPLOYER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_EMPLOYER]
	  @case_id as int,
	  @client_id as int,
	  @address_id as int,
	  @emplr_name as varchar(50),
	  @emplr_phone as varchar(11),
	  @end_date as datetime,
	  @strt_date as datetime
	  @term_reason as text,
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
	  IF @address_id = 0
    BEGIN
    SET @address_id = null
    END
	  IF @emplr_name = ''
    BEGIN
    SET @emplr_name = null
    END
	  IF @emplr_phone = ''
    BEGIN
    SET @emplr_phone = null
    END
	  IF @end_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @end_date = null
    END
	  IF @strt_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @strt_date = null
    END
    SELECT [emplr_id] 
      FROM [dbo].[employer] 
       WHERE ([case_id] = @case_id)
       AND ([client_id] = @client_id)
       AND ([address_id] = @address_id)
       AND ([emplr_name] like @emplr_name)
       AND ([emplr_phone] like @emplr_phone)
       AND ([end_date] = @end_date or [end_date] is null)
       AND ([strt_date] = @strt_date)
       AND ([term_reason] like @term_reason or [term_reason] is null)
END
GO

