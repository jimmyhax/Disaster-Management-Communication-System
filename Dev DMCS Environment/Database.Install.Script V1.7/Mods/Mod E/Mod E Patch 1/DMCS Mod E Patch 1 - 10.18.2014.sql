
BEGIN TRANSACTION

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Resources_In_Warehouse_Non_FEMA]    Script Date: 9/8/2014 9:56:10 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[SP_DMCS_Location_Resources_In_Warehouse_Non_FEMA]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        
resource.Resource_ID, 
products.product_id,  
resource.Location_ID, 

product_name, 
product_desc, 
product_type, 
products.product_qty,
products.Product_subtype,

location.type,
location.location_desc,
location.city,
location.county,
location.state,
location.zip,
location.n_lat,
location.n_long,

FEMA_Description,
Make,
Model,
Weight,


      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) AS distance

FROM  dbo.resource, dbo.products, dbo.warehouse_product_Location, dbo.location, dbo.warehouse, dbo.address
WHERE	resource.Resource_ID = products.Resource_ID
		AND products.product_id = warehouse_product_Location.product_id
		AND warehouse_product_Location.warehouse_id = warehouse.warehouse_id
		AND location.Location_ID = warehouse_product_Location.Location_ID
		AND warehouse.address_id = address.address_id
		

	and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) < @intRadius
 Order BY distance
-- Return XML for formatting results
FOR XML RAW('marker'),ROOT('markers')
 
SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Resources_In_Warehouse]    Script Date: 9/8/2014 10:40:19 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_DMCS_Location_Resources_In_Warehouse]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        
resource.Resource_ID, 
products.product_id,  
resource.Location_ID, 

product_name, 
product_desc, 
product_type, 
products.product_qty,

location.type,
location.location_desc,
location.city,
location.county,
location.state,
location.zip,
location.n_lat,
location.n_long,

FEMA_Description,
Make,
Model,
Weight,
Equipment,

      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) AS distance

FROM  dbo.resource, dbo.products, dbo.warehouse_product_Location, dbo.location, dbo.warehouse, dbo.address, dbo.FEMA
WHERE	resource.Resource_ID = products.Resource_ID
		AND products.product_id = warehouse_product_Location.product_id
		AND products.product_id = FEMA.FEMA_ID
		AND warehouse_product_Location.warehouse_id = warehouse.warehouse_id
		AND location.Location_ID =warehouse_product_Location.Location_ID
		AND warehouse.address_id =address.address_id
		

	and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) < @intRadius
 Order By distance
-- Return XML for formatting results
FOR XML RAW('marker'),ROOT('markers')
 
SET NOCOUNT OFF


GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_WC_Location_Resources_nonFEMA]    Script Date: 9/8/2014 10:45:13 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_DMCS_WC_Location_Resources_nonFEMA]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int,
		@wcType1 as varchar(100),
		@wcType2 as varchar(100),
		@wcType3 as varchar(100),
		@wcType4 as varchar(100),
		@wcType5 as varchar(100),
		@wcType6 as varchar(100),
		@wcType7 as varchar(100),
		@wcType8 as varchar(100),
		@wcType9 as varchar(100),
		@wcType10 as varchar(100)
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        
resource.Resource_ID, 
products.product_id,  
resource.Location_ID, 

product_name, 
product_desc, 
product_type, 
products.product_qty,
products.Product_subtype,

location.type,
location.location_desc,
location.city,
location.county,
location.state,
location.zip,
location.n_lat,
location.n_long,

FEMA_Description,
Make,
Model,
Weight,



      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) AS distance


FROM  dbo.resource, dbo.products, dbo.warehouse_product_Location, dbo.location, dbo.warehouse, dbo.address
WHERE	resource.Resource_ID = products.Resource_ID
		AND products.product_id = warehouse_product_Location.product_id
		AND warehouse_product_Location.warehouse_id = warehouse.warehouse_id
		AND location.Location_ID = warehouse_product_Location.Location_ID
		AND warehouse.address_id = address.address_id

	and product_type in (COALESCE(@wcType1,null), COALESCE(@wcType2,null), COALESCE(@wcType3,null), 
	COALESCE(@wcType4,null),COALESCE(@wcType5,null), COALESCE(@wcType6,null), COALESCE(@wcType7,null), 
	COALESCE(@wcType8,null),COALESCE(@wcType9,null), COALESCE(@wcType10,null) )
	and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) < @intRadius
