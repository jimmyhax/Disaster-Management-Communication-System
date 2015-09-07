/****** Object:  Table [dbo].[MemberProfileFields]    Script Date: 9/7/2015 11:22:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MemberProfileFields](
  [ProfileFieldID] int IDENTITY(1,1) NOT NULL,
  [MemberID] bigint NOT NULL,
  [FieldID] int NOT NULL,
  [FieldValue] ntext(1073741823) NOT NULL,
  [Created] datetime NOT NULL,
  [Modified] datetime NULL,
 CONSTRAINT [MemberProfileFields_ProfileFieldID_pk] PRIMARY KEY CLUSTERED 
(
	[ProfileFieldID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MEMBERPROFILEFIELDS]    Script Date: 9/7/2015 11:22:40 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MEMBERPROFILEFIELDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MEMBERPROFILEFIELDS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MEMBERPROFILEFIELDS]
           @ProfileFieldID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [ProfileFieldID]
      ,[MemberID]
      ,[FieldID]
      ,[FieldValue]
      ,[Created]
      ,[Modified]
  FROM [dbo].[MemberProfileFields]
 WHERE ProfileFieldID = @ProfileFieldID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MEMBERPROFILEFIELDS]    Script Date: 9/7/2015 11:22:40 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MEMBERPROFILEFIELDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MEMBERPROFILEFIELDS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MEMBERPROFILEFIELDS]
	  @MemberID as bigint,
	  @FieldID as int,
	  @FieldValue as ntext(1073741823),
	  @Created as datetime
	  @Modified as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @FieldID = 0
    BEGIN
    SET @FieldID = null
    END
	  IF @FieldValue = 0
    BEGIN
    SET @FieldValue = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
	Insert INTO [dbo].[MemberProfileFields]
           (
            [MemberID]
           ,[FieldID]
           ,[FieldValue]
           ,[Created]
           ,[Modified]
            )
     VALUES (
            @MemberID
           ,@FieldID
           ,@FieldValue
           ,@Created
           ,@Modified
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MEMBERPROFILEFIELDS]    Script Date: 9/7/2015 11:22:40 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MEMBERPROFILEFIELDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MEMBERPROFILEFIELDS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MEMBERPROFILEFIELDS]
	  @ProfileFieldID as int,
	  @MemberID as bigint,
	  @FieldID as int,
	  @FieldValue as ntext(1073741823),
	  @Created as datetime
	  @Modified as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @FieldID = 0
    BEGIN
    SET @FieldID = null
    END
	  IF @FieldValue = 0
    BEGIN
    SET @FieldValue = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
	UPDATE [dbo].[MemberProfileFields]
       SET
		   [MemberID] = @MemberID,
		   [FieldID] = @FieldID,
		   [FieldValue] = @FieldValue,
		   [Created] = @Created,
		   [Modified] = @Modified
       WHERE ProfileFieldID = @ProfileFieldID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MEMBERPROFILEFIELDS]    Script Date: 9/7/2015 11:22:40 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MEMBERPROFILEFIELDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MEMBERPROFILEFIELDS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MEMBERPROFILEFIELDS]
	@ProfileFieldID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.MemberProfileFields
	where ProfileFieldID = @ProfileFieldID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MEMBERPROFILEFIELDS]    Script Date: 9/7/2015 11:22:40 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MEMBERPROFILEFIELDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MEMBERPROFILEFIELDS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MEMBERPROFILEFIELDS]
	  @MemberID as bigint,
	  @FieldID as int,
	  @FieldValue as ntext(1073741823),
	  @Created as datetime
	  @Modified as datetime,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @FieldID = 0
    BEGIN
    SET @FieldID = null
    END
	  IF @FieldValue = 0
    BEGIN
    SET @FieldValue = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
    SELECT [ProfileFieldID] 
      FROM [dbo].[MemberProfileFields] 
       WHERE ([MemberID] = @MemberID)
       AND ([FieldID] = @FieldID)
       AND ([FieldValue] = @FieldValue)
       AND ([Created] = @Created)
       AND ([Modified] = @Modified or [Modified] is null)
END
GO

