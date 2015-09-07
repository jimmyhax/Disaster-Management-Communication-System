/****** Object:  Table [dbo].[encounter_client_vaccine]    Script Date: 9/7/2015 11:22:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[encounter_client_vaccine](
  [encounter_id] int IDENTITY(1,1) NOT NULL,
  [vaccine_id] int NOT NULL,
  [current_client_medicine] varchar(30) NULL,
  [assistance] char(1) NOT NULL,
  [quantity] int NULL,
  [Under_six_months_old] char(1) NOT NULL,
  [pregnant] char(1) NOT NULL,
  [children] int NOT NULL,
  [occupation] varchar(30) NULL,
  [chronic_disease] varchar(50) NULL,
  [qualify] char(1) NOT NULL,
  [dose_date1] datetime NOT NULL,
  [dose_date2] datetime NULL,
  [adult_consent] image(2147483647) NULL,
  [guardian_consent] image(2147483647) NULL,
  [vaccine_admin] datetime NOT NULL,
  [guardian_f_name] varchar(20) NULL,
  [guardian_l_name] varchar(20) NULL,
  [guardian_mi] char(1) NULL,
  [guardian_phone] varchar(11) NULL,
  [adult_consent_date] datetime NULL,
  [guard_consent_date] datetime NULL,
  [dose_form1] char(1) NOT NULL,
  [dose_form2] char(1) NULL,
 CONSTRAINT [encounter_client_vaccine_encounter_id_pk] PRIMARY KEY CLUSTERED 
(
	[encounter_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_ENCOUNTER_CLIENT_VACCINE]    Script Date: 9/7/2015 11:22:16 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_ENCOUNTER_CLIENT_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_ENCOUNTER_CLIENT_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_ENCOUNTER_CLIENT_VACCINE]
           @encounter_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [encounter_id]
      ,[vaccine_id]
      ,[current_client_medicine]
      ,[assistance]
      ,[quantity]
      ,[Under_six_months_old]
      ,[pregnant]
      ,[children]
      ,[occupation]
      ,[chronic_disease]
      ,[qualify]
      ,[dose_date1]
      ,[dose_date2]
      ,[adult_consent]
      ,[guardian_consent]
      ,[vaccine_admin]
      ,[guardian_f_name]
      ,[guardian_l_name]
      ,[guardian_mi]
      ,[guardian_phone]
      ,[adult_consent_date]
      ,[guard_consent_date]
      ,[dose_form1]
      ,[dose_form2]
  FROM [dbo].[encounter_client_vaccine]
 WHERE encounter_id = @encounter_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_ENCOUNTER_CLIENT_VACCINE]    Script Date: 9/7/2015 11:22:16 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_ENCOUNTER_CLIENT_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_ENCOUNTER_CLIENT_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_ENCOUNTER_CLIENT_VACCINE]
	  @encounter_id as int,
	  @vaccine_id as int,
	  @current_client_medicine as varchar(30),
	  @assistance as char(1),
	  @quantity as int,
	  @Under_six_months_old as char(1),
	  @pregnant as char(1),
	  @children as int,
	  @occupation as varchar(30),
	  @chronic_disease as varchar(50),
	  @qualify as char(1),
	  @dose_date1 as datetime,
	  @dose_date2 as datetime,
	  @adult_consent as image,
	  @guardian_consent as image,
	  @vaccine_admin as datetime,
	  @guardian_f_name as varchar(20),
	  @guardian_l_name as varchar(20),
	  @guardian_mi as char(1),
	  @guardian_phone as varchar(11),
	  @adult_consent_date as datetime,
	  @guard_consent_date as datetime,
	  @dose_form1 as char(1)
	  @dose_form2 as char(1),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @vaccine_id = 0
    BEGIN
    SET @vaccine_id = null
    END
	  IF @current_client_medicine = ''
    BEGIN
    SET @current_client_medicine = null
    END
	  IF @assistance = ''
    BEGIN
    SET @assistance = null
    END
	  IF @quantity = 0
    BEGIN
    SET @quantity = null
    END
	  IF @Under_six_months_old = ''
    BEGIN
    SET @Under_six_months_old = null
    END
	  IF @pregnant = ''
    BEGIN
    SET @pregnant = null
    END
	  IF @children = 0
    BEGIN
    SET @children = null
    END
	  IF @occupation = ''
    BEGIN
    SET @occupation = null
    END
	  IF @chronic_disease = ''
    BEGIN
    SET @chronic_disease = null
    END
	  IF @qualify = ''
    BEGIN
    SET @qualify = null
    END
	  IF @dose_date1 = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @dose_date1 = null
    END
	  IF @dose_date2 = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @dose_date2 = null
    END
	  IF @vaccine_admin = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @vaccine_admin = null
    END
	  IF @guardian_f_name = ''
    BEGIN
    SET @guardian_f_name = null
    END
	  IF @guardian_l_name = ''
    BEGIN
    SET @guardian_l_name = null
    END
	  IF @guardian_mi = ''
    BEGIN
    SET @guardian_mi = null
    END
	  IF @guardian_phone = ''
    BEGIN
    SET @guardian_phone = null
    END
	  IF @adult_consent_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @adult_consent_date = null
    END
	  IF @guard_consent_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @guard_consent_date = null
    END
	  IF @dose_form1 = ''
    BEGIN
    SET @dose_form1 = null
    END
	  IF @dose_form2 = ''
    BEGIN
    SET @dose_form2 = null
    END
	Insert INTO [dbo].[encounter_client_vaccine]
           (
            [encounter_id]
           ,[vaccine_id]
           ,[current_client_medicine]
           ,[assistance]
           ,[quantity]
           ,[Under_six_months_old]
           ,[pregnant]
           ,[children]
           ,[occupation]
           ,[chronic_disease]
           ,[qualify]
           ,[dose_date1]
           ,[dose_date2]
           ,[adult_consent]
           ,[guardian_consent]
           ,[vaccine_admin]
           ,[guardian_f_name]
           ,[guardian_l_name]
           ,[guardian_mi]
           ,[guardian_phone]
           ,[adult_consent_date]
           ,[guard_consent_date]
           ,[dose_form1]
           ,[dose_form2]
            )
     VALUES (
            @encounter_id
           ,@vaccine_id
           ,@current_client_medicine
           ,@assistance
           ,@quantity
           ,@Under_six_months_old
           ,@pregnant
           ,@children
           ,@occupation
           ,@chronic_disease
           ,@qualify
           ,@dose_date1
           ,@dose_date2
           ,@adult_consent
           ,@guardian_consent
           ,@vaccine_admin
           ,@guardian_f_name
           ,@guardian_l_name
           ,@guardian_mi
           ,@guardian_phone
           ,@adult_consent_date
           ,@guard_consent_date
           ,@dose_form1
           ,@dose_form2
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_ENCOUNTER_CLIENT_VACCINE]    Script Date: 9/7/2015 11:22:16 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_ENCOUNTER_CLIENT_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_ENCOUNTER_CLIENT_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_ENCOUNTER_CLIENT_VACCINE]
	  @encounter_id as int,
	  @vaccine_id as int,
	  @current_client_medicine as varchar(30),
	  @assistance as char(1),
	  @quantity as int,
	  @Under_six_months_old as char(1),
	  @pregnant as char(1),
	  @children as int,
	  @occupation as varchar(30),
	  @chronic_disease as varchar(50),
	  @qualify as char(1),
	  @dose_date1 as datetime,
	  @dose_date2 as datetime,
	  @adult_consent as image,
	  @guardian_consent as image,
	  @vaccine_admin as datetime,
	  @guardian_f_name as varchar(20),
	  @guardian_l_name as varchar(20),
	  @guardian_mi as char(1),
	  @guardian_phone as varchar(11),
	  @adult_consent_date as datetime,
	  @guard_consent_date as datetime,
	  @dose_form1 as char(1)
	  @dose_form2 as char(1),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @vaccine_id = 0
    BEGIN
    SET @vaccine_id = null
    END
	  IF @current_client_medicine = ''
    BEGIN
    SET @current_client_medicine = null
    END
	  IF @assistance = ''
    BEGIN
    SET @assistance = null
    END
	  IF @quantity = 0
    BEGIN
    SET @quantity = null
    END
	  IF @Under_six_months_old = ''
    BEGIN
    SET @Under_six_months_old = null
    END
	  IF @pregnant = ''
    BEGIN
    SET @pregnant = null
    END
	  IF @children = 0
    BEGIN
    SET @children = null
    END
	  IF @occupation = ''
    BEGIN
    SET @occupation = null
    END
	  IF @chronic_disease = ''
    BEGIN
    SET @chronic_disease = null
    END
	  IF @qualify = ''
    BEGIN
    SET @qualify = null
    END
	  IF @dose_date1 = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @dose_date1 = null
    END
	  IF @dose_date2 = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @dose_date2 = null
    END
	  IF @vaccine_admin = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @vaccine_admin = null
    END
	  IF @guardian_f_name = ''
    BEGIN
    SET @guardian_f_name = null
    END
	  IF @guardian_l_name = ''
    BEGIN
    SET @guardian_l_name = null
    END
	  IF @guardian_mi = ''
    BEGIN
    SET @guardian_mi = null
    END
	  IF @guardian_phone = ''
    BEGIN
    SET @guardian_phone = null
    END
	  IF @adult_consent_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @adult_consent_date = null
    END
	  IF @guard_consent_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @guard_consent_date = null
    END
	  IF @dose_form1 = ''
    BEGIN
    SET @dose_form1 = null
    END
	  IF @dose_form2 = ''
    BEGIN
    SET @dose_form2 = null
    END
	UPDATE [dbo].[encounter_client_vaccine]
       SET
		   [vaccine_id] = @vaccine_id,
		   [current_client_medicine] = @current_client_medicine,
		   [assistance] = @assistance,
		   [quantity] = @quantity,
		   [Under_six_months_old] = @Under_six_months_old,
		   [pregnant] = @pregnant,
		   [children] = @children,
		   [occupation] = @occupation,
		   [chronic_disease] = @chronic_disease,
		   [qualify] = @qualify,
		   [dose_date1] = @dose_date1,
		   [dose_date2] = @dose_date2,
		   [adult_consent] = @adult_consent,
		   [guardian_consent] = @guardian_consent,
		   [vaccine_admin] = @vaccine_admin,
		   [guardian_f_name] = @guardian_f_name,
		   [guardian_l_name] = @guardian_l_name,
		   [guardian_mi] = @guardian_mi,
		   [guardian_phone] = @guardian_phone,
		   [adult_consent_date] = @adult_consent_date,
		   [guard_consent_date] = @guard_consent_date,
		   [dose_form1] = @dose_form1,
		   [dose_form2] = @dose_form2
       WHERE encounter_id = @encounter_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_ENCOUNTER_CLIENT_VACCINE]    Script Date: 9/7/2015 11:22:16 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_ENCOUNTER_CLIENT_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_ENCOUNTER_CLIENT_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_ENCOUNTER_CLIENT_VACCINE]
	@encounter_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.encounter_client_vaccine
	where encounter_id = @encounter_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_ENCOUNTER_CLIENT_VACCINE]    Script Date: 9/7/2015 11:22:16 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_ENCOUNTER_CLIENT_VACCINE]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_ENCOUNTER_CLIENT_VACCINE]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_ENCOUNTER_CLIENT_VACCINE]
	  @vaccine_id as int,
	  @current_client_medicine as varchar(30),
	  @assistance as char(1),
	  @quantity as int,
	  @Under_six_months_old as char(1),
	  @pregnant as char(1),
	  @children as int,
	  @occupation as varchar(30),
	  @chronic_disease as varchar(50),
	  @qualify as char(1),
	  @dose_date1 as datetime,
	  @dose_date2 as datetime,
	  @adult_consent as image,
	  @guardian_consent as image,
	  @vaccine_admin as datetime,
	  @guardian_f_name as varchar(20),
	  @guardian_l_name as varchar(20),
	  @guardian_mi as char(1),
	  @guardian_phone as varchar(11),
	  @adult_consent_date as datetime,
	  @guard_consent_date as datetime,
	  @dose_form1 as char(1)
	  @dose_form2 as char(1),
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @vaccine_id = 0
    BEGIN
    SET @vaccine_id = null
    END
	  IF @current_client_medicine = ''
    BEGIN
    SET @current_client_medicine = null
    END
	  IF @assistance = ''
    BEGIN
    SET @assistance = null
    END
	  IF @quantity = 0
    BEGIN
    SET @quantity = null
    END
	  IF @Under_six_months_old = ''
    BEGIN
    SET @Under_six_months_old = null
    END
	  IF @pregnant = ''
    BEGIN
    SET @pregnant = null
    END
	  IF @children = 0
    BEGIN
    SET @children = null
    END
	  IF @occupation = ''
    BEGIN
    SET @occupation = null
    END
	  IF @chronic_disease = ''
    BEGIN
    SET @chronic_disease = null
    END
	  IF @qualify = ''
    BEGIN
    SET @qualify = null
    END
	  IF @dose_date1 = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @dose_date1 = null
    END
	  IF @dose_date2 = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @dose_date2 = null
    END
	  IF @vaccine_admin = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @vaccine_admin = null
    END
	  IF @guardian_f_name = ''
    BEGIN
    SET @guardian_f_name = null
    END
	  IF @guardian_l_name = ''
    BEGIN
    SET @guardian_l_name = null
    END
	  IF @guardian_mi = ''
    BEGIN
    SET @guardian_mi = null
    END
	  IF @guardian_phone = ''
    BEGIN
    SET @guardian_phone = null
    END
	  IF @adult_consent_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @adult_consent_date = null
    END
	  IF @guard_consent_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @guard_consent_date = null
    END
	  IF @dose_form1 = ''
    BEGIN
    SET @dose_form1 = null
    END
	  IF @dose_form2 = ''
    BEGIN
    SET @dose_form2 = null
    END
    SELECT [encounter_id] 
      FROM [dbo].[encounter_client_vaccine] 
       WHERE ([vaccine_id] = @vaccine_id)
       AND ([current_client_medicine] like @current_client_medicine or [current_client_medicine] is null)
       AND ([assistance] = @assistance)
       AND ([quantity] = @quantity or [quantity] is null)
       AND ([Under_six_months_old] = @Under_six_months_old)
       AND ([pregnant] = @pregnant)
       AND ([children] = @children)
       AND ([occupation] like @occupation or [occupation] is null)
       AND ([chronic_disease] like @chronic_disease or [chronic_disease] is null)
       AND ([qualify] = @qualify)
       AND ([dose_date1] = @dose_date1)
       AND ([dose_date2] = @dose_date2 or [dose_date2] is null)
       AND ([vaccine_admin] = @vaccine_admin)
       AND ([guardian_f_name] like @guardian_f_name or [guardian_f_name] is null)
       AND ([guardian_l_name] like @guardian_l_name or [guardian_l_name] is null)
       AND ([guardian_mi] = @guardian_mi or [guardian_mi] is null)
       AND ([guardian_phone] like @guardian_phone or [guardian_phone] is null)
       AND ([adult_consent_date] = @adult_consent_date or [adult_consent_date] is null)
       AND ([guard_consent_date] = @guard_consent_date or [guard_consent_date] is null)
       AND ([dose_form1] = @dose_form1)
       AND ([dose_form2] = @dose_form2 or [dose_form2] is null)
END
GO