ORDER BY distance
 


-- Return XML for formatting results
FOR XML RAW('marker'),ROOT('markers')
 
SET NOCOUNT OFF

GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_WC_Location_Resources]    Script Date: 9/8/2014 10:47:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_DMCS_WC_Location_Resources]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int,
		@wcType1 as varchar(100),
		@wcType2 as varchar(100),
		@wcType3 as varchar(100),
		@wcType4 as varchar(100),
		@wcType5 as varchar(100),
		@wcType6 as varchar(100),
		@wcType7 as varchar(100),
		@wcType8 as varchar(100),
		@wcType9 as varchar(100),
		@wcType10 as varchar(100)
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        
resource.Resource_ID, 
products.product_id,  
resource.Location_ID, 

product_name, 
product_desc, 
product_type,
Product_subtype, 
products.product_qty,

Products.FEMA_Description,
Products.Make,
Products.Model,
Products.Weight,

location.type,
location.location_desc,
location.city,
location.county,
location.state,
location.zip,
location.n_lat,
location.n_long,

FEMA.Equipment,



      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) AS distance

FROM  dbo.resource, dbo.products, dbo.warehouse_product_Location, dbo.location, dbo.warehouse, dbo.address, dbo.FEMA
WHERE	resource.Resource_ID = products.Resource_ID
		AND products.product_id = warehouse_product_Location.product_id
		AND products.product_id = FEMA.FEMA_ID
		AND warehouse_product_Location.warehouse_id = warehouse.warehouse_id
		AND location.Location_ID =warehouse_product_Location.Location_ID
		AND warehouse.address_id =address.address_id

	and FEMA_Description in (COALESCE(@wcType1,null), COALESCE(@wcType2,null), COALESCE(@wcType3,null), 
	COALESCE(@wcType4,null),COALESCE(@wcType5,null), COALESCE(@wcType6,null), COALESCE(@wcType7,null), 
	COALESCE(@wcType8,null),COALESCE(@wcType9,null), COALESCE(@wcType10,null) )
	and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) < @intRadius
ORDER BY distance
 


-- Return XML for formatting results
FOR XML RAW('marker'),ROOT('markers')
 
SET NOCOUNT OFF


GO


/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Resources_In_Warehouse_Non_FEMA_Searchbox]    Script Date: 9/14/2014 11:31:21 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_DMCS_Location_Resources_In_Warehouse_Non_FEMA_Searchbox]
    (
        @strProductNamesWC Varchar(max),
		@dmlLat Varchar(max),
        @dmlLng Varchar(max),
        @intRadius Varchar(max)
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier Varchar(max)
SET @intMilesModifier = '3959'  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
DECLARE @string as varchar(MAX) 
SET @string = 
'SELECT        
resource.Resource_ID, 
products.product_id,  
resource.Location_ID, 

product_name, 
product_desc, 
product_type, 
products.product_qty,
products.Product_subtype,

location.type,
location.location_desc,
location.city,
location.county,
location.state,
location.zip,
location.n_lat,
location.n_long,

FEMA_Description,
Make,
Model,
Weight,


      
	  (' + @intMilesModifier + '*acos(cos(radians(' + @dmlLat + '))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(' + @dmlLng + '))+sin(radians(' + @dmlLat + '))*sin(radians(n_lat)))) AS distance

