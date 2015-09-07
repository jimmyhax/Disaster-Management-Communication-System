/****** Object:  Table [dbo].[ProfileFields]    Script Date: 9/7/2015 11:23:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProfileFields](
  [FieldID] int IDENTITY(1,1) NOT NULL,
  [FieldTypeID] int NOT NULL,
  [FieldName] nvarchar(64) NOT NULL,
  [Comment] ntext(1073741823) NULL,
  [PossibleValues] ntext(1073741823) NULL,
  [TextSelectValue] nvarchar(64) NULL,
  [IsMandatory] int NOT NULL,
  [ShowInSignUp] int NOT NULL,
  [FieldGroupID] int NOT NULL,
  [OrderID] int NOT NULL,
  [Created] datetime NOT NULL,
  [Modified] datetime NULL,
  [SortValues] int NULL,
  [IsActive] int NOT NULL,
  [AdminUseOnly] int NOT NULL,
  [VerticalLayout] int NOT NULL,
  [Encrypted] int NULL,
 CONSTRAINT [ProfileFields_FieldID_pk] PRIMARY KEY CLUSTERED 
(
	[FieldID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PROFILEFIELDS]    Script Date: 9/7/2015 11:23:10 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PROFILEFIELDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PROFILEFIELDS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PROFILEFIELDS]
           @FieldID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [FieldID]
      ,[FieldTypeID]
      ,[FieldName]
      ,[Comment]
      ,[PossibleValues]
      ,[TextSelectValue]
      ,[IsMandatory]
      ,[ShowInSignUp]
      ,[FieldGroupID]
      ,[OrderID]
      ,[Created]
      ,[Modified]
      ,[SortValues]
      ,[IsActive]
      ,[AdminUseOnly]
      ,[VerticalLayout]
      ,[Encrypted]
  FROM [dbo].[ProfileFields]
 WHERE FieldID = @FieldID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PROFILEFIELDS]    Script Date: 9/7/2015 11:23:10 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PROFILEFIELDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PROFILEFIELDS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PROFILEFIELDS]
	  @FieldTypeID as int,
	  @FieldName as nvarchar(64),
	  @Comment as ntext(1073741823),
	  @PossibleValues as ntext(1073741823),
	  @TextSelectValue as nvarchar(64),
	  @IsMandatory as int,
	  @ShowInSignUp as int,
	  @FieldGroupID as int,
	  @OrderID as int,
	  @Created as datetime,
	  @Modified as datetime,
	  @SortValues as int,
	  @IsActive as int,
	  @AdminUseOnly as int,
	  @VerticalLayout as int
	  @Encrypted as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @FieldTypeID = 0
    BEGIN
    SET @FieldTypeID = null
    END
	  IF @FieldName = 0
    BEGIN
    SET @FieldName = null
    END
	  IF @Comment = 0
    BEGIN
    SET @Comment = null
    END
	  IF @PossibleValues = 0
    BEGIN
    SET @PossibleValues = null
    END
	  IF @TextSelectValue = 0
    BEGIN
    SET @TextSelectValue = null
    END
	  IF @IsMandatory = 0
    BEGIN
    SET @IsMandatory = null
    END
	  IF @ShowInSignUp = 0
    BEGIN
    SET @ShowInSignUp = null
    END
	  IF @FieldGroupID = 0
    BEGIN
    SET @FieldGroupID = null
    END
	  IF @OrderID = 0
    BEGIN
    SET @OrderID = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
	  IF @SortValues = 0
    BEGIN
    SET @SortValues = null
    END
	  IF @IsActive = 0
    BEGIN
    SET @IsActive = null
    END
	  IF @AdminUseOnly = 0
    BEGIN
    SET @AdminUseOnly = null
    END
	  IF @VerticalLayout = 0
    BEGIN
    SET @VerticalLayout = null
    END
	  IF @Encrypted = 0
    BEGIN
    SET @Encrypted = null
    END
	Insert INTO [dbo].[ProfileFields]
           (
            [FieldTypeID]
           ,[FieldName]
           ,[Comment]
           ,[PossibleValues]
           ,[TextSelectValue]
           ,[IsMandatory]
           ,[ShowInSignUp]
           ,[FieldGroupID]
           ,[OrderID]
           ,[Created]
           ,[Modified]
           ,[SortValues]
           ,[IsActive]
           ,[AdminUseOnly]
           ,[VerticalLayout]
           ,[Encrypted]
            )
     VALUES (
            @FieldTypeID
           ,@FieldName
           ,@Comment
           ,@PossibleValues
           ,@TextSelectValue
           ,@IsMandatory
           ,@ShowInSignUp
           ,@FieldGroupID
           ,@OrderID
           ,@Created
           ,@Modified
           ,@SortValues
           ,@IsActive
           ,@AdminUseOnly
           ,@VerticalLayout
           ,@Encrypted
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PROFILEFIELDS]    Script Date: 9/7/2015 11:23:10 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PROFILEFIELDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PROFILEFIELDS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PROFILEFIELDS]
	  @FieldID as int,
	  @FieldTypeID as int,
	  @FieldName as nvarchar(64),
	  @Comment as ntext(1073741823),
	  @PossibleValues as ntext(1073741823),
	  @TextSelectValue as nvarchar(64),
	  @IsMandatory as int,
	  @ShowInSignUp as int,
	  @FieldGroupID as int,
	  @OrderID as int,
	  @Created as datetime,
	  @Modified as datetime,
	  @SortValues as int,
	  @IsActive as int,
	  @AdminUseOnly as int,
	  @VerticalLayout as int
	  @Encrypted as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @FieldTypeID = 0
    BEGIN
    SET @FieldTypeID = null
    END
	  IF @FieldName = 0
    BEGIN
    SET @FieldName = null
    END
	  IF @Comment = 0
    BEGIN
    SET @Comment = null
    END
	  IF @PossibleValues = 0
    BEGIN
    SET @PossibleValues = null
    END
	  IF @TextSelectValue = 0
    BEGIN
    SET @TextSelectValue = null
    END
	  IF @IsMandatory = 0
    BEGIN
    SET @IsMandatory = null
    END
	  IF @ShowInSignUp = 0
    BEGIN
    SET @ShowInSignUp = null
    END
	  IF @FieldGroupID = 0
    BEGIN
    SET @FieldGroupID = null
    END
	  IF @OrderID = 0
    BEGIN
    SET @OrderID = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
	  IF @SortValues = 0
    BEGIN
    SET @SortValues = null
    END
	  IF @IsActive = 0
    BEGIN
    SET @IsActive = null
    END
	  IF @AdminUseOnly = 0
    BEGIN
    SET @AdminUseOnly = null
    END
	  IF @VerticalLayout = 0
    BEGIN
    SET @VerticalLayout = null
    END
	  IF @Encrypted = 0
    BEGIN
    SET @Encrypted = null
    END
	UPDATE [dbo].[ProfileFields]
       SET
		   [FieldTypeID] = @FieldTypeID,
		   [FieldName] = @FieldName,
		   [Comment] = @Comment,
		   [PossibleValues] = @PossibleValues,
		   [TextSelectValue] = @TextSelectValue,
		   [IsMandatory] = @IsMandatory,
		   [ShowInSignUp] = @ShowInSignUp,
		   [FieldGroupID] = @FieldGroupID,
		   [OrderID] = @OrderID,
		   [Created] = @Created,
		   [Modified] = @Modified,
		   [SortValues] = @SortValues,
		   [IsActive] = @IsActive,
		   [AdminUseOnly] = @AdminUseOnly,
		   [VerticalLayout] = @VerticalLayout,
		   [Encrypted] = @Encrypted
       WHERE FieldID = @FieldID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PROFILEFIELDS]    Script Date: 9/7/2015 11:23:10 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PROFILEFIELDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PROFILEFIELDS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PROFILEFIELDS]
	@FieldID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.ProfileFields
	where FieldID = @FieldID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PROFILEFIELDS]    Script Date: 9/7/2015 11:23:10 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PROFILEFIELDS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PROFILEFIELDS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PROFILEFIELDS]
	  @FieldTypeID as int,
	  @FieldName as nvarchar(64),
	  @Comment as ntext(1073741823),
	  @PossibleValues as ntext(1073741823),
	  @TextSelectValue as nvarchar(64),
	  @IsMandatory as int,
	  @ShowInSignUp as int,
	  @FieldGroupID as int,
	  @OrderID as int,
	  @Created as datetime,
	  @Modified as datetime,
	  @SortValues as int,
	  @IsActive as int,
	  @AdminUseOnly as int,
	  @VerticalLayout as int
	  @Encrypted as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @FieldTypeID = 0
    BEGIN
    SET @FieldTypeID = null
    END
	  IF @FieldName = 0
    BEGIN
    SET @FieldName = null
    END
	  IF @Comment = 0
    BEGIN
    SET @Comment = null
    END
	  IF @PossibleValues = 0
    BEGIN
    SET @PossibleValues = null
    END
	  IF @TextSelectValue = 0
    BEGIN
    SET @TextSelectValue = null
    END
	  IF @IsMandatory = 0
    BEGIN
    SET @IsMandatory = null
    END
	  IF @ShowInSignUp = 0
    BEGIN
    SET @ShowInSignUp = null
    END
	  IF @FieldGroupID = 0
    BEGIN
    SET @FieldGroupID = null
    END
	  IF @OrderID = 0
    BEGIN
    SET @OrderID = null
    END
	  IF @Created = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Created = null
    END
	  IF @Modified = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Modified = null
    END
	  IF @SortValues = 0
    BEGIN
    SET @SortValues = null
    END
	  IF @IsActive = 0
    BEGIN
    SET @IsActive = null
    END
	  IF @AdminUseOnly = 0
    BEGIN
    SET @AdminUseOnly = null
    END
	  IF @VerticalLayout = 0
    BEGIN
    SET @VerticalLayout = null
    END
	  IF @Encrypted = 0
    BEGIN
    SET @Encrypted = null
    END
    SELECT [FieldID] 
      FROM [dbo].[ProfileFields] 
       WHERE ([FieldTypeID] = @FieldTypeID)
       AND ([FieldName] = @FieldName)
       AND ([Comment] = @Comment or [Comment] is null)
       AND ([PossibleValues] = @PossibleValues or [PossibleValues] is null)
       AND ([TextSelectValue] = @TextSelectValue or [TextSelectValue] is null)
       AND ([IsMandatory] = @IsMandatory)
       AND ([ShowInSignUp] = @ShowInSignUp)
       AND ([FieldGroupID] = @FieldGroupID)
       AND ([OrderID] = @OrderID)
       AND ([Created] = @Created)
       AND ([Modified] = @Modified or [Modified] is null)
       AND ([SortValues] = @SortValues or [SortValues] is null)
       AND ([IsActive] = @IsActive)
       AND ([AdminUseOnly] = @AdminUseOnly)
       AND ([VerticalLayout] = @VerticalLayout)
       AND ([Encrypted] = @Encrypted or [Encrypted] is null)
END
GO

