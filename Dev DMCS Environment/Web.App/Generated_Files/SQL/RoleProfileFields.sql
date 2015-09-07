/****** Object:  Table [dbo].[RoleProfileFields]    Script Date: 9/7/2015 11:23:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoleProfileFields](
  [RoleFieldID] int IDENTITY(1,1) NOT NULL,
  [RoleID] bigint NOT NULL,
  [ProfileFieldID] int NOT NULL,
 CONSTRAINT [RoleProfileFields_RoleFieldID_pk] PRIMARY KEY CLUSTERED 
(
	[RoleFieldID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ROLEPROFILEFIELDS]    Script Date: 9/7/2015 11:23:20 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ROLEPROFILEFIELDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ROLEPROFILEFIELDS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ROLEPROFILEFIELDS]
           @RoleFieldID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [RoleFieldID]
      ,[RoleID]
      ,[ProfileFieldID]
  FROM [dbo].[RoleProfileFields]
 WHERE RoleFieldID = @RoleFieldID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_ROLEPROFILEFIELDS]    Script Date: 9/7/2015 11:23:20 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_ROLEPROFILEFIELDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_ROLEPROFILEFIELDS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_ROLEPROFILEFIELDS]
	  @RoleID as bigint
	  @ProfileFieldID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @RoleID = 0
    BEGIN
    SET @RoleID = null
    END
	  IF @ProfileFieldID = 0
    BEGIN
    SET @ProfileFieldID = null
    END
	Insert INTO [dbo].[RoleProfileFields]
           (
            [RoleID]
           ,[ProfileFieldID]
            )
     VALUES (
            @RoleID
           ,@ProfileFieldID
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_ROLEPROFILEFIELDS]    Script Date: 9/7/2015 11:23:20 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_ROLEPROFILEFIELDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_ROLEPROFILEFIELDS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_ROLEPROFILEFIELDS]
	  @RoleFieldID as int,
	  @RoleID as bigint
	  @ProfileFieldID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @RoleID = 0
    BEGIN
    SET @RoleID = null
    END
	  IF @ProfileFieldID = 0
    BEGIN
    SET @ProfileFieldID = null
    END
	UPDATE [dbo].[RoleProfileFields]
       SET
		   [RoleID] = @RoleID,
		   [ProfileFieldID] = @ProfileFieldID
       WHERE RoleFieldID = @RoleFieldID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_ROLEPROFILEFIELDS]    Script Date: 9/7/2015 11:23:20 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_ROLEPROFILEFIELDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_ROLEPROFILEFIELDS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_ROLEPROFILEFIELDS]
	@RoleFieldID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.RoleProfileFields
	where RoleFieldID = @RoleFieldID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_ROLEPROFILEFIELDS]    Script Date: 9/7/2015 11:23:20 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_ROLEPROFILEFIELDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_ROLEPROFILEFIELDS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_ROLEPROFILEFIELDS]
	  @RoleID as bigint
	  @ProfileFieldID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @RoleID = 0
    BEGIN
    SET @RoleID = null
    END
	  IF @ProfileFieldID = 0
    BEGIN
    SET @ProfileFieldID = null
    END
    SELECT [RoleFieldID] 
      FROM [dbo].[RoleProfileFields] 
       WHERE ([RoleID] = @RoleID)
       AND ([ProfileFieldID] = @ProfileFieldID)
END
GO

