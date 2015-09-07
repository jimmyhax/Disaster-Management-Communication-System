/****** Object:  Table [dbo].[MemberAttempts]    Script Date: 9/7/2015 11:22:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MemberAttempts](
  [AttemptID] bigint IDENTITY(1,1) NOT NULL,
  [MemberID] bigint NOT NULL,
  [AttemptType] int NOT NULL,
  [Attempts] int NOT NULL,
  [Created] datetime NOT NULL,
  [Modified] datetime NULL,
  [IsAttemptValid] int NOT NULL,
 CONSTRAINT [MemberAttempts_AttemptID_pk] PRIMARY KEY CLUSTERED 
(
	[AttemptID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MEMBERATTEMPTS]    Script Date: 9/7/2015 11:22:37 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MEMBERATTEMPTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MEMBERATTEMPTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MEMBERATTEMPTS]
           @AttemptID as bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [AttemptID]
      ,[MemberID]
      ,[AttemptType]
      ,[Attempts]
      ,[Created]
      ,[Modified]
      ,[IsAttemptValid]
  FROM [dbo].[MemberAttempts]
 WHERE AttemptID = @AttemptID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MEMBERATTEMPTS]    Script Date: 9/7/2015 11:22:37 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MEMBERATTEMPTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MEMBERATTEMPTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MEMBERATTEMPTS]
	  @MemberID as bigint,
	  @AttemptType as int,
	  @Attempts as int,
	  @Created as datetime,
	  @Modified as datetime
	  @IsAttemptValid as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @AttemptType = 0
    BEGIN
    SET @AttemptType = null
    END
	  IF @Attempts = 0
    BEGIN
    SET @Attempts = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
	  IF @IsAttemptValid = 0
    BEGIN
    SET @IsAttemptValid = null
    END
	Insert INTO [dbo].[MemberAttempts]
           (
            [MemberID]
           ,[AttemptType]
           ,[Attempts]
           ,[Created]
           ,[Modified]
           ,[IsAttemptValid]
            )
     VALUES (
            @MemberID
           ,@AttemptType
           ,@Attempts
           ,@Created
           ,@Modified
           ,@IsAttemptValid
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MEMBERATTEMPTS]    Script Date: 9/7/2015 11:22:37 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MEMBERATTEMPTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MEMBERATTEMPTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MEMBERATTEMPTS]
	  @AttemptID as bigint,
	  @MemberID as bigint,
	  @AttemptType as int,
	  @Attempts as int,
	  @Created as datetime,
	  @Modified as datetime
	  @IsAttemptValid as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @AttemptType = 0
    BEGIN
    SET @AttemptType = null
    END
	  IF @Attempts = 0
    BEGIN
    SET @Attempts = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
	  IF @IsAttemptValid = 0
    BEGIN
    SET @IsAttemptValid = null
    END
	UPDATE [dbo].[MemberAttempts]
       SET
		   [MemberID] = @MemberID,
		   [AttemptType] = @AttemptType,
		   [Attempts] = @Attempts,
		   [Created] = @Created,
		   [Modified] = @Modified,
		   [IsAttemptValid] = @IsAttemptValid
       WHERE AttemptID = @AttemptID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MEMBERATTEMPTS]    Script Date: 9/7/2015 11:22:37 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MEMBERATTEMPTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MEMBERATTEMPTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MEMBERATTEMPTS]
	@AttemptID bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.MemberAttempts
	where AttemptID = @AttemptID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MEMBERATTEMPTS]    Script Date: 9/7/2015 11:22:37 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MEMBERATTEMPTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MEMBERATTEMPTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MEMBERATTEMPTS]
	  @MemberID as bigint,
	  @AttemptType as int,
	  @Attempts as int,
	  @Created as datetime,
	  @Modified as datetime
	  @IsAttemptValid as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @MemberID = 0
    BEGIN
    SET @MemberID = null
    END
	  IF @AttemptType = 0
    BEGIN
    SET @AttemptType = null
    END
	  IF @Attempts = 0
    BEGIN
    SET @Attempts = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
	  IF @IsAttemptValid = 0
    BEGIN
    SET @IsAttemptValid = null
    END
    SELECT [AttemptID] 
      FROM [dbo].[MemberAttempts] 
       WHERE ([MemberID] = @MemberID)
       AND ([AttemptType] = @AttemptType)
       AND ([Attempts] = @Attempts)
       AND ([Created] = @Created)
       AND ([Modified] = @Modified or [Modified] is null)
       AND ([IsAttemptValid] = @IsAttemptValid)
END
GO

