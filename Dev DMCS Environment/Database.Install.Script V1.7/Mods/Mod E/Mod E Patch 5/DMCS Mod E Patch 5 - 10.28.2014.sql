BEGIN TRANSACTION

/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PET_TYPE_WC]    Script Date: 9/21/2014 11:44:10 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_COUNTY_ALERT_PHONE_NUMBERS_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string =  'select	phone_primary
					from	person, client, address 
					where	address.address_id = person.address_id 
					and		person.person_id = client_id
					and		client.Subscribed_Alerts = ''Y''
					and		' + @wareclause
	Exec(@string)
END

GO


COMMIT