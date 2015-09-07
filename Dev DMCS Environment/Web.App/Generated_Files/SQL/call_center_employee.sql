/****** Object:  Table [dbo].[call_center_employee]    Script Date: 9/7/2015 11:21:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[call_center_employee](
  [call_center_employee_id] int IDENTITY(1,1) NOT NULL,
  [call_center_id] int NOT NULL,
  [employee_id] int NOT NULL,
 CONSTRAINT [call_center_employee_call_center_employee_id_pk] PRIMARY KEY CLUSTERED 
(
	[call_center_employee_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_CALL_CENTER_EMPLOYEE]    Script Date: 9/7/2015 11:21:53 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_CALL_CENTER_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_CALL_CENTER_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CALL_CENTER_EMPLOYEE]
           @call_center_employee_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [call_center_employee_id]
      ,[call_center_id]
      ,[employee_id]
  FROM [dbo].[call_center_employee]
 WHERE call_center_employee_id = @call_center_employee_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_CALL_CENTER_EMPLOYEE]    Script Date: 9/7/2015 11:21:53 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_CALL_CENTER_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_CALL_CENTER_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_CALL_CENTER_EMPLOYEE]
	  @call_center_id as int
	  @employee_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
	Insert INTO [dbo].[call_center_employee]
           (
            [call_center_id]
           ,[employee_id]
            )
     VALUES (
            @call_center_id
           ,@employee_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_CALL_CENTER_EMPLOYEE]    Script Date: 9/7/2015 11:21:53 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_CALL_CENTER_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_CALL_CENTER_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_CALL_CENTER_EMPLOYEE]
	  @call_center_employee_id as int,
	  @call_center_id as int
	  @employee_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
	UPDATE [dbo].[call_center_employee]
       SET
		   [call_center_id] = @call_center_id,
		   [employee_id] = @employee_id
       WHERE call_center_employee_id = @call_center_employee_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_CALL_CENTER_EMPLOYEE]    Script Date: 9/7/2015 11:21:53 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_CALL_CENTER_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_CALL_CENTER_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_CALL_CENTER_EMPLOYEE]
	@call_center_employee_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.call_center_employee
	where call_center_employee_id = @call_center_employee_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_CALL_CENTER_EMPLOYEE]    Script Date: 9/7/2015 11:21:53 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_CALL_CENTER_EMPLOYEE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_CALL_CENTER_EMPLOYEE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_CALL_CENTER_EMPLOYEE]
	  @call_center_id as int
	  @employee_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @call_center_id = 0
    BEGIN
    SET @call_center_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
    SELECT [call_center_employee_id] 
      FROM [dbo].[call_center_employee] 
       WHERE ([call_center_id] = @call_center_id)
       AND ([employee_id] = @employee_id)
END
GO