FROM            dbo.location INNER JOIN
                         dbo.warehouse_product_Location ON dbo.location.Location_ID = dbo.warehouse_product_Location.Location_ID INNER JOIN
                         dbo.warehouse ON dbo.warehouse_product_Location.warehouse_id = dbo.warehouse.warehouse_id AND 
                         dbo.location.Location_ID = dbo.warehouse.Location_ID INNER JOIN
                         dbo.address ON dbo.warehouse_product_Location.address_id = dbo.address.address_id AND 
                         dbo.warehouse.address_id = dbo.address.address_id INNER JOIN
                         dbo.resource ON dbo.location.Location_ID = dbo.resource.Location_ID INNER JOIN
                         dbo.products ON dbo.warehouse_product_Location.product_id = dbo.products.product_id AND 
                         dbo.resource.Resource_ID = dbo.products.Resource_ID LEFT JOIN
                         dbo.FEMA ON dbo.products.product_id = dbo.FEMA.FEMA_ID
WHERE	                 dbo.FEMA.FEMA_ID  is null	
						 AND (product_name + '' - '' + product_desc) IN (' + @strProductNamesWC + ')

	and (' + @intMilesModifier + '*acos(cos(radians(' + @dmlLat + '))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(' + @dmlLng + '))+sin(radians(' + @dmlLat + '))*sin(radians(n_lat)))) < ' + @intRadius + '
 Order By distance
-- Return XML for formatting results
FOR XML RAW(''marker''),ROOT(''markers'')'
	Exec(@string) 
SET NOCOUNT OFF



GO


/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Resources_In_Warehouse_Searchbox]    Script Date: 9/14/2014 11:31:41 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_DMCS_Location_Resources_In_Warehouse_Searchbox]
    (
        @strProductNamesWC Varchar(max),
		@dmlLat Varchar(max),
        @dmlLng Varchar(max),
        @intRadius Varchar(max)
    )
    As
 
SET NOCOUNT ON

DECLARE @intMilesModifier as varchar(MAX)
SET @intMilesModifier = '3959'  -- If using kilometers, use 6371 instead of 3959
DECLARE @string as varchar(MAX) 
SET @string = 
'SELECT        
resource.Resource_ID, 
products.product_id,  
resource.Location_ID, 

product_name, 
product_desc, 
product_type, 
products.product_qty,

location.type,
location.location_desc,
location.city,
location.county,
location.state,
location.zip,
location.n_lat,
location.n_long,

FEMA_Description,
Make,
Model,
Weight,
Equipment,

      
	  (' + @intMilesModifier + '*acos(cos(radians(' + @dmlLat + '))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(' + @dmlLng + '))+sin(radians(' + @dmlLat + '))*sin(radians(n_lat)))) AS distance

FROM  dbo.resource, dbo.products, dbo.warehouse_product_Location, dbo.location, dbo.warehouse, dbo.address, dbo.FEMA
WHERE	resource.Resource_ID = products.Resource_ID
		AND products.product_id = warehouse_product_Location.product_id
		AND products.product_id = FEMA.FEMA_ID
		AND warehouse_product_Location.warehouse_id = warehouse.warehouse_id
		AND location.Location_ID =warehouse_product_Location.Location_ID
		AND warehouse.address_id =address.address_id
		AND (product_name + '' - '' + FEMA_Description) IN (' + @strProductNamesWC + ')
		

	and (' + @intMilesModifier + '*acos(cos(radians(' + @dmlLat + '))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(' + @dmlLng + '))+sin(radians(' + @dmlLat + '))*sin(radians(n_lat)))) < ' + @intRadius + '
 Order By distance
-- Return XML for formatting results
FOR XML RAW(''marker''),ROOT(''markers'')'

	Exec(@string)
SET NOCOUNT OFF

GO


/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Resources_In_Warehouse_Non_FEMA]    Script Date: 9/14/2014 11:32:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_DMCS_Location_Resources_In_Warehouse_Non_FEMA]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        
resource.Resource_ID, 
products.product_id,  
resource.Location_ID, 

product_name, 
product_desc, 
product_type, 
products.product_qty,
products.Product_subtype,

location.type,
location.location_desc,
location.city,
location.county,
location.state,
location.zip,
location.n_lat,
location.n_long,

FEMA_Description,
Make,
Model,
Weight,


      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) AS distance

