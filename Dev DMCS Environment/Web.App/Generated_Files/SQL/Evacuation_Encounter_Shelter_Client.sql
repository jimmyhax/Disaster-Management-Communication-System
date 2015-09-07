/****** Object:  Table [dbo].[Evacuation_Encounter_Shelter_Client]    Script Date: 9/7/2015 11:22:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Evacuation_Encounter_Shelter_Client](
  [Evacuation_Encounter_Shelter_Client_ID] int IDENTITY(1,1) NOT NULL,
  [Evacuation_Area_ID] int NOT NULL,
  [Encounter_Id] int NOT NULL,
  [Start_Date] datetime NOT NULL,
  [End_Date] datetime NULL,
  [Shelter_ID] int NOT NULL,
  [Client_ID] int NOT NULL,
 CONSTRAINT [Evacuation_Encounter_Shelter_Client_Evacuation_Encounter_Shelter_Client_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Evacuation_Encounter_Shelter_Client_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_CLIENT]    Script Date: 9/7/2015 11:22:19 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_CLIENT]
           @Evacuation_Encounter_Shelter_Client_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Evacuation_Encounter_Shelter_Client_ID]
      ,[Evacuation_Area_ID]
      ,[Encounter_Id]
      ,[Start_Date]
      ,[End_Date]
      ,[Shelter_ID]
      ,[Client_ID]
  FROM [dbo].[Evacuation_Encounter_Shelter_Client]
 WHERE Evacuation_Encounter_Shelter_Client_ID = @Evacuation_Encounter_Shelter_Client_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_EVACUATION_ENCOUNTER_SHELTER_CLIENT]    Script Date: 9/7/2015 11:22:19 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_EVACUATION_ENCOUNTER_SHELTER_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_EVACUATION_ENCOUNTER_SHELTER_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_EVACUATION_ENCOUNTER_SHELTER_CLIENT]
	  @Evacuation_Area_ID as int,
	  @Encounter_Id as int,
	  @Start_Date as datetime,
	  @End_Date as datetime,
	  @Shelter_ID as int
	  @Client_ID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Encounter_Id = 0
    BEGIN
    SET @Encounter_Id = null
    END
	  IF @Start_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Start_Date = null
    END
	  IF @End_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @End_Date = null
    END
	  IF @Shelter_ID = 0
    BEGIN
    SET @Shelter_ID = null
    END
	  IF @Client_ID = 0
    BEGIN
    SET @Client_ID = null
    END
	Insert INTO [dbo].[Evacuation_Encounter_Shelter_Client]
           (
            [Evacuation_Area_ID]
           ,[Encounter_Id]
           ,[Start_Date]
           ,[End_Date]
           ,[Shelter_ID]
           ,[Client_ID]
            )
     VALUES (
            @Evacuation_Area_ID
           ,@Encounter_Id
           ,@Start_Date
           ,@End_Date
           ,@Shelter_ID
           ,@Client_ID
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_EVACUATION_ENCOUNTER_SHELTER_CLIENT]    Script Date: 9/7/2015 11:22:19 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_EVACUATION_ENCOUNTER_SHELTER_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_EVACUATION_ENCOUNTER_SHELTER_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_EVACUATION_ENCOUNTER_SHELTER_CLIENT]
	  @Evacuation_Encounter_Shelter_Client_ID as int,
	  @Evacuation_Area_ID as int,
	  @Encounter_Id as int,
	  @Start_Date as datetime,
	  @End_Date as datetime,
	  @Shelter_ID as int
	  @Client_ID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Encounter_Id = 0
    BEGIN
    SET @Encounter_Id = null
    END
	  IF @Start_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Start_Date = null
    END
	  IF @End_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @End_Date = null
    END
	  IF @Shelter_ID = 0
    BEGIN
    SET @Shelter_ID = null
    END
	  IF @Client_ID = 0
    BEGIN
    SET @Client_ID = null
    END
	UPDATE [dbo].[Evacuation_Encounter_Shelter_Client]
       SET
		   [Evacuation_Area_ID] = @Evacuation_Area_ID,
		   [Encounter_Id] = @Encounter_Id,
		   [Start_Date] = @Start_Date,
		   [End_Date] = @End_Date,
		   [Shelter_ID] = @Shelter_ID,
		   [Client_ID] = @Client_ID
       WHERE Evacuation_Encounter_Shelter_Client_ID = @Evacuation_Encounter_Shelter_Client_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_EVACUATION_ENCOUNTER_SHELTER_CLIENT]    Script Date: 9/7/2015 11:22:19 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_EVACUATION_ENCOUNTER_SHELTER_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_EVACUATION_ENCOUNTER_SHELTER_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_EVACUATION_ENCOUNTER_SHELTER_CLIENT]
	@Evacuation_Encounter_Shelter_Client_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Evacuation_Encounter_Shelter_Client
	where Evacuation_Encounter_Shelter_Client_ID = @Evacuation_Encounter_Shelter_Client_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_EVACUATION_ENCOUNTER_SHELTER_CLIENT]    Script Date: 9/7/2015 11:22:19 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_EVACUATION_ENCOUNTER_SHELTER_CLIENT]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_EVACUATION_ENCOUNTER_SHELTER_CLIENT]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_EVACUATION_ENCOUNTER_SHELTER_CLIENT]
	  @Evacuation_Area_ID as int,
	  @Encounter_Id as int,
	  @Start_Date as datetime,
	  @End_Date as datetime,
	  @Shelter_ID as int
	  @Client_ID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Encounter_Id = 0
    BEGIN
    SET @Encounter_Id = null
    END
	  IF @Start_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @Start_Date = null
    END
	  IF @End_Date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @End_Date = null
    END
	  IF @Shelter_ID = 0
    BEGIN
    SET @Shelter_ID = null
    END
	  IF @Client_ID = 0
    BEGIN
    SET @Client_ID = null
    END
    SELECT [Evacuation_Encounter_Shelter_Client_ID] 
      FROM [dbo].[Evacuation_Encounter_Shelter_Client] 
       WHERE ([Evacuation_Area_ID] = @Evacuation_Area_ID)
       AND ([Encounter_Id] = @Encounter_Id)
       AND ([Start_Date] = @Start_Date)
       AND ([End_Date] = @End_Date or [End_Date] is null)
       AND ([Shelter_ID] = @Shelter_ID)
       AND ([Client_ID] = @Client_ID)
END
GO

