/****** Object:  Table [dbo].[Shelter]    Script Date: 9/7/2015 11:23:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shelter](
  [Shelter_ID] int IDENTITY(1,1) NOT NULL,
  [Address_ID] int NOT NULL,
  [Shelter_Type] varchar(15) NOT NULL,
  [Max_Capacity] int NOT NULL,
  [AllowsPets] varchar(3) NOT NULL,
 CONSTRAINT [Shelter_Shelter_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Shelter_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_SHELTER]    Script Date: 9/7/2015 11:23:24 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_SHELTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_SHELTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_SHELTER]
           @Shelter_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Shelter_ID]
      ,[Address_ID]
      ,[Shelter_Type]
      ,[Max_Capacity]
      ,[AllowsPets]
  FROM [dbo].[Shelter]
 WHERE Shelter_ID = @Shelter_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_SHELTER]    Script Date: 9/7/2015 11:23:24 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_SHELTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_SHELTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_SHELTER]
	  @Address_ID as int,
	  @Shelter_Type as varchar(15),
	  @Max_Capacity as int
	  @AllowsPets as varchar(3),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Address_ID = 0
    BEGIN
    SET @Address_ID = null
    END
	  IF @Shelter_Type = ''
    BEGIN
    SET @Shelter_Type = null
    END
	  IF @Max_Capacity = 0
    BEGIN
    SET @Max_Capacity = null
    END
	  IF @AllowsPets = ''
    BEGIN
    SET @AllowsPets = null
    END
	Insert INTO [dbo].[Shelter]
           (
            [Address_ID]
           ,[Shelter_Type]
           ,[Max_Capacity]
           ,[AllowsPets]
            )
     VALUES (
            @Address_ID
           ,@Shelter_Type
           ,@Max_Capacity
           ,@AllowsPets
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_SHELTER]    Script Date: 9/7/2015 11:23:24 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_SHELTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_SHELTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_SHELTER]
	  @Shelter_ID as int,
	  @Address_ID as int,
	  @Shelter_Type as varchar(15),
	  @Max_Capacity as int
	  @AllowsPets as varchar(3),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Address_ID = 0
    BEGIN
    SET @Address_ID = null
    END
	  IF @Shelter_Type = ''
    BEGIN
    SET @Shelter_Type = null
    END
	  IF @Max_Capacity = 0
    BEGIN
    SET @Max_Capacity = null
    END
	  IF @AllowsPets = ''
    BEGIN
    SET @AllowsPets = null
    END
	UPDATE [dbo].[Shelter]
       SET
		   [Address_ID] = @Address_ID,
		   [Shelter_Type] = @Shelter_Type,
		   [Max_Capacity] = @Max_Capacity,
		   [AllowsPets] = @AllowsPets
       WHERE Shelter_ID = @Shelter_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_SHELTER]    Script Date: 9/7/2015 11:23:24 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_SHELTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_SHELTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_SHELTER]
	@Shelter_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Shelter
	where Shelter_ID = @Shelter_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_SHELTER]    Script Date: 9/7/2015 11:23:24 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_SHELTER]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_SHELTER]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_SHELTER]
	  @Address_ID as int,
	  @Shelter_Type as varchar(15),
	  @Max_Capacity as int
	  @AllowsPets as varchar(3),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Address_ID = 0
    BEGIN
    SET @Address_ID = null
    END
	  IF @Shelter_Type = ''
    BEGIN
    SET @Shelter_Type = null
    END
	  IF @Max_Capacity = 0
    BEGIN
    SET @Max_Capacity = null
    END
	  IF @AllowsPets = ''
    BEGIN
    SET @AllowsPets = null
    END
    SELECT [Shelter_ID] 
      FROM [dbo].[Shelter] 
       WHERE ([Address_ID] = @Address_ID)
       AND ([Shelter_Type] like @Shelter_Type)
       AND ([Max_Capacity] = @Max_Capacity)
       AND ([AllowsPets] like @AllowsPets)
END
GO

