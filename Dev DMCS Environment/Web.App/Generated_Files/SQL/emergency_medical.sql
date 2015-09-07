/****** Object:  Table [dbo].[emergency_medical]    Script Date: 9/7/2015 11:22:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[emergency_medical](
  [em_id] int IDENTITY(1,1) NOT NULL,
  [client_id] int NOT NULL,
  [ambulance_company_name] varchar(50) NOT NULL,
  [ambulance_identification] varchar(30) NOT NULL,
  [appointment_date] datetime NULL,
  [area_of_specialty] varchar(30) NULL,
  [assistance_order] varchar(50) NULL,
  [date_of_service] datetime NOT NULL,
  [degree_certifications] text(2147483647) NULL,
  [doctor_appointments] varchar(30) NULL,
  [doctor_id] int NULL,
  [doctor_start_date] datetime NULL,
  [driver_id] int NULL,
  [educational_institution_name] varchar(50) NULL,
  [external_examination] text(2147483647) NULL,
  [hospital_name] varchar(50) NULL,
  [internal_examination] text(2147483647) NULL,
  [lights_sirens_to_scene] varchar(3) NULL,
  [location_type] varchar(3) NULL,
  [number_of_days_admitted] int NULL,
  [office_location] varchar(30) NULL,
  [other_remarks] text(2147483647) NULL,
  [prescription_medicines] text(2147483647) NULL,
  [time_of_service] datetime NULL,
  [total_cost] money NULL,
  [deceased_id] int NULL,
 CONSTRAINT [emergency_medical_em_id_pk] PRIMARY KEY CLUSTERED 
(
	[em_id] ASC
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
/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_EMERGENCY_MEDICAL]    Script Date: 9/7/2015 11:22:10 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_EMERGENCY_MEDICAL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_SELECT_EMERGENCY_MEDICAL]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_EMERGENCY_MEDICAL]
           @em_id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [em_id]
      ,[client_id]
      ,[ambulance_company_name]
      ,[ambulance_identification]
      ,[appointment_date]
      ,[area_of_specialty]
      ,[assistance_order]
      ,[date_of_service]
      ,[degree_certifications]
      ,[doctor_appointments]
      ,[doctor_id]
      ,[doctor_start_date]
      ,[driver_id]
      ,[educational_institution_name]
      ,[external_examination]
      ,[hospital_name]
      ,[internal_examination]
      ,[lights_sirens_to_scene]
      ,[location_type]
      ,[number_of_days_admitted]
      ,[office_location]
      ,[other_remarks]
      ,[prescription_medicines]
      ,[time_of_service]
      ,[total_cost]
      ,[deceased_id]
  FROM [dbo].[emergency_medical]
 WHERE em_id = @em_id
End
GO
/***********************************************************/
/*************************************************/
/****** - INSERT STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_EMERGENCY_MEDICAL]    Script Date: 9/7/2015 11:22:10 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_EMERGENCY_MEDICAL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_INSERT_EMERGENCY_MEDICAL]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_EMERGENCY_MEDICAL]
	  @client_id as int,
	  @ambulance_company_name as varchar(50),
	  @ambulance_identification as varchar(30),
	  @appointment_date as datetime,
	  @area_of_specialty as varchar(30),
	  @assistance_order as varchar(50),
	  @date_of_service as datetime,
	  @degree_certifications as text,
	  @doctor_appointments as varchar(30),
	  @doctor_id as int,
	  @doctor_start_date as datetime,
	  @driver_id as int,
	  @educational_institution_name as varchar(50),
	  @external_examination as text,
	  @hospital_name as varchar(50),
	  @internal_examination as text,
	  @lights_sirens_to_scene as varchar(3),
	  @location_type as varchar(3),
	  @number_of_days_admitted as int,
	  @office_location as varchar(30),
	  @other_remarks as text,
	  @prescription_medicines as text,
	  @time_of_service as datetime,
	  @total_cost as money
	  @deceased_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @ambulance_company_name = ''
    BEGIN
    SET @ambulance_company_name = null
    END
	  IF @ambulance_identification = ''
    BEGIN
    SET @ambulance_identification = null
    END
	  IF @appointment_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @appointment_date = null
    END
	  IF @area_of_specialty = ''
    BEGIN
    SET @area_of_specialty = null
    END
	  IF @assistance_order = ''
    BEGIN
    SET @assistance_order = null
    END
	  IF @date_of_service = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_of_service = null
    END
	  IF @doctor_appointments = ''
    BEGIN
    SET @doctor_appointments = null
    END
	  IF @doctor_id = 0
    BEGIN
    SET @doctor_id = null
    END
	  IF @doctor_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @doctor_start_date = null
    END
	  IF @driver_id = 0
    BEGIN
    SET @driver_id = null
    END
	  IF @educational_institution_name = ''
    BEGIN
    SET @educational_institution_name = null
    END
	  IF @hospital_name = ''
    BEGIN
    SET @hospital_name = null
    END
	  IF @lights_sirens_to_scene = ''
    BEGIN
    SET @lights_sirens_to_scene = null
    END
	  IF @location_type = ''
    BEGIN
    SET @location_type = null
    END
	  IF @number_of_days_admitted = 0
    BEGIN
    SET @number_of_days_admitted = null
    END
	  IF @office_location = ''
    BEGIN
    SET @office_location = null
    END
	  IF @time_of_service = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @time_of_service = null
    END
	  IF @total_cost = 0
    BEGIN
    SET @total_cost = null
    END
	  IF @deceased_id = 0
    BEGIN
    SET @deceased_id = null
    END
	Insert INTO [dbo].[emergency_medical]
           (
            [client_id]
           ,[ambulance_company_name]
           ,[ambulance_identification]
           ,[appointment_date]
           ,[area_of_specialty]
           ,[assistance_order]
           ,[date_of_service]
           ,[degree_certifications]
           ,[doctor_appointments]
           ,[doctor_id]
           ,[doctor_start_date]
           ,[driver_id]
           ,[educational_institution_name]
           ,[external_examination]
           ,[hospital_name]
           ,[internal_examination]
           ,[lights_sirens_to_scene]
           ,[location_type]
           ,[number_of_days_admitted]
           ,[office_location]
           ,[other_remarks]
           ,[prescription_medicines]
           ,[time_of_service]
           ,[total_cost]
           ,[deceased_id]
            )
     VALUES (
            @client_id
           ,@ambulance_company_name
           ,@ambulance_identification
           ,@appointment_date
           ,@area_of_specialty
           ,@assistance_order
           ,@date_of_service
           ,@degree_certifications
           ,@doctor_appointments
           ,@doctor_id
           ,@doctor_start_date
           ,@driver_id
           ,@educational_institution_name
           ,@external_examination
           ,@hospital_name
           ,@internal_examination
           ,@lights_sirens_to_scene
           ,@location_type
           ,@number_of_days_admitted
           ,@office_location
           ,@other_remarks
           ,@prescription_medicines
           ,@time_of_service
           ,@total_cost
           ,@deceased_id
            )
END
GO
/***********************************************************/
/*************************************************/
/****** - UPDATE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_EMERGENCY_MEDICAL]    Script Date: 9/7/2015 11:22:10 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_EMERGENCY_MEDICAL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_EMERGENCY_MEDICAL]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_EMERGENCY_MEDICAL]
	  @em_id as int,
	  @client_id as int,
	  @ambulance_company_name as varchar(50),
	  @ambulance_identification as varchar(30),
	  @appointment_date as datetime,
	  @area_of_specialty as varchar(30),
	  @assistance_order as varchar(50),
	  @date_of_service as datetime,
	  @degree_certifications as text,
	  @doctor_appointments as varchar(30),
	  @doctor_id as int,
	  @doctor_start_date as datetime,
	  @driver_id as int,
	  @educational_institution_name as varchar(50),
	  @external_examination as text,
	  @hospital_name as varchar(50),
	  @internal_examination as text,
	  @lights_sirens_to_scene as varchar(3),
	  @location_type as varchar(3),
	  @number_of_days_admitted as int,
	  @office_location as varchar(30),
	  @other_remarks as text,
	  @prescription_medicines as text,
	  @time_of_service as datetime,
	  @total_cost as money
	  @deceased_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @ambulance_company_name = ''
    BEGIN
    SET @ambulance_company_name = null
    END
	  IF @ambulance_identification = ''
    BEGIN
    SET @ambulance_identification = null
    END
	  IF @appointment_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @appointment_date = null
    END
	  IF @area_of_specialty = ''
    BEGIN
    SET @area_of_specialty = null
    END
	  IF @assistance_order = ''
    BEGIN
    SET @assistance_order = null
    END
	  IF @date_of_service = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_of_service = null
    END
	  IF @doctor_appointments = ''
    BEGIN
    SET @doctor_appointments = null
    END
	  IF @doctor_id = 0
    BEGIN
    SET @doctor_id = null
    END
	  IF @doctor_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @doctor_start_date = null
    END
	  IF @driver_id = 0
    BEGIN
    SET @driver_id = null
    END
	  IF @educational_institution_name = ''
    BEGIN
    SET @educational_institution_name = null
    END
	  IF @hospital_name = ''
    BEGIN
    SET @hospital_name = null
    END
	  IF @lights_sirens_to_scene = ''
    BEGIN
    SET @lights_sirens_to_scene = null
    END
	  IF @location_type = ''
    BEGIN
    SET @location_type = null
    END
	  IF @number_of_days_admitted = 0
    BEGIN
    SET @number_of_days_admitted = null
    END
	  IF @office_location = ''
    BEGIN
    SET @office_location = null
    END
	  IF @time_of_service = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @time_of_service = null
    END
	  IF @total_cost = 0
    BEGIN
    SET @total_cost = null
    END
	  IF @deceased_id = 0
    BEGIN
    SET @deceased_id = null
    END
	UPDATE [dbo].[emergency_medical]
       SET
		   [client_id] = @client_id,
		   [ambulance_company_name] = @ambulance_company_name,
		   [ambulance_identification] = @ambulance_identification,
		   [appointment_date] = @appointment_date,
		   [area_of_specialty] = @area_of_specialty,
		   [assistance_order] = @assistance_order,
		   [date_of_service] = @date_of_service,
		   [degree_certifications] = @degree_certifications,
		   [doctor_appointments] = @doctor_appointments,
		   [doctor_id] = @doctor_id,
		   [doctor_start_date] = @doctor_start_date,
		   [driver_id] = @driver_id,
		   [educational_institution_name] = @educational_institution_name,
		   [external_examination] = @external_examination,
		   [hospital_name] = @hospital_name,
		   [internal_examination] = @internal_examination,
		   [lights_sirens_to_scene] = @lights_sirens_to_scene,
		   [location_type] = @location_type,
		   [number_of_days_admitted] = @number_of_days_admitted,
		   [office_location] = @office_location,
		   [other_remarks] = @other_remarks,
		   [prescription_medicines] = @prescription_medicines,
		   [time_of_service] = @time_of_service,
		   [total_cost] = @total_cost,
		   [deceased_id] = @deceased_id
       WHERE em_id = @em_id
END
GO
/***********************************************************/
/*************************************************/
/****** - DELETE STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_EMERGENCY_MEDICAL]    Script Date: 9/7/2015 11:22:10 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_EMERGENCY_MEDICAL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_DELETE_EMERGENCY_MEDICAL]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_EMERGENCY_MEDICAL]
	@em_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete dbo.emergency_medical
	where em_id = @em_id
END
GO
/***********************************************************/
/*************************************************/
/****** - GET STORED PROCEDURE -  ******/
/*************************************************/
/***********************************************************/
/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_EMERGENCY_MEDICAL]    Script Date: 9/7/2015 11:22:10 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_EMERGENCY_MEDICAL]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_DMCS_GET_EMERGENCY_MEDICAL]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DMCS_GET_EMERGENCY_MEDICAL]
	  @client_id as int,
	  @ambulance_company_name as varchar(50),
	  @ambulance_identification as varchar(30),
	  @appointment_date as datetime,
	  @area_of_specialty as varchar(30),
	  @assistance_order as varchar(50),
	  @date_of_service as datetime,
	  @degree_certifications as text,
	  @doctor_appointments as varchar(30),
	  @doctor_id as int,
	  @doctor_start_date as datetime,
	  @driver_id as int,
	  @educational_institution_name as varchar(50),
	  @external_examination as text,
	  @hospital_name as varchar(50),
	  @internal_examination as text,
	  @lights_sirens_to_scene as varchar(3),
	  @location_type as varchar(3),
	  @number_of_days_admitted as int,
	  @office_location as varchar(30),
	  @other_remarks as text,
	  @prescription_medicines as text,
	  @time_of_service as datetime,
	  @total_cost as money
	  @deceased_id as int,
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  IF @client_id = 0
    BEGIN
    SET @client_id = null
    END
	  IF @ambulance_company_name = ''
    BEGIN
    SET @ambulance_company_name = null
    END
	  IF @ambulance_identification = ''
    BEGIN
    SET @ambulance_identification = null
    END
	  IF @appointment_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @appointment_date = null
    END
	  IF @area_of_specialty = ''
    BEGIN
    SET @area_of_specialty = null
    END
	  IF @assistance_order = ''
    BEGIN
    SET @assistance_order = null
    END
	  IF @date_of_service = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @date_of_service = null
    END
	  IF @doctor_appointments = ''
    BEGIN
    SET @doctor_appointments = null
    END
	  IF @doctor_id = 0
    BEGIN
    SET @doctor_id = null
    END
	  IF @doctor_start_date = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @doctor_start_date = null
    END
	  IF @driver_id = 0
    BEGIN
    SET @driver_id = null
    END
	  IF @educational_institution_name = ''
    BEGIN
    SET @educational_institution_name = null
    END
	  IF @hospital_name = ''
    BEGIN
    SET @hospital_name = null
    END
	  IF @lights_sirens_to_scene = ''
    BEGIN
    SET @lights_sirens_to_scene = null
    END
	  IF @location_type = ''
    BEGIN
    SET @location_type = null
    END
	  IF @number_of_days_admitted = 0
    BEGIN
    SET @number_of_days_admitted = null
    END
	  IF @office_location = ''
    BEGIN
    SET @office_location = null
    END
	  IF @time_of_service = '9/9/1900 12:00:00 AM'
    BEGIN
    SET @time_of_service = null
    END
	  IF @total_cost = 0
    BEGIN
    SET @total_cost = null
    END
	  IF @deceased_id = 0
    BEGIN
    SET @deceased_id = null
    END
    SELECT [em_id] 
      FROM [dbo].[emergency_medical] 
       WHERE ([client_id] = @client_id)
       AND ([ambulance_company_name] like @ambulance_company_name)
       AND ([ambulance_identification] like @ambulance_identification)
       AND ([appointment_date] = @appointment_date or [appointment_date] is null)
       AND ([area_of_specialty] like @area_of_specialty or [area_of_specialty] is null)
       AND ([assistance_order] like @assistance_order or [assistance_order] is null)
       AND ([date_of_service] = @date_of_service)
       AND ([degree_certifications] like @degree_certifications or [degree_certifications] is null)
       AND ([doctor_appointments] like @doctor_appointments or [doctor_appointments] is null)
       AND ([doctor_id] = @doctor_id or [doctor_id] is null)
       AND ([doctor_start_date] = @doctor_start_date or [doctor_start_date] is null)
       AND ([driver_id] = @driver_id or [driver_id] is null)
       AND ([educational_institution_name] like @educational_institution_name or [educational_institution_name] is null)
       AND ([external_examination] like @external_examination or [external_examination] is null)
       AND ([hospital_name] like @hospital_name or [hospital_name] is null)
       AND ([internal_examination] like @internal_examination or [internal_examination] is null)
       AND ([lights_sirens_to_scene] like @lights_sirens_to_scene or [lights_sirens_to_scene] is null)
       AND ([location_type] like @location_type or [location_type] is null)
       AND ([number_of_days_admitted] = @number_of_days_admitted or [number_of_days_admitted] is null)
       AND ([office_location] like @office_location or [office_location] is null)
       AND ([other_remarks] like @other_remarks or [other_remarks] is null)
       AND ([prescription_medicines] like @prescription_medicines or [prescription_medicines] is null)
       AND ([time_of_service] = @time_of_service or [time_of_service] is null)
       AND ([total_cost] = @total_cost or [total_cost] is null)
       AND ([deceased_id] = @deceased_id or [deceased_id] is null)
END
GO