FROM            dbo.location INNER JOIN
                         dbo.warehouse_product_Location ON dbo.location.Location_ID = dbo.warehouse_product_Location.Location_ID INNER JOIN
                         dbo.warehouse ON dbo.warehouse_product_Location.warehouse_id = dbo.warehouse.warehouse_id AND 
                         dbo.location.Location_ID = dbo.warehouse.Location_ID INNER JOIN
                         dbo.address ON dbo.warehouse_product_Location.address_id = dbo.address.address_id AND 
                         dbo.warehouse.address_id = dbo.address.address_id INNER JOIN
                         dbo.resource ON dbo.location.Location_ID = dbo.resource.Location_ID INNER JOIN
                         dbo.products ON dbo.warehouse_product_Location.product_id = dbo.products.product_id AND 
                         dbo.resource.Resource_ID = dbo.products.Resource_ID LEFT JOIN
                         dbo.FEMA ON dbo.products.product_id = dbo.FEMA.FEMA_ID
WHERE		   			 dbo.FEMA.FEMA_ID  is null		

	and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) < @intRadius
 Order BY distance
-- Return XML for formatting results
FOR XML RAW('marker'),ROOT('markers')
 
SET NOCOUNT OFF



GO

/****** Object:  StoredProcedure [dbo].[SP_DMCS_Location_Resources_In_Warehouse]    Script Date: 9/14/2014 11:32:41 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[SP_DMCS_Location_Resources_In_Warehouse]
    (
        @dmlLat decimal(18, 12),
        @dmlLng decimal(18, 12),
        @intRadius int
    )
    As
 
SET NOCOUNT ON
 
DECLARE @intMilesModifier int
SET @intMilesModifier = 3959  -- If using kilometers, use 6371 instead of 3959
 
-- Select locations that are near the parameters based on distance formula on a sphere
SELECT        
resource.Resource_ID, 
products.product_id,  
resource.Location_ID, 

product_name, 
product_desc, 
product_type, 
products.product_qty,

location.type,
location.location_desc,
location.city,
location.county,
location.state,
location.zip,
location.n_lat,
location.n_long,

FEMA_Description,
Make,
Model,
Weight,
Equipment,

      
	  (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) AS distance

FROM  dbo.resource, dbo.products, dbo.warehouse_product_Location, dbo.location, dbo.warehouse, dbo.address, dbo.FEMA
WHERE	resource.Resource_ID = products.Resource_ID
		AND products.product_id = warehouse_product_Location.product_id
		AND products.product_id = FEMA.FEMA_ID
		AND warehouse_product_Location.warehouse_id = warehouse.warehouse_id
		AND location.Location_ID =warehouse_product_Location.Location_ID
		AND warehouse.address_id =address.address_id
		

	and (@intMilesModifier*acos(cos(radians(@dmlLat))*cos(radians(n_lat))*cos(radians(n_long)-
       radians(@dmlLng))+sin(radians(@dmlLat))*sin(radians(n_lat)))) < @intRadius
 Order By distance
-- Return XML for formatting results
FOR XML RAW('marker'),ROOT('markers')
 
SET NOCOUNT OFF



GO




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

/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PERSON_MISSING_OR_DECEASED_WC]    Script Date: 10/19/2014 5:09:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_PERSON_MISSING_OR_DECEASED_WC]
	  @wareclause as varchar(MAX)
AS
Begin
    Declare @string as varchar(MAX)
	Set @string = 'SELECT      dbo.person.f_name, dbo.person.m_initial, dbo.person.l_name, dbo.client.client_status, dbo.person.gender, dbo.person.birthdate, dbo.person.phone_primary, dbo.person.ssn, dbo.person.email, dbo.client.picture, dbo.address.city, dbo.address.state, dbo.address.str_add, 
            dbo.client.client_id, dbo.person.person_id, dbo.person.address_id
FROM        person, client, address    
WHERE		person.address_id = address.address_id
		AND	person_id = client_id
		AND (dbo.client.client_status=''M'' OR dbo.client.client_status=''D'')' 
		+ @wareclause

	Exec(@string)
END



GO


/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_PERSON_MISSING_OR_DECEASED_WC]    Script Date: 10/21/2014 9:54:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_CLIENT_SEARCH_WC]
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