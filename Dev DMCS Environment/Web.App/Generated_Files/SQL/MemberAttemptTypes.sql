/****** Object:  Table [dbo].[MemberAttemptTypes]    Script Date: 9/7/2015 11:22:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MemberAttemptTypes](
  [MemberAttemptTypeID] int IDENTITY(1,1) NOT NULL,
  [AttemptTypeDescription] nvarchar(1024) NOT NULL,
 CONSTRAINT [MemberAttemptTypes_MemberAttemptTypeID_pk] PRIMARY KEY CLUSTERED 
(
	[MemberAttemptTypeID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MEMBERATTEMPTTYPES]    Script Date: 9/7/2015 11:22:38 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MEMBERATTEMPTTYPES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MEMBERATTEMPTTYPES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MEMBERATTEMPTTYPES]
           @MemberAttemptTypeID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [MemberAttemptTypeID]
      ,[AttemptTypeDescription]
  FROM [dbo].[MemberAttemptTypes]
 WHERE MemberAttemptTypeID = @MemberAttemptTypeID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MEMBERATTEMPTTYPES]    Script Date: 9/7/2015 11:22:38 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MEMBERATTEMPTTYPES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MEMBERATTEMPTTYPES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MEMBERATTEMPTTYPES]
	  @MemberAttemptTypeID as int
	  @AttemptTypeDescription as nvarchar(1024),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @AttemptTypeDescription = 0
    BEGIN
    SET @AttemptTypeDescription = null
    END
	Insert INTO [dbo].[MemberAttemptTypes]
           (
            [MemberAttemptTypeID]
           ,[AttemptTypeDescription]
            )
     VALUES (
            @MemberAttemptTypeID
           ,@AttemptTypeDescription
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MEMBERATTEMPTTYPES]    Script Date: 9/7/2015 11:22:38 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MEMBERATTEMPTTYPES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MEMBERATTEMPTTYPES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MEMBERATTEMPTTYPES]
	  @MemberAttemptTypeID as int
	  @AttemptTypeDescription as nvarchar(1024),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @AttemptTypeDescription = 0
    BEGIN
    SET @AttemptTypeDescription = null
    END
	UPDATE [dbo].[MemberAttemptTypes]
       SET
		   [AttemptTypeDescription] = @AttemptTypeDescription
       WHERE MemberAttemptTypeID = @MemberAttemptTypeID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MEMBERATTEMPTTYPES]    Script Date: 9/7/2015 11:22:38 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MEMBERATTEMPTTYPES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MEMBERATTEMPTTYPES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MEMBERATTEMPTTYPES]
	@MemberAttemptTypeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.MemberAttemptTypes
	where MemberAttemptTypeID = @MemberAttemptTypeID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MEMBERATTEMPTTYPES]    Script Date: 9/7/2015 11:22:38 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MEMBERATTEMPTTYPES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MEMBERATTEMPTTYPES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MEMBERATTEMPTTYPES]
	  @AttemptTypeDescription as nvarchar(1024),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @AttemptTypeDescription = 0
    BEGIN
    SET @AttemptTypeDescription = null
    END
    SELECT [MemberAttemptTypeID] 
      FROM [dbo].[MemberAttemptTypes] 
       WHERE ([AttemptTypeDescription] = @AttemptTypeDescription)
END
GO

