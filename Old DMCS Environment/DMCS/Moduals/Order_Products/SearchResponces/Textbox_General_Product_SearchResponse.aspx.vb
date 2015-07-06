Imports System.Xml
Imports System.Data.SqlClient

Partial Class Textbox_General_Product_SearchResponse
    Inherits System.Web.UI.Page

    ' Page Load
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim dmlSearchLatitude As String = ""
        Dim dmlSearchLongitude As String = ""
        Dim intSearchRadius As String = ""
        Dim strSearchProductNamesWC As String = ""

        If Request.QueryString("lat") <> "" Then
            dmlSearchLatitude = CDbl(Request.QueryString("lat").ToString)
        End If
        If Request.QueryString("lng") <> "" Then
            dmlSearchLongitude = CDbl(Request.QueryString("lng").ToString)
        End If
        If Request.QueryString("radius") <> "" Then
            intSearchRadius = CInt(Request.QueryString("radius").ToString)
        End If
        If Request.QueryString("productNamesWC") <> "" Then
            strSearchProductNamesWC = CStr(Request.QueryString("productNamesWC"))
        End If
        ' Here you make the call to your locations stored procedure
        ' This database call is a little messy but is just to show you the point.
        Dim connDB = New SqlConnection
        Dim cmd As New SqlCommand
        Dim cstLcal As ConnectionStringSettings
        cstLcal = ConfigurationManager.ConnectionStrings("localhost")
        connDB.ConnectionString = cstLcal.ConnectionString

        connDB.Open()
        cmd.Connection = connDB
        cmd.CommandType = Data.CommandType.StoredProcedure
        cmd.CommandTimeout = 20
        cmd.CommandText = "dbo.SP_DMCS_Location_Resources_In_Warehouse_Non_FEMA_Searchbox"
        cmd.Parameters.AddWithValue("@strProductNamesWC", strSearchProductNamesWC)
        cmd.Parameters.AddWithValue("@dmlLat", dmlSearchLatitude)
        cmd.Parameters.AddWithValue("@dmlLng", dmlSearchLongitude)
        cmd.Parameters.AddWithValue("@intRadius", intSearchRadius)

        ' Execute the stored procedure and return the result as plain XML
        Dim rdrXMLLocations As XmlReader = Nothing
        rdrXMLLocations = cmd.ExecuteXmlReader()

        Response.Expires = 0
        Response.ContentType = "text/xml"
        Dim oDocument As New XmlDocument()
        Dim sb As New System.Text.StringBuilder()
        Using rdrXMLLocations
            While Not rdrXMLLocations.EOF
                rdrXMLLocations.MoveToContent()
                sb.Append(rdrXMLLocations.ReadOuterXml())
            End While
            rdrXMLLocations.Close()
        End Using
        If sb.ToString() <> "" Then
            oDocument.LoadXml(sb.ToString())
        End If
        oDocument.Save(Response.Output)
        Response.OutputStream.Flush()
        Response.OutputStream.Close()

    End Sub

End Class


