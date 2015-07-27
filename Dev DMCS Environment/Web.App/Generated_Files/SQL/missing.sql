/****** Object:  Table [dbo].[missing]    Script Date: 7/22/2015 5:33:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[missing](
  [Missing_id] int IDENTITY(1,1) NOT NULL,
  [client_other_info] varchar(250) NULL,
  [clothing] varchar(150) NULL,
  [date_of_disappearance] datetime NOT NULL,
 CONSTRAINT [missing_Missing_id_pk] PRIMARY KEY CLUSTERED 
(
	[Missing_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MISSING]    Script Date: 7/22/2015 5:33:47 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MISSING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MISSING]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MISSING]
           @Missing_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Missing_id]
      ,[client_other_info]
      ,[clothing]
      ,[date_of_disappearance]
  FROM [dbo].[missing]
 WHERE Missing_id = @Missing_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MISSING]    Script Date: 7/22/2015 5:33:47 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MISSING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MISSING]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MISSING]
	  @Missing_id as int,
	  @client_other_info as varchar(250),
	  @clothing as varchar(150)
	  @date_of_disappearance as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_other_info = ''
    BEGIN
    SET @client_other_info = null
    END
	  IF @clothing = ''
    BEGIN
    SET @clothing = null
    END
	  IF @date_of_disappearance = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_of_disappearance = null
    END
	Insert INTO [dbo].[missing]
           (
            [Missing_id]
           ,[client_other_info]
           ,[clothing]
           ,[date_of_disappearance]
            )
     VALUES (
            @Missing_id
           ,@client_other_info
           ,@clothing
           ,@date_of_disappearance
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MISSING]    Script Date: 7/22/2015 5:33:47 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MISSING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MISSING]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MISSING]
	  @Missing_id as int,
	  @client_other_info as varchar(250),
	  @clothing as varchar(150)
	  @date_of_disappearance as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_other_info = ''
    BEGIN
    SET @client_other_info = null
    END
	  IF @clothing = ''
    BEGIN
    SET @clothing = null
    END
	  IF @date_of_disappearance = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_of_disappearance = null
    END
	UPDATE [dbo].[missing]
       SET
		   [client_other_info] = @client_other_info,
		   [clothing] = @clothing,
		   [date_of_disappearance] = @date_of_disappearance
       WHERE Missing_id = @Missing_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MISSING]    Script Date: 7/22/2015 5:33:47 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MISSING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MISSING]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MISSING]
	@Missing_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.missing
	where Missing_id = @Missing_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MISSING]    Script Date: 7/22/2015 5:33:47 PM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MISSING]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MISSING]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MISSING]
	  @client_other_info as varchar(250),
	  @clothing as varchar(150)
	  @date_of_disappearance as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_other_info = ''
    BEGIN
    SET @client_other_info = null
    END
	  IF @clothing = ''
    BEGIN
    SET @clothing = null
    END
	  IF @date_of_disappearance = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_of_disappearance = null
    END
    SELECT [Missing_id] 
      FROM [dbo].[missing] 
       WHERE ([client_other_info] like @client_other_info or [client_other_info] is null)
       AND ([clothing] like @clothing or [clothing] is null)
       AND ([date_of_disappearance] = @date_of_disappearance)
END
GO

