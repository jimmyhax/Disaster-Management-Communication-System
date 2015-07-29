BEGIN TRANSACTION

/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PERSON_MISSING_OR_DECEASED_WC]    Script Date: 10/27/2014 11:41:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PERSON_REPORTING_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'SELECT      dbo.person.f_name, dbo.person.m_initial, dbo.person.l_name, dbo.client.client_status, dbo.person.gender, dbo.person.birthdate, dbo.person.phone_primary, dbo.person.ssn, dbo.person.email, dbo.client.picture, dbo.address.city, dbo.address.state, dbo.address.str_add, 
            dbo.client.client_id, dbo.person.person_id, dbo.person.address_id
FROM        person, client, address    
WHERE		person.address_id = address.address_id
		AND	person_id = client_id ' 
		+ @wareclause

	Exec(@string)
END

GO


COMMIT