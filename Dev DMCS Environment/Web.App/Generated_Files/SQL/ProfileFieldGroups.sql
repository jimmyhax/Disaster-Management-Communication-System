/****** Object:  Table [dbo].[ProfileFieldGroups]    Script Date: 9/7/2015 11:23:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProfileFieldGroups](
  [FieldGroupID] int IDENTITY(1,1) NOT NULL,
  [FieldGroupName] nvarchar(64) NOT NULL,
  [FieldGroupDescription] nvarchar(1024) NOT NULL,
  [OrderID] int NOT NULL,
  [IsActive] int NOT NULL,
  [AdminUseOnly] int NOT NULL,
 CONSTRAINT [ProfileFieldGroups_FieldGroupID_pk] PRIMARY KEY CLUSTERED 
(
	[FieldGroupID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PROFILEFIELDGROUPS]    Script Date: 9/7/2015 11:23:08 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PROFILEFIELDGROUPS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PROFILEFIELDGROUPS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PROFILEFIELDGROUPS]
           @FieldGroupID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [FieldGroupID]
      ,[FieldGroupName]
      ,[FieldGroupDescription]
      ,[OrderID]
      ,[IsActive]
      ,[AdminUseOnly]
  FROM [dbo].[ProfileFieldGroups]
 WHERE FieldGroupID = @FieldGroupID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PROFILEFIELDGROUPS]    Script Date: 9/7/2015 11:23:08 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PROFILEFIELDGROUPS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PROFILEFIELDGROUPS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PROFILEFIELDGROUPS]
	  @FieldGroupName as nvarchar(64),
	  @FieldGroupDescription as nvarchar(1024),
	  @OrderID as int,
	  @IsActive as int
	  @AdminUseOnly as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @FieldGroupName = 0
    BEGIN
    SET @FieldGroupName = null
    END
	  IF @FieldGroupDescription = 0
    BEGIN
    SET @FieldGroupDescription = null
    END
	  IF @OrderID = 0
    BEGIN
    SET @OrderID = null
    END
	  IF @IsActive = 0
    BEGIN
    SET @IsActive = null
    END
	  IF @AdminUseOnly = 0
    BEGIN
    SET @AdminUseOnly = null
    END
	Insert INTO [dbo].[ProfileFieldGroups]
           (
            [FieldGroupName]
           ,[FieldGroupDescription]
           ,[OrderID]
           ,[IsActive]
           ,[AdminUseOnly]
            )
     VALUES (
            @FieldGroupName
           ,@FieldGroupDescription
           ,@OrderID
           ,@IsActive
           ,@AdminUseOnly
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PROFILEFIELDGROUPS]    Script Date: 9/7/2015 11:23:09 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PROFILEFIELDGROUPS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PROFILEFIELDGROUPS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PROFILEFIELDGROUPS]
	  @FieldGroupID as int,
	  @FieldGroupName as nvarchar(64),
	  @FieldGroupDescription as nvarchar(1024),
	  @OrderID as int,
	  @IsActive as int
	  @AdminUseOnly as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @FieldGroupName = 0
    BEGIN
    SET @FieldGroupName = null
    END
	  IF @FieldGroupDescription = 0
    BEGIN
    SET @FieldGroupDescription = null
    END
	  IF @OrderID = 0
    BEGIN
    SET @OrderID = null
    END
	  IF @IsActive = 0
    BEGIN
    SET @IsActive = null
    END
	  IF @AdminUseOnly = 0
    BEGIN
    SET @AdminUseOnly = null
    END
	UPDATE [dbo].[ProfileFieldGroups]
       SET
		   [FieldGroupName] = @FieldGroupName,
		   [FieldGroupDescription] = @FieldGroupDescription,
		   [OrderID] = @OrderID,
		   [IsActive] = @IsActive,
		   [AdminUseOnly] = @AdminUseOnly
       WHERE FieldGroupID = @FieldGroupID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PROFILEFIELDGROUPS]    Script Date: 9/7/2015 11:23:09 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PROFILEFIELDGROUPS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PROFILEFIELDGROUPS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PROFILEFIELDGROUPS]
	@FieldGroupID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.ProfileFieldGroups
	where FieldGroupID = @FieldGroupID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PROFILEFIELDGROUPS]    Script Date: 9/7/2015 11:23:09 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PROFILEFIELDGROUPS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PROFILEFIELDGROUPS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PROFILEFIELDGROUPS]
	  @FieldGroupName as nvarchar(64),
	  @FieldGroupDescription as nvarchar(1024),
	  @OrderID as int,
	  @IsActive as int
	  @AdminUseOnly as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @FieldGroupName = 0
    BEGIN
    SET @FieldGroupName = null
    END
	  IF @FieldGroupDescription = 0
    BEGIN
    SET @FieldGroupDescription = null
    END
	  IF @OrderID = 0
    BEGIN
    SET @OrderID = null
    END
	  IF @IsActive = 0
    BEGIN
    SET @IsActive = null
    END
	  IF @AdminUseOnly = 0
    BEGIN
    SET @AdminUseOnly = null
    END
    SELECT [FieldGroupID] 
      FROM [dbo].[ProfileFieldGroups] 
       WHERE ([FieldGroupName] = @FieldGroupName)
       AND ([FieldGroupDescription] = @FieldGroupDescription)
       AND ([OrderID] = @OrderID)
       AND ([IsActive] = @IsActive)
       AND ([AdminUseOnly] = @AdminUseOnly)
END
GO

