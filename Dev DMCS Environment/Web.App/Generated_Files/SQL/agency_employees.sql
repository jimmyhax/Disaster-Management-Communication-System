/****** Object:  Table [dbo].[agency_employees]    Script Date: 9/7/2015 11:21:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[agency_employees](
  [agency_empl_id] int IDENTITY(1,1) NOT NULL,
  [agency_id] int NOT NULL,
  [employee_id] int NOT NULL,
 CONSTRAINT [agency_employees_agency_empl_id_pk] PRIMARY KEY CLUSTERED 
(
	[agency_empl_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_AGENCY_EMPLOYEES]    Script Date: 9/7/2015 11:21:44 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_AGENCY_EMPLOYEES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_AGENCY_EMPLOYEES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_AGENCY_EMPLOYEES]
           @agency_empl_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [agency_empl_id]
      ,[agency_id]
      ,[employee_id]
  FROM [dbo].[agency_employees]
 WHERE agency_empl_id = @agency_empl_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_AGENCY_EMPLOYEES]    Script Date: 9/7/2015 11:21:44 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_AGENCY_EMPLOYEES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_AGENCY_EMPLOYEES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_AGENCY_EMPLOYEES]
	  @agency_id as int
	  @employee_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @agency_id = 0
    BEGIN
    SET @agency_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
	Insert INTO [dbo].[agency_employees]
           (
            [agency_id]
           ,[employee_id]
            )
     VALUES (
            @agency_id
           ,@employee_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_AGENCY_EMPLOYEES]    Script Date: 9/7/2015 11:21:44 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_AGENCY_EMPLOYEES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_AGENCY_EMPLOYEES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_AGENCY_EMPLOYEES]
	  @agency_empl_id as int,
	  @agency_id as int
	  @employee_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @agency_id = 0
    BEGIN
    SET @agency_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
	UPDATE [dbo].[agency_employees]
       SET
		   [agency_id] = @agency_id,
		   [employee_id] = @employee_id
       WHERE agency_empl_id = @agency_empl_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_AGENCY_EMPLOYEES]    Script Date: 9/7/2015 11:21:44 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_AGENCY_EMPLOYEES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_AGENCY_EMPLOYEES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_AGENCY_EMPLOYEES]
	@agency_empl_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.agency_employees
	where agency_empl_id = @agency_empl_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_AGENCY_EMPLOYEES]    Script Date: 9/7/2015 11:21:44 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_AGENCY_EMPLOYEES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_AGENCY_EMPLOYEES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_AGENCY_EMPLOYEES]
	  @agency_id as int
	  @employee_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @agency_id = 0
    BEGIN
    SET @agency_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
    SELECT [agency_empl_id] 
      FROM [dbo].[agency_employees] 
       WHERE ([agency_id] = @agency_id)
       AND ([employee_id] = @employee_id)
END
GO

