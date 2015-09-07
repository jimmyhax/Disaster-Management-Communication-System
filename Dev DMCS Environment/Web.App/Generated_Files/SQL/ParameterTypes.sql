/****** Object:  Table [dbo].[ParameterTypes]    Script Date: 9/7/2015 11:22:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParameterTypes](
  [TypeID] int IDENTITY(1,1) NOT NULL,
  [TypeName] nvarchar(128) NOT NULL,
  [TypeSize] int NOT NULL,
 CONSTRAINT [ParameterTypes_TypeID_pk] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PARAMETERTYPES]    Script Date: 9/7/2015 11:22:57 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_PARAMETERTYPES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_PARAMETERTYPES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PARAMETERTYPES]
           @TypeID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [TypeID]
      ,[TypeName]
      ,[TypeSize]
  FROM [dbo].[ParameterTypes]
 WHERE TypeID = @TypeID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_PARAMETERTYPES]    Script Date: 9/7/2015 11:22:57 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_PARAMETERTYPES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_PARAMETERTYPES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_PARAMETERTYPES]
	  @TypeID as int,
	  @TypeName as nvarchar(128)
	  @TypeSize as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @TypeName = 0
    BEGIN
    SET @TypeName = null
    END
	  IF @TypeSize = 0
    BEGIN
    SET @TypeSize = null
    END
	Insert INTO [dbo].[ParameterTypes]
           (
            [TypeID]
           ,[TypeName]
           ,[TypeSize]
            )
     VALUES (
            @TypeID
           ,@TypeName
           ,@TypeSize
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_PARAMETERTYPES]    Script Date: 9/7/2015 11:22:57 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_PARAMETERTYPES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_PARAMETERTYPES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_PARAMETERTYPES]
	  @TypeID as int,
	  @TypeName as nvarchar(128)
	  @TypeSize as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @TypeName = 0
    BEGIN
    SET @TypeName = null
    END
	  IF @TypeSize = 0
    BEGIN
    SET @TypeSize = null
    END
	UPDATE [dbo].[ParameterTypes]
       SET
		   [TypeName] = @TypeName,
		   [TypeSize] = @TypeSize
       WHERE TypeID = @TypeID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_PARAMETERTYPES]    Script Date: 9/7/2015 11:22:57 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_PARAMETERTYPES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_PARAMETERTYPES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_PARAMETERTYPES]
	@TypeID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.ParameterTypes
	where TypeID = @TypeID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_PARAMETERTYPES]    Script Date: 9/7/2015 11:22:57 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_PARAMETERTYPES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_PARAMETERTYPES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_PARAMETERTYPES]
	  @TypeName as nvarchar(128)
	  @TypeSize as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @TypeName = 0
    BEGIN
    SET @TypeName = null
    END
	  IF @TypeSize = 0
    BEGIN
    SET @TypeSize = null
    END
    SELECT [TypeID] 
      FROM [dbo].[ParameterTypes] 
       WHERE ([TypeName] = @TypeName)
       AND ([TypeSize] = @TypeSize)
END
GO

