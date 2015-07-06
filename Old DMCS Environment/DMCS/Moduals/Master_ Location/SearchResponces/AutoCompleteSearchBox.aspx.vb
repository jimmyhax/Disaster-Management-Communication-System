Imports System.Xml
Imports System.Data.SqlClient
Imports Newtonsoft.Json

Partial Class AutoCompleteSearchBox
    Inherits System.Web.UI.Page

    ' Page Load
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        ' Here you make the call to your locations stored procedure
        ' This database call is a little messy but is just to show you the point.
        Dim connDB = New SqlConnection
        Dim cmd As New SqlCommand
        connDB.ConnectionString = IDManager.connection()

        connDB.Open()
        cmd.Connection = connDB
        cmd.CommandType = Data.CommandType.StoredProcedure
        cmd.CommandTimeout = 20
        cmd.CommandText = "dbo.SP_DMCS_GrabEquiptmentList"


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
        Dim JsonConvert As Object = New Object()
        Dim jsonText = JsonConvert.SerializeXmlNode(oDocument)
        System.IO.File.WriteAllText("C:\Users\jim\Desktop\data.txt", jsonText)
        oDocument.Save(Response.Output)
        Response.OutputStream.Flush()
        Response.OutputStream.Close()

    End Sub



End Class
