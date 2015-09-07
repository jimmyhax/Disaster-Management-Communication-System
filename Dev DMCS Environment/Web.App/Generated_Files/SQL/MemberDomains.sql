/****** Object:  Table [dbo].[MemberDomains]    Script Date: 9/7/2015 11:22:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MemberDomains](
  [MemberDomainID] int IDENTITY(1,1) NOT NULL,
  [MemberID] bigint NOT NULL,
  [DomainID] int NOT NULL,
 CONSTRAINT [MemberDomains_MemberDomainID_pk] PRIMARY KEY CLUSTERED 
(
	[MemberDomainID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MEMBERDOMAINS]    Script Date: 9/7/2015 11:22:39 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MEMBERDOMAINS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MEMBERDOMAINS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MEMBERDOMAINS]
           @MemberDomainID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [MemberDomainID]
      ,[MemberID]
      ,[DomainID]
  FROM [dbo].[MemberDomains]
 WHERE MemberDomainID = @MemberDomainID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MEMBERDOMAINS]    Script Date: 9/7/2015 11:22:39 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MEMBERDOMAINS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MEMBERDOMAINS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MEMBERDOMAINS]
	  @MemberID as bigint
	  @DomainID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @DomainID = 0
    BEGIN
    SET @DomainID = null
    END
	Insert INTO [dbo].[MemberDomains]
           (
            [MemberID]
           ,[DomainID]
            )
     VALUES (
            @MemberID
           ,@DomainID
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MEMBERDOMAINS]    Script Date: 9/7/2015 11:22:39 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MEMBERDOMAINS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MEMBERDOMAINS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MEMBERDOMAINS]
	  @MemberDomainID as int,
	  @MemberID as bigint
	  @DomainID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @DomainID = 0
    BEGIN
    SET @DomainID = null
    END
	UPDATE [dbo].[MemberDomains]
       SET
		   [MemberID] = @MemberID,
		   [DomainID] = @DomainID
       WHERE MemberDomainID = @MemberDomainID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MEMBERDOMAINS]    Script Date: 9/7/2015 11:22:39 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MEMBERDOMAINS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MEMBERDOMAINS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MEMBERDOMAINS]
	@MemberDomainID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.MemberDomains
	where MemberDomainID = @MemberDomainID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MEMBERDOMAINS]    Script Date: 9/7/2015 11:22:39 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MEMBERDOMAINS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MEMBERDOMAINS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MEMBERDOMAINS]
	  @MemberID as bigint
	  @DomainID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @DomainID = 0
    BEGIN
    SET @DomainID = null
    END
    SELECT [MemberDomainID] 
      FROM [dbo].[MemberDomains] 
       WHERE ([MemberID] = @MemberID)
       AND ([DomainID] = @DomainID)
END
GO

