/****** Object:  Table [dbo].[Evacuation_Encounter_Shelter_Employee]    Script Date: 9/7/2015 11:22:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Evacuation_Encounter_Shelter_Employee](
  [Evacuation_Encounter_Shelter_Employee_ID] int IDENTITY(1,1) NOT NULL,
  [Shelter_ID] int NOT NULL,
  [Employee_ID] int NOT NULL,
  [Evacuation_Area_ID] int NULL,
  [Encounter_ID] int NOT NULL,
 CONSTRAINT [Evacuation_Encounter_Shelter_Employee_Evacuation_Encounter_Shelter_Employee_ID_pk] PRIMARY KEY CLUSTERED 
(
	[Evacuation_Encounter_Shelter_Employee_ID] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]    Script Date: 9/7/2015 11:22:20 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]
           @Evacuation_Encounter_Shelter_Employee_ID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [Evacuation_Encounter_Shelter_Employee_ID]
      ,[Shelter_ID]
      ,[Employee_ID]
      ,[Evacuation_Area_ID]
      ,[Encounter_ID]
  FROM [dbo].[Evacuation_Encounter_Shelter_Employee]
 WHERE Evacuation_Encounter_Shelter_Employee_ID = @Evacuation_Encounter_Shelter_Employee_ID
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]    Script Date: 9/7/2015 11:22:20 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]
	  @Shelter_ID as int,
	  @Employee_ID as int,
	  @Evacuation_Area_ID as int
	  @Encounter_ID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Shelter_ID = 0
    BEGIN
    SET @Shelter_ID = null
    END
	  IF @Employee_ID = 0
    BEGIN
    SET @Employee_ID = null
    END
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Encounter_ID = 0
    BEGIN
    SET @Encounter_ID = null
    END
	Insert INTO [dbo].[Evacuation_Encounter_Shelter_Employee]
           (
            [Shelter_ID]
           ,[Employee_ID]
           ,[Evacuation_Area_ID]
           ,[Encounter_ID]
            )
     VALUES (
            @Shelter_ID
           ,@Employee_ID
           ,@Evacuation_Area_ID
           ,@Encounter_ID
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]    Script Date: 9/7/2015 11:22:20 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]
	  @Evacuation_Encounter_Shelter_Employee_ID as int,
	  @Shelter_ID as int,
	  @Employee_ID as int,
	  @Evacuation_Area_ID as int
	  @Encounter_ID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Shelter_ID = 0
    BEGIN
    SET @Shelter_ID = null
    END
	  IF @Employee_ID = 0
    BEGIN
    SET @Employee_ID = null
    END
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Encounter_ID = 0
    BEGIN
    SET @Encounter_ID = null
    END
	UPDATE [dbo].[Evacuation_Encounter_Shelter_Employee]
       SET
		   [Shelter_ID] = @Shelter_ID,
		   [Employee_ID] = @Employee_ID,
		   [Evacuation_Area_ID] = @Evacuation_Area_ID,
		   [Encounter_ID] = @Encounter_ID
       WHERE Evacuation_Encounter_Shelter_Employee_ID = @Evacuation_Encounter_Shelter_Employee_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]    Script Date: 9/7/2015 11:22:20 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]
	@Evacuation_Encounter_Shelter_Employee_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.Evacuation_Encounter_Shelter_Employee
	where Evacuation_Encounter_Shelter_Employee_ID = @Evacuation_Encounter_Shelter_Employee_ID
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]    Script Date: 9/7/2015 11:22:20 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_EVACUATION_ENCOUNTER_SHELTER_EMPLOYEE]
	  @Shelter_ID as int,
	  @Employee_ID as int,
	  @Evacuation_Area_ID as int
	  @Encounter_ID as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @Shelter_ID = 0
    BEGIN
    SET @Shelter_ID = null
    END
	  IF @Employee_ID = 0
    BEGIN
    SET @Employee_ID = null
    END
	  IF @Evacuation_Area_ID = 0
    BEGIN
    SET @Evacuation_Area_ID = null
    END
	  IF @Encounter_ID = 0
    BEGIN
    SET @Encounter_ID = null
    END
    SELECT [Evacuation_Encounter_Shelter_Employee_ID] 
      FROM [dbo].[Evacuation_Encounter_Shelter_Employee] 
       WHERE ([Shelter_ID] = @Shelter_ID)
       AND ([Employee_ID] = @Employee_ID)
       AND ([Evacuation_Area_ID] = @Evacuation_Area_ID or [Evacuation_Area_ID] is null)
       AND ([Encounter_ID] = @Encounter_ID)
END
GO

