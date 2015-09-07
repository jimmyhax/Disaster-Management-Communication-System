/****** Object:  Table [dbo].[Inspection_Status]    Script Date: 9/7/2015 11:22:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inspection_Status](
  [InspectionStatus_ID] int IDENTITY(1,1) NOT NULL,
  [Evacuation_Area_ID] int NOT NULL,
  [Address_ID] int NOT NULL,
  [Inspection_Code] varchar(30) NULL,
  [Client_Found] varchar(3) NOT NULL,
  [Client_Found_Status] varchar(30) NULL,
 CONSTRAINT [Inspection_Status_InspectionStatus_ID_pk] PRIMARY KEY CLUSTERED 
(
	[InspectionStatus_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_INSPECTION_STATUS]    Script Date: 9/7/2015 11:22:28 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_INSPECTION_STATUS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_INSPECTION_STATUS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_INSPECTION_STATUS]
           @InspectionStatus_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [InspectionStatus_ID]
      ,[Evacuation_Area_ID]
      ,[Address_ID]
      ,[Inspection_Code]
      ,[Client_Found]
      ,[Client_Found_Status]
  FROM [dbo].[Inspection_Status]
 WHERE InspectionStatus_ID = @InspectionStatus_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_INSPECTION_STATUS]    Script Date: 9/7/2015 11:22:28 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_INSPECTION_STATUS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_INSPECTION_STATUS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_INSPECTION_STATUS]
	  @Evacuation_Area_ID as int,
	  @Address_ID as int,
	  @Inspection_Code as varchar(30),
	  @Client_Found as varchar(3)
	  @Client_Found_Status as varchar(30),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Address_ID = 0
    BEGIN
    SET @Address_ID = null
    END
	  IF @Inspection_Code = ''
    BEGIN
    SET @Inspection_Code = null
    END
	  IF @Client_Found = ''
    BEGIN
    SET @Client_Found = null
    END
	  IF @Client_Found_Status = ''
    BEGIN
    SET @Client_Found_Status = null
    END
	Insert INTO [dbo].[Inspection_Status]
           (
            [Evacuation_Area_ID]
           ,[Address_ID]
           ,[Inspection_Code]
           ,[Client_Found]
           ,[Client_Found_Status]
            )
     VALUES (
            @Evacuation_Area_ID
           ,@Address_ID
           ,@Inspection_Code
           ,@Client_Found
           ,@Client_Found_Status
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_INSPECTION_STATUS]    Script Date: 9/7/2015 11:22:28 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_INSPECTION_STATUS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_INSPECTION_STATUS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_INSPECTION_STATUS]
	  @InspectionStatus_ID as int,
	  @Evacuation_Area_ID as int,
	  @Address_ID as int,
	  @Inspection_Code as varchar(30),
	  @Client_Found as varchar(3)
	  @Client_Found_Status as varchar(30),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Address_ID = 0
    BEGIN
    SET @Address_ID = null
    END
	  IF @Inspection_Code = ''
    BEGIN
    SET @Inspection_Code = null
    END
	  IF @Client_Found = ''
    BEGIN
    SET @Client_Found = null
    END
	  IF @Client_Found_Status = ''
    BEGIN
    SET @Client_Found_Status = null
    END
	UPDATE [dbo].[Inspection_Status]
       SET
		   [Evacuation_Area_ID] = @Evacuation_Area_ID,
		   [Address_ID] = @Address_ID,
		   [Inspection_Code] = @Inspection_Code,
		   [Client_Found] = @Client_Found,
		   [Client_Found_Status] = @Client_Found_Status
       WHERE InspectionStatus_ID = @InspectionStatus_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_INSPECTION_STATUS]    Script Date: 9/7/2015 11:22:28 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_INSPECTION_STATUS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_INSPECTION_STATUS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_INSPECTION_STATUS]
	@InspectionStatus_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Inspection_Status
	where InspectionStatus_ID = @InspectionStatus_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_INSPECTION_STATUS]    Script Date: 9/7/2015 11:22:28 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_INSPECTION_STATUS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_INSPECTION_STATUS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_INSPECTION_STATUS]
	  @Evacuation_Area_ID as int,
	  @Address_ID as int,
	  @Inspection_Code as varchar(30),
	  @Client_Found as varchar(3)
	  @Client_Found_Status as varchar(30),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Address_ID = 0
    BEGIN
    SET @Address_ID = null
    END
	  IF @Inspection_Code = ''
    BEGIN
    SET @Inspection_Code = null
    END
	  IF @Client_Found = ''
    BEGIN
    SET @Client_Found = null
    END
	  IF @Client_Found_Status = ''
    BEGIN
    SET @Client_Found_Status = null
    END
    SELECT [InspectionStatus_ID] 
      FROM [dbo].[Inspection_Status] 
       WHERE ([Evacuation_Area_ID] = @Evacuation_Area_ID)
       AND ([Address_ID] = @Address_ID)
       AND ([Inspection_Code] like @Inspection_Code or [Inspection_Code] is null)
       AND ([Client_Found] like @Client_Found)
       AND ([Client_Found_Status] like @Client_Found_Status or [Client_Found_Status] is null)
END
GO

