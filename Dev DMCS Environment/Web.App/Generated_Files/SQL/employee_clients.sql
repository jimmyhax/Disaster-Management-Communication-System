/****** Object:  Table [dbo].[employee_clients]    Script Date: 9/7/2015 11:22:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employee_clients](
  [emp_client_id] int IDENTITY(1,1) NOT NULL,
  [client_id] int NOT NULL,
  [employee_id] int NOT NULL,
 CONSTRAINT [employee_clients_emp_client_id_pk] PRIMARY KEY CLUSTERED 
(
	[emp_client_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EMPLOYEE_CLIENTS]    Script Date: 9/7/2015 11:22:13 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EMPLOYEE_CLIENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EMPLOYEE_CLIENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EMPLOYEE_CLIENTS]
           @emp_client_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [emp_client_id]
      ,[client_id]
      ,[employee_id]
  FROM [dbo].[employee_clients]
 WHERE emp_client_id = @emp_client_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_EMPLOYEE_CLIENTS]    Script Date: 9/7/2015 11:22:13 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_EMPLOYEE_CLIENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_EMPLOYEE_CLIENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_EMPLOYEE_CLIENTS]
	  @client_id as int
	  @employee_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
	Insert INTO [dbo].[employee_clients]
           (
            [client_id]
           ,[employee_id]
            )
     VALUES (
            @client_id
           ,@employee_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_EMPLOYEE_CLIENTS]    Script Date: 9/7/2015 11:22:13 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_EMPLOYEE_CLIENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_EMPLOYEE_CLIENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_EMPLOYEE_CLIENTS]
	  @emp_client_id as int,
	  @client_id as int
	  @employee_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
	UPDATE [dbo].[employee_clients]
       SET
		   [client_id] = @client_id,
		   [employee_id] = @employee_id
       WHERE emp_client_id = @emp_client_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_EMPLOYEE_CLIENTS]    Script Date: 9/7/2015 11:22:13 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_EMPLOYEE_CLIENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_EMPLOYEE_CLIENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_EMPLOYEE_CLIENTS]
	@emp_client_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.employee_clients
	where emp_client_id = @emp_client_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_EMPLOYEE_CLIENTS]    Script Date: 9/7/2015 11:22:13 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_EMPLOYEE_CLIENTS]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_EMPLOYEE_CLIENTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_EMPLOYEE_CLIENTS]
	  @client_id as int
	  @employee_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @employee_id = 0
    BEGIN
    SET @employee_id = null
    END
    SELECT [emp_client_id] 
      FROM [dbo].[employee_clients] 
       WHERE ([client_id] = @client_id)
       AND ([employee_id] = @employee_id)
END
GO

