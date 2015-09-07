/****** Object:  Table [dbo].[mobile_employees]    Script Date: 9/7/2015 11:22:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mobile_employees](
  [mobile_employee_id] int IDENTITY(1,1) NOT NULL,
  [mobile_unit_id] int NOT NULL,
  [employee_id] int NOT NULL,
 CONSTRAINT [mobile_employees_mobile_employee_id_pk] PRIMARY KEY CLUSTERED 
(
	[mobile_employee_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MOBILE_EMPLOYEES]    Script Date: 9/7/2015 11:22:49 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MOBILE_EMPLOYEES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MOBILE_EMPLOYEES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MOBILE_EMPLOYEES]
           @mobile_employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [mobile_employee_id]
      ,[mobile_unit_id]
      ,[employee_id]
  FROM [dbo].[mobile_employees]
 WHERE mobile_employee_id = @mobile_employee_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MOBILE_EMPLOYEES]    Script Date: 9/7/2015 11:22:49 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MOBILE_EMPLOYEES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MOBILE_EMPLOYEES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MOBILE_EMPLOYEES]
	  @mobile_unit_id as int
	  @employee_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @mobile_unit_id = 0
    BEGIN
    SET @mobile_unit_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
	Insert INTO [dbo].[mobile_employees]
           (
            [mobile_unit_id]
           ,[employee_id]
            )
     VALUES (
            @mobile_unit_id
           ,@employee_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MOBILE_EMPLOYEES]    Script Date: 9/7/2015 11:22:49 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MOBILE_EMPLOYEES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MOBILE_EMPLOYEES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MOBILE_EMPLOYEES]
	  @mobile_employee_id as int,
	  @mobile_unit_id as int
	  @employee_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @mobile_unit_id = 0
    BEGIN
    SET @mobile_unit_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
	UPDATE [dbo].[mobile_employees]
       SET
		   [mobile_unit_id] = @mobile_unit_id,
		   [employee_id] = @employee_id
       WHERE mobile_employee_id = @mobile_employee_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MOBILE_EMPLOYEES]    Script Date: 9/7/2015 11:22:49 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MOBILE_EMPLOYEES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MOBILE_EMPLOYEES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MOBILE_EMPLOYEES]
	@mobile_employee_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.mobile_employees
	where mobile_employee_id = @mobile_employee_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MOBILE_EMPLOYEES]    Script Date: 9/7/2015 11:22:49 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MOBILE_EMPLOYEES]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MOBILE_EMPLOYEES]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MOBILE_EMPLOYEES]
	  @mobile_unit_id as int
	  @employee_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @mobile_unit_id = 0
    BEGIN
    SET @mobile_unit_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
    SELECT [mobile_employee_id] 
      FROM [dbo].[mobile_employees] 
       WHERE ([mobile_unit_id] = @mobile_unit_id)
       AND ([employee_id] = @employee_id)
END
GO

