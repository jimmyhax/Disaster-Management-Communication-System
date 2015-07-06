using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.App
{
    public partial class ScriptGenerator : System.Web.UI.Page
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
        script_generator script_generator = new script_generator();
        Boolean Generate_fromDatabase;

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

            DB_Array = DB_Names.Text.Split('|');

            DB_Type_Array = DB_Types.Text.Split('|');

            Null_Array = Null_Names.Text.Split('|');

            Boolean result;
            result = Check_For_Errors();

            if (result == true)
            { return; }


            if (Include_Create_Table.Checked == true)
            { GENERATE_DB_SCRIPT_Create_Table(); }

            if (Include_Select.Checked == true)
            { GENERATE_DB_SCRIPT_Select(); }

            if (Include_Insert.Checked == true)
            { GENERATE_DB_SCRIPT_Insert(); GENERATE_DB_SCRIPT_GET(); }

            if (Include_Update.Checked == true)
            { GENERATE_DB_SCRIPT_Update(); }

            if (Include_Delete.Checked == true)
            { GENERATE_DB_SCRIPT_Delete(); }

            if (Include_WC.Checked == true)
            { GENERATE_DB_SCRIPT_WC(); }

            result = Check_For_Object_Errors();

            if (result == true) { return; }

            DB_Type_Array = C_Types.Text.Split('|');
            GENERATE_OBJECT_Get_Set();
            GENERATE_OBJECT_Select();
            GENERATE_OBJECT_Insert();
            GENERATE_OBJECT_Update();
            GENERATE_OBJECT_Delete();
            GENERATE_OBJECT_WC();

            //Element_Array = Element_Names.Text.Split(',');
            GENERATE_SCREEN_Select();
            GENERATE_SCREEN_C_Select();
            GENERATE_SCREEN_Insert();
            GENERATE_SCREEN_C_Insert();
            GENERATE_SCREEN_Update();
            GENERATE_SCREEN_C_Update();
            GENERATE_SCREEN_Delete();
            GENERATE_SCREEN_C_Delete();
            GENERATE_SCREEN_Insert_Update_Delete();
            GENERATE_SCREEN_C_Insert_Update_Delete();
            //show code on form
            Database_Script_Output.Text = Database_Script_Output_StringText;
            Object_Output.Text = Object_Output_StringText;
            //Select_Screen_Output.Text = Select_Screen_Output_StringText;
            //Select_Screen_C_Output.Text = Select_Screen_C_Output_StringText;
            //Insert_Screen_Output.Text = Insert_Screen_Output_StringText;
            //Insert_Screen_C_Output.Text = Insert_Screen_C_Output_StringText;
            //Update_Screen_Output.Text = Update_Screen_Output_StringText;
            //Update_Screen_C_Output.Text = Update_Screen_C_Output_StringText;
            //Delete_Screen_Output.Text = Delete_Screen_Output_StringText;
            //Delete_Screen_C_Output.Text = Delete_Screen_C_Output_StringText;
            Delete_Screen_C_Output.Text = "Refer to Insert_Update_Delete_Output";
            Select_Screen_Output.Text = "Refer to Insert_Update_Delete_Output";
            Select_Screen_C_Output.Text = "Refer to Insert_Update_Delete_Output";
            Insert_Screen_Output.Text = "Refer to Insert_Update_Delete_Output";
            Insert_Screen_C_Output.Text = "Refer to Insert_Update_Delete_Output";
            Update_Screen_Output.Text = "Refer to Insert_Update_Delete_Output";
            Update_Screen_C_Output.Text = "Refer to Insert_Update_Delete_Output";
            Delete_Screen_Output.Text = "Refer to Insert_Update_Delete_Output";
            Delete_Screen_C_Output.Text = "Refer to Insert_Update_Delete_Output";
            Insert_Update_Delete_Output.Text = Insert_Update_Delete_Output_StringText;
            Insert_Update_Delete_C_Output.Text = Insert_Update_Delete_C_Output_StringText;

            //Create.Visible = false;
            Restart.Visible = true;

        }


        public void GENERATE_DB_SCRIPT_Create_Table()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }

            Database_Script_Output_StringText += "/****** Object:  Table [dbo].[" + Table_Name + "]    Script Date: " + DateTime.Now + " ******/" + Environment.NewLine;
            Database_Script_Output_StringText += "SET ANSI_NULLS ON" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "SET QUOTED_IDENTIFIER ON" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "SET ANSI_PADDING ON" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;
            Database_Script_Output_StringText += "CREATE TABLE [dbo].[" + Table_Name + "](" + Environment.NewLine;

            Database_Script_Output_StringText += "  [" + DB_Array[0] + "] " + DB_Type_Array[0] + " IDENTITY(1,1) " + Null_Array[0] + "," + Environment.NewLine;

            for (int i = 1; i < DB_Array.Length - 1; i++)
            {
                script_generator script_generator = new script_generator();
                script_generator = script_generator.Select(Table_Name, DB_Array[i]);
                //check for percisionable value
                if (script_generator.result == 0)
                {
                    Database_Script_Output_StringText += "  [" + DB_Array[i] + "] " + DB_Type_Array[i] + " " + Null_Array[i] + "," + Environment.NewLine;
                }
                //check for MAX
                else if (script_generator.result == -1)
                {
                    Database_Script_Output_StringText += "  [" + DB_Array[i] + "] " + DB_Type_Array[i] + "(MAX) " + Null_Array[i] + "," + Environment.NewLine;
                }
                //All others
                else
                {
                    Database_Script_Output_StringText += "  [" + DB_Array[i] + "] " + DB_Type_Array[i] + "(" + script_generator.result + ") " + Null_Array[i] + "," + Environment.NewLine;

                }

            }


            Database_Script_Output_StringText += " CONSTRAINT [" + Table_Name + "_" + DB_Array[0] + "_pk] PRIMARY KEY CLUSTERED " + Environment.NewLine;
            Database_Script_Output_StringText += "(" + Environment.NewLine;
            Database_Script_Output_StringText += "	[" + DB_Array[0] + "] ASC" + Environment.NewLine;
            Database_Script_Output_StringText += ")WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]" + Environment.NewLine;
            Database_Script_Output_StringText += ") ON [PRIMARY] " + Environment.NewLine;
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
        public void GENERATE_DB_SCRIPT_Select()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }

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
        public void GENERATE_DB_SCRIPT_Insert()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }


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
            //check to see if tables PK is sequential
            script_generator = script_generator.Check_Identity(Table_Name);
            //if not..
            if (script_generator.result == 0)
            {
                for (int i = 0; i < DB_Array.Length - 1; i++)
                {

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
            }
            else
            {
                for (int i = 1; i < DB_Array.Length - 1; i++)
                {
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
            }

            Database_Script_Output_StringText += "AS" + Environment.NewLine;
            Database_Script_Output_StringText += "BEGIN" + Environment.NewLine;
            Database_Script_Output_StringText += "	-- SET NOCOUNT ON added to prevent extra result sets from" + Environment.NewLine;
            Database_Script_Output_StringText += "	-- interfering with SELECT statements." + Environment.NewLine;
            Database_Script_Output_StringText += "	SET NOCOUNT ON;" + Environment.NewLine;
            for (int i = 1; i < DB_Array.Length - 1; i++)
            {
                if (DB_Type_Array[i] == "varchar" || DB_Type_Array[i] == "char")
                {
                    Database_Script_Output_StringText += "	  IF @" + DB_Array[i] + " = ''" + Environment.NewLine;
                    Database_Script_Output_StringText += "    BEGIN" + Environment.NewLine;
                    Database_Script_Output_StringText += "    SET @" + DB_Array[i] + " = null" + Environment.NewLine;
                    Database_Script_Output_StringText += "    END" + Environment.NewLine;
                }
                else if (DB_Type_Array[i] == "datetime")
                {
                    Database_Script_Output_StringText += "	  IF @" + DB_Array[i] + " = '9/9/1900 12:00:00 AM'" + Environment.NewLine;
                    Database_Script_Output_StringText += "    BEGIN" + Environment.NewLine;
                    Database_Script_Output_StringText += "    SET @" + DB_Array[i] + " = null" + Environment.NewLine;
                    Database_Script_Output_StringText += "    END" + Environment.NewLine;
                }
                else if (DB_Type_Array[i] == "text" || DB_Type_Array[i] == "geography" || DB_Type_Array[i] == "image")
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
            //check to see if tables PK is sequential
            script_generator = script_generator.Check_Identity(Table_Name);
            //if not..
            if (script_generator.result == 0)
            {
                for (int i = 0; i < DB_Array.Length - 1; i++)
                {
                    if (i == 0)
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

                for (int i = 0; i < DB_Array.Length - 1; i++)
                {
                    if (i == 0)
                    {
                        Database_Script_Output_StringText += "            @" + DB_Array[i] + Environment.NewLine;
                    }
                    else
                    {
                        Database_Script_Output_StringText += "           ,@" + DB_Array[i] + Environment.NewLine;
                    }
                }
            }
            else
            {
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
            }
            Database_Script_Output_StringText += "            )" + Environment.NewLine;
            Database_Script_Output_StringText += "END" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;

        }
        public void GENERATE_DB_SCRIPT_Update()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }


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
                if (DB_Type_Array[i] == "varchar" || DB_Type_Array[i] == "char")
                {
                    Database_Script_Output_StringText += "	  IF @" + DB_Array[i] + " = ''" + Environment.NewLine;
                    Database_Script_Output_StringText += "    BEGIN" + Environment.NewLine;
                    Database_Script_Output_StringText += "    SET @" + DB_Array[i] + " = null" + Environment.NewLine;
                    Database_Script_Output_StringText += "    END" + Environment.NewLine;
                }
                else if (DB_Type_Array[i] == "datetime")
                {
                    Database_Script_Output_StringText += "	  IF @" + DB_Array[i] + " = '9/9/1900 12:00:00 AM'" + Environment.NewLine;
                    Database_Script_Output_StringText += "    BEGIN" + Environment.NewLine;
                    Database_Script_Output_StringText += "    SET @" + DB_Array[i] + " = null" + Environment.NewLine;
                    Database_Script_Output_StringText += "    END" + Environment.NewLine;
                }
                else if (DB_Type_Array[i] == "text" || DB_Type_Array[i] == "geography" || DB_Type_Array[i] == "image")
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
        public void GENERATE_DB_SCRIPT_Delete()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }




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
        public void GENERATE_DB_SCRIPT_GET()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }



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
                if (DB_Type_Array[i] == "varchar" || DB_Type_Array[i] == "char")
                {
                    Database_Script_Output_StringText += "	  IF @" + DB_Array[i] + " = ''" + Environment.NewLine;
                    Database_Script_Output_StringText += "    BEGIN" + Environment.NewLine;
                    Database_Script_Output_StringText += "    SET @" + DB_Array[i] + " = null" + Environment.NewLine;
                    Database_Script_Output_StringText += "    END" + Environment.NewLine;
                }
                else if (DB_Type_Array[i] == "datetime")
                {
                    Database_Script_Output_StringText += "	  IF @" + DB_Array[i] + " = '9/9/1900 12:00:00 AM'" + Environment.NewLine;
                    Database_Script_Output_StringText += "    BEGIN" + Environment.NewLine;
                    Database_Script_Output_StringText += "    SET @" + DB_Array[i] + " = null" + Environment.NewLine;
                    Database_Script_Output_StringText += "    END" + Environment.NewLine;
                }
                else if (DB_Type_Array[i] == "text" || DB_Type_Array[i] == "geography" || DB_Type_Array[i] == "image")
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
                    if (DB_Type_Array[i] != "geography" && DB_Type_Array[i] != "image" && Null_Array[i] == "NOT NULL")
                    {
                        Database_Script_Output_StringText += "       WHERE ([" + DB_Array[i] + "] " + Equal_Sign + " @" + DB_Array[i] + ")" + Environment.NewLine;
                    }
                    else if (DB_Type_Array[i] != "geography" && DB_Type_Array[i] != "image" && Null_Array[i] == "NULL")
                    {
                        Database_Script_Output_StringText += "       WHERE ([" + DB_Array[i] + "] " + Equal_Sign + " @" + DB_Array[i] + " or [" + DB_Array[i] + "] is null)" + Environment.NewLine;
                    }
                }
                else
                {
                    if (DB_Type_Array[i] != "geography" && DB_Type_Array[i] != "image" && Null_Array[i] == "NOT NULL")
                    {
                        Database_Script_Output_StringText += "       AND ([" + DB_Array[i] + "] " + Equal_Sign + " @" + DB_Array[i] + ")" + Environment.NewLine;
                    }
                    else if (DB_Type_Array[i] != "geography" && DB_Type_Array[i] != "image" && Null_Array[i] == "NULL")
                    {
                        Database_Script_Output_StringText += "       AND ([" + DB_Array[i] + "] " + Equal_Sign + " @" + DB_Array[i] + " or [" + DB_Array[i] + "] is null)" + Environment.NewLine;
                    }
                }
            }

            Database_Script_Output_StringText += "END" + Environment.NewLine;
            Database_Script_Output_StringText += "GO" + Environment.NewLine;







        }
        public void GENERATE_DB_SCRIPT_WC()
        {

            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }



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



        }




        public void GENERATE_OBJECT_Get_Set()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }



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
        public void GENERATE_OBJECT_Select()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }




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
                if (DB_Type_Array[i] == "geography") { Cur_Type = "rdr.GetString(" + i + ");"; }
                if (DB_Type_Array[i] == "String") { Cur_Type = "rdr.GetString(" + i + ");"; }
                if (DB_Type_Array[i] == "Char") { Cur_Type = "rdr.GetString(" + i + ");"; }
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
                if (DB_Type_Array[i] == "geography") { Cur_Type = "\" \""; }
                if (DB_Type_Array[i] == "String") { Cur_Type = "\" \""; }
                if (DB_Type_Array[i] == "Char") { Cur_Type = "\" \""; }
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
        public void GENERATE_OBJECT_Insert()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }

            //INSERT
            Object_Output_StringText += "    public " + Table_Name + " Insert(" + Table_Name + " id)" + Environment.NewLine;
            Object_Output_StringText += "    {" + Environment.NewLine;
            Object_Output_StringText += "        string ConnectionString = IDManager.connection();" + Environment.NewLine;
            Object_Output_StringText += "        SqlConnection con = new SqlConnection(ConnectionString);" + Environment.NewLine;
            Object_Output_StringText += "        try" + Environment.NewLine;
            Object_Output_StringText += "        {" + Environment.NewLine;
            Object_Output_StringText += "            con.Open();" + Environment.NewLine;
            Object_Output_StringText += "            SqlCommand cmd = new SqlCommand(\"SP_DMCS_INSERT_" + Table_Name.ToUpper() + "\", con);" + Environment.NewLine;
            Object_Output_StringText += "            cmd.CommandType = System.Data.CommandType.StoredProcedure;" + Environment.NewLine;
            //check to see if tables PK is sequential
            script_generator = script_generator.Check_Identity(Table_Name);
            //if not..
            if (script_generator.result == 0)
            {
                for (int i = 0; i < DB_Array.Length - 1; i++)
                {
                    Object_Output_StringText += "            cmd.Parameters.AddWithValue(\"" + "@" + DB_Array[i] + "\", id." + DB_Array[i] + ");" + Environment.NewLine;
                }
            }
            else
            {
                for (int i = 1; i < DB_Array.Length - 1; i++)
                {
                    Object_Output_StringText += "            cmd.Parameters.AddWithValue(\"" + "@" + DB_Array[i] + "\", id." + DB_Array[i] + ");" + Environment.NewLine;
                }
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
        public void GENERATE_OBJECT_Update()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }

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
        public void GENERATE_OBJECT_Delete()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }

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
        public void GENERATE_OBJECT_WC()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }

            //Select_WC
            Object_Output_StringText += "    public DataTable Select(string whereclause)" + Environment.NewLine;
            Object_Output_StringText += "    {" + Environment.NewLine;
            Object_Output_StringText += "        DataTable alrows = new DataTable();" + Environment.NewLine;
            Object_Output_StringText += "        string ConnectionString = IDManager.connection();" + Environment.NewLine;
            Object_Output_StringText += "        SqlConnection con = new SqlConnection(ConnectionString);" + Environment.NewLine;
            Object_Output_StringText += "        try" + Environment.NewLine;
            Object_Output_StringText += "        {" + Environment.NewLine;
            Object_Output_StringText += "            con.Open();" + Environment.NewLine;
            Object_Output_StringText += "            SqlCommand cmd = new SqlCommand(\"SP_DMCS_SELECT_" + Table_Name.ToUpper() + "_WC\", con);" + Environment.NewLine;
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



        public void GENERATE_SCREEN_Select()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }

            //SELECT  

            Select_Screen_Output_StringText += "<%@ Page Title=\"\" Language=\"C#\" MasterPageFile=\"~/Site.Master\" AutoEventWireup=\"true\" CodeBehind=\"" + Table_Name + "_Select.aspx.cs\" Inherits=\"DMCS." + Table_Name + "_Select\" %>" + Environment.NewLine;
            Select_Screen_Output_StringText += "<asp:Content ID=\"Content1\" ContentPlaceHolderID=\"HeadContent\" runat=\"server\">" + Environment.NewLine;
            Select_Screen_Output_StringText += "</asp:Content>" + Environment.NewLine;
            Select_Screen_Output_StringText += "<asp:Content ID=\"Content2\" ContentPlaceHolderID=\"FeaturedContent\" runat=\"server\">" + Environment.NewLine;ConnectionStrings:
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
            Select_Screen_Output_StringText += "         <asp:SqlDataSource ID=\"SqlDataSource1\" runat=\"server\" ConnectionString=\"<%$ ConnectionStrings:DefaultConnection %>\" SelectCommand=\"SELECT [disaster_id], [disaster_name] FROM [disaster]\"></asp:SqlDataSource>" + Environment.NewLine;
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
            Select_Screen_Output_StringText += "                    <asp:SqlDataSource runat=\"server\" ID=\"SqlDataSource2\" ConnectionString=\"<%$ ConnectionStrings:DefaultConnection %>\" SelectCommand= \"SELECT";
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
        public void GENERATE_SCREEN_C_Select()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }

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
        public void GENERATE_SCREEN_Insert()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }

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
            Insert_Screen_Output_StringText += "         <asp:SqlDataSource ID=\"SqlDataSource1\" runat=\"server\" ConnectionString=\"<%$ ConnectionStrings:DefaultConnection %>\" SelectCommand=\"SELECT [disaster_id], [disaster_name] FROM [disaster]\"></asp:SqlDataSource>" + Environment.NewLine;
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
            Insert_Screen_Output_StringText += "                    <asp:SqlDataSource runat=\"server\" ID=\"SqlDataSource2\" ConnectionString=\"<%$ ConnectionStrings:DefaultConnection %>\" SelectCommand= \"SELECT";
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
        public void GENERATE_SCREEN_C_Insert()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }

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
        public void GENERATE_SCREEN_Update()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }

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
            Update_Screen_Output_StringText += "         <asp:SqlDataSource ID=\"SqlDataSource1\" runat=\"server\" ConnectionString=\"<%$ ConnectionStrings:DefaultConnection %>\" SelectCommand=\"SELECT [disaster_id], [disaster_name] FROM [disaster]\"></asp:SqlDataSource>" + Environment.NewLine;
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
            Update_Screen_Output_StringText += "                    <asp:SqlDataSource runat=\"server\" ID=\"SqlDataSource2\" ConnectionString=\"<%$ ConnectionStrings:DefaultConnection %>\" SelectCommand= \"SELECT";
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
        public void GENERATE_SCREEN_C_Update()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }

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
        public void GENERATE_SCREEN_Delete()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }

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
            Delete_Screen_Output_StringText += "         <asp:SqlDataSource ID=\"SqlDataSource1\" runat=\"server\" ConnectionString=\"<%$ ConnectionStrings:DefaultConnection %>\" SelectCommand=\"SELECT [disaster_id], [disaster_name] FROM [disaster]\"></asp:SqlDataSource>" + Environment.NewLine;
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
            Delete_Screen_Output_StringText += "                    <asp:SqlDataSource runat=\"server\" ID=\"SqlDataSource2\" ConnectionString=\"<%$ ConnectionStrings:DefaultConnection %>\" SelectCommand= \"SELECT";
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
        public void GENERATE_SCREEN_C_Delete()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }

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
        public void GENERATE_SCREEN_Insert_Update_Delete()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }


            //INSERT_UPDATE_DELETE
            Insert_Update_Delete_Output_StringText += "<%@ Page Title=\"\" Language=\"C#\" MasterPageFile=\"~/Site.Master\" AutoEventWireup=\"false\" CodeBehind=\"" + Table_Name + ".aspx.cs\" Inherits=\"DMCS." + Table_Name + "_\" %>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "<asp:Content ID=\"Content1\" ContentPlaceHolderID=\"HeadContent\" runat=\"server\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "</asp:Content>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "<asp:Content ID=\"Content2\" ContentPlaceHolderID=\"FeaturedContent\" runat=\"server\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "</asp:Content>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "<asp:Content ID=\"Content3\" ContentPlaceHolderID=\"MainContent\" runat=\"server\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "    <!DOCTYPE html>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "    <html>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "    <head>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "        <meta name=\"viewport\" content=\"initial-scale=1.0, user-scalable=no\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "        <meta charset=\"utf-8\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "        <title>TITLE NAME</title>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "    </head>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "    <body>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "        <div style=\"width: 100%; height: 100%; font-family: 'Calibri Light';\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "        <asp:TabContainer ID=\"MyAjaxTabContainer\" runat=\"server\" UseVerticalStripPlacement=\"false\" ActiveTabIndex=\"2\" Visible=\"True\" BackColor=\"#e75050\" ForeColor=\"#333333\" BorderColor=\"#E75050\" BorderStyle=\"Double\" BorderWidth=\"10px\">" + Environment.NewLine;
            //INSERT TAB
            Insert_Update_Delete_Output_StringText += "                <asp:TabPanel ID=\"Insert_Tab_Panel\" runat=\"server\" HeaderText=\"Insert\" Enabled=\"true\" ScrollBars=\"Auto\" BackColor=\"#EFEEEF\" BorderColor=\"#666666\" BorderStyle=\"Solid\" EnableTheming=\"True\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                    <ContentTemplate>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                        <div>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            <table width=\"100%\" bgcolor=\"#e2e2e2\" border=\"3\" style=\"font-family: 'Calibri Light'\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                <tr>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                                    <td width=\"20%\" height=\"50px\" style=\"border-style: none; padding: 0px 10px 0px 10px;\" align=\"left\">" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                                        <asp:Label ID=\"Insert_Label2\" runat=\"server\" Text=\"Select a Disaster: \" Font-Size=\"Large\" ForeColor=\"Black\"></asp:Label>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                                        <asp:DropDownList ID=\"Insert_ddlDisaster\" runat=\"server\" Height=\"24px\" Width=\"240px\" OnSelectedIndexChanged=\"Insert_ddlDisaster_SelectedIndexChanged\" AutoPostBack=\"True\" DataSourceID=\"Insert_SqlDataSource1\" DataTextField=\"disaster_name\" DataValueField=\"disaster_id\" Style=\"margin-left: 0px\" Font-Bold=\"True\"></asp:DropDownList>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                                        <asp:SqlDataSource ID=\"Insert_SqlDataSource1\" runat=\"server\" ConnectionString=\"<%$ ConnectionStrings:DefaultConnection %>\" SelectCommand=\"SELECT [disaster_id], [disaster_name] FROM [disaster]\"></asp:SqlDataSource>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                                    </td>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    <td width=\"100%\" style=\"border-style: none; padding: 0px 10px 0px 10px;\" align=\"Center\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        <asp:Label ID=\"Insert_Label1\" runat=\"server\" Text=\"HEADER TEXT\" Font-Bold=\"True\" Font-Size=\"X-Large\"></asp:Label>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    </td>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                </tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            </table>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            <table width=\"100%\" height=\"100%\" bgcolor=\"#e2e2e2\" border=\"3\" style=\"font-family: 'Calibri Light'\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                <tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    <td style=\"padding: 10px 0px 0px 0px\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        <asp:GridView ID=\"Insert_" + Table_Name + "_GridView\" Style=\"border-style: solid none none none;\" " + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            Font-Size=\"Medium\" runat=\"server\" DataSourceID=\"Insert_SqlDataSource2\" AutoGenerateColumns=\"False\" " + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            DataKeyNames=\"" + DB_Array[0] + "\" BackColor=\"#CCCCCC\" BorderColor=\"#666666\" BorderStyle=\"Solid\" " + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            BorderWidth=\"3px\" CellPadding=\"4\" CellSpacing=\"2\" ForeColor=\"#1A1A1A\" Width=\"100%\" " + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            OnSelectedIndexChanged=\"Insert_Select_Record\" AllowPaging=\"True\" Font-Bold=\"False\" " + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            Font-Italic=\"False\" Font-Names=\"Calibri Light\" Font-Overline=\"False\" OnRowDataBound=\"RowDataBound\"" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            Font-Underline=\"False\" GridLines=\"Horizontal\" HorizontalAlign=\"Center\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <AlternatingRowStyle BackColor=\"Gray\" Font-Underline=\"False\" ForeColor=\"White\" />" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <Columns>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                                <asp:CommandField ShowSelectButton=\"True\"></asp:CommandField>" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                if (DB_Type_Array[i] != "byte[]")
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
                else
                {
                    if (i < 3)
                    {
                        Insert_Update_Delete_Output_StringText += "                            <asp:ImageField DataImageUrlField = \"" + DB_Array[0] + "\" DataImageUrlFormatString = \"~/Images/ShowImage.aspx?Table_Name=" + Table_Name + "&Image_Name=" + DB_Array[i] + "&ID=" + DB_Array[0] + "={0}\" ControlStyle-Width = \"150\" ControlStyle-Height = \"100\" HeaderText = \"Preview Image\"/>" + Environment.NewLine;
                    }
                    else
                    {
                        Insert_Update_Delete_Output_StringText += "                            <asp:ImageField DataImageUrlField = \"" + DB_Array[0] + "\" DataImageUrlFormatString = \"~/Images/ShowImage.aspx?Table_Name=" + Table_Name + "&Image_Name=" + DB_Array[i] + "&ID=" + DB_Array[0] + "={0}\" ControlStyle-Width = \"150\" ControlStyle-Height = \"100\" HeaderText = \"Preview Image\" Visible=\"false\" />" + Environment.NewLine;
                    }
                }
            }
            Insert_Update_Delete_Output_StringText += "                                            </Columns>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <FooterStyle BackColor=\"#CCCCCC\"></FooterStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <HeaderStyle BackColor=\"#EA5151\" ForeColor=\"White\" Font-Size=\"Medium\"></HeaderStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <PagerStyle HorizontalAlign=\"Center\" BackColor=\"#CCCCCC\" ForeColor=\"Black\"></PagerStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <RowStyle BackColor=\"#EFEEEF\" Font-Size=\"Medium\"></RowStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <SelectedRowStyle BackColor=\"#EA5151\" Font-Bold=\"True\" ForeColor=\"White\"></SelectedRowStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <SortedAscendingCellStyle BackColor=\"#F1F1F1\"></SortedAscendingCellStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <SortedAscendingHeaderStyle BackColor=\"Gray\"></SortedAscendingHeaderStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <SortedDescendingCellStyle BackColor=\"#CAC9C9\"></SortedDescendingCellStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <SortedDescendingHeaderStyle BackColor=\"#383838\"></SortedDescendingHeaderStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        </asp:GridView>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                    <asp:SqlDataSource runat=\"server\" ID=\"Insert_SqlDataSource2\" ConnectionString=\"<%$ ConnectionStrings:DefaultConnection %>\" SelectCommand= \"SELECT";
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
            Insert_Update_Delete_Output_StringText += "                                    </td>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                </tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            </table>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            <asp:Panel ID=\"Insert_" + Table_Name + "_InfoHead\" runat=\"server\" ForeColor=\"#EFEEEF\" Height=\"25px\" BackImageUrl=\"~/Images/panelheader1.jpg\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                <asp:Label ID=\"Insert_" + Table_Name + "_InfoHead_label\" Style=\"padding: 10px\" runat=\"server\" Text=\"" + Table_Name + " Information\" Font-Size=\"Large\"></asp:Label>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            </asp:Panel>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            <asp:Panel ID=\"Insert_" + Table_Name + "_InfoBody\" runat=\"server\" style=\"overflow:hidden;\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                <div>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    <table width=\"100%\" height=\"auto\" bgcolor=\"#666666\" border=\"3\" style=\"font-family: 'Calibri Light'; color: #E2E2E2;\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        <tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <th colspan=\"4\" style=\"padding: 5px 10px 5px 10px; background-color: #aaaaaa;\" width=\"100%\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                                <asp:Label ID=\"Insert_Label3\" runat=\"server\" Font-Bold=\"False\" Font-Size=\"Large\" ForeColor=\"#333333\" Text=\"SECTION HEADER\"></asp:Label>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            </th>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                             <tr>" + Environment.NewLine;
            int rowcount = 0;
            for (int i = 1; i < DB_Array.Length - 1; i++)
            {
                if (rowcount == 4)
                {
                    Insert_Update_Delete_Output_StringText += "                                             </tr>" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                             <tr>" + Environment.NewLine;
                    rowcount = 0;
                }

                if (DB_Type_Array[i] == "byte[]")
                {
                    Insert_Update_Delete_Output_StringText += "                                                 <td style=\"padding: 20px 10px 10px 10px\">" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <asp:Label ID=\"Insert_" + DB_Array[i] + "_lbl\" runat=\"server\" Font-Size=\"Large\" Text=\"" + DB_Array[i] + ":" + "\"></asp:Label>" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <br />" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <asp:Image ID=\"Insert_" + DB_Array[i] + "_Image\" runat=\"server\" ImageUrl=\"~/Images/Default_Person.jpg\" />" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <asp:FileUpload ID=\"Insert_" + DB_Array[i] + "_FileUpload\" runat=\"server\" />" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                 </td>" + Environment.NewLine;
                }
                else
                {
                    Insert_Update_Delete_Output_StringText += "                                                 <td style=\"padding: 20px 10px 10px 10px\">" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <asp:Label ID=\"Insert_" + DB_Array[i] + "_lbl\" runat=\"server\" Font-Size=\"Large\" Text=\"" + DB_Array[i] + ":" + "\"></asp:Label>" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <br />" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <asp:TextBox ID=\"Insert_" + DB_Array[i] + "_txt" + "\" runat=\"server\" Text=\"\" Width=\"121px\"></asp:TextBox>" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <br />" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                 </td>" + Environment.NewLine;
                }

                rowcount++;
            }
            Insert_Update_Delete_Output_StringText += "                                            </tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        </tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    </table>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    <table width=\"100%\" height=\"auto\" bgcolor=\"#e2e2e2\" style=\"font-family: 'Calibri Light'\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        <tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <td style=\"padding: 0px 0px 0px 0px\" width=\"100%\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                                <asp:Button ID=\"Insert_btn\" runat=\"server\" Font-Size=\"Large\" Text=\"Insert\" BackColor=\"#EA5151\" ForeColor=\"#E2E2E2\" Width=\"100%\" OnClick=\"INSERT\" CausesValidation=\"False\" Style=\"margin-bottom: 0px; margin-top: 0px; border-style: solid none none none;\" BorderColor=\"#666666\" BorderWidth=\"3px\" />" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            </td>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        </tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    </table>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                </div>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            </asp:Panel>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            <asp:CollapsiblePanelExtender ID=\"Insert_cpe" + Table_Name + "Info\" runat=\"server\" CollapseControlID=\"Insert_" + Table_Name + "_InfoHead\" CollapsedText=\"Show " + Table_Name + " Information\" Enabled=\"True\" ExpandControlID=\"Insert_" + Table_Name + "_InfoHead\" ExpandedText=\"" + Table_Name + " Information\" TargetControlID=\"Insert_" + Table_Name + "_InfoBody\" TextLabelID=\"Insert_" + Table_Name + "_InfoHead_label\"></asp:CollapsiblePanelExtender>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                        </div>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                    </ContentTemplate>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                </asp:TabPanel>" + Environment.NewLine;

            //UPDATE TAB
            Insert_Update_Delete_Output_StringText += "                <asp:TabPanel ID=\"Update_Tab_Panel\" runat=\"server\" HeaderText=\"Update\" Enabled=\"true\" ScrollBars=\"Auto\" BackColor=\"#EFEEEF\" BorderColor=\"#666666\" BorderStyle=\"Solid\" EnableTheming=\"True\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                    <ContentTemplate>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                        <div>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            <table width=\"100%\" bgcolor=\"#e2e2e2\" border=\"3\" style=\"font-family: 'Calibri Light'\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                <tr>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                                    <td width=\"20%\" height=\"50px\" style=\"border-style: none; padding: 0px 10px 0px 10px;\" align=\"left\">" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                                        <asp:Label ID=\"Update_Label2\" runat=\"server\" Text=\"Select a Disaster: \" Font-Size=\"Large\" ForeColor=\"Black\"></asp:Label>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                                        <asp:DropDownList ID=\"Update_ddlDisaster\" runat=\"server\" Height=\"24px\" Width=\"240px\" OnSelectedIndexChanged=\"Update_ddlDisaster_SelectedIndexChanged\" AutoPostBack=\"True\" DataSourceID=\"Update_SqlDataSource1\" DataTextField=\"disaster_name\" DataValueField=\"disaster_id\" Style=\"margin-left: 0px\" Font-Bold=\"True\"></asp:DropDownList>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                                        <asp:SqlDataSource ID=\"Update_SqlDataSource1\" runat=\"server\" ConnectionString=\"<%$ ConnectionStrings:DefaultConnection %>\" SelectCommand=\"SELECT [disaster_id], [disaster_name] FROM [disaster]\"></asp:SqlDataSource>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                                    </td>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    <td width=\"100%\" style=\"border-style: none; padding: 0px 10px 0px 10px;\" align=\"Center\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        <asp:Label ID=\"Update_Label1\" runat=\"server\" Text=\"HEADER TEXT\" Font-Bold=\"True\" Font-Size=\"X-Large\"></asp:Label>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    </td>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                </tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            </table>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            <table width=\"100%\" height=\"100%\" bgcolor=\"#e2e2e2\" border=\"3\" style=\"font-family: 'Calibri Light'\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                <tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    <td style=\"padding: 10px 0px 0px 0px\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        <asp:GridView ID=\"Update_" + Table_Name + "_GridView\" Style=\"border-style: solid none none none;\" " + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            Font-Size=\"Medium\" runat=\"server\" DataSourceID=\"Update_SqlDataSource2\" AutoGenerateColumns=\"False\" " + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            DataKeyNames=\"" + DB_Array[0] + "\" BackColor=\"#CCCCCC\" BorderColor=\"#666666\" BorderStyle=\"Solid\" " + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            BorderWidth=\"3px\" CellPadding=\"4\" CellSpacing=\"2\" ForeColor=\"#1A1A1A\" Width=\"100%\" " + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            OnSelectedIndexChanged=\"Update_Select_Record\" AllowPaging=\"True\" Font-Bold=\"False\" " + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            Font-Italic=\"False\" Font-Names=\"Calibri Light\" Font-Overline=\"False\" OnRowDataBound=\"RowDataBound\"" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            Font-Underline=\"False\" GridLines=\"Horizontal\" HorizontalAlign=\"Center\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <AlternatingRowStyle BackColor=\"Gray\" Font-Underline=\"False\" ForeColor=\"White\" />" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <Columns>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                                <asp:CommandField ShowSelectButton=\"True\"></asp:CommandField>" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                if (DB_Type_Array[i] != "byte[]")
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
                else
                {
                    if (i < 3)
                    {
                        Insert_Update_Delete_Output_StringText += "                            <asp:ImageField DataImageUrlField = \"" + DB_Array[0] + "\" DataImageUrlFormatString = \"~/Images/ShowImage.aspx?Table_Name=" + Table_Name + "&Image_Name=" + DB_Array[i] + "&ID=" + DB_Array[0] + "={0}\" ControlStyle-Width = \"150\" ControlStyle-Height = \"100\" HeaderText = \"Preview Image\"/>" + Environment.NewLine;
                    }
                    else
                    {
                        Insert_Update_Delete_Output_StringText += "                            <asp:ImageField DataImageUrlField = \"" + DB_Array[0] + "\" DataImageUrlFormatString = \"~/Images/ShowImage.aspx?Table_Name=" + Table_Name + "&Image_Name=" + DB_Array[i] + "&ID=" + DB_Array[0] + "={0}\" ControlStyle-Width = \"150\" ControlStyle-Height = \"100\" HeaderText = \"Preview Image\" Visible=\"false\" />" + Environment.NewLine;
                    }
                }
            }
            Insert_Update_Delete_Output_StringText += "                                            </Columns>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <FooterStyle BackColor=\"#CCCCCC\"></FooterStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <HeaderStyle BackColor=\"#EA5151\" ForeColor=\"White\" Font-Size=\"Medium\"></HeaderStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <PagerStyle HorizontalAlign=\"Center\" BackColor=\"#CCCCCC\" ForeColor=\"Black\"></PagerStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <RowStyle BackColor=\"#EFEEEF\" Font-Size=\"Medium\"></RowStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <SelectedRowStyle BackColor=\"#EA5151\" Font-Bold=\"True\" ForeColor=\"White\"></SelectedRowStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <SortedAscendingCellStyle BackColor=\"#F1F1F1\"></SortedAscendingCellStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <SortedAscendingHeaderStyle BackColor=\"Gray\"></SortedAscendingHeaderStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <SortedDescendingCellStyle BackColor=\"#CAC9C9\"></SortedDescendingCellStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <SortedDescendingHeaderStyle BackColor=\"#383838\"></SortedDescendingHeaderStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        </asp:GridView>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                    <asp:SqlDataSource runat=\"server\" ID=\"Update_SqlDataSource2\" ConnectionString=\"<%$ ConnectionStrings:DefaultConnection %>\" SelectCommand= \"SELECT";
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
            Insert_Update_Delete_Output_StringText += "                                    </td>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                </tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            </table>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            <asp:Panel ID=\"Update_" + Table_Name + "_InfoHead\" runat=\"server\" ForeColor=\"#EFEEEF\" Height=\"25px\" BackImageUrl=\"~/Images/panelheader1.jpg\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                <asp:Label ID=\"Update_" + Table_Name + "_InfoHead_label\" Style=\"padding: 10px\" runat=\"server\" Text=\"" + Table_Name + " Information\" Font-Size=\"Large\"></asp:Label>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            </asp:Panel>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            <asp:Panel ID=\"Update_" + Table_Name + "_InfoBody\" runat=\"server\" style=\"overflow:hidden;\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                <div>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    <table width=\"100%\" height=\"auto\" bgcolor=\"#666666\" border=\"3\" style=\"font-family: 'Calibri Light'; color: #E2E2E2;\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        <tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <th colspan=\"4\" style=\"padding: 5px 10px 5px 10px; background-color: #aaaaaa;\" width=\"100%\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                                <asp:Label ID=\"Update_Label3\" runat=\"server\" Font-Bold=\"False\" Font-Size=\"Large\" ForeColor=\"#333333\" Text=\"SECTION HEADER\"></asp:Label>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            </th>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                             <tr>" + Environment.NewLine;
            rowcount = 0;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                if (rowcount == 4)
                {
                    Insert_Update_Delete_Output_StringText += "                                             </tr>" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                             <tr>" + Environment.NewLine;
                    rowcount = 0;
                }

                if (DB_Type_Array[i] == "byte[]")
                {
                    Insert_Update_Delete_Output_StringText += "                                                 <td style=\"padding: 20px 10px 10px 10px\">" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <asp:Label ID=\"Update_" + DB_Array[i] + "_lbl\" runat=\"server\" Font-Size=\"Large\" Text=\"" + DB_Array[i] + ":" + "\"></asp:Label>" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <br />" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <asp:Image ID=\"Update_" + DB_Array[i] + "_Image\" runat=\"server\" ImageUrl=\"~/Images/Default_Person.jpg\" />" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <asp:FileUpload ID=\"Update_" + DB_Array[i] + "_FileUpload\" runat=\"server\" />" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                 </td>" + Environment.NewLine;
                }
                else
                {
                    Insert_Update_Delete_Output_StringText += "                                                 <td style=\"padding: 20px 10px 10px 10px\">" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <asp:Label ID=\"Update_" + DB_Array[i] + "_lbl\" runat=\"server\" Font-Size=\"Large\" Text=\"" + DB_Array[i] + ":" + "\"></asp:Label>" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <br />" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <asp:TextBox ID=\"Update_" + DB_Array[i] + "_txt" + "\" runat=\"server\" Text=\"\" Width=\"121px\"></asp:TextBox>" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <br />" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                 </td>" + Environment.NewLine;
                }

                rowcount++;
            }
            Insert_Update_Delete_Output_StringText += "                                            </tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        </tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    </table>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    <table width=\"100%\" height=\"auto\" bgcolor=\"#e2e2e2\" style=\"font-family: 'Calibri Light'\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        <tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <td style=\"padding: 0px 0px 0px 0px\" width=\"100%\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                                <asp:Button ID=\"Update_btn\" runat=\"server\" Font-Size=\"Large\" Text=\"Update\" BackColor=\"#EA5151\" ForeColor=\"#E2E2E2\" Width=\"100%\" OnClick=\"UPDATE\" CausesValidation=\"False\" Style=\"margin-bottom: 0px; margin-top: 0px; border-style: solid none none none;\" BorderColor=\"#666666\" BorderWidth=\"3px\" />" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            </td>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        </tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    </table>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                </div>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            </asp:Panel>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            <asp:CollapsiblePanelExtender ID=\"Update_cpe" + Table_Name + "Info\" runat=\"server\" CollapseControlID=\"Update_" + Table_Name + "_InfoHead\" CollapsedText=\"Show " + Table_Name + " Information\" Enabled=\"True\" ExpandControlID=\"Update_" + Table_Name + "_InfoHead\" ExpandedText=\"" + Table_Name + " Information\" TargetControlID=\"Update_" + Table_Name + "_InfoBody\" TextLabelID=\"Update_" + Table_Name + "_InfoHead_label\"></asp:CollapsiblePanelExtender>" + Environment.NewLine;

            Insert_Update_Delete_Output_StringText += "                        </div>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                    </ContentTemplate>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                </asp:TabPanel>" + Environment.NewLine;
            //DELETE TAB
            Insert_Update_Delete_Output_StringText += "                <asp:TabPanel ID=\"Delete_Tab_Panel\" runat=\"server\" HeaderText=\"Delete\" Enabled=\"true\" ScrollBars=\"Auto\" BackColor=\"#EFEEEF\" BorderColor=\"#666666\" BorderStyle=\"Solid\" EnableTheming=\"True\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                    <ContentTemplate>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                        <div>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            <table width=\"100%\" bgcolor=\"#e2e2e2\" border=\"3\" style=\"font-family: 'Calibri Light'\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                <tr>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                                    <td width=\"20%\" height=\"50px\" style=\"border-style: none; padding: 0px 10px 0px 10px;\" align=\"left\">" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                                        <asp:Label ID=\"Delete_Label2\" runat=\"server\" Text=\"Select a Disaster: \" Font-Size=\"Large\" ForeColor=\"Black\"></asp:Label>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                                        <asp:DropDownList ID=\"Delete_ddlDisaster\" runat=\"server\" Height=\"24px\" Width=\"240px\" OnSelectedIndexChanged=\"Delete_ddlDisaster_SelectedIndexChanged\" AutoPostBack=\"True\" DataSourceID=\"Delete_SqlDataSource1\" DataTextField=\"disaster_name\" DataValueField=\"disaster_id\" Style=\"margin-left: 0px\" Font-Bold=\"True\"></asp:DropDownList>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                                        <asp:SqlDataSource ID=\"Delete_SqlDataSource1\" runat=\"server\" ConnectionString=\"<%$ ConnectionStrings:DefaultConnection %>\" SelectCommand=\"SELECT [disaster_id], [disaster_name] FROM [disaster]\"></asp:SqlDataSource>" + Environment.NewLine;
            //Insert_Update_Delete_Output_StringText += "                                    </td>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    <td width=\"100%\" style=\"border-style: none; padding: 0px 10px 0px 10px;\" align=\"Center\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        <asp:Label ID=\"Delete_Label1\" runat=\"server\" Text=\"HEADER TEXT\" Font-Bold=\"True\" Font-Size=\"X-Large\"></asp:Label>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    </td>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                </tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            </table>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            <table width=\"100%\" height=\"100%\" bgcolor=\"#e2e2e2\" border=\"3\" style=\"font-family: 'Calibri Light'\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                <tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    <td style=\"padding: 10px 0px 0px 0px\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        <asp:GridView ID=\"Delete_" + Table_Name + "_GridView\" Style=\"border-style: solid none none none;\" " + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            Font-Size=\"Medium\" runat=\"server\" DataSourceID=\"Delete_SqlDataSource2\" AutoGenerateColumns=\"False\" " + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            DataKeyNames=\"" + DB_Array[0] + "\" BackColor=\"#CCCCCC\" BorderColor=\"#666666\" BorderStyle=\"Solid\" " + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            BorderWidth=\"3px\" CellPadding=\"4\" CellSpacing=\"2\" ForeColor=\"#1A1A1A\" Width=\"100%\" " + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            OnSelectedIndexChanged=\"Delete_Select_Record\" AllowPaging=\"True\" Font-Bold=\"False\" " + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            Font-Italic=\"False\" Font-Names=\"Calibri Light\" Font-Overline=\"False\" OnRowDataBound=\"RowDataBound\"" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            Font-Underline=\"False\" GridLines=\"Horizontal\" HorizontalAlign=\"Center\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <AlternatingRowStyle BackColor=\"Gray\" Font-Underline=\"False\" ForeColor=\"White\" />" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <Columns>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                                <asp:CommandField ShowSelectButton=\"True\"></asp:CommandField>" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                if (DB_Type_Array[i] != "byte[]")
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
                else
                {
                    if (i < 3)
                    {
                        Insert_Update_Delete_Output_StringText += "                            <asp:ImageField DataImageUrlField = \"" + DB_Array[0] + "\" DataImageUrlFormatString = \"~/Images/ShowImage.aspx?Table_Name=" + Table_Name + "&Image_Name=" + DB_Array[i] + "&ID=" + DB_Array[0] + "={0}\" ControlStyle-Width = \"150\" ControlStyle-Height = \"100\" HeaderText = \"Preview Image\"/>" + Environment.NewLine;
                    }
                    else
                    {
                        Insert_Update_Delete_Output_StringText += "                            <asp:ImageField DataImageUrlField = \"" + DB_Array[0] + "\" DataImageUrlFormatString = \"~/Images/ShowImage.aspx?Table_Name=" + Table_Name + "&Image_Name=" + DB_Array[i] + "&ID=" + DB_Array[0] + "={0}\" ControlStyle-Width = \"150\" ControlStyle-Height = \"100\" HeaderText = \"Preview Image\" Visible=\"false\" />" + Environment.NewLine;
                    }
                }
            }
            Insert_Update_Delete_Output_StringText += "                                            </Columns>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <FooterStyle BackColor=\"#CCCCCC\"></FooterStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <HeaderStyle BackColor=\"#EA5151\" ForeColor=\"White\" Font-Size=\"Medium\"></HeaderStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <PagerStyle HorizontalAlign=\"Center\" BackColor=\"#CCCCCC\" ForeColor=\"Black\"></PagerStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <RowStyle BackColor=\"#EFEEEF\" Font-Size=\"Medium\"></RowStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <SelectedRowStyle BackColor=\"#EA5151\" Font-Bold=\"True\" ForeColor=\"White\"></SelectedRowStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <SortedAscendingCellStyle BackColor=\"#F1F1F1\"></SortedAscendingCellStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <SortedAscendingHeaderStyle BackColor=\"Gray\"></SortedAscendingHeaderStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <SortedDescendingCellStyle BackColor=\"#CAC9C9\"></SortedDescendingCellStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <SortedDescendingHeaderStyle BackColor=\"#383838\"></SortedDescendingHeaderStyle>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        </asp:GridView>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                    <asp:SqlDataSource runat=\"server\" ID=\"Delete_SqlDataSource2\" ConnectionString=\"<%$ ConnectionStrings:DefaultConnection %>\" SelectCommand= \"SELECT";
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
            Insert_Update_Delete_Output_StringText += "                                    </td>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                </tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            </table>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            <asp:Panel ID=\"Delete_" + Table_Name + "_InfoHead\" runat=\"server\" ForeColor=\"#EFEEEF\" Height=\"25px\" BackImageUrl=\"~/Images/panelheader1.jpg\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                <asp:Label ID=\"Delete_" + Table_Name + "_InfoHead_label\" Style=\"padding: 10px\" runat=\"server\" Text=\"" + Table_Name + " Information\" Font-Size=\"Large\"></asp:Label>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            </asp:Panel>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            <asp:Panel ID=\"Delete_" + Table_Name + "_InfoBody\" runat=\"server\" style=\"overflow:hidden;\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                <div>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    <table width=\"100%\" height=\"auto\" bgcolor=\"#666666\" border=\"3\" style=\"font-family: 'Calibri Light'; color: #E2E2E2;\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        <tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <th colspan=\"4\" style=\"padding: 5px 10px 5px 10px; background-color: #aaaaaa;\" width=\"100%\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                                <asp:Label ID=\"Delete_Label3\" runat=\"server\" Font-Bold=\"False\" Font-Size=\"Large\" ForeColor=\"#333333\" Text=\"SECTION HEADER\"></asp:Label>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            </th>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                             <tr>" + Environment.NewLine;
            rowcount = 0;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                if (rowcount == 4)
                {
                    Insert_Update_Delete_Output_StringText += "                                             </tr>" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                             <tr>" + Environment.NewLine;
                    rowcount = 0;
                }

                if (DB_Type_Array[i] == "byte[]")
                {
                    Insert_Update_Delete_Output_StringText += "                                                 <td style=\"padding: 20px 10px 10px 10px\">" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <asp:Label ID=\"Delete_" + DB_Array[i] + "_lbl\" runat=\"server\" Font-Size=\"Large\" Text=\"" + DB_Array[i] + ":" + "\"></asp:Label>" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <br />" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <asp:Image ID=\"Delete_" + DB_Array[i] + "_Image\" runat=\"server\" ImageUrl=\"~/Images/Default_Person.jpg\" />" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                 </td>" + Environment.NewLine;
                }
                else
                {
                    Insert_Update_Delete_Output_StringText += "                                                 <td style=\"padding: 20px 10px 10px 10px\">" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <asp:Label ID=\"Delete_" + DB_Array[i] + "_lbl\" runat=\"server\" Font-Size=\"Large\" Text=\"" + DB_Array[i] + ":" + "\"></asp:Label>" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <br />" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <asp:Label ID=\"Delete_" + DB_Array[i] + "_txt_lbl" + "\" runat=\"server\" Text=\"\" Width=\"121px\"></asp:Label>" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                     <br />" + Environment.NewLine;
                    Insert_Update_Delete_Output_StringText += "                                                 </td>" + Environment.NewLine;
                }

                rowcount++;
            }
            Insert_Update_Delete_Output_StringText += "                                            </tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        </tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    </table>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    <table width=\"100%\" height=\"auto\" bgcolor=\"#e2e2e2\" style=\"font-family: 'Calibri Light'\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        <tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            <td style=\"padding: 0px 0px 0px 0px\" width=\"100%\">" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                                <asp:Button ID=\"Delete_btn\" runat=\"server\" Font-Size=\"Large\" Text=\"Delete\" BackColor=\"#EA5151\" ForeColor=\"#E2E2E2\" Width=\"100%\" OnClick=\"DELETE\" CausesValidation=\"False\" Style=\"margin-bottom: 0px; margin-top: 0px; border-style: solid none none none;\" BorderColor=\"#666666\" BorderWidth=\"3px\" />" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                            </td>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                        </tr>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                    </table>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                                </div>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            </asp:Panel>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                            <asp:CollapsiblePanelExtender ID=\"Delete_cpe" + Table_Name + "Info\" runat=\"server\" CollapseControlID=\"Delete_" + Table_Name + "_InfoHead\" CollapsedText=\"Show " + Table_Name + " Information\" Enabled=\"True\" ExpandControlID=\"Delete_" + Table_Name + "_InfoHead\" ExpandedText=\"" + Table_Name + " Information\" TargetControlID=\"Delete_" + Table_Name + "_InfoBody\" TextLabelID=\"Delete_" + Table_Name + "_InfoHead_label\"></asp:CollapsiblePanelExtender>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                        </div>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                    </ContentTemplate>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "                </asp:TabPanel>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "            </asp:TabContainer>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "        </div>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "    </body>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "    </html>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "    <asp:ToolkitScriptManager ID=\"ToolkitScriptManager1\" runat=\"server\"></asp:ToolkitScriptManager>" + Environment.NewLine;
            Insert_Update_Delete_Output_StringText += "</asp:Content>" + Environment.NewLine;





        }
        public void GENERATE_SCREEN_C_Insert_Update_Delete()
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }

            //INSERT_UPDATE_DELETE
            Insert_Update_Delete_C_Output_StringText += "using System;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Collections.Generic;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Linq;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Web;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Web.UI;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Web.UI.WebControls;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Text.RegularExpressions;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Data;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Data.SqlClient;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Configuration;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Diagnostics;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Collections;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Configuration;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Collections.Generic;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Linq;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Data;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Web;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Web.UI;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Web.UI.WebControls;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Web.UI.WebControls.WebParts;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Text.RegularExpressions;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Data.SqlClient;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Web.Security;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Web.UI.HtmlControls;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Xml.Linq;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.IO;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Data;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Linq;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Net.Mail;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Net;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Text;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Xml;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Web.Services;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using System.Web.Mvc;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "using DMCS.App_Code;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "namespace DMCS" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "{" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "public partial class " + Table_Name + "_ : System.Web.UI.Page" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "{" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            public " + Table_Name + " " + Table_Name + " = new " + Table_Name + "();" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    protected void Page_Load(object sender, EventArgs e)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        if (!ClientScript.IsStartupScriptRegistered(\"initialize\"))" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            Page.ClientScript.RegisterStartupScript(this.GetType()," + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "                \"initialize\", \"initialize();\", true);" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        }" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        if (!Page.IsPostBack)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        {   }" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Insert_Update_Delete_C_Output_StringText += "    /////////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    ////////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    ///////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    //////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    /////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    //Insert Tab Methods" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////            
            //Insert_Update_Delete_C_Output_StringText += "    protected void Insert_ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        try" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        {" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "            disaster disaster = new disaster();" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "            GlobalVariables.DisasterID = Convert.ToInt32(Insert_ddlDisaster.SelectedItem.Value);" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        }" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        catch { }" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Insert_Update_Delete_C_Output_StringText += "    protected void Insert_Select_Record(object sender, EventArgs e)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + " = Insert_" + Table_Name + "_select(Convert.ToInt32(Insert_" + Table_Name + "_GridView.SelectedValue));" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Insert_Update_Delete_C_Output_StringText += "    public " + Table_Name + " Insert_" + Table_Name + "_select(int ID)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + " = " + Table_Name + ".Select(ID);" + Environment.NewLine;
            for (int i = 1; i < DB_Array.Length - 1; i++)
            {
                if (DB_Type_Array[i] != "byte[]")
                {
                    Insert_Update_Delete_C_Output_StringText += "        Insert_" + DB_Array[i] + "_txt.Text = Convert.ToString(" + Table_Name + "." + DB_Array[i] + ");" + Environment.NewLine;
                }
                else
                {
                    Insert_Update_Delete_C_Output_StringText += "        Insert_" + DB_Array[i] + "_Image.Attributes[\"src\"] = ResolveUrl(\"~/Images/ShowImage.aspx?Table_Name=" + Table_Name + "&Image_Name=" + DB_Array[i] + "&ID=" + DB_Array[0] + "=\" + ID);" + Environment.NewLine;
                }
            }
            Insert_Update_Delete_C_Output_StringText += "        return " + Table_Name + ";" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Insert_Update_Delete_C_Output_StringText += "    protected void INSERT(object sender, EventArgs e)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + " = " + Table_Name + "_insert();" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Insert_Update_Delete_C_Output_StringText += "    public " + Table_Name + " " + Table_Name + "_insert()" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;

            for (int i = 1; i < DB_Array.Length - 1; i++)
            {

                if (DB_Type_Array[i] == "Int32")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToInt32(Insert_" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "Double")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToDouble(Insert_" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "double")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToDouble(Insert_" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "String")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Insert_" + DB_Array[i] + "_txt.Text;" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "Char")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToString(Insert_" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "DateTime")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToDateTime(Insert_" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "Boolean")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToBoolean(Insert_" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "Decimal")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToDecimal(Insert_" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "byte[]")
                {
                    Insert_Update_Delete_C_Output_StringText += "        byte[] uploaded_picture = Insert_" + DB_Array[i] + "_FileUpload.FileBytes;" + Environment.NewLine;
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = uploaded_picture;" + Environment.NewLine;
                }

            }
            Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + " = " + Table_Name + ".Insert(" + Table_Name + ");" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        Insert_" + Table_Name + "_GridView.DataBind();" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        Update_" + Table_Name + "_GridView.DataBind();" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        Delete_" + Table_Name + "_GridView.DataBind();" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        return " + Table_Name + ";" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Insert_Update_Delete_C_Output_StringText += "    /////////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    ////////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    ///////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    //////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    /////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    //Update Tab Methods" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////            
            //Insert_Update_Delete_C_Output_StringText += "    protected void Update_ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        try" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        {" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "            disaster disaster = new disaster();" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "            GlobalVariables.DisasterID = Convert.ToInt32(Update_ddlDisaster.SelectedItem.Value);" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        }" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        catch { }" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Insert_Update_Delete_C_Output_StringText += "    protected void Update_Select_Record(object sender, EventArgs e)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + " = Update_" + Table_Name + "_select(Convert.ToInt32(Update_" + Table_Name + "_GridView.SelectedValue));" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Insert_Update_Delete_C_Output_StringText += "    public " + Table_Name + " Update_" + Table_Name + "_select(int ID)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + " = " + Table_Name + ".Select(ID);" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                if (DB_Type_Array[i] != "byte[]")
                {
                    Insert_Update_Delete_C_Output_StringText += "        Update_" + DB_Array[i] + "_txt.Text = Convert.ToString(" + Table_Name + "." + DB_Array[i] + ");" + Environment.NewLine;
                }
                else
                {
                    Insert_Update_Delete_C_Output_StringText += "        Update_" + DB_Array[i] + "_Image.Attributes[\"src\"] = ResolveUrl(\"~/Images/ShowImage.aspx?Table_Name=" + Table_Name + "&Image_Name=" + DB_Array[i] + "&ID=" + DB_Array[0] + "=\" + ID);" + Environment.NewLine;
                }
            }
            Insert_Update_Delete_C_Output_StringText += "        return " + Table_Name + ";" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Insert_Update_Delete_C_Output_StringText += "    protected void UPDATE(object sender, EventArgs e)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + " = " + Table_Name + "_update(Convert.ToInt32(Update_" + Table_Name + "_GridView.SelectedValue));" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Insert_Update_Delete_C_Output_StringText += "    public " + Table_Name + " " + Table_Name + "_update(int ID)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + " = " + Table_Name + ".Select(ID);" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                if (DB_Type_Array[i] == "Int32")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToInt32(Update_" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "Double")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToDouble(Update_" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "double")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToDouble(Update_" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "String")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Update_" + DB_Array[i] + "_txt.Text;" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "Char")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToString(Update_" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "DateTime")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToDateTime(Update_" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "Boolean")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToBoolean(Update_" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "Decimal")
                {
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = Convert.ToDecimal(Update_" + DB_Array[i] + "_txt.Text);" + Environment.NewLine;
                }
                if (DB_Type_Array[i] == "byte[]")
                {
                    Insert_Update_Delete_C_Output_StringText += "        byte[] uploaded_picture = Update_" + DB_Array[i] + "_FileUpload.FileBytes;" + Environment.NewLine;
                    Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "." + DB_Array[i] + " = uploaded_picture;" + Environment.NewLine;
                }
            }
            Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + ".Update(" + Table_Name + ");" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        Insert_" + Table_Name + "_GridView.DataBind();" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        Update_" + Table_Name + "_GridView.DataBind();" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        Delete_" + Table_Name + "_GridView.DataBind();" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        return " + Table_Name + ";" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////
            Insert_Update_Delete_C_Output_StringText += "" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////
            Insert_Update_Delete_C_Output_StringText += "    /////////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    ////////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    ///////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    //////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    /////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    //Delete Tab Methods" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            //Insert_Update_Delete_C_Output_StringText += "    protected void Delete_ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        try" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        {" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "            disaster disaster = new disaster();" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "            GlobalVariables.DisasterID = Convert.ToInt32(Delete_ddlDisaster.SelectedItem.Value);" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        }" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "        catch { }" + Environment.NewLine;
            //Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Insert_Update_Delete_C_Output_StringText += "    protected void Delete_Select_Record(object sender, EventArgs e)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + " = Delete_" + Table_Name + "_select(Convert.ToInt32(Delete_" + Table_Name + "_GridView.SelectedValue));" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Insert_Update_Delete_C_Output_StringText += "    public " + Table_Name + " Delete_" + Table_Name + "_select(int ID)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + " = " + Table_Name + ".Select(ID);" + Environment.NewLine;
            for (int i = 0; i < DB_Array.Length - 1; i++)
            {
                if (DB_Type_Array[i] != "byte[]")
                {
                    Insert_Update_Delete_C_Output_StringText += "        Delete_" + DB_Array[i] + "_txt_lbl.Text = Convert.ToString(" + Table_Name + "." + DB_Array[i] + ");" + Environment.NewLine;
                }
                else
                {
                    Insert_Update_Delete_C_Output_StringText += "        Delete_" + DB_Array[i] + "_Image.Attributes[\"src\"] = ResolveUrl(\"~/Images/ShowImage.aspx?Table_Name=" + Table_Name + "&Image_Name=" + DB_Array[i] + "&ID=" + DB_Array[0] + "=\" + ID);" + Environment.NewLine;
                }
            }
            Insert_Update_Delete_C_Output_StringText += "        return " + Table_Name + ";" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Insert_Update_Delete_C_Output_StringText += "    protected void DELETE(object sender, EventArgs e)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + "_delete(Convert.ToInt32(Delete_" + Table_Name + "_GridView.SelectedValue));" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////
            Insert_Update_Delete_C_Output_StringText += "    public void " + Table_Name + "_delete(int ID)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        " + Table_Name + ".Delete(ID);" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        Insert_" + Table_Name + "_GridView.DataBind();" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        Update_" + Table_Name + "_GridView.DataBind();" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        Delete_" + Table_Name + "_GridView.DataBind();" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////
            Insert_Update_Delete_C_Output_StringText += "" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Insert_Update_Delete_C_Output_StringText += "    /////////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    ////////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    ///////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    //////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    /////////////////////" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    //Universial Methods" + Environment.NewLine;
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Insert_Update_Delete_C_Output_StringText += "    protected void RowDataBound(object sender, GridViewRowEventArgs e)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        if (e.Row.RowType == DataControlRowType.DataRow)" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        {" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            // EXAMPLE:" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            // client_status = e.Row.Cells[5].Text;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            // Gender = e.Row.Cells[4].Text;" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            //if (e.Row.Cells[5].Text == \"M\")" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            //{" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            //    e.Row.Cells[5].Text = \"Missing\";" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            //}" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            //else if (e.Row.Cells[5].Text == \"D\")" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            //{" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            //    e.Row.Cells[5].Text = \"Deceased\";" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            //}" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            //if (e.Row.Cells[4].Text == \"M\")" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            //{" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            //    e.Row.Cells[4].Text = \"Male\";" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            //}" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            //else if (e.Row.Cells[4].Text == \"F\")" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            //{" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            //    e.Row.Cells[4].Text = \"Female\";" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "            //}" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "        }" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "    }" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "  }" + Environment.NewLine;
            Insert_Update_Delete_C_Output_StringText += "}" + Environment.NewLine;
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
        protected void Download_Click(object sender, EventArgs e)
        {
            if (Generate_fromDatabase == true)
            {
                Table_Name = The_Table_Name.Text;
            }
            else
            {
                Table_Name = Manual_Table_Name.Text;
            }

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

                //File.AppendAllText(@"c:\GENERATED_CODE\SCRIPTS\" + Table_Name + ".sql", Database_Script_Output.Text + Environment.NewLine);
                //File.AppendAllText(@"c:\GENERATED_CODE\OBJECTS\" + Table_Name + ".cs", Object_Output.Text + Environment.NewLine);
                //File.AppendAllText(@"c:\GENERATED_CODE\SCREENS\" + Table_Name + "_Select.aspx", Select_Screen_Output.Text + Environment.NewLine);
                //File.AppendAllText(@"c:\GENERATED_CODE\SCREENS\" + Table_Name + "_Select.aspx.cs", Select_Screen_C_Output.Text + Environment.NewLine);
                //File.AppendAllText(@"c:\GENERATED_CODE\SCREENS\" + Table_Name + "_Insert.aspx", Insert_Screen_Output.Text + Environment.NewLine);
                //File.AppendAllText(@"c:\GENERATED_CODE\SCREENS\" + Table_Name + "_Insert.aspx.cs", Insert_Screen_C_Output.Text + Environment.NewLine);
                //File.AppendAllText(@"c:\GENERATED_CODE\SCREENS\" + Table_Name + "_Update.aspx", Update_Screen_Output.Text + Environment.NewLine);
                //File.AppendAllText(@"c:\GENERATED_CODE\SCREENS\" + Table_Name + "_Update.aspx.cs", Update_Screen_C_Output.Text + Environment.NewLine);
                //File.AppendAllText(@"c:\GENERATED_CODE\SCREENS\" + Table_Name + "_Screen.aspx", Insert_Update_Delete_Output.Text + Environment.NewLine);
                //File.AppendAllText(@"c:\GENERATED_CODE\SCREENS\" + Table_Name + "_Screen.aspx.cs", Insert_Update_Delete_C_Output.Text + Environment.NewLine);


                //using (ZipFile zip = new ZipFile())
                //{

                //    File.WriteAllText(Server.MapPath("~/Script_Generator_Files/SQL/" + Table_Name + ".sql"), Database_Script_Output.Text + Environment.NewLine);
                //    File.WriteAllText(Server.MapPath("~/Script_Generator_Files/App_Code/" + Table_Name + ".cs"), Object_Output.Text + Environment.NewLine);
                //    File.WriteAllText(Server.MapPath("~/Script_Generator_Files/Screens/" + Table_Name + ".aspx"), Insert_Update_Delete_Output.Text + Environment.NewLine);
                //    File.WriteAllText(Server.MapPath("~/Script_Generator_Files/Screens/" + Table_Name + ".aspx.cs"), Insert_Update_Delete_C_Output.Text + Environment.NewLine);

                //    string DIR_path = Server.MapPath("~/" + Table_Name + ".sql");
                //    zip.AddFile(DIR_path, "SQL");

                //    DIR_path = Server.MapPath("~/Script_Generator_Files/App_Code/" + Table_Name + ".cs");
                //    zip.AddFile(DIR_path, "C_Object");

                //    DIR_path = Server.MapPath("~/" + Table_Name + ".aspx");
                //    zip.AddFile(DIR_path, "Screen");

                //    DIR_path = Server.MapPath("~/" + Table_Name + ".aspx.cs");
                //    zip.AddFile(DIR_path, "Screen_C");


                //    zip.Save(Server.MapPath("~/Script_Generator_Files/samplefiles.zip"));



                //}

                //myDiv.Style.Add("display", "Block");
                //string strURL = Server.MapPath("~/Script_Generator_Files/samplefiles.zip");
                //WebClient req = new WebClient();
                //HttpResponse Response = HttpContext.Current.Response;
                //Response.Clear();
                //Response.ClearContent();
                //Response.ClearHeaders();
                //Response.Buffer = true;
                //Response.ContentType = "application/zip";
                //Response.AddHeader("Content-Disposition", "attachment;filename=\"YourFiles.zip\"");
                //byte[] data = req.DownloadData(Server.MapPath(strURL));
                //Response.BinaryWrite(data);
                //Response.End();



            }
            catch
            { ERROR.Text = "bla bla bla.. Permissions and stuff."; }


        }
        static byte[] GetBytes(string str)
        {
            byte[] bytes = new byte[str.Length * sizeof(char)];
            System.Buffer.BlockCopy(str.ToCharArray(), 0, bytes, 0, bytes.Length);
            return bytes;
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

            Database_Script_Output.Text = string.Empty;
            Object_Output.Text = string.Empty;

            Select_Screen_Output.Text = string.Empty;
            Insert_Screen_Output.Text = string.Empty;
            Update_Screen_Output.Text = string.Empty;
            Delete_Screen_Output.Text = string.Empty;
            Insert_Update_Delete_Output.Text = string.Empty;

            Select_Screen_C_Output.Text = string.Empty;
            Insert_Screen_C_Output.Text = string.Empty;
            Update_Screen_C_Output.Text = string.Empty;
            Delete_Screen_C_Output.Text = string.Empty;
            Insert_Update_Delete_C_Output.Text = string.Empty;

            //myDiv.Style.Add("display", "none");
            Restart.Visible = false;
            //Create.Visible = true;
        }

        protected void The_Table_Name_SelectedIndexChanged(object sender, EventArgs e)
        {

            Generate_fromDatabase = true;
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
                    //Clear fields on the pages
                    DB_Names.Text = "";
                    Null_Names.Text = "";
                    DB_Types.Text = "";
                    C_Types.Text = "";
                    //Element_Names.Text = "";
                    //read the reader object for all columns of the subject table
                    while (rdr.Read())
                    {

                        //append column names
                        DB_Names.Text += rdr["COLUMN_NAME"].ToString() + "|";
                        //test for null
                        if (rdr["IS_NULLABLE"].ToString().Equals("YES"))
                            Null_Names.Text += "NULL|";
                        else
                            Null_Names.Text += "NOT NULL|";
                        //append SQL data types to textbox
                        DB_Types.Text += rdr["DATA_TYPE"].ToString() + "|";
                        //test for C# types and append to textbox-->format strings
                        C_Types.Text += getCsType((rdr["DATA_TYPE"].ToString().Replace("()", "")).ToLower(), rdr["CHARACTER_MAXIMUM_LENGTH"].ToString()) + "|";
                    }
                    //format SQL types string from textbox
                    DB_Types.Text = DB_Types.Text.ToString().Replace("()", "");
                }
                Create_Click(sender, e);
                Download_Click(sender, e);
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
            Generate_fromDatabase = false;
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

        protected void DOWNLOAD_Click1(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, typeof(string), "New_Window", "window.open( 'http://jimmyhax.com/Script_Generator_Files/samplefiles.zip', null, 'height=800,width=1280,status=yes,toolbar=yes,menubar=yes,location=no' );", true);
        }

    }
}