/****** Object:  Table [dbo].[services]    Script Date: 9/7/2015 11:23:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[services](
  [service_id] int IDENTITY(1,1) NOT NULL,
  [Company] varchar(15) NOT NULL,
  [service_type] char(1) NOT NULL,
  [Estimated_Time] datetime NOT NULL,
  [Email] varchar(1) NULL,
  [Phone_Number] int NOT NULL,
  [Full_Cost] int NULL,
  [Estimated_Cost] int NOT NULL,
 CONSTRAINT [services_service_id_pk] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_SERVICES]    Script Date: 9/7/2015 11:23:23 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_SERVICES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_SERVICES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_SERVICES]
           @service_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [service_id]
      ,[Company]
      ,[service_type]
      ,[Estimated_Time]
      ,[Email]
      ,[Phone_Number]
      ,[Full_Cost]
      ,[Estimated_Cost]
  FROM [dbo].[services]
 WHERE service_id = @service_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_SERVICES]    Script Date: 9/7/2015 11:23:23 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_SERVICES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_SERVICES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_SERVICES]
	  @Company as varchar(15),
	  @service_type as char(1),
	  @Estimated_Time as datetime,
	  @Email as varchar(1),
	  @Phone_Number as int,
	  @Full_Cost as int
	  @Estimated_Cost as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Company = ''
    BEGIN
    SET @Company = null
    END
	  IF @service_type = ''
    BEGIN
    SET @service_type = null
    END
	  IF @Estimated_Time = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Estimated_Time = null
    END
	  IF @Email = ''
    BEGIN
    SET @Email = null
    END
	  IF @Phone_Number = 0
    BEGIN
    SET @Phone_Number = null
    END
	  IF @Full_Cost = 0
    BEGIN
    SET @Full_Cost = null
    END
	  IF @Estimated_Cost = 0
    BEGIN
    SET @Estimated_Cost = null
    END
	Insert INTO [dbo].[services]
           (
            [Company]
           ,[service_type]
           ,[Estimated_Time]
           ,[Email]
           ,[Phone_Number]
           ,[Full_Cost]
           ,[Estimated_Cost]
            )
     VALUES (
            @Company
           ,@service_type
           ,@Estimated_Time
           ,@Email
           ,@Phone_Number
           ,@Full_Cost
           ,@Estimated_Cost
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_SERVICES]    Script Date: 9/7/2015 11:23:23 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_SERVICES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_SERVICES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_SERVICES]
	  @service_id as int,
	  @Company as varchar(15),
	  @service_type as char(1),
	  @Estimated_Time as datetime,
	  @Email as varchar(1),
	  @Phone_Number as int,
	  @Full_Cost as int
	  @Estimated_Cost as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Company = ''
    BEGIN
    SET @Company = null
    END
	  IF @service_type = ''
    BEGIN
    SET @service_type = null
    END
	  IF @Estimated_Time = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Estimated_Time = null
    END
	  IF @Email = ''
    BEGIN
    SET @Email = null
    END
	  IF @Phone_Number = 0
    BEGIN
    SET @Phone_Number = null
    END
	  IF @Full_Cost = 0
    BEGIN
    SET @Full_Cost = null
    END
	  IF @Estimated_Cost = 0
    BEGIN
    SET @Estimated_Cost = null
    END
	UPDATE [dbo].[services]
       SET
		   [Company] = @Company,
		   [service_type] = @service_type,
		   [Estimated_Time] = @Estimated_Time,
		   [Email] = @Email,
		   [Phone_Number] = @Phone_Number,
		   [Full_Cost] = @Full_Cost,
		   [Estimated_Cost] = @Estimated_Cost
       WHERE service_id = @service_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_SERVICES]    Script Date: 9/7/2015 11:23:23 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_SERVICES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_SERVICES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_SERVICES]
	@service_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.services
	where service_id = @service_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_SERVICES]    Script Date: 9/7/2015 11:23:23 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_SERVICES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_SERVICES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_SERVICES]
	  @Company as varchar(15),
	  @service_type as char(1),
	  @Estimated_Time as datetime,
	  @Email as varchar(1),
	  @Phone_Number as int,
	  @Full_Cost as int
	  @Estimated_Cost as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Company = ''
    BEGIN
    SET @Company = null
    END
	  IF @service_type = ''
    BEGIN
    SET @service_type = null
    END
	  IF @Estimated_Time = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Estimated_Time = null
    END
	  IF @Email = ''
    BEGIN
    SET @Email = null
    END
	  IF @Phone_Number = 0
    BEGIN
    SET @Phone_Number = null
    END
	  IF @Full_Cost = 0
    BEGIN
    SET @Full_Cost = null
    END
	  IF @Estimated_Cost = 0
    BEGIN
    SET @Estimated_Cost = null
    END
    SELECT [service_id] 
      FROM [dbo].[services] 
       WHERE ([Company] like @Company)
       AND ([service_type] = @service_type)
       AND ([Estimated_Time] = @Estimated_Time)
       AND ([Email] like @Email or [Email] is null)
       AND ([Phone_Number] = @Phone_Number)
       AND ([Full_Cost] = @Full_Cost or [Full_Cost] is null)
       AND ([Estimated_Cost] = @Estimated_Cost)
END
GO

