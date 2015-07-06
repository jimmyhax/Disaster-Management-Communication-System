using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;
using System.Collections;
using System.Web.UI.WebControls.WebParts;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.IO;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Xml;
using System.Web.Services;

namespace DMCS
{
    public partial class Download_All : System.Web.UI.Page
    {

        String Table_Name;
        String[] DB_Array;
        String[] DB_Type_Array;
        String[] Null_Array;
        List<string> table_names;
        String Database_Script_Output_StringText;
        String Object_Output_StringText;
        String Select_Screen_Output_StringText;
        String Select_Screen_C_Output_StringText;
        String Insert_Screen_Output_StringText;
        String Insert_Screen_C_Output_StringText;
        String Update_Screen_Output_StringText;
        String Update_Screen_C_Output_StringText;
        String Delete_Screen_Output_StringText;
        String Delete_Screen_C_Output_StringText;
        String Insert_Update_Delete_Output_StringText;
        String Insert_Update_Delete_C_Output_StringText;
        List<string> DB_TableList = new List<string>();
        String DB_Names_String;
        String Null_Names_String;
        String DB_Types_String;
        String C_Types_String;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!ClientScript.IsStartupScriptRegistered("initialize"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                    "initialize", "initialize();", true);
            }


            if (!Page.IsPostBack)
            {


            }
        }

        protected void Create_Click(object sender, EventArgs e)
        {

        }


        public void GENERATE_DB_SCRIPT_Create_Table(string Table_Name)
        {
            


            Database_Script_Output_StringText += "/****** Object:  Table [dbo].[" + Table_Name + "]    Script Date: " + DateTime.Now + " ******/" + Environment.NewLine;
            Database_Script_Output_StringText += "SET ANSI_NULLS ON" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "SET QUOTED_IDENTIFIER ON" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "SET ANSI_PADDING ON" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "CREATE TABLE [dbo].[" + Table_Name + "](" + Environment.NewLine;

            Database_Script_Output_StringText += "	[" + DB_Array[0] + "] " + DB_Type_Array[0] + " IDENTITY(1,1) " + Null_Array[0] + "," + Environment.NewLine;

            for (int i = 1; i < DB_Array.Length - 1 - 1; i++)
            {
                Database_Script_Output_StringText += "	[" + DB_Array[i] + "] " + DB_Type_Array[i] + " " + Null_Array[i] + "," + Environment.NewLine;
            }
            Database_Script_Output_StringText += " CONSTRAINT [" + Table_Name + "_" + DB_Array[0] + "_pk] PRIMARY KEY CLUSTERED " + Environment.NewLine;
            Database_Script_Output_StringText += "(" + Environment.NewLine;
            Database_Script_Output_StringText += "	[" + DB_Array[0] + "] ASC" + Environment.NewLine;
            Database_Script_Output_StringText += ")WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]" + Environment.NewLine;
            Database_Script_Output_StringText += ") ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "SET ANSI_PADDING OFF" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "/*************************************************/" + Environment.NewLine;
            Database_Script_Output_StringText += "/****** FK TEMPLATE - NEEDS ACCURATE DATA - ******/" + Environment.NewLine;
            Database_Script_Output_StringText += "/*************************************************/" + Environment.NewLine;
            Database_Script_Output_StringText += "/**********    ALTER TABLE [dbo].[THIS_TABLE_NAME]  WITH CHECK ADD  CONSTRAINT [NAME_OF_CONSTRAINT] FOREIGN KEY([FK_ON_THIS_TABLE])    **********/" + Environment.NewLine;
            Database_Script_Output_StringText += "/**********    REFERENCES [dbo].[OTHER_TABLE_NAME] ([OTHER_TABLE_FK])    **********/" + Environment.NewLine;
            Database_Script_Output_StringText += "/**********    GO    **********/" + Environment.NewLine;
            Database_Script_Output_StringText += "/**********    ALTER TABLE [dbo].[THIS_TABLE_NAME] CHECK CONSTRAINT [NAME_OF_CONSTRAINT]    **********/" + Environment.NewLine;
            Database_Script_Output_StringText += "/**********    GO    **********/" + Environment.NewLine;



        }
        public void GENERATE_DB_SCRIPT_Select(string Table_Name)
        {
            

            Database_Script_Output_StringText += "/***********************************************************/" + Environment.NewLine;
            Database_Script_Output_StringText += "/*************************************************/" + Environment.NewLine;
            Database_Script_Output_StringText += "/****** - SELECT STORED PROCEDURE -  ******/" + Environment.NewLine;
            Database_Script_Output_StringText += "/*************************************************/" + Environment.NewLine;
            Database_Script_Output_StringText += "/***********************************************************/" + Environment.NewLine;
            //SELECT
            Database_Script_Output_StringText += "/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_" + Table_Name.ToUpper() + "]    Script Date: " + DateTime.Now + " ******/" + Environment.NewLine;
            Database_Script_Output_StringText += "IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_" + Table_Name.ToUpper() + "]') AND type in (N'P', N'PC'))" + Environment.NewLine;
            Database_Script_Output_StringText += "DROP PROCEDURE [dbo].[SP_DMCS_SELECT_" + Table_Name.ToUpper() + "]" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "SET ANSI_NULLS ON" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "SET QUOTED_IDENTIFIER ON" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_" + Table_Name.ToUpper() + "]" + Environment.NewLine;
            Database_Script_Output_StringText += "           @" + DB_Array[0] + " as " + DB_Type_Array[0] + Environment.NewLine;
            Database_Script_Output_StringText += "AS" + Environment.NewLine;
            Database_Script_Output_StringText += "BEGIN" + Environment.NewLine;
            Database_Script_Output_StringText += "	-- SET NOCOUNT ON added to prevent extra result sets from" + Environment.NewLine;
            Database_Script_Output_StringText += "	-- interfering with SELECT statements." + Environment.NewLine;
            Database_Script_Output_StringText += "	SET NOCOUNT ON;" + Environment.NewLine;
            Database_Script_Output_StringText += "SELECT [" + DB_Array[0] + "]" + Environment.NewLine;

            for (int i = 1; i < DB_Array.Length - 1; i++)
            {
                Database_Script_Output_StringText += "      ,[" + DB_Array[i] + "]" + Environment.NewLine;
            }
            Database_Script_Output_StringText += "  FROM [dbo].[" + Table_Name + "]" + Environment.NewLine;
            Database_Script_Output_StringText += " WHERE " + DB_Array[0] + " = @" + DB_Array[0] + Environment.NewLine;
            Database_Script_Output_StringText += "End" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;

        }
        public void GENERATE_DB_SCRIPT_Insert(string Table_Name)
        {
            


            Database_Script_Output_StringText += "/***********************************************************/" + Environment.NewLine;
            Database_Script_Output_StringText += "/*************************************************/" + Environment.NewLine;
            Database_Script_Output_StringText += "/****** - INSERT STORED PROCEDURE -  ******/" + Environment.NewLine;
            Database_Script_Output_StringText += "/*************************************************/" + Environment.NewLine;
            Database_Script_Output_StringText += "/***********************************************************/" + Environment.NewLine;
            //INSERT
            Database_Script_Output_StringText += "/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_" + Table_Name.ToUpper() + "]    Script Date: " + DateTime.Now + " ******/" + Environment.NewLine;
            Database_Script_Output_StringText += "IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_" + Table_Name.ToUpper() + "]') AND type in (N'P', N'PC'))" + Environment.NewLine;
            Database_Script_Output_StringText += "DROP PROCEDURE [dbo].[SP_DMCS_INSERT_" + Table_Name.ToUpper() + "]" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "SET ANSI_NULLS ON" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "SET QUOTED_IDENTIFIER ON" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_" + Table_Name.ToUpper() + "]" + Environment.NewLine;
            for (int i = 1; i < DB_Array.Length - 1; i++)
            {
                script_generator script_generator = new script_generator();
                script_generator = script_generator.Select(Table_Name, DB_Array[i]);
                //check for percisionable value
                if (script_generator.result == 0 || DB_Type_Array[i] == "text" || DB_Type_Array[i] == "geography" || DB_Type_Array[i] == "image")
                {
                    if (i == DB_Array.Length - 2)
                    {
                        Database_Script_Output_StringText += "	  @" + DB_Array[i] + " as " + DB_Type_Array[i] + Environment.NewLine;
                    }
                    else
                    {
                        Database_Script_Output_StringText += "	  @" + DB_Array[i] + " as " + DB_Type_Array[i] + "," + Environment.NewLine;
                    }
                }
                //check for MAX
                else if (script_generator.result == -1)
                {
                    if (i == DB_Array.Length - 2)
                    {
                        Database_Script_Output_StringText += "	  @" + DB_Array[i] + " as " + DB_Type_Array[i] + "(MAX)" + Environment.NewLine;
                    }
                    else
                    {
                        Database_Script_Output_StringText += "	  @" + DB_Array[i] + " as " + DB_Type_Array[i] + "(MAX)," + Environment.NewLine;
                    }
                }
                //All others
                else
                {
                    if (i == DB_Array.Length - 2)
                    {
                        Database_Script_Output_StringText += "	  @" + DB_Array[i] + " as " + DB_Type_Array[i] + "(" + script_generator.result + ")" + Environment.NewLine;
                    }
                    else
                    {
                        Database_Script_Output_StringText += "	  @" + DB_Array[i] + " as " + DB_Type_Array[i] + "(" + script_generator.result + ")," + Environment.NewLine;
                    }
                }
            }
            Database_Script_Output_StringText += "AS" + Environment.NewLine;
            Database_Script_Output_StringText += "BEGIN" + Environment.NewLine;
            Database_Script_Output_StringText += "	-- SET NOCOUNT ON added to prevent extra result sets from" + Environment.NewLine;
            Database_Script_Output_StringText += "	-- interfering with SELECT statements." + Environment.NewLine;
            Database_Script_Output_StringText += "	SET NOCOUNT ON;" + Environment.NewLine;
            for (int i = 1; i < DB_Array.Length - 1; i++)
            {
                if (DB_Type_Array[i] == "varchar")
                {
                    Database_Script_Output_StringText += "	  IF @" + DB_Array[i] + " = ''" + Environment.NewLine;
                    Database_Script_Output_StringText += "    BEGIN" + Environment.NewLine;
                    Database_Script_Output_StringText += "    SET @" + DB_Array[i] + " = null" + Environment.NewLine;
                    Database_Script_Output_StringText += "    END" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "text" || DB_Type_Array[i] == "geography" || DB_Type_Array[i] == "image")
                {
                }
                else
                {
                    Database_Script_Output_StringText += "	  IF @" + DB_Array[i] + " = 0" + Environment.NewLine;
                    Database_Script_Output_StringText += "    BEGIN" + Environment.NewLine;
                    Database_Script_Output_StringText += "    SET @" + DB_Array[i] + " = null" + Environment.NewLine;
                    Database_Script_Output_StringText += "    END" + Environment.NewLine;
                }
            }
            Database_Script_Output_StringText += "	Insert INTO [dbo].[" + Table_Name + "]" + Environment.NewLine;
            Database_Script_Output_StringText += "           (" + Environment.NewLine;
            for (int i = 1; i < DB_Array.Length - 1; i++)
            {
                if (i == 1)
                {
                    Database_Script_Output_StringText += "            [" + DB_Array[i] + "]" + Environment.NewLine;
                }
                else
                {
                    Database_Script_Output_StringText += "           ,[" + DB_Array[i] + "]" + Environment.NewLine;
                }
            }
            Database_Script_Output_StringText += "            )" + Environment.NewLine;
            Database_Script_Output_StringText += "     VALUES (" + Environment.NewLine;

            for (int i = 1; i < DB_Array.Length - 1; i++)
            {
                if (i == 1)
                {
                    Database_Script_Output_StringText += "            @" + DB_Array[i] + Environment.NewLine;
                }
                else
                {
                    Database_Script_Output_StringText += "           ,@" + DB_Array[i] + Environment.NewLine;
                }
            }
            Database_Script_Output_StringText += "            )" + Environment.NewLine;
            Database_Script_Output_StringText += "END" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;

        }
        public void GENERATE_DB_SCRIPT_Update(string Table_Name)
        {
            


            Database_Script_Output_StringText += "/***********************************************************/" + Environment.NewLine;
            Database_Script_Output_StringText += "/*************************************************/" + Environment.NewLine;
            Database_Script_Output_StringText += "/****** - UPDATE STORED PROCEDURE -  ******/" + Environment.NewLine;
            Database_Script_Output_StringText += "/*************************************************/" + Environment.NewLine;
            Database_Script_Output_StringText += "/***********************************************************/" + Environment.NewLine;
            //UPDATE

            Database_Script_Output_StringText += "/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_" + Table_Name.ToUpper() + "]    Script Date: " + DateTime.Now + " ******/" + Environment.NewLine;
            Database_Script_Output_StringText += "IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_" + Table_Name.ToUpper() + "]') AND type in (N'P', N'PC'))" + Environment.NewLine;
            Database_Script_Output_StringText += "DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_" + Table_Name.ToUpper() + "]" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "SET ANSI_NULLS ON" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "SET QUOTED_IDENTIFIER ON" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_" + Table_Name.ToUpper() + "]" + Environment.NewLine;

            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                script_generator script_generator = new script_generator();
                script_generator = script_generator.Select(Table_Name, DB_Array[i]);
                //check for percisionable value
                if (script_generator.result == 0 || DB_Type_Array[i] == "text" || DB_Type_Array[i] == "geography" || DB_Type_Array[i] == "image")
                {
                    if (i == DB_Array.Length - 2)
                    {
                        Database_Script_Output_StringText += "	  @" + DB_Array[i] + " as " + DB_Type_Array[i] + Environment.NewLine;
                    }
                    else
                    {
                        Database_Script_Output_StringText += "	  @" + DB_Array[i] + " as " + DB_Type_Array[i] + "," + Environment.NewLine;
                    }
                }
                //check for MAX
                else if (script_generator.result == -1)
                {
                    if (i == DB_Array.Length - 2)
                    {
                        Database_Script_Output_StringText += "	  @" + DB_Array[i] + " as " + DB_Type_Array[i] + "(MAX)" + Environment.NewLine;
                    }
                    else
                    {
                        Database_Script_Output_StringText += "	  @" + DB_Array[i] + " as " + DB_Type_Array[i] + "(MAX)," + Environment.NewLine;
                    }
                }
                //All others
                else
                {
                    if (i == DB_Array.Length - 2)
                    {
                        Database_Script_Output_StringText += "	  @" + DB_Array[i] + " as " + DB_Type_Array[i] + "(" + script_generator.result + ")" + Environment.NewLine;
                    }
                    else
                    {
                        Database_Script_Output_StringText += "	  @" + DB_Array[i] + " as " + DB_Type_Array[i] + "(" + script_generator.result + ")," + Environment.NewLine;
                    }
                }
            }

            Database_Script_Output_StringText += "AS" + Environment.NewLine;
            Database_Script_Output_StringText += "BEGIN" + Environment.NewLine;
            Database_Script_Output_StringText += "	-- SET NOCOUNT ON added to prevent extra result sets from" + Environment.NewLine;
            Database_Script_Output_StringText += "	-- interfering with SELECT statements." + Environment.NewLine;
            Database_Script_Output_StringText += "	SET NOCOUNT ON;" + Environment.NewLine;
            for (int i = 1; i < DB_Array.Length - 1; i++)
            {
                if (DB_Type_Array[i] == "varchar")
                {
                    Database_Script_Output_StringText += "	  IF @" + DB_Array[i] + " = ''" + Environment.NewLine;
                    Database_Script_Output_StringText += "    BEGIN" + Environment.NewLine;
                    Database_Script_Output_StringText += "    SET @" + DB_Array[i] + " = null" + Environment.NewLine;
                    Database_Script_Output_StringText += "    END" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "text" || DB_Type_Array[i] == "geography" || DB_Type_Array[i] == "image")
                {
                }
                else
                {
                    Database_Script_Output_StringText += "	  IF @" + DB_Array[i] + " = 0" + Environment.NewLine;
                    Database_Script_Output_StringText += "    BEGIN" + Environment.NewLine;
                    Database_Script_Output_StringText += "    SET @" + DB_Array[i] + " = null" + Environment.NewLine;
                    Database_Script_Output_StringText += "    END" + Environment.NewLine;
                }
            }
            Database_Script_Output_StringText += "	UPDATE [dbo].[" + Table_Name + "]" + Environment.NewLine;
            Database_Script_Output_StringText += "       SET" + Environment.NewLine;

            for (int i = 1; i < DB_Array.Length - 1; i++)
            {
                if (i == DB_Array.Length - 1 - 1)
                {
                    Database_Script_Output_StringText += "		   [" + DB_Array[i] + "] = @" + DB_Array[i] + Environment.NewLine;
                }
                else
                {
                    Database_Script_Output_StringText += "		   [" + DB_Array[i] + "] = @" + DB_Array[i] + "," + Environment.NewLine;
                }
            }


            Database_Script_Output_StringText += "       WHERE " + DB_Array[0] + " = @" + DB_Array[0] + Environment.NewLine;
            Database_Script_Output_StringText += "END" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;

        }
        public void GENERATE_DB_SCRIPT_Delete(string Table_Name)
        {
            




            Database_Script_Output_StringText += "/***********************************************************/" + Environment.NewLine;
            Database_Script_Output_StringText += "/*************************************************/" + Environment.NewLine;
            Database_Script_Output_StringText += "/****** - DELETE STORED PROCEDURE -  ******/" + Environment.NewLine;
            Database_Script_Output_StringText += "/*************************************************/" + Environment.NewLine;
            Database_Script_Output_StringText += "/***********************************************************/" + Environment.NewLine;
            //DELETE

            Database_Script_Output_StringText += "/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_" + Table_Name.ToUpper() + "]    Script Date: " + DateTime.Now + " ******/" + Environment.NewLine;
            Database_Script_Output_StringText += "IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_" + Table_Name.ToUpper() + "]') AND type in (N'P', N'PC'))" + Environment.NewLine;
            Database_Script_Output_StringText += "DROP PROCEDURE [dbo].[SP_DMCS_DELETE_" + Table_Name.ToUpper() + "]" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "SET ANSI_NULLS ON" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "SET QUOTED_IDENTIFIER ON" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_" + Table_Name.ToUpper() + "]" + Environment.NewLine;
            Database_Script_Output_StringText += "	@" + DB_Array[0] + " " + DB_Type_Array[0] + Environment.NewLine;
            Database_Script_Output_StringText += "AS" + Environment.NewLine;
            Database_Script_Output_StringText += "BEGIN" + Environment.NewLine;
            Database_Script_Output_StringText += "	-- SET NOCOUNT ON added to prevent extra result sets from" + Environment.NewLine;
            Database_Script_Output_StringText += "	-- interfering with SELECT statements." + Environment.NewLine;
            Database_Script_Output_StringText += "	SET NOCOUNT ON;" + Environment.NewLine;
            Database_Script_Output_StringText += "	Delete dbo." + Table_Name + Environment.NewLine;
            Database_Script_Output_StringText += "	where " + DB_Array[0] + " = @" + DB_Array[0] + Environment.NewLine;
            Database_Script_Output_StringText += "END" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;

        }
        public void GENERATE_DB_SCRIPT_GET(string Table_Name)
        {
            



            //GET SP
            Database_Script_Output_StringText += "/***********************************************************/" + Environment.NewLine;
            Database_Script_Output_StringText += "/*************************************************/" + Environment.NewLine;
            Database_Script_Output_StringText += "/****** - GET STORED PROCEDURE -  ******/" + Environment.NewLine;
            Database_Script_Output_StringText += "/*************************************************/" + Environment.NewLine;
            Database_Script_Output_StringText += "/***********************************************************/" + Environment.NewLine;

            Database_Script_Output_StringText += "/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_" + Table_Name.ToUpper() + "]    Script Date: " + DateTime.Now + " ******/" + Environment.NewLine;
            Database_Script_Output_StringText += "IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_" + Table_Name.ToUpper() + "]') AND type in (N'P', N'PC'))" + Environment.NewLine;
            Database_Script_Output_StringText += "DROP PROCEDURE [dbo].[SP_DMCS_GET_" + Table_Name.ToUpper() + "]" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "SET ANSI_NULLS ON" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "SET QUOTED_IDENTIFIER ON" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "CREATE PROCEDURE [dbo].[SP_DMCS_GET_" + Table_Name.ToUpper() + "]" + Environment.NewLine;
            for (int i = 1; i < DB_Array.Length - 1; i++)
            {
                script_generator script_generator = new script_generator();
                script_generator = script_generator.Select(Table_Name, DB_Array[i]);
                //check for percisionable value
                if (script_generator.result == 0 || DB_Type_Array[i] == "text" || DB_Type_Array[i] == "geography" || DB_Type_Array[i] == "image")
                {
                    if (i == DB_Array.Length - 2)
                    {
                        Database_Script_Output_StringText += "	  @" + DB_Array[i] + " as " + DB_Type_Array[i] + Environment.NewLine;
                    }
                    else
                    {
                        Database_Script_Output_StringText += "	  @" + DB_Array[i] + " as " + DB_Type_Array[i] + "," + Environment.NewLine;
                    }
                }
                //check for MAX
                else if (script_generator.result == -1)
                {
                    if (i == DB_Array.Length - 2)
                    {
                        Database_Script_Output_StringText += "	  @" + DB_Array[i] + " as " + DB_Type_Array[i] + "(MAX)" + Environment.NewLine;
                    }
                    else
                    {
                        Database_Script_Output_StringText += "	  @" + DB_Array[i] + " as " + DB_Type_Array[i] + "(MAX)," + Environment.NewLine;
                    }
                }
                //All others
                else
                {
                    if (i == DB_Array.Length - 2)
                    {
                        Database_Script_Output_StringText += "	  @" + DB_Array[i] + " as " + DB_Type_Array[i] + "(" + script_generator.result + ")" + Environment.NewLine;
                    }
                    else
                    {
                        Database_Script_Output_StringText += "	  @" + DB_Array[i] + " as " + DB_Type_Array[i] + "(" + script_generator.result + ")," + Environment.NewLine;
                    }
                }
            }
            Database_Script_Output_StringText += "AS" + Environment.NewLine;
            Database_Script_Output_StringText += "BEGIN" + Environment.NewLine;
            Database_Script_Output_StringText += "	-- SET NOCOUNT ON added to prevent extra result sets from" + Environment.NewLine;
            Database_Script_Output_StringText += "	-- interfering with SELECT statements." + Environment.NewLine;
            Database_Script_Output_StringText += "	SET NOCOUNT ON;" + Environment.NewLine;
            for (int i = 1; i < DB_Array.Length - 1; i++)
            {
                if (DB_Type_Array[i] == "varchar")
                {
                    Database_Script_Output_StringText += "	  IF @" + DB_Array[i] + " = ''" + Environment.NewLine;
                    Database_Script_Output_StringText += "    BEGIN" + Environment.NewLine;
                    Database_Script_Output_StringText += "    SET @" + DB_Array[i] + " = null" + Environment.NewLine;
                    Database_Script_Output_StringText += "    END" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "text" || DB_Type_Array[i] == "geography" || DB_Type_Array[i] == "image")
                {
                }
                else
                {
                    Database_Script_Output_StringText += "	  IF @" + DB_Array[i] + " = 0" + Environment.NewLine;
                    Database_Script_Output_StringText += "    BEGIN" + Environment.NewLine;
                    Database_Script_Output_StringText += "    SET @" + DB_Array[i] + " = null" + Environment.NewLine;
                    Database_Script_Output_StringText += "    END" + Environment.NewLine;
                }
            }
            Database_Script_Output_StringText += "    SELECT [" + DB_Array[0] + "] " + Environment.NewLine;
            Database_Script_Output_StringText += "      FROM [dbo].[" + Table_Name + "] " + Environment.NewLine;
            for (int i = 1; i < DB_Array.Length - 1; i++)
            {
                String Equal_Sign;
                if (DB_Type_Array[i] == "varchar" || DB_Type_Array[i] == "text")
                { Equal_Sign = "like"; }
                else { Equal_Sign = "="; }
                if (i == 1)
                {
                    Database_Script_Output_StringText += "     WHERE [" + DB_Array[i] + "] " + Equal_Sign + " @" + DB_Array[i] + Environment.NewLine;
                }
                else
                {
                    if (DB_Type_Array[i] != "geography" && DB_Type_Array[i] != "image")
                    {
                        Database_Script_Output_StringText += "       AND [" + DB_Array[i] + "] " + Equal_Sign + " @" + DB_Array[i] + Environment.NewLine;
                    }
                }
            }

            Database_Script_Output_StringText += "END" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;







        }
        public void GENERATE_DB_SCRIPT_WC(string Table_Name)
        {

            



            //Select_WC
            Database_Script_Output_StringText += "/***********************************************************/" + Environment.NewLine;
            Database_Script_Output_StringText += "/*************************************************/" + Environment.NewLine;
            Database_Script_Output_StringText += "/****** - WHERE CLAUSE STORED PROCEDURE -  ******/" + Environment.NewLine;
            Database_Script_Output_StringText += "/*************************************************/" + Environment.NewLine;
            Database_Script_Output_StringText += "/***********************************************************/" + Environment.NewLine;

            Database_Script_Output_StringText += "/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_" + Table_Name.ToUpper() + "_WC]    Script Date: " + DateTime.Now + " ******/" + Environment.NewLine;
            Database_Script_Output_StringText += "IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_" + Table_Name.ToUpper() + "_WC]') AND type in (N'P', N'PC'))" + Environment.NewLine;
            Database_Script_Output_StringText += "DROP PROCEDURE [dbo].[SP_DMCS_SELECT_" + Table_Name.ToUpper() + "_WC]" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "SET ANSI_NULLS ON" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "SET QUOTED_IDENTIFIER ON" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_" + Table_Name.ToUpper() + "_WC]" + Environment.NewLine;
            Database_Script_Output_StringText += "	  @wareclause as varchar(MAX)" + Environment.NewLine;
            Database_Script_Output_StringText += "AS" + Environment.NewLine;
            Database_Script_Output_StringText += "Begin" + Environment.NewLine;
            Database_Script_Output_StringText += "    Declare @string as varchar(MAX)" + Environment.NewLine;
            Database_Script_Output_StringText += "	Set @string = 'Select * from " + Table_Name + " where ' + @wareclause" + Environment.NewLine;
            Database_Script_Output_StringText += "	Exec(@string)" + Environment.NewLine;
            Database_Script_Output_StringText += "END" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "" + Environment.NewLine;


            Database_Script_Output_StringText += "/****** - Thank you Jim. You are SooOOoo Awesome! -  ******/" + Environment.NewLine;

        }




        public void GENERATE_OBJECT_Get_Set(string Table_Name)
        {
            



            Object_Output_StringText += "using System;" + Environment.NewLine;
            Object_Output_StringText += "using System.IO;" + Environment.NewLine;
            Object_Output_StringText += "using System.Data;" + Environment.NewLine;
            Object_Output_StringText += "using System.Collections.Generic;" + Environment.NewLine;
            Object_Output_StringText += "using System.Text;" + Environment.NewLine;
            Object_Output_StringText += "using System.Data.SqlClient;" + Environment.NewLine;
            Object_Output_StringText += "using DMCS;" + Environment.NewLine;

            Object_Output_StringText += "namespace DMCS" + Environment.NewLine;
            Object_Output_StringText += "{" + Environment.NewLine;
            Object_Output_StringText += "public class " + Table_Name + Environment.NewLine;
            Object_Output_StringText += "{" + Environment.NewLine;

            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                Object_Output_StringText += "    public " + DB_Type_Array[i] + " " + DB_Array[i] + Environment.NewLine;
                Object_Output_StringText += "    {" + Environment.NewLine;
                Object_Output_StringText += "        get;" + Environment.NewLine;
                Object_Output_StringText += "        set;" + Environment.NewLine;
                Object_Output_StringText += "    }" + Environment.NewLine;
            }


            Object_Output_StringText += "" + Environment.NewLine;
            Object_Output_StringText += "" + Environment.NewLine;

            Object_Output_StringText += "    public void SetColumnDefaults()" + Environment.NewLine;
            Object_Output_StringText += "    {" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                String Cur_Type = "";
                if (DB_Type_Array[i] == "Int32") { Cur_Type = "0"; }
                if (DB_Type_Array[i] == "Double") { Cur_Type = "0.0"; }
                if (DB_Type_Array[i] == "double") { Cur_Type = "0.0"; }
                if (DB_Type_Array[i] == "String") { Cur_Type = "\" \""; }
                if (DB_Type_Array[i] == "Char") { Cur_Type = "'x'"; }
                if (DB_Type_Array[i] == "DateTime") { Cur_Type = "DateTime.Now"; }
                if (DB_Type_Array[i] == "Boolean") { Cur_Type = "false"; }
                if (DB_Type_Array[i] == "Decimal") { Cur_Type = "0"; }
                if (DB_Type_Array[i] == "byte[]") { Cur_Type = "null"; }


                Object_Output_StringText += "        " + DB_Array[i] + " = " + Cur_Type + ";" + Environment.NewLine;

            }

            Object_Output_StringText += "    }" + Environment.NewLine;


        }
        public void GENERATE_OBJECT_Select(string Table_Name)
        {
            




            //SELECT
            Object_Output_StringText += "    public " + Table_Name + " Select(int id)" + Environment.NewLine;
            Object_Output_StringText += "    {" + Environment.NewLine;
            Object_Output_StringText += "        " + Table_Name + " " + Table_Name + " = new " + Table_Name + "();" + Environment.NewLine;
            Object_Output_StringText += "        string ConnectionString = IDManager.connection();" + Environment.NewLine;
            Object_Output_StringText += "        SqlConnection con = new SqlConnection(ConnectionString);" + Environment.NewLine;
            Object_Output_StringText += "        try" + Environment.NewLine;
            Object_Output_StringText += "        {" + Environment.NewLine;
            Object_Output_StringText += "            con.Open();" + Environment.NewLine;
            Object_Output_StringText += "            SqlCommand cmd = new SqlCommand(\"SP_DMCS_SELECT_" + Table_Name.ToUpper() + "\", con);" + Environment.NewLine;
            Object_Output_StringText += "            cmd.CommandType = System.Data.CommandType.StoredProcedure;" + Environment.NewLine;
            Object_Output_StringText += "            cmd.Parameters.AddWithValue(\"" + "@" + DB_Array[0] + "\", id);" + Environment.NewLine;
            Object_Output_StringText += "            SqlDataReader rdr = cmd.ExecuteReader();" + Environment.NewLine;
            Object_Output_StringText += "            if (rdr.HasRows)" + Environment.NewLine;
            Object_Output_StringText += "            {" + Environment.NewLine;
            Object_Output_StringText += "                rdr.Read();" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                String Cur_Type = "";
                if (DB_Type_Array[i] == "Int32") { Cur_Type = "rdr.GetInt32(" + i + ");"; }
                if (DB_Type_Array[i] == "Double") { Cur_Type = "rdr.GetDouble(" + i + ");"; }
                if (DB_Type_Array[i] == "double") { Cur_Type = "rdr.GetDouble(" + i + ");"; }
                if (DB_Type_Array[i] == "String") { Cur_Type = "rdr.GetString(" + i + ");"; }
                if (DB_Type_Array[i] == "Char") { Cur_Type = "rdr.GetChar(" + i + ");"; }
                if (DB_Type_Array[i] == "DateTime") { Cur_Type = "rdr.GetDateTime(" + i + ");"; }
                if (DB_Type_Array[i] == "Boolean") { Cur_Type = "rdr.GetBoolean(" + i + ");"; }
                if (DB_Type_Array[i] == "Decimal") { Cur_Type = "rdr.GetDecimal(" + i + ");"; }
                if (DB_Type_Array[i] == "byte[]") { Cur_Type = "(byte[])rdr[\"" + DB_Array[i] + "\"];"; }

                Object_Output_StringText += "                if (!rdr.IsDBNull(" + i + "))" + Environment.NewLine;
                Object_Output_StringText += "                {" + Environment.NewLine;
                Object_Output_StringText += "                    " + Table_Name + "." + DB_Array[i] + " = " + Cur_Type + Environment.NewLine;
                Object_Output_StringText += "                }" + Environment.NewLine;

                Cur_Type = "";
                if (DB_Type_Array[i] == "Int32") { Cur_Type = "0"; }
                if (DB_Type_Array[i] == "Double") { Cur_Type = "0.0"; }
                if (DB_Type_Array[i] == "double") { Cur_Type = "0.0"; }
                if (DB_Type_Array[i] == "String") { Cur_Type = "\" \""; }
                if (DB_Type_Array[i] == "Char") { Cur_Type = "'x'"; }
                if (DB_Type_Array[i] == "DateTime") { Cur_Type = "DateTime.Now"; }
                if (DB_Type_Array[i] == "Boolean") { Cur_Type = "false"; }
                if (DB_Type_Array[i] == "Decimal") { Cur_Type = "0"; }
                if (DB_Type_Array[i] == "byte[]") { Cur_Type = "null"; }

                Object_Output_StringText += "                else" + Environment.NewLine;
                Object_Output_StringText += "                {" + Environment.NewLine;
                Object_Output_StringText += "                    " + Table_Name + "." + DB_Array[i] + " = " + Cur_Type + ";" + Environment.NewLine;
                Object_Output_StringText += "                }" + Environment.NewLine;
            }
            Object_Output_StringText += "                }" + Environment.NewLine;
            Object_Output_StringText += "                else" + Environment.NewLine;
            Object_Output_StringText += "                {" + Environment.NewLine;
            Object_Output_StringText += "                    " + Table_Name + ".SetColumnDefaults();" + Environment.NewLine;
            Object_Output_StringText += "                }" + Environment.NewLine;
            Object_Output_StringText += "            }" + Environment.NewLine;
            Object_Output_StringText += "            catch (Exception ex)" + Environment.NewLine;
            Object_Output_StringText += "            {" + Environment.NewLine;
            Object_Output_StringText += "            " + Table_Name + ".SetColumnDefaults();" + Environment.NewLine;
            Object_Output_StringText += "            return " + Table_Name + ";" + Environment.NewLine;
            Object_Output_StringText += "            }" + Environment.NewLine;
            Object_Output_StringText += "        finally" + Environment.NewLine;
            Object_Output_StringText += "        {" + Environment.NewLine;
            Object_Output_StringText += "            con.Close();" + Environment.NewLine;
            Object_Output_StringText += "        }" + Environment.NewLine;
            Object_Output_StringText += "        return " + Table_Name + ";" + Environment.NewLine;
            Object_Output_StringText += "    }" + Environment.NewLine;
            Object_Output_StringText += "" + Environment.NewLine;

        }
        public void GENERATE_OBJECT_Insert(string Table_Name)
        {
            

            //INSERT
            Object_Output_StringText += "    public " + Table_Name + " Insert(" + Table_Name + " id)" + Environment.NewLine;
            Object_Output_StringText += "    {" + Environment.NewLine;
            Object_Output_StringText += "        string ConnectionString = IDManager.connection();" + Environment.NewLine;
            Object_Output_StringText += "        SqlConnection con = new SqlConnection(ConnectionString);" + Environment.NewLine;
            Object_Output_StringText += "        try" + Environment.NewLine;
            Object_Output_StringText += "        {" + Environment.NewLine;
            Object_Output_StringText += "            con.Open();" + Environment.NewLine;
            Object_Output_StringText += "            SqlCommand cmd = new SqlCommand(\"SP_DMCS_Insert_" + Table_Name + "\", con);" + Environment.NewLine;
            Object_Output_StringText += "            cmd.CommandType = System.Data.CommandType.StoredProcedure;" + Environment.NewLine;
            for (int i = 1; i < DB_Array.Length - 1; i++)
            {
                Object_Output_StringText += "            cmd.Parameters.AddWithValue(\"" + "@" + DB_Array[i] + "\", id." + DB_Array[i] + ");" + Environment.NewLine;
            }
            Object_Output_StringText += "            cmd.ExecuteReader();" + Environment.NewLine;

            Object_Output_StringText += "            con.Close();" + Environment.NewLine;
            Object_Output_StringText += "            con.Open();" + Environment.NewLine;
            Object_Output_StringText += "            cmd = new SqlCommand(\"SP_DMCS_GET_" + Table_Name.ToUpper() + "\", con);" + Environment.NewLine;
            Object_Output_StringText += "            cmd.CommandType = System.Data.CommandType.StoredProcedure;" + Environment.NewLine;
            for (int i = 1; i < DB_Array.Length - 1; i++)
            {
                Object_Output_StringText += "            cmd.Parameters.AddWithValue(\"" + "@" + DB_Array[i] + "\", id." + DB_Array[i] + ");" + Environment.NewLine;
            }
            Object_Output_StringText += "            SqlDataReader rdr = cmd.ExecuteReader();" + Environment.NewLine;

            Object_Output_StringText += "            if (rdr.HasRows)" + Environment.NewLine;
            Object_Output_StringText += "            {" + Environment.NewLine;
            Object_Output_StringText += "                rdr.Read();" + Environment.NewLine;
            Object_Output_StringText += "                id." + DB_Array[0] + " = rdr.GetInt32(0);" + Environment.NewLine;
            Object_Output_StringText += "            }" + Environment.NewLine;
            Object_Output_StringText += "        }" + Environment.NewLine;
            Object_Output_StringText += "        catch (Exception ex)" + Environment.NewLine;
            Object_Output_StringText += "        {" + Environment.NewLine;
            Object_Output_StringText += "            id.SetColumnDefaults();" + Environment.NewLine;
            Object_Output_StringText += "        }" + Environment.NewLine;
            Object_Output_StringText += "        finally" + Environment.NewLine;
            Object_Output_StringText += "        {" + Environment.NewLine;
            Object_Output_StringText += "            con.Close();" + Environment.NewLine;
            Object_Output_StringText += "        }" + Environment.NewLine;
            Object_Output_StringText += "        return id;" + Environment.NewLine;
            Object_Output_StringText += "    }" + Environment.NewLine;



        }
        public void GENERATE_OBJECT_Update(string Table_Name)
        {
            

            //UPDATE
            Object_Output_StringText += "    public Boolean Update(" + Table_Name + " id)" + Environment.NewLine;
            Object_Output_StringText += "    {" + Environment.NewLine;
            Object_Output_StringText += "        string ConnectionString = IDManager.connection();" + Environment.NewLine;
            Object_Output_StringText += "        SqlConnection con = new SqlConnection(ConnectionString);" + Environment.NewLine;
            Object_Output_StringText += "        try" + Environment.NewLine;
            Object_Output_StringText += "        {" + Environment.NewLine;
            Object_Output_StringText += "            con.Open();" + Environment.NewLine;
            Object_Output_StringText += "            SqlCommand cmd = new SqlCommand(\"SP_DMCS_UPDATE_" + Table_Name.ToUpper() + "\", con);" + Environment.NewLine;
            Object_Output_StringText += "            cmd.CommandType = System.Data.CommandType.StoredProcedure;" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                Object_Output_StringText += "            cmd.Parameters.AddWithValue(\"" + "@" + DB_Array[i] + "\", id." + DB_Array[i] + ");" + Environment.NewLine;
            }
            Object_Output_StringText += "            cmd.ExecuteReader();" + Environment.NewLine;
            Object_Output_StringText += "            con.Close();" + Environment.NewLine;
            Object_Output_StringText += "            return true;" + Environment.NewLine;
            Object_Output_StringText += "        }" + Environment.NewLine;
            Object_Output_StringText += "        catch (Exception ex)" + Environment.NewLine;
            Object_Output_StringText += "        {" + Environment.NewLine;
            Object_Output_StringText += "            return false;" + Environment.NewLine;
            Object_Output_StringText += "        }" + Environment.NewLine;
            Object_Output_StringText += "        finally" + Environment.NewLine;
            Object_Output_StringText += "        {" + Environment.NewLine;
            Object_Output_StringText += "            con.Close();" + Environment.NewLine;
            Object_Output_StringText += "        }" + Environment.NewLine;
            Object_Output_StringText += "    }" + Environment.NewLine;

        }
        public void GENERATE_OBJECT_Delete(string Table_Name)
        {
            

            //DELETE
            Object_Output_StringText += "    public Boolean Delete(int id)" + Environment.NewLine;
            Object_Output_StringText += "    {" + Environment.NewLine;
            Object_Output_StringText += "        string ConnectionString = IDManager.connection();" + Environment.NewLine;
            Object_Output_StringText += "        SqlConnection con = new SqlConnection(ConnectionString);" + Environment.NewLine;
            Object_Output_StringText += "        try" + Environment.NewLine;
            Object_Output_StringText += "        {" + Environment.NewLine;
            Object_Output_StringText += "            con.Open();" + Environment.NewLine;
            Object_Output_StringText += "            SqlCommand cmd = new SqlCommand(\"SP_DMCS_DELETE_" + Table_Name.ToUpper() + "\", con);" + Environment.NewLine;
            Object_Output_StringText += "            cmd.CommandType = System.Data.CommandType.StoredProcedure;" + Environment.NewLine;
            Object_Output_StringText += "            cmd.Parameters.AddWithValue(\"" + "@" + DB_Array[0] + "\", id);" + Environment.NewLine;
            Object_Output_StringText += "            cmd.ExecuteReader();" + Environment.NewLine;
            Object_Output_StringText += "            con.Close();" + Environment.NewLine;
            Object_Output_StringText += "            return true;" + Environment.NewLine;
            Object_Output_StringText += "        }" + Environment.NewLine;
            Object_Output_StringText += "        catch (Exception ex)" + Environment.NewLine;
            Object_Output_StringText += "        {" + Environment.NewLine;
            Object_Output_StringText += "            return false;" + Environment.NewLine;
            Object_Output_StringText += "        }" + Environment.NewLine;
            Object_Output_StringText += "        finally" + Environment.NewLine;
            Object_Output_StringText += "        {" + Environment.NewLine;
            Object_Output_StringText += "            con.Close();" + Environment.NewLine;
            Object_Output_StringText += "        }" + Environment.NewLine;
            Object_Output_StringText += "    }" + Environment.NewLine;
            Object_Output_StringText += "" + Environment.NewLine;
        }
        public void GENERATE_OBJECT_WC(string Table_Name)
        {
            

            //Select_WC
            Object_Output_StringText += "    public DataTable Select(string whereclause)" + Environment.NewLine;
            Object_Output_StringText += "    {" + Environment.NewLine;
            Object_Output_StringText += "        DataTable alrows = new DataTable();" + Environment.NewLine;
            Object_Output_StringText += "        string ConnectionString = IDManager.connection();" + Environment.NewLine;
            Object_Output_StringText += "        SqlConnection con = new SqlConnection(ConnectionString);" + Environment.NewLine;
            Object_Output_StringText += "        try" + Environment.NewLine;
            Object_Output_StringText += "        {" + Environment.NewLine;
            Object_Output_StringText += "            con.Open();" + Environment.NewLine;
            Object_Output_StringText += "            SqlCommand cmd = new SqlCommand(\"SP_DMCS_SELECT" + Table_Name.ToUpper() + "_WC\", con);" + Environment.NewLine;
            Object_Output_StringText += "            cmd.CommandType = System.Data.CommandType.StoredProcedure;" + Environment.NewLine;
            Object_Output_StringText += "            cmd.Parameters.AddWithValue(\"" + "@wareclause" + "\", whereclause);" + Environment.NewLine;
            Object_Output_StringText += "            SqlDataReader rdr = cmd.ExecuteReader();" + Environment.NewLine;
            Object_Output_StringText += "            alrows.Load(rdr);" + Environment.NewLine;
            Object_Output_StringText += "            return alrows;" + Environment.NewLine;
            Object_Output_StringText += "        }" + Environment.NewLine;
            Object_Output_StringText += "        catch (Exception ex)" + Environment.NewLine;
            Object_Output_StringText += "        {" + Environment.NewLine;
            Object_Output_StringText += "            return alrows;" + Environment.NewLine;
            Object_Output_StringText += "        }" + Environment.NewLine;
            Object_Output_StringText += "        finally" + Environment.NewLine;
            Object_Output_StringText += "        {" + Environment.NewLine;
            Object_Output_StringText += "            con.Close();" + Environment.NewLine;
            Object_Output_StringText += "        }" + Environment.NewLine;
            Object_Output_StringText += "    }" + Environment.NewLine;
            Object_Output_StringText += "}" + Environment.NewLine;
            Object_Output_StringText += "" + Environment.NewLine;
            Object_Output_StringText += "}" + Environment.NewLine;
            Object_Output_StringText += "" + Environment.NewLine;
            Object_Output_StringText += "" + Environment.NewLine;
            Object_Output_StringText += "" + Environment.NewLine;




        }



        public void GENERATE_SCREEN_Select(string Table_Name)
        {
            

            //SELECT  

            Select_Screen_Output_StringText += "<%@ Page Title=\"\" Language=\"C#\" MasterPageFile=\"~/Site.Master\" AutoEventWireup=\"true\" CodeBehind=\"" + Table_Name + "_Select.aspx.cs\" Inherits=\"DMCS." + Table_Name + "_Select\" %>" + Environment.NewLine;
            Select_Screen_Output_StringText += "<asp:Content ID=\"Content1\" ContentPlaceHolderID=\"HeadContent\" runat=\"server\">" + Environment.NewLine;
            Select_Screen_Output_StringText += "</asp:Content>" + Environment.NewLine;
            Select_Screen_Output_StringText += "<asp:Content ID=\"Content2\" ContentPlaceHolderID=\"FeaturedContent\" runat=\"server\">" + Environment.NewLine;
            Select_Screen_Output_StringText += "</asp:Content>" + Environment.NewLine;
            Select_Screen_Output_StringText += "<asp:Content ID=\"Content3\" ContentPlaceHolderID=\"MainContent\" runat=\"server\">" + Environment.NewLine;
            Select_Screen_Output_StringText += "    <!DOCTYPE html>" + Environment.NewLine;
            Select_Screen_Output_StringText += "    <html>" + Environment.NewLine;
            Select_Screen_Output_StringText += "    <head>" + Environment.NewLine;
            Select_Screen_Output_StringText += "        <meta name=\"viewport\" content=\"initial-scale=1.0, user-scalable=no\">" + Environment.NewLine;
            Select_Screen_Output_StringText += "        <meta charset=\"utf-8\">" + Environment.NewLine;
            Select_Screen_Output_StringText += "        <title>TITLE NAME</title>" + Environment.NewLine;
            Select_Screen_Output_StringText += "    </head>" + Environment.NewLine;
            Select_Screen_Output_StringText += "    <body>" + Environment.NewLine;
            Select_Screen_Output_StringText += "        <table width=\"100%\" bgcolor=\"Silver\" border=\"3\">" + Environment.NewLine;
            Select_Screen_Output_StringText += "            <tr>" + Environment.NewLine;
            Select_Screen_Output_StringText += "                <td width=\"20%\" height=\"50px\" style=\"border-style: none\" align=\"right\">" + Environment.NewLine;
            Select_Screen_Output_StringText += "                    <asp:Label ID=\"Label2\" runat=\"server\" Text=\"Select a Disaster: \" Font-Bold=\"True\" ForeColor=\"Black\"></asp:Label>" + Environment.NewLine;
            Select_Screen_Output_StringText += "                            <asp:DropDownList ID=\"ddlDisaster\" runat=\"server\"" + Environment.NewLine;
            Select_Screen_Output_StringText += "                              Height=\"24px\" Width=\"240px\"" + Environment.NewLine;
            Select_Screen_Output_StringText += "                              OnSelectedIndexChanged=\"ddlDisaster_SelectedIndexChanged\"" + Environment.NewLine;
            Select_Screen_Output_StringText += "                              AutoPostBack=\"True\" DataSourceID=\"SqlDataSource1\" DataTextField=\"disaster_name\" DataValueField=\"disaster_id\" Style=\"margin-left: 0px\" Font-Bold=\"True\">" + Environment.NewLine;
            Select_Screen_Output_StringText += "                    </asp:DropDownList>" + Environment.NewLine;
            Select_Screen_Output_StringText += "         <asp:SqlDataSource ID=\"SqlDataSource1\" runat=\"server\" ConnectionString=\"<%$ ConnectionStrings:localhost %>\" SelectCommand=\"SELECT [disaster_id], [disaster_name] FROM [disaster]\"></asp:SqlDataSource>" + Environment.NewLine;
            Select_Screen_Output_StringText += "                </td>" + Environment.NewLine;
            Select_Screen_Output_StringText += "                <td width=\"80%\" style=\"border-style: none\" align=\"Center\">" + Environment.NewLine;
            Select_Screen_Output_StringText += "                    <asp:Label ID=\"Label1\" runat=\"server\" Text=\"TEXT\" Font-Bold=\"True\" Font-Size=\"20pt\"></asp:Label>" + Environment.NewLine;
            Select_Screen_Output_StringText += "                </td>" + Environment.NewLine;
            Select_Screen_Output_StringText += "            </tr>" + Environment.NewLine;
            Select_Screen_Output_StringText += "        </table>" + Environment.NewLine;
            Select_Screen_Output_StringText += "        <table width=\"100%\" height=\"100%\" bgcolor=\"Silver\" border=\"3\">" + Environment.NewLine;
            Select_Screen_Output_StringText += "            <tr>" + Environment.NewLine;
            Select_Screen_Output_StringText += "                <td>" + Environment.NewLine;
            Select_Screen_Output_StringText += "                    <asp:GridView ID=\"GridView1\" runat=\"server\" DataSourceID=\"SqlDataSource2\" AutoGenerateColumns=\"False\" DataKeyNames=\"alert_ID\" BackColor=\"#CCCCCC\" BorderColor=\"#999999\" BorderStyle=\"Solid\" BorderWidth=\"3px\" CellPadding=\"4\" CellSpacing=\"2\" ForeColor=\"Black\" Width=\"100%\">" + Environment.NewLine;
            Select_Screen_Output_StringText += "                        <Columns>" + Environment.NewLine;
            Select_Screen_Output_StringText += "                            <asp:CommandField ShowSelectButton=\"True\"></asp:CommandField>" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                Select_Screen_Output_StringText += "                            <asp:BoundField DataField=\"" + DB_Array[i] + "\" HeaderText=\"" + DB_Array[i] + "\" InsertVisible=\"False\" ReadOnly=\"True\" SortExpression=\"" + DB_Array[i] + "\" />" + Environment.NewLine;
            }

            Select_Screen_Output_StringText += "                        </Columns>" + Environment.NewLine;
            Select_Screen_Output_StringText += "                        <FooterStyle BackColor=\"#CCCCCC\"></FooterStyle>" + Environment.NewLine;
            Select_Screen_Output_StringText += "                        <HeaderStyle BackColor=\"Black\" Font-Bold=\"True\" ForeColor=\"White\"></HeaderStyle>" + Environment.NewLine;
            Select_Screen_Output_StringText += "                        <PagerStyle HorizontalAlign=\"Left\" BackColor=\"#CCCCCC\" ForeColor=\"Black\"></PagerStyle>" + Environment.NewLine;
            Select_Screen_Output_StringText += "                        <RowStyle BackColor=\"White\"></RowStyle>" + Environment.NewLine;
            Select_Screen_Output_StringText += "                        <SelectedRowStyle BackColor=\"#000099\" Font-Bold=\"True\" ForeColor=\"White\"></SelectedRowStyle>" + Environment.NewLine;
            Select_Screen_Output_StringText += "                        <SortedAscendingCellStyle BackColor=\"#F1F1F1\"></SortedAscendingCellStyle>" + Environment.NewLine;
            Select_Screen_Output_StringText += "                        <SortedAscendingHeaderStyle BackColor=\"#808080\"></SortedAscendingHeaderStyle>" + Environment.NewLine;
            Select_Screen_Output_StringText += "                        <SortedDescendingCellStyle BackColor=\"#CAC9C9\"></SortedDescendingCellStyle>" + Environment.NewLine;
            Select_Screen_Output_StringText += "                        <SortedDescendingHeaderStyle BackColor=\"#383838\"></SortedDescendingHeaderStyle>" + Environment.NewLine;
            Select_Screen_Output_StringText += "                    </asp:GridView>" + Environment.NewLine;
            Select_Screen_Output_StringText += "                    <asp:SqlDataSource runat=\"server\" ID=\"SqlDataSource2\" ConnectionString=\"<%$ ConnectionStrings:localhost %>\" SelectCommand= \"SELECT";
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                if (i == DB_Array.Length - 1 - 1)
                {
                    Select_Screen_Output_StringText += " [" + DB_Array[i] + "]";
                }
                else
                {
                    Select_Screen_Output_StringText += " [" + DB_Array[i] + "],";
                }


            }
            Select_Screen_Output_StringText += " FROM [" + Table_Name + "]\"";
            Select_Screen_Output_StringText += "></asp:SqlDataSource>" + Environment.NewLine;

            Select_Screen_Output_StringText += "                </td>" + Environment.NewLine;
            Select_Screen_Output_StringText += "            </tr>" + Environment.NewLine;
            Select_Screen_Output_StringText += "        </table>" + Environment.NewLine;
            Select_Screen_Output_StringText += "        <table width=\"100%\" height=\"auto\" bgcolor=\"Silver\" border=\"3\">" + Environment.NewLine;
            int rowcount = 0;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                //String Cur_Element = "";
                //if (Element_Array[i] == "TextBox") { Cur_Element = "            <asp:Label ID=\"" + DB_Array[i] + "_Lable\" runat=\"server\" Text=\"" + DB_Array[i] + ":" + "\"></asp:Label><br /><asp:TextBox ID=\"" + DB_Array[i] + "_txt" + "\" runat=\"server\" Text=\"" + DB_Array[i] + "_txt" + "\"></asp:TextBox><br />"; }
                //if (Element_Array[i] == "RadioButton") { Cur_Element = "            <asp:Label ID=\"" + DB_Array[i] + "_Lable\" runat=\"server\" Text=\"" + DB_Array[i] + ":"+ "\"></asp:Label><br /><asp:RadioButton ID=\"" + DB_Array[i] + "_RadioBtn" + "\" runat=\"server\" Text=\"" + DB_Array[i] + "_RadioBtn" + "\" /><br />"; }

                if (rowcount == 5)
                {
                    Select_Screen_Output_StringText += "            <tr>" + Environment.NewLine;
                    Select_Screen_Output_StringText += "                <td>" + Environment.NewLine;
                    Select_Screen_Output_StringText += "            <asp:Label ID=\"" + DB_Array[i] + "_Lable\" runat=\"server\" Text=\"" + DB_Array[i] + ":" + "\"></asp:Label><br /><asp:TextBox ID=\"" + DB_Array[i] + "_txt" + "\" runat=\"server\" Text=\"" + DB_Array[i] + "_txt" + "\"></asp:TextBox><br />" + Environment.NewLine;
                    Select_Screen_Output_StringText += "                </td>" + Environment.NewLine;
                    Select_Screen_Output_StringText += "            </tr>" + Environment.NewLine;
                    rowcount = 0;
                }
                else
                {
                    Select_Screen_Output_StringText += "                <td>" + Environment.NewLine;
                    Select_Screen_Output_StringText += "            <asp:Label ID=\"" + DB_Array[i] + "_Lable\" runat=\"server\" Text=\"" + DB_Array[i] + ":" + "\"></asp:Label><br /><asp:TextBox ID=\"" + DB_Array[i] + "_txt" + "\" runat=\"server\" Text=\"" + DB_Array[i] + "_txt" + "\"></asp:TextBox><br />" + Environment.NewLine;
                    Select_Screen_Output_StringText += "</td>" + Environment.NewLine;
                }
                rowcount++;
            }

            Select_Screen_Output_StringText += "        </table>" + Environment.NewLine;
            Select_Screen_Output_StringText += "    </body>" + Environment.NewLine;
            Select_Screen_Output_StringText += "    </html>" + Environment.NewLine;
            Select_Screen_Output_StringText += "</asp:Content>" + Environment.NewLine;



        }
        public void GENERATE_SCREEN_C_Select(string Table_Name)
        {
            

            //SELECT  \"" "\" 
            Select_Screen_C_Output_StringText += "using System;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Collections.Generic;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Linq;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Web;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Web.UI;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Web.UI.WebControls;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Text.RegularExpressions;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Data;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Data.SqlClient;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Configuration;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Diagnostics;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Collections;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Configuration;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Collections.Generic;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Linq;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Data;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Web;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Web.UI;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Web.UI.WebControls;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Web.UI.WebControls.WebParts;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Text.RegularExpressions;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Data.SqlClient;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Web.Security;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Web.UI.HtmlControls;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Xml.Linq;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.IO;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Data;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Linq;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Net.Mail;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Net;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Text;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Xml;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Web.Services;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "using System.Web.Mvc;" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "namespace DMCS.App_Code" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "{" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "public partial class " + Table_Name + "_Select : System.Web.UI.Page" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "{" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "    protected void Page_Load(object sender, EventArgs e)" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "    {" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "        if (!ClientScript.IsStartupScriptRegistered(\"initialize\"))" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "        {" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "            Page.ClientScript.RegisterStartupScript(this.GetType()," + Environment.NewLine;
            Select_Screen_C_Output_StringText += "                \"initialize\", \"initialize();\", true);" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "        }" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "        if (!Page.IsPostBack)" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "        {   }" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "    }" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "    protected void ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "    {" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "        try" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "        {" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "            disaster disaster = new disaster();" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "            GlobalVariables.DisasterID = Convert.ToInt32(ddlDisaster.SelectedItem.Value);" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "        }" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "        catch { }" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "    }" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "}" + Environment.NewLine;
            Select_Screen_C_Output_StringText += "}" + Environment.NewLine;


        }
        public void GENERATE_SCREEN_Insert(string Table_Name)
        {
            

            //INSERT
            Insert_Screen_Output_StringText += "<%@ Page Title=\"\" Language=\"C#\" MasterPageFile=\"~/Site.Master\" AutoEventWireup=\"true\" CodeBehind=\"" + Table_Name + "_Insert.aspx.cs\" Inherits=\"DMCS." + Table_Name + "_Insert\" %>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "<asp:Content ID=\"Content1\" ContentPlaceHolderID=\"HeadContent\" runat=\"server\">" + Environment.NewLine;
            Insert_Screen_Output_StringText += "</asp:Content>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "<asp:Content ID=\"Content2\" ContentPlaceHolderID=\"FeaturedContent\" runat=\"server\">" + Environment.NewLine;
            Insert_Screen_Output_StringText += "</asp:Content>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "<asp:Content ID=\"Content3\" ContentPlaceHolderID=\"MainContent\" runat=\"server\">" + Environment.NewLine;
            Insert_Screen_Output_StringText += "    <!DOCTYPE html>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "    <html>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "    <head>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "        <meta name=\"viewport\" content=\"initial-scale=1.0, user-scalable=no\">" + Environment.NewLine;
            Insert_Screen_Output_StringText += "        <meta charset=\"utf-8\">" + Environment.NewLine;
            Insert_Screen_Output_StringText += "        <title>TITLE NAME</title>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "    </head>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "    <body>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "        <table width=\"100%\" bgcolor=\"Silver\" border=\"3\">" + Environment.NewLine;
            Insert_Screen_Output_StringText += "            <tr>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                <td width=\"20%\" height=\"50px\" style=\"border-style: none\" align=\"right\">" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                    <asp:Label ID=\"Label2\" runat=\"server\" Text=\"Select a Disaster: \" Font-Bold=\"True\" ForeColor=\"Black\"></asp:Label>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                            <asp:DropDownList ID=\"ddlDisaster\" runat=\"server\"" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                              Height=\"24px\" Width=\"240px\"" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                              OnSelectedIndexChanged=\"ddlDisaster_SelectedIndexChanged\"" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                              AutoPostBack=\"True\" DataSourceID=\"SqlDataSource1\" DataTextField=\"disaster_name\" DataValueField=\"disaster_id\" Style=\"margin-left: 0px\" Font-Bold=\"True\">" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                    </asp:DropDownList>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "         <asp:SqlDataSource ID=\"SqlDataSource1\" runat=\"server\" ConnectionString=\"<%$ ConnectionStrings:localhost %>\" SelectCommand=\"SELECT [disaster_id], [disaster_name] FROM [disaster]\"></asp:SqlDataSource>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                </td>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                <td width=\"80%\" style=\"border-style: none\" align=\"Center\">" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                    <asp:Label ID=\"Label1\" runat=\"server\" Text=\"TEXT\" Font-Bold=\"True\" Font-Size=\"20pt\"></asp:Label>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                </td>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "            </tr>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "        </table>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "        <table width=\"100%\" height=\"100%\" bgcolor=\"Silver\" border=\"3\">" + Environment.NewLine;
            Insert_Screen_Output_StringText += "            <tr>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                <td>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                    <asp:GridView ID=\"GridView1\" runat=\"server\" DataSourceID=\"SqlDataSource2\" AutoGenerateColumns=\"False\" DataKeyNames=\"alert_ID\" BackColor=\"#CCCCCC\" BorderColor=\"#999999\" BorderStyle=\"Solid\" BorderWidth=\"3px\" CellPadding=\"4\" CellSpacing=\"2\" ForeColor=\"Black\" Width=\"100%\" OnSelectedIndexChanged=\"Select_Record\">" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                        <Columns>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                            <asp:CommandField ShowSelectButton=\"True\"></asp:CommandField>" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                Insert_Screen_Output_StringText += "                            <asp:BoundField DataField=\"" + DB_Array[i] + "\" HeaderText=\"" + DB_Array[i] + "\" InsertVisible=\"False\" ReadOnly=\"True\" SortExpression=\"" + DB_Array[i] + "\" />" + Environment.NewLine;
            }

            Insert_Screen_Output_StringText += "                        </Columns>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                        <FooterStyle BackColor=\"#CCCCCC\"></FooterStyle>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                        <HeaderStyle BackColor=\"Black\" Font-Bold=\"True\" ForeColor=\"White\"></HeaderStyle>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                        <PagerStyle HorizontalAlign=\"Left\" BackColor=\"#CCCCCC\" ForeColor=\"Black\"></PagerStyle>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                        <RowStyle BackColor=\"White\"></RowStyle>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                        <SelectedRowStyle BackColor=\"#000099\" Font-Bold=\"True\" ForeColor=\"White\"></SelectedRowStyle>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                        <SortedAscendingCellStyle BackColor=\"#F1F1F1\"></SortedAscendingCellStyle>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                        <SortedAscendingHeaderStyle BackColor=\"#808080\"></SortedAscendingHeaderStyle>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                        <SortedDescendingCellStyle BackColor=\"#CAC9C9\"></SortedDescendingCellStyle>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                        <SortedDescendingHeaderStyle BackColor=\"#383838\"></SortedDescendingHeaderStyle>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                    </asp:GridView>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                    <asp:SqlDataSource runat=\"server\" ID=\"SqlDataSource2\" ConnectionString=\"<%$ ConnectionStrings:localhost %>\" SelectCommand= \"SELECT";
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                if (i == DB_Array.Length - 1 - 1)
                {
                    Insert_Screen_Output_StringText += " [" + DB_Array[i] + "]";
                }
                else
                {
                    Insert_Screen_Output_StringText += " [" + DB_Array[i] + "],";
                }


            }
            Insert_Screen_Output_StringText += " FROM [" + Table_Name + "]\"";
            Insert_Screen_Output_StringText += "></asp:SqlDataSource>" + Environment.NewLine;

            Insert_Screen_Output_StringText += "                </td>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "            </tr>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "        </table>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "        <table width=\"100%\" height=\"auto\" bgcolor=\"Silver\" border=\"3\">" + Environment.NewLine;
            int rowcount = 0;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                //String Cur_Element = "";
                //if (Element_Array[i] == "TextBox") { Cur_Element = "            <asp:TextBox ID=\"" + DB_Array[i] + "_txt" + "\" runat=\"server\" Text=\"" + DB_Array[i] + "_txt" + "\"></asp:TextBox>"; }
                //if (Element_Array[i] == "RadioButton") { Cur_Element = "            <asp:RadioButton ID=\"" + DB_Array[i] + "_RadioBtn" + "\" runat=\"server\" Text=\"" + DB_Array[i] + "_RadioBtn" + "\" />"; }

                if (rowcount == 5)
                {
                    Insert_Screen_Output_StringText += "            <tr>" + Environment.NewLine;
                    Insert_Screen_Output_StringText += "                <td>" + Environment.NewLine;
                    Insert_Screen_Output_StringText += "            <asp:Label ID=\"" + DB_Array[i] + "_Lable\" runat=\"server\" Text=\"" + DB_Array[i] + ":" + "\"></asp:Label><br /><asp:TextBox ID=\"" + DB_Array[i] + "_txt" + "\" runat=\"server\" Text=\"" + DB_Array[i] + "_txt" + "\"></asp:TextBox><br />" + Environment.NewLine;
                    Insert_Screen_Output_StringText += "                </td>" + Environment.NewLine;
                    Insert_Screen_Output_StringText += "            </tr>" + Environment.NewLine;
                    rowcount = 0;
                }
                else
                {
                    Insert_Screen_Output_StringText += "                <td>" + Environment.NewLine;
                    Insert_Screen_Output_StringText += "            <asp:Label ID=\"" + DB_Array[i] + "_Lable\" runat=\"server\" Text=\"" + DB_Array[i] + ":" + "\"></asp:Label><br /><asp:TextBox ID=\"" + DB_Array[i] + "_txt" + "\" runat=\"server\" Text=\"" + DB_Array[i] + "_txt" + "\"></asp:TextBox><br />" + Environment.NewLine;
                    Insert_Screen_Output_StringText += "</td>" + Environment.NewLine;
                }
                rowcount++;
            }

            Insert_Screen_Output_StringText += "        </table>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "        <table width=\"100%\" height=\"auto\" bgcolor=\"Silver\" border=\"3\">" + Environment.NewLine;
            Insert_Screen_Output_StringText += "            <tr>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                <td width=\"100%\">" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                    <asp:Button ID=\"Insert\" runat=\"server\" Text=\"Insert\" BackColor=\"#CC0000\" ForeColor=\"Silver\" Width=\"100%\" OnClick=\"INSERT\" CausesValidation=\"False\" style=\"margin-bottom: 0px\" />" + Environment.NewLine;
            Insert_Screen_Output_StringText += "                </td>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "            </tr>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "        </table>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "    </body>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "    </html>" + Environment.NewLine;
            Insert_Screen_Output_StringText += "</asp:Content>" + Environment.NewLine;

        }
        public void GENERATE_SCREEN_C_Insert(string Table_Name)
        {
            

            //SELECT  \"" "\" 
            Insert_Screen_C_Output_StringText += "using System;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Collections.Generic;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Linq;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Web;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Web.UI;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Web.UI.WebControls;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Text.RegularExpressions;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Data;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Data.SqlClient;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Configuration;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Diagnostics;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Collections;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Configuration;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Collections.Generic;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Linq;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Data;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Web;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Web.UI;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Web.UI.WebControls;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Web.UI.WebControls.WebParts;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Text.RegularExpressions;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Data.SqlClient;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Web.Security;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Web.UI.HtmlControls;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Xml.Linq;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.IO;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Data;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Linq;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Net.Mail;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Net;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Text;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Xml;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Web.Services;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "using System.Web.Mvc;" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "namespace DMCS.App_Code" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "{" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "public partial class " + Table_Name + "_Insert : System.Web.UI.Page" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "{" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "            public " + Table_Name + " " + Table_Name + " = new " + Table_Name + "();" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "    protected void Page_Load(object sender, EventArgs e)" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "        if (!ClientScript.IsStartupScriptRegistered(\"initialize\"))" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "        {" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "            Page.ClientScript.RegisterStartupScript(this.GetType()," + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "                \"initialize\", \"initialize();\", true);" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "        }" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "        if (!Page.IsPostBack)" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "        {   }" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "    }" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "    protected void ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "        try" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "        {" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "            disaster disaster = new disaster();" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "            GlobalVariables.DisasterID = Convert.ToInt32(ddlDisaster.SelectedItem.Value);" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "        }" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "        catch { }" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "    }" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "}" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "    protected void Select_Record(object sender, EventArgs e)" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "        " + Table_Name + " = " + Table_Name + ".Select(Convert.ToInt32(GridView1.SelectedValue));" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                Insert_Screen_C_Output_StringText += "        " + DB_Array[i] + "_txt.Text = Convert.ToString(" + Table_Name + "." + DB_Array[i] + ");" + Environment.NewLine;
            }
            Insert_Screen_C_Output_StringText += "    }" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "    protected void INSERT(object sender, EventArgs e)" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "    {" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                if (DB_Type_Array[i] == "int")
                {
                    Insert_Screen_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = (Convert.ToInt32(" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                else
                {
                    Insert_Screen_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = " + DB_Array[i] + "_txt.Text;" + Environment.NewLine;
                }
            }
            Insert_Screen_C_Output_StringText += "        Alert = Alert.Insert(Alert);" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "    }" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "}" + Environment.NewLine;
            Insert_Screen_C_Output_StringText += "}" + Environment.NewLine;



        }
        public void GENERATE_SCREEN_Update(string Table_Name)
        {
            

            //UPDATE
            Update_Screen_Output_StringText += "<%@ Page Title=\"\" Language=\"C#\" MasterPageFile=\"~/Site.Master\" AutoEventWireup=\"true\" CodeBehind=\"" + Table_Name + "_Update.aspx.cs\" Inherits=\"DMCS." + Table_Name + "_Update\" %>" + Environment.NewLine;
            Update_Screen_Output_StringText += "<asp:Content ID=\"Content1\" ContentPlaceHolderID=\"HeadContent\" runat=\"server\">" + Environment.NewLine;
            Update_Screen_Output_StringText += "</asp:Content>" + Environment.NewLine;
            Update_Screen_Output_StringText += "<asp:Content ID=\"Content2\" ContentPlaceHolderID=\"FeaturedContent\" runat=\"server\">" + Environment.NewLine;
            Update_Screen_Output_StringText += "</asp:Content>" + Environment.NewLine;
            Update_Screen_Output_StringText += "<asp:Content ID=\"Content3\" ContentPlaceHolderID=\"MainContent\" runat=\"server\">" + Environment.NewLine;
            Update_Screen_Output_StringText += "    <!DOCTYPE html>" + Environment.NewLine;
            Update_Screen_Output_StringText += "    <html>" + Environment.NewLine;
            Update_Screen_Output_StringText += "    <head>" + Environment.NewLine;
            Update_Screen_Output_StringText += "        <meta name=\"viewport\" content=\"initial-scale=1.0, user-scalable=no\">" + Environment.NewLine;
            Update_Screen_Output_StringText += "        <meta charset=\"utf-8\">" + Environment.NewLine;
            Update_Screen_Output_StringText += "        <title>TITLE NAME</title>" + Environment.NewLine;
            Update_Screen_Output_StringText += "    </head>" + Environment.NewLine;
            Update_Screen_Output_StringText += "    <body>" + Environment.NewLine;
            Update_Screen_Output_StringText += "        <table width=\"100%\" bgcolor=\"Silver\" border=\"3\">" + Environment.NewLine;
            Update_Screen_Output_StringText += "            <tr>" + Environment.NewLine;
            Update_Screen_Output_StringText += "                <td width=\"20%\" height=\"50px\" style=\"border-style: none\" align=\"right\">" + Environment.NewLine;
            Update_Screen_Output_StringText += "                    <asp:Label ID=\"Label2\" runat=\"server\" Text=\"Select a Disaster: \" Font-Bold=\"True\" ForeColor=\"Black\"></asp:Label>" + Environment.NewLine;
            Update_Screen_Output_StringText += "                            <asp:DropDownList ID=\"ddlDisaster\" runat=\"server\"" + Environment.NewLine;
            Update_Screen_Output_StringText += "                              Height=\"24px\" Width=\"240px\"" + Environment.NewLine;
            Update_Screen_Output_StringText += "                              OnSelectedIndexChanged=\"ddlDisaster_SelectedIndexChanged\"" + Environment.NewLine;
            Update_Screen_Output_StringText += "                              AutoPostBack=\"True\" DataSourceID=\"SqlDataSource1\" DataTextField=\"disaster_name\" DataValueField=\"disaster_id\" Style=\"margin-left: 0px\" Font-Bold=\"True\">" + Environment.NewLine;
            Update_Screen_Output_StringText += "                    </asp:DropDownList>" + Environment.NewLine;
            Update_Screen_Output_StringText += "         <asp:SqlDataSource ID=\"SqlDataSource1\" runat=\"server\" ConnectionString=\"<%$ ConnectionStrings:localhost %>\" SelectCommand=\"SELECT [disaster_id], [disaster_name] FROM [disaster]\"></asp:SqlDataSource>" + Environment.NewLine;
            Update_Screen_Output_StringText += "                </td>" + Environment.NewLine;
            Update_Screen_Output_StringText += "                <td width=\"80%\" style=\"border-style: none\" align=\"Center\">" + Environment.NewLine;
            Update_Screen_Output_StringText += "                    <asp:Label ID=\"Label1\" runat=\"server\" Text=\"TEXT\" Font-Bold=\"True\" Font-Size=\"20pt\"></asp:Label>" + Environment.NewLine;
            Update_Screen_Output_StringText += "                </td>" + Environment.NewLine;
            Update_Screen_Output_StringText += "            </tr>" + Environment.NewLine;
            Update_Screen_Output_StringText += "        </table>" + Environment.NewLine;
            Update_Screen_Output_StringText += "        <table width=\"100%\" height=\"100%\" bgcolor=\"Silver\" border=\"3\">" + Environment.NewLine;
            Update_Screen_Output_StringText += "            <tr>" + Environment.NewLine;
            Update_Screen_Output_StringText += "                <td>" + Environment.NewLine;
            Update_Screen_Output_StringText += "                    <asp:GridView ID=\"GridView1\" runat=\"server\" DataSourceID=\"SqlDataSource2\" AutoGenerateColumns=\"False\" DataKeyNames=\"alert_ID\" BackColor=\"#CCCCCC\" BorderColor=\"#999999\" BorderStyle=\"Solid\" BorderWidth=\"3px\" CellPadding=\"4\" CellSpacing=\"2\" ForeColor=\"Black\" Width=\"100%\" OnSelectedIndexChanged=\"Select_Record\">" + Environment.NewLine;
            Update_Screen_Output_StringText += "                        <Columns>" + Environment.NewLine;
            Update_Screen_Output_StringText += "                            <asp:CommandField ShowSelectButton=\"True\"></asp:CommandField>" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                Update_Screen_Output_StringText += "                            <asp:BoundField DataField=\"" + DB_Array[i] + "\" HeaderText=\"" + DB_Array[i] + "\" InsertVisible=\"False\" ReadOnly=\"True\" SortExpression=\"" + DB_Array[i] + "\" />" + Environment.NewLine;
            }

            Update_Screen_Output_StringText += "                        </Columns>" + Environment.NewLine;
            Update_Screen_Output_StringText += "                        <FooterStyle BackColor=\"#CCCCCC\"></FooterStyle>" + Environment.NewLine;
            Update_Screen_Output_StringText += "                        <HeaderStyle BackColor=\"Black\" Font-Bold=\"True\" ForeColor=\"White\"></HeaderStyle>" + Environment.NewLine;
            Update_Screen_Output_StringText += "                        <PagerStyle HorizontalAlign=\"Left\" BackColor=\"#CCCCCC\" ForeColor=\"Black\"></PagerStyle>" + Environment.NewLine;
            Update_Screen_Output_StringText += "                        <RowStyle BackColor=\"White\"></RowStyle>" + Environment.NewLine;
            Update_Screen_Output_StringText += "                        <SelectedRowStyle BackColor=\"#000099\" Font-Bold=\"True\" ForeColor=\"White\"></SelectedRowStyle>" + Environment.NewLine;
            Update_Screen_Output_StringText += "                        <SortedAscendingCellStyle BackColor=\"#F1F1F1\"></SortedAscendingCellStyle>" + Environment.NewLine;
            Update_Screen_Output_StringText += "                        <SortedAscendingHeaderStyle BackColor=\"#808080\"></SortedAscendingHeaderStyle>" + Environment.NewLine;
            Update_Screen_Output_StringText += "                        <SortedDescendingCellStyle BackColor=\"#CAC9C9\"></SortedDescendingCellStyle>" + Environment.NewLine;
            Update_Screen_Output_StringText += "                        <SortedDescendingHeaderStyle BackColor=\"#383838\"></SortedDescendingHeaderStyle>" + Environment.NewLine;
            Update_Screen_Output_StringText += "                    </asp:GridView>" + Environment.NewLine;
            Update_Screen_Output_StringText += "                    <asp:SqlDataSource runat=\"server\" ID=\"SqlDataSource2\" ConnectionString=\"<%$ ConnectionStrings:localhost %>\" SelectCommand= \"SELECT";
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                if (i == DB_Array.Length - 1 - 1)
                {
                    Update_Screen_Output_StringText += " [" + DB_Array[i] + "]";
                }
                else
                {
                    Update_Screen_Output_StringText += " [" + DB_Array[i] + "],";
                }


            }
            Update_Screen_Output_StringText += " FROM [" + Table_Name + "]\"";
            Update_Screen_Output_StringText += "></asp:SqlDataSource>" + Environment.NewLine;

            Update_Screen_Output_StringText += "                </td>" + Environment.NewLine;
            Update_Screen_Output_StringText += "            </tr>" + Environment.NewLine;
            Update_Screen_Output_StringText += "        </table>" + Environment.NewLine;
            Update_Screen_Output_StringText += "        <table width=\"100%\" height=\"auto\" bgcolor=\"Silver\" border=\"3\">" + Environment.NewLine;
            int rowcount = 0;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                //String Cur_Element = "";
                //if (Element_Array[i] == "TextBox") { Cur_Element = "            <asp:TextBox ID=\"" + DB_Array[i] + "_txt" + "\" runat=\"server\" Text=\"" + DB_Array[i] + "_txt" + "\"></asp:TextBox>"; }
                //if (Element_Array[i] == "RadioButton") { Cur_Element = "            <asp:RadioButton ID=\"" + DB_Array[i] + "_RadioBtn" + "\" runat=\"server\" Text=\"" + DB_Array[i] + "_RadioBtn" + "\" />"; }

                if (rowcount == 5)
                {
                    Update_Screen_Output_StringText += "            <tr>" + Environment.NewLine;
                    Update_Screen_Output_StringText += "                <td>" + Environment.NewLine;
                    Update_Screen_Output_StringText += "            <asp:Label ID=\"" + DB_Array[i] + "_Lable\" runat=\"server\" Text=\"" + DB_Array[i] + ":" + "\"></asp:Label><br /><asp:TextBox ID=\"" + DB_Array[i] + "_txt" + "\" runat=\"server\" Text=\"" + DB_Array[i] + "_txt" + "\"></asp:TextBox><br />" + Environment.NewLine;
                    Update_Screen_Output_StringText += "                </td>" + Environment.NewLine;
                    Update_Screen_Output_StringText += "            </tr>" + Environment.NewLine;
                    rowcount = 0;
                }
                else
                {
                    Update_Screen_Output_StringText += "                <td>" + Environment.NewLine;
                    Update_Screen_Output_StringText += "            <asp:Label ID=\"" + DB_Array[i] + "_Lable\" runat=\"server\" Text=\"" + DB_Array[i] + ":" + "\"></asp:Label><br /><asp:TextBox ID=\"" + DB_Array[i] + "_txt" + "\" runat=\"server\" Text=\"" + DB_Array[i] + "_txt" + "\"></asp:TextBox><br />" + Environment.NewLine;
                    Update_Screen_Output_StringText += "</td>" + Environment.NewLine;
                }
                rowcount++;
            }

            Update_Screen_Output_StringText += "        </table>" + Environment.NewLine;
            Update_Screen_Output_StringText += "        <table width=\"100%\" height=\"auto\" bgcolor=\"Silver\" border=\"3\">" + Environment.NewLine;
            Update_Screen_Output_StringText += "            <tr>" + Environment.NewLine;
            Update_Screen_Output_StringText += "                <td width=\"100%\">" + Environment.NewLine;
            Update_Screen_Output_StringText += "                    <asp:Button ID=\"Update\" runat=\"server\" Text=\"Update\" BackColor=\"#CC0000\" ForeColor=\"Silver\" Width=\"100%\" OnClick=\"UPDATE\" CausesValidation=\"False\" />" + Environment.NewLine;
            Update_Screen_Output_StringText += "                </td>" + Environment.NewLine;
            Update_Screen_Output_StringText += "            </tr>" + Environment.NewLine;
            Update_Screen_Output_StringText += "        </table>" + Environment.NewLine;
            Update_Screen_Output_StringText += "    </body>" + Environment.NewLine;
            Update_Screen_Output_StringText += "    </html>" + Environment.NewLine;
            Update_Screen_Output_StringText += "</asp:Content>" + Environment.NewLine;

        }
        public void GENERATE_SCREEN_C_Update(string Table_Name)
        {
            

            //SELECT 
            Update_Screen_C_Output_StringText += "using System;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Collections.Generic;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Linq;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Web;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Web.UI;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Web.UI.WebControls;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Text.RegularExpressions;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Data;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Data.SqlClient;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Configuration;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Diagnostics;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Collections;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Configuration;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Collections.Generic;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Linq;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Data;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Web;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Web.UI;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Web.UI.WebControls;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Web.UI.WebControls.WebParts;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Text.RegularExpressions;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Data.SqlClient;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Web.Security;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Web.UI.HtmlControls;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Xml.Linq;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.IO;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Data;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Linq;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Net.Mail;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Net;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Text;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Xml;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Web.Services;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "using System.Web.Mvc;" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "namespace DMCS.App_Code" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "{" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "public partial class " + Table_Name + "_Update : System.Web.UI.Page" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "{" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "            public " + Table_Name + " " + Table_Name + " = new " + Table_Name + "();" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "    protected void Page_Load(object sender, EventArgs e)" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "    {" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "        if (!ClientScript.IsStartupScriptRegistered(\"initialize\"))" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "        {" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "            Page.ClientScript.RegisterStartupScript(this.GetType()," + Environment.NewLine;
            Update_Screen_C_Output_StringText += "                \"initialize\", \"initialize();\", true);" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "        }" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "        if (!Page.IsPostBack)" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "        {   }" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "    }" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "    protected void ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "    {" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "        try" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "        {" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "            disaster disaster = new disaster();" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "            GlobalVariables.DisasterID = Convert.ToInt32(ddlDisaster.SelectedItem.Value);" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "        }" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "        catch { }" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "    }" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "}" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "    protected void Select_Record(object sender, EventArgs e)" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "    {" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "        " + Table_Name + " = " + Table_Name + ".Select(Convert.ToInt32(GridView1.SelectedValue));" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                Update_Screen_C_Output_StringText += "        " + DB_Array[i] + "_txt.Text = Convert.ToString(" + Table_Name + "." + DB_Array[i] + ");" + Environment.NewLine;
            }
            Update_Screen_C_Output_StringText += "    }" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "    protected void UPDATE(object sender, EventArgs e)" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "    {" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "        " + Table_Name + " = " + Table_Name + ".Select(Convert.ToInt32(GridView1.SelectedValue));" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                if (DB_Type_Array[i] == "int")
                {
                    Update_Screen_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = (Convert.ToInt32(" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                else
                {
                    Update_Screen_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = " + DB_Array[i] + "_txt.Text;" + Environment.NewLine;
                }
            }
            Update_Screen_C_Output_StringText += "        Alert.Update(Alert);" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "    }" + Environment.NewLine;
            Update_Screen_C_Output_StringText += "}" + Environment.NewLine;



        }
        public void GENERATE_SCREEN_Delete(string Table_Name)
        {
            

            //DELETE
            Delete_Screen_Output_StringText += "<%@ Page Title=\"\" Language=\"C#\" MasterPageFile=\"~/Site.Master\" AutoEventWireup=\"true\" CodeBehind=\"" + Table_Name + "_Delete.aspx.cs\" Inherits=\"DMCS." + Table_Name + "_Delete\" %>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "<asp:Content ID=\"Content1\" ContentPlaceHolderID=\"HeadContent\" runat=\"server\">" + Environment.NewLine;
            Delete_Screen_Output_StringText += "</asp:Content>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "<asp:Content ID=\"Content2\" ContentPlaceHolderID=\"FeaturedContent\" runat=\"server\">" + Environment.NewLine;
            Delete_Screen_Output_StringText += "</asp:Content>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "<asp:Content ID=\"Content3\" ContentPlaceHolderID=\"MainContent\" runat=\"server\">" + Environment.NewLine;
            Delete_Screen_Output_StringText += "    <!DOCTYPE html>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "    <html>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "    <head>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "        <meta name=\"viewport\" content=\"initial-scale=1.0, user-scalable=no\">" + Environment.NewLine;
            Delete_Screen_Output_StringText += "        <meta charset=\"utf-8\">" + Environment.NewLine;
            Delete_Screen_Output_StringText += "        <title>TITLE NAME</title>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "    </head>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "    <body>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "        <table width=\"100%\" bgcolor=\"Silver\" border=\"3\">" + Environment.NewLine;
            Delete_Screen_Output_StringText += "            <tr>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                <td width=\"20%\" height=\"50px\" style=\"border-style: none\" align=\"right\">" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                    <asp:Label ID=\"Label2\" runat=\"server\" Text=\"Select a Disaster: \" Font-Bold=\"True\" ForeColor=\"Black\"></asp:Label>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                            <asp:DropDownList ID=\"ddlDisaster\" runat=\"server\"" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                              Height=\"24px\" Width=\"240px\"" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                              OnSelectedIndexChanged=\"ddlDisaster_SelectedIndexChanged\"" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                              AutoPostBack=\"True\" DataSourceID=\"SqlDataSource1\" DataTextField=\"disaster_name\" DataValueField=\"disaster_id\" Style=\"margin-left: 0px\" Font-Bold=\"True\">" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                    </asp:DropDownList>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "         <asp:SqlDataSource ID=\"SqlDataSource1\" runat=\"server\" ConnectionString=\"<%$ ConnectionStrings:localhost %>\" SelectCommand=\"SELECT [disaster_id], [disaster_name] FROM [disaster]\"></asp:SqlDataSource>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                </td>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                <td width=\"80%\" style=\"border-style: none\" align=\"Center\">" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                    <asp:Label ID=\"Label1\" runat=\"server\" Text=\"TEXT\" Font-Bold=\"True\" Font-Size=\"20pt\"></asp:Label>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                </td>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "            </tr>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "        </table>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "        <table width=\"100%\" height=\"100%\" bgcolor=\"Silver\" border=\"3\">" + Environment.NewLine;
            Delete_Screen_Output_StringText += "            <tr>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                <td>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                    <asp:GridView ID=\"GridView1\" runat=\"server\" DataSourceID=\"SqlDataSource2\" AutoGenerateColumns=\"False\" DataKeyNames=\"alert_ID\" BackColor=\"#CCCCCC\" BorderColor=\"#999999\" BorderStyle=\"Solid\" BorderWidth=\"3px\" CellPadding=\"4\" CellSpacing=\"2\" ForeColor=\"Black\" Width=\"100%\" OnSelectedIndexChanged=\"Select_Record\">" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                        <Columns>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                            <asp:CommandField ShowSelectButton=\"True\"></asp:CommandField>" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                Delete_Screen_Output_StringText += "                            <asp:BoundField DataField=\"" + DB_Array[i] + "\" HeaderText=\"" + DB_Array[i] + "\" InsertVisible=\"False\" ReadOnly=\"True\" SortExpression=\"" + DB_Array[i] + "\" />" + Environment.NewLine;
            }

            Delete_Screen_Output_StringText += "                        </Columns>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                        <FooterStyle BackColor=\"#CCCCCC\"></FooterStyle>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                        <HeaderStyle BackColor=\"Black\" Font-Bold=\"True\" ForeColor=\"White\"></HeaderStyle>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                        <PagerStyle HorizontalAlign=\"Left\" BackColor=\"#CCCCCC\" ForeColor=\"Black\"></PagerStyle>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                        <RowStyle BackColor=\"White\"></RowStyle>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                        <SelectedRowStyle BackColor=\"#000099\" Font-Bold=\"True\" ForeColor=\"White\"></SelectedRowStyle>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                        <SortedAscendingCellStyle BackColor=\"#F1F1F1\"></SortedAscendingCellStyle>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                        <SortedAscendingHeaderStyle BackColor=\"#808080\"></SortedAscendingHeaderStyle>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                        <SortedDescendingCellStyle BackColor=\"#CAC9C9\"></SortedDescendingCellStyle>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                        <SortedDescendingHeaderStyle BackColor=\"#383838\"></SortedDescendingHeaderStyle>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                    </asp:GridView>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                    <asp:SqlDataSource runat=\"server\" ID=\"SqlDataSource2\" ConnectionString=\"<%$ ConnectionStrings:localhost %>\" SelectCommand= \"SELECT";
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                if (i == DB_Array.Length - 1 - 1)
                {
                    Delete_Screen_Output_StringText += " [" + DB_Array[i] + "]";
                }
                else
                {
                    Delete_Screen_Output_StringText += " [" + DB_Array[i] + "],";
                }


            }
            Delete_Screen_Output_StringText += " FROM [" + Table_Name + "]\"";
            Delete_Screen_Output_StringText += "></asp:SqlDataSource>" + Environment.NewLine;

            Delete_Screen_Output_StringText += "                </td>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "            </tr>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "        </table>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "        <table width=\"100%\" height=\"auto\" bgcolor=\"Silver\" border=\"3\">" + Environment.NewLine;
            int rowcount = 0;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                //String Cur_Element = "";
                //if (Element_Array[i] == "TextBox") { Cur_Element = "            <asp:TextBox ID=\"" + DB_Array[i] + "_txt" + "\" runat=\"server\" Text=\"" + DB_Array[i] + "_txt" + "\"></asp:TextBox>"; }
                //if (Element_Array[i] == "RadioButton") { Cur_Element = "            <asp:RadioButton ID=\"" + DB_Array[i] + "_RadioBtn" + "\" runat=\"server\" Text=\"" + DB_Array[i] + "_RadioBtn" + "\" />"; }

                if (rowcount == 5)
                {
                    Delete_Screen_Output_StringText += "            <tr>" + Environment.NewLine;
                    Delete_Screen_Output_StringText += "                <td>" + Environment.NewLine;
                    Delete_Screen_Output_StringText += "            <asp:Label ID=\"" + DB_Array[i] + "_Lable\" runat=\"server\" Text=\"" + DB_Array[i] + ":" + "\"></asp:Label><br /><asp:TextBox ID=\"" + DB_Array[i] + "_txt" + "\" runat=\"server\" Text=\"" + DB_Array[i] + "_txt" + "\"></asp:TextBox><br />" + Environment.NewLine;
                    Delete_Screen_Output_StringText += "                </td>" + Environment.NewLine;
                    Delete_Screen_Output_StringText += "            </tr>" + Environment.NewLine;
                    rowcount = 0;
                }
                else
                {
                    Delete_Screen_Output_StringText += "                <td>" + Environment.NewLine;
                    Delete_Screen_Output_StringText += "            <asp:Label ID=\"" + DB_Array[i] + "_Lable\" runat=\"server\" Text=\"" + DB_Array[i] + ":" + "\"></asp:Label><br /><asp:TextBox ID=\"" + DB_Array[i] + "_txt" + "\" runat=\"server\" Text=\"" + DB_Array[i] + "_txt" + "\"></asp:TextBox><br />" + Environment.NewLine;
                    Delete_Screen_Output_StringText += "</td>" + Environment.NewLine;
                }
                rowcount++;
            }

            Delete_Screen_Output_StringText += "        </table>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "        <table width=\"100%\" height=\"auto\" bgcolor=\"Silver\" border=\"3\">" + Environment.NewLine;
            Delete_Screen_Output_StringText += "            <tr>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                <td width=\"34%\">" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                    <asp:Button ID=\"Delete\" runat=\"server\" Text=\"Delete\" BackColor=\"#CC0000\" ForeColor=\"Silver\" Width=\"100%\" OnClick=\"DELETE\" CausesValidation=\"False\" style=\"margin-bottom: 0px\" />" + Environment.NewLine;
            Delete_Screen_Output_StringText += "                </td>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "            </tr>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "        </table>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "    </body>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "    </html>" + Environment.NewLine;
            Delete_Screen_Output_StringText += "</asp:Content>" + Environment.NewLine;

        }
        public void GENERATE_SCREEN_C_Delete(string Table_Name)
        {
            

            //SELECT
            Delete_Screen_C_Output_StringText += "using System;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Collections.Generic;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Linq;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Web;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Web.UI;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Web.UI.WebControls;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Text.RegularExpressions;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Data;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Data.SqlClient;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Configuration;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Diagnostics;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Collections;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Configuration;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Collections.Generic;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Linq;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Data;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Web;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Web.UI;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Web.UI.WebControls;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Web.UI.WebControls.WebParts;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Text.RegularExpressions;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Data.SqlClient;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Web.Security;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Web.UI.HtmlControls;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Xml.Linq;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.IO;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Data;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Linq;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Net.Mail;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Net;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Text;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Xml;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Web.Services;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "using System.Web.Mvc;" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "namespace DMCS.App_Code" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "{" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "public partial class " + Table_Name + "_Delete : System.Web.UI.Page" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "{" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "            public " + Table_Name + " " + Table_Name + " = new " + Table_Name + "();" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "    protected void Page_Load(object sender, EventArgs e)" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "    {" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "        if (!ClientScript.IsStartupScriptRegistered(\"initialize\"))" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "        {" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "            Page.ClientScript.RegisterStartupScript(this.GetType()," + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "                \"initialize\", \"initialize();\", true);" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "        }" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "        if (!Page.IsPostBack)" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "        {   }" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "    }" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "    protected void ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "    {" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "        try" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "        {" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "            disaster disaster = new disaster();" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "            GlobalVariables.DisasterID = Convert.ToInt32(ddlDisaster.SelectedItem.Value);" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "        }" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "        catch { }" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "    }" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "}" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "    protected void Select_Record(object sender, EventArgs e)" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "    {" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "        " + Table_Name + " = " + Table_Name + ".Select(Convert.ToInt32(GridView1.SelectedValue));" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                Delete_Screen_C_Output_StringText += "        " + DB_Array[i] + "_txt.Text = Convert.ToString(" + Table_Name + "." + DB_Array[i] + ");" + Environment.NewLine;
            }
            Delete_Screen_C_Output_StringText += "    }" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "    protected void DELETE(object sender, EventArgs e)" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "    {" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "        " + Table_Name + ".Delete(Convert.ToInt32(GridView1.SelectedValue));" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "    }" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "}" + Environment.NewLine;
            Delete_Screen_C_Output_StringText += "}" + Environment.NewLine;



        }
        public void GENERATE_SCREEN_Insert_Update_Delete(string Table_Name)
        {
            


            //INSERT_UPDATE_DELETE
            //Insert_Update_Delete_Output_StringText += "<%@ Page Title=\"\" Language=\"C#\" MasterPageFile=\"~/Site.Master\" AutoEventWireup=\"true\" CodeBehind=\"" + Table_Name + "_Insert_Update_Delete.aspx.cs\" Inherits=\"DMCS." + Table_Name + "_Insert_Update_Delete\" %>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "<asp:Content ID=\"Content1\" ContentPlaceHolderID=\"HeadContent\" runat=\"server\">" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "</asp:Content>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "<asp:Content ID=\"Content2\" ContentPlaceHolderID=\"FeaturedContent\" runat=\"server\">" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "</asp:Content>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "<asp:Content ID=\"Content3\" ContentPlaceHolderID=\"MainContent\" runat=\"server\">" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "    <!DOCTYPE html>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "    <html>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "    <head>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "        <meta name=\"viewport\" content=\"initial-scale=1.0, user-scalable=no\">" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "        <meta charset=\"utf-8\">" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "        <title>TITLE NAME</title>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "    </head>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "    <body>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "        <table width=\"100%\" bgcolor=\"Silver\" border=\"3\">" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "            <tr>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                <td width=\"20%\" height=\"50px\" style=\"border-style: none\" align=\"right\">" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                    <asp:Label ID=\"Label2\" runat=\"server\" Text=\"Select a Disaster: \" Font-Bold=\"True\" ForeColor=\"Black\"></asp:Label>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                            <asp:DropDownList ID=\"ddlDisaster\" runat=\"server\"" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                              Height=\"24px\" Width=\"240px\"" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                              OnSelectedIndexChanged=\"ddlDisaster_SelectedIndexChanged\"" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                              AutoPostBack=\"True\" DataSourceID=\"SqlDataSource1\" DataTextField=\"disaster_name\" DataValueField=\"disaster_id\" Style=\"margin-left: 0px\" Font-Bold=\"True\">" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                    </asp:DropDownList>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "         <asp:SqlDataSource ID=\"SqlDataSource1\" runat=\"server\" ConnectionString=\"<%$ ConnectionStrings:localhost %>\" SelectCommand=\"SELECT [disaster_id], [disaster_name] FROM [disaster]\"></asp:SqlDataSource>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                </td>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                <td width=\"80%\" style=\"border-style: none\" align=\"Center\">" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                    <asp:Label ID=\"Label1\" runat=\"server\" Text=\"TEXT\" Font-Bold=\"True\" Font-Size=\"20pt\"></asp:Label>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                </td>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "            </tr>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "        </table>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "        <table width=\"100%\" height=\"100%\" bgcolor=\"Silver\" border=\"3\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "            <tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                <td style=\"padding: 0px 10px 0px 10px\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                    <asp:GridView ID=\"GridView1\" runat=\"server\" DataSourceID=\"SqlDataSource2\" AutoGenerateColumns=\"False\" DataKeyNames=\"" + DB_Array[0] + "\" BackColor=\"#CCCCCC\" BorderColor=\"#999999\" BorderStyle=\"Solid\" BorderWidth=\"5px\" CellPadding=\"4\" CellSpacing=\"2\" ForeColor=\"#1A1A1A\" Width=\"100%\" OnSelectedIndexChanged=\"Select_Record\" AllowPaging=\"True\" Font-Bold=\"False\" Font-Italic=\"False\" Font-Names=\"Calibri Light\" Font-Overline=\"False\" Font-Underline=\"False\" GridLines=\"Horizontal\" HorizontalAlign=\"Center\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                        <AlternatingRowStyle BackColor=\"Gray\" Font-Underline=\"False\" ForeColor=\"White\" />" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                        <Columns>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            <asp:CommandField ShowSelectButton=\"True\"></asp:CommandField>" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                if (i < 3)
                {
                    Insert_Update_Delete_Output_StringText += "                            <asp:BoundField DataField=\"" + DB_Array[i] + "\" HeaderText=\"" + DB_Array[i] + "\" InsertVisible=\"False\" ReadOnly=\"True\" SortExpression=\"" + DB_Array[i] + "\" />" + Environment.NewLine;
                }
                else
                {
                    Insert_Update_Delete_Output_StringText += "                            <asp:BoundField DataField=\"" + DB_Array[i] + "\" HeaderText=\"" + DB_Array[i] + "\" InsertVisible=\"False\" ReadOnly=\"True\" SortExpression=\"" + DB_Array[i] + "\" Visible=\"false\" />" + Environment.NewLine;
                }
            }

            Insert_Update_Delete_Output_StringText += "                        </Columns>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                        <FooterStyle BackColor=\"#CCCCCC\"></FooterStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                        <HeaderStyle BackColor=\"#EA5151\" Font-Bold=\"True\" ForeColor=\"White\"></HeaderStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                        <PagerStyle HorizontalAlign=\"Center\" BackColor=\"#CCCCCC\" ForeColor=\"Black\"></PagerStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                        <RowStyle BackColor=\"#CCCCCC\"></RowStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                        <SelectedRowStyle BackColor=\"#EA4C4C\" Font-Bold=\"True\" ForeColor=\"#CCCCCC\" ></SelectedRowStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                        <SortedAscendingCellStyle BackColor=\"#F1F1F1\"></SortedAscendingCellStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                        <SortedAscendingHeaderStyle BackColor=\"#808080\"></SortedAscendingHeaderStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                        <SortedDescendingCellStyle BackColor=\"#CAC9C9\"></SortedDescendingCellStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                        <SortedDescendingHeaderStyle BackColor=\"#383838\"></SortedDescendingHeaderStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                    </asp:GridView>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                    <asp:SqlDataSource runat=\"server\" ID=\"SqlDataSource2\" ConnectionString=\"<%$ ConnectionStrings:localhost %>\" SelectCommand= \"SELECT";
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                if (i == DB_Array.Length - 1 - 1)
                {
                    Insert_Update_Delete_Output_StringText += " [" + DB_Array[i] + "]";
                }
                else
                {
                    Insert_Update_Delete_Output_StringText += " [" + DB_Array[i] + "],";
                }


            }
            Insert_Update_Delete_Output_StringText += " FROM [" + Table_Name + "]\"";
            Insert_Update_Delete_Output_StringText += "></asp:SqlDataSource>" + Environment.NewLine;

            Insert_Update_Delete_Output_StringText += "                </td>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "            </tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "        </table>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "        <table width=\"100%\" height=\"auto\" bgcolor=\"Silver\" border=\"3\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "            <tr>" + Environment.NewLine;
            int rowcount = 0;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                if (rowcount == 4)
                {
                    Insert_Update_Delete_Output_StringText += "            </tr>" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "            <tr>" + Environment.NewLine;
                    rowcount = 0;
                }

                if (DB_Type_Array[i] == "byte[]")
                {
                    Insert_Update_Delete_Output_StringText += "                <td style=\"padding: 0px 10px 0px 10px\">" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "            <asp:Label ID=\"" + DB_Array[i] + "_lbl\" runat=\"server\" Text=\"" + DB_Array[i] + ":" + "\"></asp:Label><br /><asp:FileUpload ID=\"FileUpload1\" runat=\"server\" /><br />" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "</td>" + Environment.NewLine;
                }
                else
                {
                    Insert_Update_Delete_Output_StringText += "                <td style=\"padding: 0px 10px 0px 10px\">" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "            <asp:Label ID=\"" + DB_Array[i] + "_lbl\" runat=\"server\" Text=\"" + DB_Array[i] + ":" + "\"></asp:Label><br /><asp:TextBox ID=\"" + DB_Array[i] + "_txt" + "\" runat=\"server\" Text=\"" + DB_Array[i] + "_txt" + "\" Width=\"121px\"></asp:TextBox><br />" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "</td>" + Environment.NewLine;
                }

                rowcount++;
            }
            Insert_Update_Delete_Output_StringText += "            </tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "        </table>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "        <table width=\"100%\" height=\"auto\" bgcolor=\"Silver\" border=\"3\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "            <tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                <td width=\"33%\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                    <asp:Button ID=\"Insert\" runat=\"server\" Text=\"Insert\" BackColor=\"#CC0000\" ForeColor=\"Silver\" Width=\"100%\" OnClick=\"INSERT\" CausesValidation=\"False\" style=\"margin-bottom: 0px\" />" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                </td>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                <td width=\"34%\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                    <asp:Button ID=\"Update\" runat=\"server\" Text=\"Update\" BackColor=\"#CC0000\" ForeColor=\"Silver\" Width=\"100%\" OnClick=\"UPDATE\" CausesValidation=\"False\" />" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                </td>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                <td width=\"34%\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                    <asp:Button ID=\"Delete\" runat=\"server\" Text=\"Delete\" BackColor=\"#CC0000\" ForeColor=\"Silver\" Width=\"100%\" OnClick=\"DELETE\" CausesValidation=\"False\" style=\"margin-bottom: 0px\" />" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                </td>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "            </tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "        </table>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "    </body>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "    </html>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "</asp:Content>" + Environment.NewLine;

        }
        public void GENERATE_SCREEN_C_Insert_Update_Delete(string Table_Name)
        {
            

            //INSERT_UPDATE_DELETE
            //Insert_Update_Delete_C_Output_StringText += "using System;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Collections.Generic;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Linq;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Web;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Web.UI;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Web.UI.WebControls;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Text.RegularExpressions;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Data;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Data.SqlClient;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Configuration;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Diagnostics;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Collections;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Configuration;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Collections.Generic;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Linq;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Data;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Web;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Web.UI;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Web.UI.WebControls;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Web.UI.WebControls.WebParts;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Text.RegularExpressions;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Data.SqlClient;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Web.Security;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Web.UI.HtmlControls;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Xml.Linq;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.IO;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Data;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Linq;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Net.Mail;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Net;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Text;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Xml;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Web.Services;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "using System.Web.Mvc;" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "namespace DMCS.App_Code" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "{" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "public partial class " + Table_Name + "_Insert_Update_Delete : System.Web.UI.Page" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "{" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "            public " + Table_Name + " " + Table_Name + " = new " + Table_Name + "();" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "    protected void Page_Load(object sender, EventArgs e)" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        if (!ClientScript.IsStartupScriptRegistered(\"initialize\"))" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        {" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "            Page.ClientScript.RegisterStartupScript(this.GetType()," + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "                \"initialize\", \"initialize();\", true);" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        }" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        if (!Page.IsPostBack)" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        {   }" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "    protected void ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        try" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        {" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "            disaster disaster = new disaster();" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "            GlobalVariables.DisasterID = Convert.ToInt32(ddlDisaster.SelectedItem.Value);" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        }" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        catch { }" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    protected void Select_Record(object sender, EventArgs e)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "             " + Table_Name + " = " + Table_Name + "_select(Convert.ToInt32(GridView1.SelectedValue));" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    protected void INSERT(object sender, EventArgs e)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "             " + Table_Name + " = " + Table_Name + "_insert();" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    protected void UPDATE(object sender, EventArgs e)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "             " + Table_Name + " = " + Table_Name + "_update(Convert.ToInt32(GridView1.SelectedValue));" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    protected void DELETE(object sender, EventArgs e)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "             " + Table_Name + "_delete(Convert.ToInt32(GridView1.SelectedValue));" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "/////////////////////////////////////////////////////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "/////////////////////////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "//////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "//Methods To Call" + Environment.NewLine;

            Insert_Update_Delete_C_Output_StringText += "    public " + Table_Name + " " + Table_Name + "_select(int ID)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + " = " + Table_Name + ".Select(ID);" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                Insert_Update_Delete_C_Output_StringText += "        " + DB_Array[i] + "_txt.Text = Convert.ToString(" + Table_Name + "." + DB_Array[i] + ");" + Environment.NewLine;
            }
            Insert_Update_Delete_C_Output_StringText += "        return " + Table_Name + ";" + Environment.NewLine;

            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;


            Insert_Update_Delete_C_Output_StringText += "    public " + Table_Name + " " + Table_Name + "_insert()" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            for (int i = 1; i < DB_Array.Length - 1; i++)
            {
                String Cur_Type = "";
                if (DB_Type_Array[i] == "Int32")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToInt32(" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "Double")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToDouble(" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "double")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToDouble(" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "String")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = " + DB_Array[i] + "_txt.Text;" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "Char")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToString(" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "DateTime")
                {
                    Cur_Type = Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToDateTime(" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "Boolean")
                {
                    Cur_Type = Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToBoolean(" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "Decimal")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToDecimal(" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "byte[]")
                {
                    Insert_Update_Delete_C_Output_StringText += "        byte[] uploaded_picture = FileUpload1.FileBytes;" + Environment.NewLine;
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = uploaded_picture;" + Environment.NewLine;
                }

            }
            Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + " = " + Table_Name + ".Insert(" + Table_Name + ");" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        GridView1.DataBind();" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        return Pet;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;

            Insert_Update_Delete_C_Output_StringText += "    public " + Table_Name + " " + Table_Name + "_update(int ID)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + " = " + Table_Name + ".Select(ID);" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                String Cur_Type = "";
                if (DB_Type_Array[i] == "Int32")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToInt32(" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "Double")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToDouble(" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "double")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToDouble(" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "String")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = " + DB_Array[i] + "_txt.Text;" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "Char")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToString(" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "DateTime")
                {
                    Cur_Type = Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToDateTime(" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "Boolean")
                {
                    Cur_Type = Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToBoolean(" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "Decimal")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToDecimal(" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "byte[]")
                {
                    Insert_Update_Delete_C_Output_StringText += "        byte[] uploaded_picture = FileUpload1.FileBytes;" + Environment.NewLine;
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = uploaded_picture;" + Environment.NewLine;
                }
            }
            Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + ".Update(" + Table_Name + ");" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        GridView1.DataBind();" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        return Pet;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;

            Insert_Update_Delete_C_Output_StringText += "    public void " + Table_Name + "_delete(int ID)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + ".Delete(ID);" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        GridView1.DataBind();" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "}" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "}" + Environment.NewLine;




        }




        public Boolean Check_For_Errors()
        {
            Boolean trigger = false;

            if (The_Table_Name.Text == "")
            { ERROR.Text = "DB SCRIPT ERROR: You must include a table name"; return trigger = true; }

            if (DB_Array.Length - 1 != DB_Type_Array.Length - 1)
            {
                ERROR.Text = "There were too many variables ether in the database feild names or the types. Please conferm that they are matching up correctly.";
                return trigger = true;
            }

            if (DB_Names.Text == "")
            { ERROR.Text = "DB SCRIPT ERROR: You must include at least one Database feild name"; return trigger = true; }
            if (DB_Types.Text == "")
            { ERROR.Text = "DB SCRIPT ERROR: You must include at least one Database tyep to match its coresponding feild name"; return trigger = true; }


            if (Include_Create_Table.Checked == false
                & Include_Select.Checked == false
                & Include_Insert.Checked == false
                & Include_Update.Checked == false
                & Include_Delete.Checked == false
                & Include_WC.Checked == false)
            { ERROR.Text = "DB SCRIPT ERROR: You must Select at least one select box to generate code"; return trigger = true; }

            return trigger;
        }
        public Boolean Check_For_Object_Errors()
        {
            Boolean trigger = false;

            if (The_Table_Name.Text == "")
            { ERROR.Text = "OBJECT ERROR: You must include a table name"; return trigger = true; }

            if (DB_Array.Length - 1 != DB_Type_Array.Length - 1 || DB_Array.Length - 1 != Null_Array.Length - 1)
            {
                ERROR.Text = "There were too many variables ether in the database feild names, types, or null/not null text boxes. Please conferm that they are matching up correctly.";
                return trigger = true;
            }

            if (DB_Names.Text == "")
            { ERROR.Text = "OBJECT ERROR: You must include at least one Database feild name"; return trigger = true; }
            if (DB_Types.Text == "")
            { ERROR.Text = "OBJECT ERROR: You must include at least one Database tyep to match its coresponding feild name"; return trigger = true; }

            if (Include_Create_Table.Checked == false
                & Include_Select.Checked == false
                & Include_Insert.Checked == false
                & Include_Update.Checked == false
                & Include_Delete.Checked == false
                & Include_WC.Checked == false)
            { ERROR.Text = "OBJECT ERROR: You must Select at least one select box to generate code"; return trigger = true; }

            return trigger;
        }

        protected void Restart_Click(object sender, EventArgs e)
        {

            Database_Script_Output_StringText = string.Empty;
            Object_Output_StringText = string.Empty;

            Select_Screen_Output_StringText = string.Empty;
            Insert_Screen_Output_StringText = string.Empty;
            Update_Screen_Output_StringText = string.Empty;
            Delete_Screen_Output_StringText = string.Empty;
            Insert_Update_Delete_Output_StringText = string.Empty;

            Select_Screen_C_Output_StringText = string.Empty;
            Insert_Screen_C_Output_StringText = string.Empty;
            Update_Screen_C_Output_StringText = string.Empty;
            Delete_Screen_C_Output_StringText = string.Empty;
            Insert_Update_Delete_C_Output_StringText = string.Empty;


        }
        protected void The_Table_Name_SelectedIndexChanged(object sender, EventArgs e)
        {

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


        /// <summary>
        /// //////////// DOWNLOAD ALL FROM DATABASE - BETA
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Download_All_Click(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Localhost"].ConnectionString);
            SqlCommand sqlcmd = new SqlCommand("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES", conn);
            //try it, catch it, close it, and give away connection.
            try
            {
                conn.Open();
                using (SqlDataReader rdr = sqlcmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        streamDataLikeABoss(rdr["TABLE_NAME"].ToString());
                    }
                }
            }
            catch { }
        }
        public void streamDataLikeABoss(string tableName)
        {
            //create connection and sql commands.  Notice that a connection string is called from the config file.  change connection string to DMCS or local db. 
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Localhost"].ConnectionString);
            SqlCommand sqlcmd = new SqlCommand("SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE Table_Name ='" + tableName + "'", conn);
            DB_Types_String = "";
            //try it, catch it, close it, and give away connection.
            try
            {
                conn.Open();
                using (SqlDataReader rdr = sqlcmd.ExecuteReader())
                {
                    DB_Names_String = null;
                    DB_Types_String = null;
                    Null_Names_String = null;

                    while (rdr.Read())
                    {

                        //append column names
                        DB_Names_String += rdr["COLUMN_NAME"].ToString() + "|";
                        //test for null
                        if (rdr["IS_NULLABLE"].ToString().Equals("YES"))
                            Null_Names_String += "NULL|";
                        else
                            Null_Names_String += "NOT NULL|";
                        //append SQL data types to textbox
                        DB_Types_String += rdr["DATA_TYPE"].ToString() + "|";
                        //test for C# types and append to textbox-->format strings
                        C_Types_String += getCsType((rdr["DATA_TYPE"].ToString().Replace("()", "")).ToLower(), rdr["CHARACTER_MAXIMUM_LENGTH"].ToString()) + "|";
                    }


                    DB_Array = DB_Names_String.Split('|');

                    DB_Type_Array = DB_Types_String.Split('|');

                    Null_Array = Null_Names_String.Split('|');

                    Boolean result;
                    result = Check_For_Errors();

                    if (result == true)
                    { return; }


                    Database_Script_Output_StringText = string.Empty;
                    Object_Output_StringText = string.Empty;

                    Select_Screen_Output_StringText = string.Empty;
                    Insert_Screen_Output_StringText = string.Empty;
                    Update_Screen_Output_StringText = string.Empty;
                    Delete_Screen_Output_StringText = string.Empty;
                    Insert_Update_Delete_Output_StringText = string.Empty;

                    Select_Screen_C_Output_StringText = string.Empty;
                    Insert_Screen_C_Output_StringText = string.Empty;
                    Update_Screen_C_Output_StringText = string.Empty;
                    Delete_Screen_C_Output_StringText = string.Empty;
                    Insert_Update_Delete_C_Output_StringText = string.Empty;


                    if (Include_Create_Table.Checked == true)
                    { GENERATE_DB_SCRIPT_Create_Table(tableName); }

                    if (Include_Select.Checked == true)
                    { GENERATE_DB_SCRIPT_Select(tableName); }

                    if (Include_Insert.Checked == true)
                    { GENERATE_DB_SCRIPT_Insert(tableName); GENERATE_DB_SCRIPT_GET(tableName); }

                    if (Include_Update.Checked == true)
                    { GENERATE_DB_SCRIPT_Update(tableName); }

                    if (Include_Delete.Checked == true)
                    { GENERATE_DB_SCRIPT_Delete(tableName); }

                    if (Include_WC.Checked == true)
                    { GENERATE_DB_SCRIPT_WC(tableName); }

                    result = Check_For_Object_Errors();

                    if (result == true) { return; }

                    DB_Type_Array = C_Types_String.Split('|');
                    GENERATE_OBJECT_Get_Set(tableName);
                    GENERATE_OBJECT_Select(tableName);
                    GENERATE_OBJECT_Insert(tableName);
                    GENERATE_OBJECT_Update(tableName);
                    GENERATE_OBJECT_Delete(tableName);
                    GENERATE_OBJECT_WC(tableName);

                    //Element_Array = Element_Names.Text.Split(',');
                    GENERATE_SCREEN_Select(tableName);
                    GENERATE_SCREEN_C_Select(tableName);
                    GENERATE_SCREEN_Insert(tableName);
                    GENERATE_SCREEN_C_Insert(tableName);
                    GENERATE_SCREEN_Update(tableName);
                    GENERATE_SCREEN_C_Update(tableName);
                    GENERATE_SCREEN_Delete(tableName);
                    GENERATE_SCREEN_C_Delete(tableName);
                    GENERATE_SCREEN_Insert_Update_Delete(tableName);
                    GENERATE_SCREEN_C_Insert_Update_Delete(tableName);

                    try
                    {
                        string path = @"c:\GENERATED_CODE\SCRIPTS";

                        if (!Directory.Exists(path))
                        { Directory.CreateDirectory(path); }

                        path = @"c:\GENERATED_CODE\OBJECTS";

                        if (!Directory.Exists(path))
                        { Directory.CreateDirectory(path); }

                        path = @"c:\GENERATED_CODE\SCREENS";

                        if (!Directory.Exists(path))
                        { Directory.CreateDirectory(path); }

                        File.AppendAllText(@"c:\GENERATED_CODE\SCRIPTS\" + tableName + ".sql", Database_Script_Output_StringText + Environment.NewLine);
                        File.AppendAllText(@"c:\GENERATED_CODE\OBJECTS\" + tableName + ".cs", Object_Output_StringText + Environment.NewLine);
                        File.AppendAllText(@"c:\GENERATED_CODE\SCREENS\" + tableName + "_Select.aspx", Select_Screen_Output_StringText + Environment.NewLine);
                        File.AppendAllText(@"c:\GENERATED_CODE\SCREENS\" + tableName + "_Select.aspx.cs", Select_Screen_C_Output_StringText + Environment.NewLine);
                        File.AppendAllText(@"c:\GENERATED_CODE\SCREENS\" + tableName + "_Insert.aspx", Insert_Screen_Output_StringText + Environment.NewLine);
                        File.AppendAllText(@"c:\GENERATED_CODE\SCREENS\" + tableName + "_Insert.aspx.cs", Insert_Screen_C_Output_StringText + Environment.NewLine);
                        File.AppendAllText(@"c:\GENERATED_CODE\SCREENS\" + tableName + "_Update.aspx", Update_Screen_Output_StringText + Environment.NewLine);
                        File.AppendAllText(@"c:\GENERATED_CODE\SCREENS\" + tableName + "_Update.aspx.cs", Update_Screen_C_Output_StringText + Environment.NewLine);
                        File.AppendAllText(@"c:\GENERATED_CODE\SCREENS\" + tableName + "_Insert_Update_Delete.aspx", Insert_Update_Delete_Output_StringText + Environment.NewLine);
                        File.AppendAllText(@"c:\GENERATED_CODE\SCREENS\" + tableName + "_Insert_Update_Delete.aspx.cs", Insert_Update_Delete_C_Output_StringText + Environment.NewLine);
                        //Response.Write("<script>alert('Your files have been successfull created!                                   (C:/GENERATED_CODE/...)                                                           Your welcome! - Jimmyhax');</script>");
                    }
                    catch
                    { ERROR.Text = "bla bla bla.. Permissions and stuff."; }


                }

                
            }
            catch (SqlException ex)
            {
                //if connection cannot be made...
                Response.Write("<script>alert('Connection to " + ConfigurationManager.ConnectionStrings["Localhost"] + " cannot be established.\n" + ex.Message + "');</script>");
            }
            finally
            {
                //Close and dispose
                conn.Close();
                conn.Dispose();
            }

        }
    }
}