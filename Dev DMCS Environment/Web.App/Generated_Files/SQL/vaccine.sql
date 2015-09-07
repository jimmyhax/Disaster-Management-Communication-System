/****** Object:  Table [dbo].[vaccine]    Script Date: 9/7/2015 11:23:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[vaccine](
  [vaccine_id] int IDENTITY(1,1) NOT NULL,
  [medicine_id] int NOT NULL,
  [Num_of_reg_doses] int NULL,
  [vaccine_name] varchar(50) NOT NULL,
 CONSTRAINT [vaccine_vaccine_id_pk] PRIMARY KEY CLUSTERED 
(
	[vaccine_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_VACCINE]    Script Date: 9/7/2015 11:23:30 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_VACCINE]
           @vaccine_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [vaccine_id]
      ,[medicine_id]
      ,[Num_of_reg_doses]
      ,[vaccine_name]
  FROM [dbo].[vaccine]
 WHERE vaccine_id = @vaccine_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_VACCINE]    Script Date: 9/7/2015 11:23:30 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_VACCINE]
	  @medicine_id as int,
	  @Num_of_reg_doses as int
	  @vaccine_name as varchar(50),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @medicine_id = 0
    BEGIN
    SET @medicine_id = null
    END
	  IF @Num_of_reg_doses = 0
    BEGIN
    SET @Num_of_reg_doses = null
    END
	  IF @vaccine_name = ''
    BEGIN
    SET @vaccine_name = null
    END
	Insert INTO [dbo].[vaccine]
           (
            [medicine_id]
           ,[Num_of_reg_doses]
           ,[vaccine_name]
            )
     VALUES (
            @medicine_id
           ,@Num_of_reg_doses
           ,@vaccine_name
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_VACCINE]    Script Date: 9/7/2015 11:23:30 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_VACCINE]
	  @vaccine_id as int,
	  @medicine_id as int,
	  @Num_of_reg_doses as int
	  @vaccine_name as varchar(50),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @medicine_id = 0
    BEGIN
    SET @medicine_id = null
    END
	  IF @Num_of_reg_doses = 0
    BEGIN
    SET @Num_of_reg_doses = null
    END
	  IF @vaccine_name = ''
    BEGIN
    SET @vaccine_name = null
    END
	UPDATE [dbo].[vaccine]
       SET
		   [medicine_id] = @medicine_id,
		   [Num_of_reg_doses] = @Num_of_reg_doses,
		   [vaccine_name] = @vaccine_name
       WHERE vaccine_id = @vaccine_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_VACCINE]    Script Date: 9/7/2015 11:23:30 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_VACCINE]
	@vaccine_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.vaccine
	where vaccine_id = @vaccine_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_VACCINE]    Script Date: 9/7/2015 11:23:30 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_VACCINE]
	  @medicine_id as int,
	  @Num_of_reg_doses as int
	  @vaccine_name as varchar(50),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @medicine_id = 0
    BEGIN
    SET @medicine_id = null
    END
	  IF @Num_of_reg_doses = 0
    BEGIN
    SET @Num_of_reg_doses = null
    END
	  IF @vaccine_name = ''
    BEGIN
    SET @vaccine_name = null
    END
    SELECT [vaccine_id] 
      FROM [dbo].[vaccine] 
       WHERE ([medicine_id] = @medicine_id)
       AND ([Num_of_reg_doses] = @Num_of_reg_doses or [Num_of_reg_doses] is null)
       AND ([vaccine_name] like @vaccine_name)
END
GO

