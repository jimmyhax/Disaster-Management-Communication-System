/****** Object:  Table [dbo].[medical_assistance]    Script Date: 9/7/2015 11:22:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[medical_assistance](
  [medical_assist_order_id] int IDENTITY(1,1) NOT NULL,
  [em_id] int NOT NULL,
  [medical_assist_date] datetime NOT NULL,
  [medical_assist_doctor_id] int NULL,
  [medical_assist_hosp_price] money NULL,
  [medical_assist_hospital_name] varchar(50) NULL,
  [medical_assist_script_meds] varchar(30) NULL,
  [medical_assist_script_price] money NULL,
  [medical_assist_script_quantity] int NULL,
 CONSTRAINT [medical_assistance_medical_assist_order_id_pk] PRIMARY KEY CLUSTERED 
(
	[medical_assist_order_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_MEDICAL_ASSISTANCE]    Script Date: 9/7/2015 11:22:34 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_MEDICAL_ASSISTANCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_MEDICAL_ASSISTANCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_MEDICAL_ASSISTANCE]
           @medical_assist_order_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [medical_assist_order_id]
      ,[em_id]
      ,[medical_assist_date]
      ,[medical_assist_doctor_id]
      ,[medical_assist_hosp_price]
      ,[medical_assist_hospital_name]
      ,[medical_assist_script_meds]
      ,[medical_assist_script_price]
      ,[medical_assist_script_quantity]
  FROM [dbo].[medical_assistance]
 WHERE medical_assist_order_id = @medical_assist_order_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_MEDICAL_ASSISTANCE]    Script Date: 9/7/2015 11:22:34 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_MEDICAL_ASSISTANCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_MEDICAL_ASSISTANCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_MEDICAL_ASSISTANCE]
	  @em_id as int,
	  @medical_assist_date as datetime,
	  @medical_assist_doctor_id as int,
	  @medical_assist_hosp_price as money,
	  @medical_assist_hospital_name as varchar(50),
	  @medical_assist_script_meds as varchar(30),
	  @medical_assist_script_price as money
	  @medical_assist_script_quantity as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @em_id = 0
    BEGIN
    SET @em_id = null
    END
	  IF @medical_assist_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @medical_assist_date = null
    END
	  IF @medical_assist_doctor_id = 0
    BEGIN
    SET @medical_assist_doctor_id = null
    END
	  IF @medical_assist_hosp_price = 0
    BEGIN
    SET @medical_assist_hosp_price = null
    END
	  IF @medical_assist_hospital_name = ''
    BEGIN
    SET @medical_assist_hospital_name = null
    END
	  IF @medical_assist_script_meds = ''
    BEGIN
    SET @medical_assist_script_meds = null
    END
	  IF @medical_assist_script_price = 0
    BEGIN
    SET @medical_assist_script_price = null
    END
	  IF @medical_assist_script_quantity = 0
    BEGIN
    SET @medical_assist_script_quantity = null
    END
	Insert INTO [dbo].[medical_assistance]
           (
            [em_id]
           ,[medical_assist_date]
           ,[medical_assist_doctor_id]
           ,[medical_assist_hosp_price]
           ,[medical_assist_hospital_name]
           ,[medical_assist_script_meds]
           ,[medical_assist_script_price]
           ,[medical_assist_script_quantity]
            )
     VALUES (
            @em_id
           ,@medical_assist_date
           ,@medical_assist_doctor_id
           ,@medical_assist_hosp_price
           ,@medical_assist_hospital_name
           ,@medical_assist_script_meds
           ,@medical_assist_script_price
           ,@medical_assist_script_quantity
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_MEDICAL_ASSISTANCE]    Script Date: 9/7/2015 11:22:34 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_MEDICAL_ASSISTANCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_MEDICAL_ASSISTANCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_MEDICAL_ASSISTANCE]
	  @medical_assist_order_id as int,
	  @em_id as int,
	  @medical_assist_date as datetime,
	  @medical_assist_doctor_id as int,
	  @medical_assist_hosp_price as money,
	  @medical_assist_hospital_name as varchar(50),
	  @medical_assist_script_meds as varchar(30),
	  @medical_assist_script_price as money
	  @medical_assist_script_quantity as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @em_id = 0
    BEGIN
    SET @em_id = null
    END
	  IF @medical_assist_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @medical_assist_date = null
    END
	  IF @medical_assist_doctor_id = 0
    BEGIN
    SET @medical_assist_doctor_id = null
    END
	  IF @medical_assist_hosp_price = 0
    BEGIN
    SET @medical_assist_hosp_price = null
    END
	  IF @medical_assist_hospital_name = ''
    BEGIN
    SET @medical_assist_hospital_name = null
    END
	  IF @medical_assist_script_meds = ''
    BEGIN
    SET @medical_assist_script_meds = null
    END
	  IF @medical_assist_script_price = 0
    BEGIN
    SET @medical_assist_script_price = null
    END
	  IF @medical_assist_script_quantity = 0
    BEGIN
    SET @medical_assist_script_quantity = null
    END
	UPDATE [dbo].[medical_assistance]
       SET
		   [em_id] = @em_id,
		   [medical_assist_date] = @medical_assist_date,
		   [medical_assist_doctor_id] = @medical_assist_doctor_id,
		   [medical_assist_hosp_price] = @medical_assist_hosp_price,
		   [medical_assist_hospital_name] = @medical_assist_hospital_name,
		   [medical_assist_script_meds] = @medical_assist_script_meds,
		   [medical_assist_script_price] = @medical_assist_script_price,
		   [medical_assist_script_quantity] = @medical_assist_script_quantity
       WHERE medical_assist_order_id = @medical_assist_order_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_MEDICAL_ASSISTANCE]    Script Date: 9/7/2015 11:22:34 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_MEDICAL_ASSISTANCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_MEDICAL_ASSISTANCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_MEDICAL_ASSISTANCE]
	@medical_assist_order_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.medical_assistance
	where medical_assist_order_id = @medical_assist_order_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_MEDICAL_ASSISTANCE]    Script Date: 9/7/2015 11:22:34 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_MEDICAL_ASSISTANCE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_MEDICAL_ASSISTANCE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_MEDICAL_ASSISTANCE]
	  @em_id as int,
	  @medical_assist_date as datetime,
	  @medical_assist_doctor_id as int,
	  @medical_assist_hosp_price as money,
	  @medical_assist_hospital_name as varchar(50),
	  @medical_assist_script_meds as varchar(30),
	  @medical_assist_script_price as money
	  @medical_assist_script_quantity as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @em_id = 0
    BEGIN
    SET @em_id = null
    END
	  IF @medical_assist_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @medical_assist_date = null
    END
	  IF @medical_assist_doctor_id = 0
    BEGIN
    SET @medical_assist_doctor_id = null
    END
	  IF @medical_assist_hosp_price = 0
    BEGIN
    SET @medical_assist_hosp_price = null
    END
	  IF @medical_assist_hospital_name = ''
    BEGIN
    SET @medical_assist_hospital_name = null
    END
	  IF @medical_assist_script_meds = ''
    BEGIN
    SET @medical_assist_script_meds = null
    END
	  IF @medical_assist_script_price = 0
    BEGIN
    SET @medical_assist_script_price = null
    END
	  IF @medical_assist_script_quantity = 0
    BEGIN
    SET @medical_assist_script_quantity = null
    END
    SELECT [medical_assist_order_id] 
      FROM [dbo].[medical_assistance] 
       WHERE ([em_id] = @em_id)
       AND ([medical_assist_date] = @medical_assist_date)
       AND ([medical_assist_doctor_id] = @medical_assist_doctor_id or [medical_assist_doctor_id] is null)
       AND ([medical_assist_hosp_price] = @medical_assist_hosp_price or [medical_assist_hosp_price] is null)
       AND ([medical_assist_hospital_name] like @medical_assist_hospital_name or [medical_assist_hospital_name] is null)
       AND ([medical_assist_script_meds] like @medical_assist_script_meds or [medical_assist_script_meds] is null)
       AND ([medical_assist_script_price] = @medical_assist_script_price or [medical_assist_script_price] is null)
       AND ([medical_assist_script_quantity] = @medical_assist_script_quantity or [medical_assist_script_quantity] is null)
END
GO

