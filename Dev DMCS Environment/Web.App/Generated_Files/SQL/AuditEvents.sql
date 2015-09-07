/****** Object:  Table [dbo].[AuditEvents]    Script Date: 9/7/2015 11:21:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AuditEvents](
  [EventID] bigint IDENTITY(1,1) NOT NULL,
  [EventSource] int NOT NULL,
  [EventType] int NOT NULL,
  [Description] nvarchar(MAX) NOT NULL,
  [MemberEmail] nvarchar(255) NOT NULL,
  [Details] ntext(1073741823) NULL,
  [IPAddress] nvarchar(64) NOT NULL,
  [Created] datetime NOT NULL,
 CONSTRAINT [AuditEvents_EventID_pk] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_AUDITEVENTS]    Script Date: 9/7/2015 11:21:46 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_AUDITEVENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_AUDITEVENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_AUDITEVENTS]
           @EventID as bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [EventID]
      ,[EventSource]
      ,[EventType]
      ,[Description]
      ,[MemberEmail]
      ,[Details]
      ,[IPAddress]
      ,[Created]
  FROM [dbo].[AuditEvents]
 WHERE EventID = @EventID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_AUDITEVENTS]    Script Date: 9/7/2015 11:21:46 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_AUDITEVENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_AUDITEVENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_AUDITEVENTS]
	  @EventSource as int,
	  @EventType as int,
	  @Description as nvarchar(MAX),
	  @MemberEmail as nvarchar(255),
	  @Details as ntext(1073741823),
	  @IPAddress as nvarchar(64)
	  @Created as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @EventSource = 0
    BEGIN
    SET @EventSource = null
    END
	  IF @EventType = 0
    BEGIN
    SET @EventType = null
    END
	  IF @Description = 0
    BEGIN
    SET @Description = null
    END
	  IF @MemberEmail = 0
    BEGIN
    SET @MemberEmail = null
    END
	  IF @Details = 0
    BEGIN
    SET @Details = null
    END
	  IF @IPAddress = 0
    BEGIN
    SET @IPAddress = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	Insert INTO [dbo].[AuditEvents]
           (
            [EventSource]
           ,[EventType]
           ,[Description]
           ,[MemberEmail]
           ,[Details]
           ,[IPAddress]
           ,[Created]
            )
     VALUES (
            @EventSource
           ,@EventType
           ,@Description
           ,@MemberEmail
           ,@Details
           ,@IPAddress
           ,@Created
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_AUDITEVENTS]    Script Date: 9/7/2015 11:21:46 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_AUDITEVENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_AUDITEVENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_AUDITEVENTS]
	  @EventID as bigint,
	  @EventSource as int,
	  @EventType as int,
	  @Description as nvarchar(MAX),
	  @MemberEmail as nvarchar(255),
	  @Details as ntext(1073741823),
	  @IPAddress as nvarchar(64)
	  @Created as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @EventSource = 0
    BEGIN
    SET @EventSource = null
    END
	  IF @EventType = 0
    BEGIN
    SET @EventType = null
    END
	  IF @Description = 0
    BEGIN
    SET @Description = null
    END
	  IF @MemberEmail = 0
    BEGIN
    SET @MemberEmail = null
    END
	  IF @Details = 0
    BEGIN
    SET @Details = null
    END
	  IF @IPAddress = 0
    BEGIN
    SET @IPAddress = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	UPDATE [dbo].[AuditEvents]
       SET
		   [EventSource] = @EventSource,
		   [EventType] = @EventType,
		   [Description] = @Description,
		   [MemberEmail] = @MemberEmail,
		   [Details] = @Details,
		   [IPAddress] = @IPAddress,
		   [Created] = @Created
       WHERE EventID = @EventID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_AUDITEVENTS]    Script Date: 9/7/2015 11:21:46 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_AUDITEVENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_AUDITEVENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_AUDITEVENTS]
	@EventID bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.AuditEvents
	where EventID = @EventID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_AUDITEVENTS]    Script Date: 9/7/2015 11:21:46 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_AUDITEVENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_AUDITEVENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_AUDITEVENTS]
	  @EventSource as int,
	  @EventType as int,
	  @Description as nvarchar(MAX),
	  @MemberEmail as nvarchar(255),
	  @Details as ntext(1073741823),
	  @IPAddress as nvarchar(64)
	  @Created as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @EventSource = 0
    BEGIN
    SET @EventSource = null
    END
	  IF @EventType = 0
    BEGIN
    SET @EventType = null
    END
	  IF @Description = 0
    BEGIN
    SET @Description = null
    END
	  IF @MemberEmail = 0
    BEGIN
    SET @MemberEmail = null
    END
	  IF @Details = 0
    BEGIN
    SET @Details = null
    END
	  IF @IPAddress = 0
    BEGIN
    SET @IPAddress = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
    SELECT [EventID] 
      FROM [dbo].[AuditEvents] 
       WHERE ([EventSource] = @EventSource)
       AND ([EventType] = @EventType)
       AND ([Description] = @Description)
       AND ([MemberEmail] = @MemberEmail)
       AND ([Details] = @Details or [Details] is null)
       AND ([IPAddress] = @IPAddress)
       AND ([Created] = @Created)
END
GO

