/****** Object:  Table [dbo].[FEMA]    Script Date: 9/7/2015 11:22:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FEMA](
  [FEMA_ID] int IDENTITY(1,1) NOT NULL,
  [Cost_Code] int NOT NULL,
  [Equipment] varchar(50) NOT NULL,
  [Specification] varchar(50) NOT NULL,
  [Capacity_Size] varchar(50) NOT NULL,
  [HP] varchar(50) NOT NULL,
  [Notes] varchar(100) NOT NULL,
  [Unit] varchar(50) NOT NULL,
  [Rate] varchar(50) NOT NULL,
 CONSTRAINT [FEMA_FEMA_ID_pk] PRIMARY KEY CLUSTERED 
(
	[FEMA_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_FEMA]    Script Date: 9/7/2015 11:22:22 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_FEMA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_FEMA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_FEMA]
           @FEMA_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [FEMA_ID]
      ,[Cost_Code]
      ,[Equipment]
      ,[Specification]
      ,[Capacity_Size]
      ,[HP]
      ,[Notes]
      ,[Unit]
      ,[Rate]
  FROM [dbo].[FEMA]
 WHERE FEMA_ID = @FEMA_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_FEMA]    Script Date: 9/7/2015 11:22:22 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_FEMA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_FEMA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_FEMA]
	  @FEMA_ID as int,
	  @Cost_Code as int,
	  @Equipment as varchar(50),
	  @Specification as varchar(50),
	  @Capacity_Size as varchar(50),
	  @HP as varchar(50),
	  @Notes as varchar(100),
	  @Unit as varchar(50)
	  @Rate as varchar(50),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Cost_Code = 0
    BEGIN
    SET @Cost_Code = null
    END
	  IF @Equipment = ''
    BEGIN
    SET @Equipment = null
    END
	  IF @Specification = ''
    BEGIN
    SET @Specification = null
    END
	  IF @Capacity_Size = ''
    BEGIN
    SET @Capacity_Size = null
    END
	  IF @HP = ''
    BEGIN
    SET @HP = null
    END
	  IF @Notes = ''
    BEGIN
    SET @Notes = null
    END
	  IF @Unit = ''
    BEGIN
    SET @Unit = null
    END
	  IF @Rate = ''
    BEGIN
    SET @Rate = null
    END
	Insert INTO [dbo].[FEMA]
           (
            [FEMA_ID]
           ,[Cost_Code]
           ,[Equipment]
           ,[Specification]
           ,[Capacity_Size]
           ,[HP]
           ,[Notes]
           ,[Unit]
           ,[Rate]
            )
     VALUES (
            @FEMA_ID
           ,@Cost_Code
           ,@Equipment
           ,@Specification
           ,@Capacity_Size
           ,@HP
           ,@Notes
           ,@Unit
           ,@Rate
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_FEMA]    Script Date: 9/7/2015 11:22:22 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_FEMA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_FEMA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_FEMA]
	  @FEMA_ID as int,
	  @Cost_Code as int,
	  @Equipment as varchar(50),
	  @Specification as varchar(50),
	  @Capacity_Size as varchar(50),
	  @HP as varchar(50),
	  @Notes as varchar(100),
	  @Unit as varchar(50)
	  @Rate as varchar(50),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Cost_Code = 0
    BEGIN
    SET @Cost_Code = null
    END
	  IF @Equipment = ''
    BEGIN
    SET @Equipment = null
    END
	  IF @Specification = ''
    BEGIN
    SET @Specification = null
    END
	  IF @Capacity_Size = ''
    BEGIN
    SET @Capacity_Size = null
    END
	  IF @HP = ''
    BEGIN
    SET @HP = null
    END
	  IF @Notes = ''
    BEGIN
    SET @Notes = null
    END
	  IF @Unit = ''
    BEGIN
    SET @Unit = null
    END
	  IF @Rate = ''
    BEGIN
    SET @Rate = null
    END
	UPDATE [dbo].[FEMA]
       SET
		   [Cost_Code] = @Cost_Code,
		   [Equipment] = @Equipment,
		   [Specification] = @Specification,
		   [Capacity_Size] = @Capacity_Size,
		   [HP] = @HP,
		   [Notes] = @Notes,
		   [Unit] = @Unit,
		   [Rate] = @Rate
       WHERE FEMA_ID = @FEMA_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_FEMA]    Script Date: 9/7/2015 11:22:22 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_FEMA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_FEMA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_FEMA]
	@FEMA_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.FEMA
	where FEMA_ID = @FEMA_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_FEMA]    Script Date: 9/7/2015 11:22:22 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_FEMA]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_FEMA]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_FEMA]
	  @Cost_Code as int,
	  @Equipment as varchar(50),
	  @Specification as varchar(50),
	  @Capacity_Size as varchar(50),
	  @HP as varchar(50),
	  @Notes as varchar(100),
	  @Unit as varchar(50)
	  @Rate as varchar(50),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Cost_Code = 0
    BEGIN
    SET @Cost_Code = null
    END
	  IF @Equipment = ''
    BEGIN
    SET @Equipment = null
    END
	  IF @Specification = ''
    BEGIN
    SET @Specification = null
    END
	  IF @Capacity_Size = ''
    BEGIN
    SET @Capacity_Size = null
    END
	  IF @HP = ''
    BEGIN
    SET @HP = null
    END
	  IF @Notes = ''
    BEGIN
    SET @Notes = null
    END
	  IF @Unit = ''
    BEGIN
    SET @Unit = null
    END
	  IF @Rate = ''
    BEGIN
    SET @Rate = null
    END
    SELECT [FEMA_ID] 
      FROM [dbo].[FEMA] 
       WHERE ([Cost_Code] = @Cost_Code)
       AND ([Equipment] like @Equipment)
       AND ([Specification] like @Specification)
       AND ([Capacity_Size] like @Capacity_Size)
       AND ([HP] like @HP)
       AND ([Notes] like @Notes)
       AND ([Unit] like @Unit)
       AND ([Rate] like @Rate)
END
GO

