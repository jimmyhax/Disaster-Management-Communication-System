/****** Object:  Table [dbo].[DomainProfileFields]    Script Date: 9/7/2015 11:22:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DomainProfileFields](
  [DomainFieldID] int IDENTITY(1,1) NOT NULL,
  [DomainID] int NOT NULL,
  [ProfileFieldID] int NOT NULL,
 CONSTRAINT [DomainProfileFields_DomainFieldID_pk] PRIMARY KEY CLUSTERED 
(
	[DomainFieldID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_DOMAINPROFILEFIELDS]    Script Date: 9/7/2015 11:22:06 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_DOMAINPROFILEFIELDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_DOMAINPROFILEFIELDS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_DOMAINPROFILEFIELDS]
           @DomainFieldID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [DomainFieldID]
      ,[DomainID]
      ,[ProfileFieldID]
  FROM [dbo].[DomainProfileFields]
 WHERE DomainFieldID = @DomainFieldID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_DOMAINPROFILEFIELDS]    Script Date: 9/7/2015 11:22:06 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_DOMAINPROFILEFIELDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_DOMAINPROFILEFIELDS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_DOMAINPROFILEFIELDS]
	  @DomainID as int
	  @ProfileFieldID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @DomainID = 0
    BEGIN
    SET @DomainID = null
    END
	  IF @ProfileFieldID = 0
    BEGIN
    SET @ProfileFieldID = null
    END
	Insert INTO [dbo].[DomainProfileFields]
           (
            [DomainID]
           ,[ProfileFieldID]
            )
     VALUES (
            @DomainID
           ,@ProfileFieldID
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_DOMAINPROFILEFIELDS]    Script Date: 9/7/2015 11:22:06 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_DOMAINPROFILEFIELDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_DOMAINPROFILEFIELDS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_DOMAINPROFILEFIELDS]
	  @DomainFieldID as int,
	  @DomainID as int
	  @ProfileFieldID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @DomainID = 0
    BEGIN
    SET @DomainID = null
    END
	  IF @ProfileFieldID = 0
    BEGIN
    SET @ProfileFieldID = null
    END
	UPDATE [dbo].[DomainProfileFields]
       SET
		   [DomainID] = @DomainID,
		   [ProfileFieldID] = @ProfileFieldID
       WHERE DomainFieldID = @DomainFieldID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_DOMAINPROFILEFIELDS]    Script Date: 9/7/2015 11:22:06 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_DOMAINPROFILEFIELDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_DOMAINPROFILEFIELDS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_DOMAINPROFILEFIELDS]
	@DomainFieldID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.DomainProfileFields
	where DomainFieldID = @DomainFieldID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_DOMAINPROFILEFIELDS]    Script Date: 9/7/2015 11:22:06 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_DOMAINPROFILEFIELDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_DOMAINPROFILEFIELDS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_DOMAINPROFILEFIELDS]
	  @DomainID as int
	  @ProfileFieldID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @DomainID = 0
    BEGIN
    SET @DomainID = null
    END
	  IF @ProfileFieldID = 0
    BEGIN
    SET @ProfileFieldID = null
    END
    SELECT [DomainFieldID] 
      FROM [dbo].[DomainProfileFields] 
       WHERE ([DomainID] = @DomainID)
       AND ([ProfileFieldID] = @ProfileFieldID)
END
GO

