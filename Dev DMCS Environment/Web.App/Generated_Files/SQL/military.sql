/****** Object:  Table [dbo].[military]    Script Date: 9/7/2015 11:22:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[military](
  [military_id] int IDENTITY(1,1) NOT NULL,
  [case_id] int NOT NULL,
  [client_id] int NOT NULL,
  [discharge_date] datetime NULL,
  [enlistment_date] datetime NOT NULL,
  [military_branch] varchar(30) NOT NULL,
  [serial_num] int NOT NULL,
 CONSTRAINT [military_military_id_pk] PRIMARY KEY CLUSTERED 
(
	[military_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MILITARY]    Script Date: 9/7/2015 11:22:46 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MILITARY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MILITARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MILITARY]
           @military_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [military_id]
      ,[case_id]
      ,[client_id]
      ,[discharge_date]
      ,[enlistment_date]
      ,[military_branch]
      ,[serial_num]
  FROM [dbo].[military]
 WHERE military_id = @military_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MILITARY]    Script Date: 9/7/2015 11:22:46 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MILITARY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MILITARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MILITARY]
	  @case_id as int,
	  @client_id as int,
	  @discharge_date as datetime,
	  @enlistment_date as datetime,
	  @military_branch as varchar(30)
	  @serial_num as int,
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
	  IF @discharge_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @discharge_date = null
    END
	  IF @enlistment_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @enlistment_date = null
    END
	  IF @military_branch = ''
    BEGIN
    SET @military_branch = null
    END
	  IF @serial_num = 0
    BEGIN
    SET @serial_num = null
    END
	Insert INTO [dbo].[military]
           (
            [case_id]
           ,[client_id]
           ,[discharge_date]
           ,[enlistment_date]
           ,[military_branch]
           ,[serial_num]
            )
     VALUES (
            @case_id
           ,@client_id
           ,@discharge_date
           ,@enlistment_date
           ,@military_branch
           ,@serial_num
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MILITARY]    Script Date: 9/7/2015 11:22:46 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MILITARY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MILITARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MILITARY]
	  @military_id as int,
	  @case_id as int,
	  @client_id as int,
	  @discharge_date as datetime,
	  @enlistment_date as datetime,
	  @military_branch as varchar(30)
	  @serial_num as int,
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
	  IF @discharge_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @discharge_date = null
    END
	  IF @enlistment_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @enlistment_date = null
    END
	  IF @military_branch = ''
    BEGIN
    SET @military_branch = null
    END
	  IF @serial_num = 0
    BEGIN
    SET @serial_num = null
    END
	UPDATE [dbo].[military]
       SET
		   [case_id] = @case_id,
		   [client_id] = @client_id,
		   [discharge_date] = @discharge_date,
		   [enlistment_date] = @enlistment_date,
		   [military_branch] = @military_branch,
		   [serial_num] = @serial_num
       WHERE military_id = @military_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MILITARY]    Script Date: 9/7/2015 11:22:46 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MILITARY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MILITARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MILITARY]
	@military_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.military
	where military_id = @military_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MILITARY]    Script Date: 9/7/2015 11:22:46 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MILITARY]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MILITARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MILITARY]
	  @case_id as int,
	  @client_id as int,
	  @discharge_date as datetime,
	  @enlistment_date as datetime,
	  @military_branch as varchar(30)
	  @serial_num as int,
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
	  IF @discharge_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @discharge_date = null
    END
	  IF @enlistment_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @enlistment_date = null
    END
	  IF @military_branch = ''
    BEGIN
    SET @military_branch = null
    END
	  IF @serial_num = 0
    BEGIN
    SET @serial_num = null
    END
    SELECT [military_id] 
      FROM [dbo].[military] 
       WHERE ([case_id] = @case_id)
       AND ([client_id] = @client_id)
       AND ([discharge_date] = @discharge_date or [discharge_date] is null)
       AND ([enlistment_date] = @enlistment_date)
       AND ([military_branch] like @military_branch)
       AND ([serial_num] = @serial_num)
END
GO

