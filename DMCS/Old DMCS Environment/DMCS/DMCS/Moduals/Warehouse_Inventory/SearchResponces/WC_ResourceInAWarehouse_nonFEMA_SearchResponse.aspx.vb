Imports System.Xml
Imports System.Data.SqlClient

Partial Class WC_ResourceInAWarehouse_nonFEMA_SearchResponse
    Inherits System.Web.UI.Page

    ' Page Load
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim dmlSearchLatitude As Double
        Dim dmlSearchLongitude As Double
        Dim intSearchRadius As Int32
        Dim strSearchType1 As String
        Dim strSearchType2 As String
        Dim strSearchType3 As String
        Dim strSearchType4 As String
        Dim strSearchType5 As String
        Dim strSearchType6 As String
        Dim strSearchType7 As String
        Dim strSearchType8 As String
        Dim strSearchType9 As String
        Dim strSearchType10 As String



        If Request.QueryString("lat") <> "" Then
            dmlSearchLatitude = CDbl(Request.QueryString("lat"))
        End If
        If Request.QueryString("lng") <> "" Then
            dmlSearchLongitude = CDbl(Request.QueryString("lng"))
        End If
        If Request.QueryString("radius") <> "" Then
            intSearchRadius = CInt(Request.QueryString("radius"))
        End If
        'Types
        If Request.QueryString("type1") <> "" Then
            strSearchType1 = CStr(Request.QueryString("type1"))
        End If
        If Request.QueryString("type2") <> "" Then
            strSearchType2 = CStr(Request.QueryString("type2"))
        End If
        If Request.QueryString("type3") <> "" Then
            strSearchType3 = CStr(Request.QueryString("type3"))
        End If
        If Request.QueryString("type4") <> "" Then
            strSearchType4 = CStr(Request.QueryString("type4"))
        End If
        If Request.QueryString("type5") <> "" Then
            strSearchType5 = CStr(Request.QueryString("type5"))
        End If
        If Request.QueryString("type6") <> "" Then
            strSearchType6 = CStr(Request.QueryString("type6"))
        End If
        If Request.QueryString("type7") <> "" Then
            strSearchType7 = CStr(Request.QueryString("type7"))
        End If
        If Request.QueryString("type8") <> "" Then
            strSearchType8 = CStr(Request.QueryString("type8"))
        End If
        If Request.QueryString("type9") <> "" Then
            strSearchType9 = CStr(Request.QueryString("type9"))
        End If
        If Request.QueryString("type10") <> "" Then
            strSearchType10 = CStr(Request.QueryString("type10"))
        End If



        ' Here you make the call to your locations stored procedure
        ' This database call is a little messy but is just to show you the point.
        Dim connDB = New SqlConnection
        Dim cmd As New SqlCommand
        connDB.ConnectionString = IDManager.connection()

        connDB.Open()
        cmd.Connection = connDB
        cmd.CommandType = Data.CommandType.StoredProcedure
        cmd.CommandTimeout = 20
        cmd.CommandText = "dbo.SP_DMCS_WC_Location_Resources_nonFEMA"
        cmd.Parameters.AddWithValue("@dmlLat", dmlSearchLatitude)
        cmd.Parameters.AddWithValue("@dmlLng", dmlSearchLongitude)
        cmd.Parameters.AddWithValue("@intRadius", intSearchRadius)
        cmd.Parameters.AddWithValue("@wcType1", strSearchType1)
        cmd.Parameters.AddWithValue("@wcType2", strSearchType2)
        cmd.Parameters.AddWithValue("@wcType3", strSearchType3)
        cmd.Parameters.AddWithValue("@wcType4", strSearchType4)
        cmd.Parameters.AddWithValue("@wcType5", strSearchType5)
        cmd.Parameters.AddWithValue("@wcType6", strSearchType6)
        cmd.Parameters.AddWithValue("@wcType7", strSearchType7)
        cmd.Parameters.AddWithValue("@wcType8", strSearchType8)
        cmd.Parameters.AddWithValue("@wcType9", strSearchType9)
        cmd.Parameters.AddWithValue("@wcType10", strSearchType10)

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
