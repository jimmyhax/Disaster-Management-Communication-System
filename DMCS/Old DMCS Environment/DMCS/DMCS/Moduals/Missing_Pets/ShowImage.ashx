<%@ WebHandler Language="C#" Class="ShowImage" %>
using System;
using System.Configuration;
using System.Web;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using DMCS;
public class ShowImage : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        Int32 idNo;
        
        if (context.Request.QueryString["ID"] != null)
            idNo = Convert.ToInt32(context.Request.QueryString["ID"]);
            
        else
            throw new ArgumentException("No parameter specified");

        context.Response.ContentType = "image";
        Stream strm = ShowEmpImage(idNo);
        byte[] buffer = new byte[4096];
        int byteSeq = 0;
        try
        {
            byteSeq = strm.Read(buffer, 0, 4096);

        }
        catch (Exception)
        {
            return;
        }

        while (byteSeq > 0)
        {
            context.Response.OutputStream.Write(buffer, 0, byteSeq);
            byteSeq = strm.Read(buffer, 0, 4096);
        }
    }

    private Stream ShowEmpImage(int idNo)
    {
        string ConnectionString = IDManager.connection();

        SqlConnection connection = new SqlConnection(ConnectionString);
        string sql = "SELECT Pet_Picture FROM pet WHERE Pet_Record_ID = @ID";
        SqlCommand cmd = new SqlCommand(sql, connection);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@ID", idNo);
        connection.Open();
        object img = cmd.ExecuteScalar();
        try
        {
            return new MemoryStream((byte[])img);
        }
        catch
        {
            return null;
        }
        finally
        {
            connection.Close();
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }



}
