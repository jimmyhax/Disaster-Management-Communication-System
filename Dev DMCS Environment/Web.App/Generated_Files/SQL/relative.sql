/****** Object:  Table [dbo].[relative]    Script Date: 9/7/2015 11:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[relative](
  [relative_id] int IDENTITY(1,1) NOT NULL,
  [case_id] int NOT NULL,
  [client_id] int NOT NULL,
  [address_id] int NULL,
  [relative_help_memo] text(2147483647) NULL,
  [will_help] char(1) NOT NULL,
 CONSTRAINT [relative_relative_id_pk] PRIMARY KEY CLUSTERED 
(
	[relative_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_RELATIVE]    Script Date: 9/7/2015 11:23:15 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_RELATIVE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_RELATIVE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_RELATIVE]
           @relative_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [relative_id]
      ,[case_id]
      ,[client_id]
      ,[address_id]
      ,[relative_help_memo]
      ,[will_help]
  FROM [dbo].[relative]
 WHERE relative_id = @relative_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_RELATIVE]    Script Date: 9/7/2015 11:23:15 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_RELATIVE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_RELATIVE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_RELATIVE]
	  @case_id as int,
	  @client_id as int,
	  @address_id as int,
	  @relative_help_memo as text
	  @will_help as char(1),
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
	  IF @will_help = ''
    BEGIN
    SET @will_help = null
    END
	Insert INTO [dbo].[relative]
           (
            [case_id]
           ,[client_id]
           ,[address_id]
           ,[relative_help_memo]
           ,[will_help]
            )
     VALUES (
            @case_id
           ,@client_id
           ,@address_id
           ,@relative_help_memo
           ,@will_help
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_RELATIVE]    Script Date: 9/7/2015 11:23:15 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_RELATIVE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_RELATIVE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_RELATIVE]
	  @relative_id as int,
	  @case_id as int,
	  @client_id as int,
	  @address_id as int,
	  @relative_help_memo as text
	  @will_help as char(1),
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
	  IF @will_help = ''
    BEGIN
    SET @will_help = null
    END
	UPDATE [dbo].[relative]
       SET
		   [case_id] = @case_id,
		   [client_id] = @client_id,
		   [address_id] = @address_id,
		   [relative_help_memo] = @relative_help_memo,
		   [will_help] = @will_help
       WHERE relative_id = @relative_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_RELATIVE]    Script Date: 9/7/2015 11:23:15 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_RELATIVE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_RELATIVE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_RELATIVE]
	@relative_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.relative
	where relative_id = @relative_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_RELATIVE]    Script Date: 9/7/2015 11:23:15 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_RELATIVE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_RELATIVE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_RELATIVE]
	  @case_id as int,
	  @client_id as int,
	  @address_id as int,
	  @relative_help_memo as text
	  @will_help as char(1),
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
	  IF @will_help = ''
    BEGIN
    SET @will_help = null
    END
    SELECT [relative_id] 
      FROM [dbo].[relative] 
       WHERE ([case_id] = @case_id)
       AND ([client_id] = @client_id)
       AND ([address_id] = @address_id or [address_id] is null)
       AND ([relative_help_memo] like @relative_help_memo or [relative_help_memo] is null)
       AND ([will_help] = @will_help)
END
GO

