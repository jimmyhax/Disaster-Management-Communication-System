using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.App
{
    public partial class ScriptGenerator_V2 : System.Web.UI.Page
    {
        List<String> DB_Names = new List<String>();
        List<String> Null_Names = new List<String>();
        List<String> DB_Types = new List<String>();
        List<String> C_Types = new List<String>();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void The_Table_Name_SelectedIndexChanged(object sender, EventArgs e)
        {
        
            //get the value from the dropdownlist
            string tableName = The_Table_Name.SelectedValue;
            //create connection and sql commands.  Notice that a connection string is called from the config file.  change connection string to DMCS or local db. 
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            SqlCommand sqlcmd = new SqlCommand("SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE Table_Name ='" + tableName + "'", conn);
            //try it, catch it, close it, and give away connection.
            try
            {
                conn.Open();
                using (SqlDataReader rdr = sqlcmd.ExecuteReader())
                {
                    //read the reader object for all columns of the subject table
                    while (rdr.Read())
                    {

                        //append column names
                        DB_Names.Add(rdr["COLUMN_NAME"].ToString());
                        //test for null
                        if (rdr["IS_NULLABLE"].ToString().Equals("YES"))
                            Null_Names.Add("NULL");
                        else
                            Null_Names.Add("NOT NULL");
                        //append SQL data types to textbox
                        DB_Types.Add(rdr["DATA_TYPE"].ToString());
                        //test for C# types and append to textbox-->format strings
                        C_Types.Add(getCsType((rdr["DATA_TYPE"].ToString().Replace("()", "")).ToLower(), rdr["CHARACTER_MAXIMUM_LENGTH"].ToString()));
                    }
                    //format SQL types string from textbox
                    //DB_Types.Text = DB_Types.Text.ToString().Replace("()", "");
                }
                //Create_Click(sender, e);
                //Download_Click(sender, e);
            }
            catch (SqlException ex)
            {
                //if connection cannot be made...
                Response.Write("<script>alert('Connection to " + ConfigurationManager.ConnectionStrings["DefaultConnection"] + " cannot be established.\n" + ex.Message + "');</script>");
            }
            finally
            {
                //Close and dispose
                conn.Close();
                conn.Dispose();
            }
        }

        protected string getCsType(string type, string size)
        {
            switch (type)
            {
                case "bigint":
                    return "Int64";
                case "binary":
                    return "Byte[" + size + "]";
                case "bit":
                    return "Boolean";
                case "char":
                    return "String";
                case "nchar":
                    return "Char[" + size + "]";
                case "date":
                    return "DateTime";
                case "datetime":
                    return "DateTime";
                case "datetime2":
                    return "DateTime";
                case "DATETIMEOFFSET":
                    return "DateTimeOffset";
                case "decimal":
                    return "Decimal";
                case "float":
                    return "float";
                case "geography":
                    return "string";
                case "geometry":
                    return "string";
                case "image":
                    return "byte[]";
                case "varbinary":
                    return "byte[]";
                case "int":
                    return "Int32";
                case "money":
                    return "Decimal";
                case "numeric":
                    return "Decimal";
                case "nvarchar":
                    return "String";
                case "smallint":
                    return "Int16";
                case "tinyint":
                    return "Byte";
                case "uniqueidentifier":
                    return "Guid";
                case "varchar":
                    return "String";
                case "text":
                    return "String";
                default:
                    return "No Type";
            }
        }


    }
}