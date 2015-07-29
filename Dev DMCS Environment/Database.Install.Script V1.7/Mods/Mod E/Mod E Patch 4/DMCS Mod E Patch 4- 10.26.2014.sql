BEGIN TRANSACTION

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



COMMIT