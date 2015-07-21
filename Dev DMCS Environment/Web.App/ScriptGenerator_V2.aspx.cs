using Ionic.Zip;
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
    public partial class ScriptGenerator_V2 : System.Web.UI.Page
    {
        script_generator script_generator = new script_generator();

        List<String> DB_Names = new List<String>();
        List<String> Null_Names = new List<String>();
        List<String> DB_Types = new List<String>();
        List<String> C_Types = new List<String>();

        String tableName;

        String html_Generated;
        String cSharp_Generated;
        String object_Generated;
        String sql_Generated;
        String angularJS_Generated;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //User has changed the DDL table
        protected void DDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Get the database table information and fill the arrays
            setTableInformation();
            //Fill templates and download
            generate();
        }

        //Get the database table information and fill the arrays
        protected void setTableInformation()
        {
            tableName = Table_Name_DDL.SelectedValue;
            //create connection and sql commands.  Notice that a connection string is called from the config file.  change connection string to DMCS or local db. 
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            SqlCommand sqlcmd = new SqlCommand("SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE Table_Name ='" + tableName + "'", conn);
            //try it, catch it, close it, and give away connection.
            try
            {
                conn.Open();
                using (SqlDataReader rdr = sqlcmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DB_Names.Add(rdr["COLUMN_NAME"].ToString());
                        if (rdr["IS_NULLABLE"].ToString().Equals("YES")) {

                            Null_Names.Add("NULL");
                        }
                        else
                        {
                            Null_Names.Add("NOT NULL");
                        }

                        DB_Types.Add(rdr["DATA_TYPE"].ToString());
                        C_Types.Add(getCsType((rdr["DATA_TYPE"].ToString().Replace("()", "")).ToLower(), rdr["CHARACTER_MAXIMUM_LENGTH"].ToString()));
                    }
                }
            }
            catch (SqlException ex)
            {
                //If connection cannot be made...
                Response.Write("<script>alert('Connection to " + ConfigurationManager.ConnectionStrings["DefaultConnection"] + " cannot be established.\n" + ex.Message + "');</script>");
            }
            finally
            {
                //Close and dispose
                conn.Close();
                conn.Dispose();
            }
        }
        //Fill templates and download
        protected void generate()
        {
            html_Generated = htmlFactory();
            cSharp_Generated = cSharpFactory();
            object_Generated = objectFactory();
            sql_Generated = sqlFactory();
            angularJS_Generated = angularJSFactory();

            File.WriteAllText(Server.MapPath("~/Generated_Files/SQL/" + tableName + ".sql"), sql_Generated + Environment.NewLine);
            File.WriteAllText(Server.MapPath("~/Generated_Files/App_Code/" + tableName + ".cs"), object_Generated + Environment.NewLine);
            File.WriteAllText(Server.MapPath("~/Generated_Files/Screens/" + tableName + ".aspx"), html_Generated + Environment.NewLine);
            File.WriteAllText(Server.MapPath("~/Generated_Files/Screens/" + tableName + ".aspx.cs"), cSharp_Generated + Environment.NewLine);
            File.WriteAllText(Server.MapPath("~/Generated_Files/Angular_Controller/" + tableName + "Ctrl.js"), angularJS_Generated + Environment.NewLine);
           
        }

        //Code Generation functions ------------------------------------------------
        //--------------------------------------------------------------------------
        protected String htmlFactory()
        {
            String constructor = "";
            constructor += "<%@ Page Language=\"C#\" AutoEventWireup=\"true\" MasterPageFile=\"~/Site.Master\" CodeBehind=\"" + tableName + ".aspx.cs\" Inherits=\"Web.App." + tableName + "Class\" EnableEventValidation=\"True\" ValidateRequest=\"True\" %>" + Environment.NewLine;
            constructor += "<asp:Content ID=\"BodyContent\" ContentPlaceHolderID=\"MainContent\" runat=\"server\">" + Environment.NewLine;
            constructor += "    <div class=\"container-fluid\" ng-controller=\"" + tableName + "Ctrl\">" + Environment.NewLine;
            constructor += "        <div class=\"body-header\">" + Environment.NewLine;
            constructor += "            <a class=\"back-link\"><span class=\"glyphicon glyphicon-menu-left back-arrow\"></span><span> Home</span></a>" + Environment.NewLine;
            constructor += "            <h1><span>Address CRUD</span></h1>" + Environment.NewLine;
            constructor += "        </div>" + Environment.NewLine;
            constructor += "        <div class=\"body-contents col-lg-12\">" + Environment.NewLine;
            constructor += "            <ajaxToolkit:TabContainer ID=\"TabContainer\" runat=\"server\" ActiveTabIndex=\"0\" Height=\"100%\">" + Environment.NewLine;
            constructor += "                <ajaxToolkit:TabPanel runat=\"server\" HeaderText=\"Insert\" ID=\"Insert_Tab\">" + Environment.NewLine;
            constructor += "                    <ContentTemplate>" + Environment.NewLine;
            constructor += "                        <div class=\"gridview-container\" align=\"center\">" + Environment.NewLine;
            constructor += "                            <div class=\"gridview-contents\">" + Environment.NewLine;
            constructor += "                                <asp:GridView" + Environment.NewLine;
            constructor += "                                    ID=\"Insert_GridView\"" + Environment.NewLine;
            constructor += "                                    runat=\"server\"" + Environment.NewLine;
            constructor += "                                    AllowPaging=\"True\"" + Environment.NewLine;
            constructor += "                                    AllowSorting=\"True\"" + Environment.NewLine;
            constructor += "                                    AutoGenerateColumns=\"False\"" + Environment.NewLine;
            constructor += "                                    DataKeyNames=\"address_id\"" + Environment.NewLine;
            constructor += "                                    DataSourceID=\"Address_Insert_DS\"" + Environment.NewLine;
            constructor += "                                    OnSelectedIndexChanged=\"Insert_GridView_OnSelectedIndexChanged\"" + Environment.NewLine;
            constructor += "                                    GridLines=\"None\"" + Environment.NewLine;
            constructor += "                                    CssClass=\"mGrid\"" + Environment.NewLine;
            constructor += "                                    PagerStyle-CssClass=\"pgr\"" + Environment.NewLine;
            constructor += "                                    AlternatingRowStyle-CssClass=\"alt\"" + Environment.NewLine;
            constructor += "                                    SelectedRowStyle-CssClass=\"selected-row\">" + Environment.NewLine;
            constructor += "                                    <Columns>" + Environment.NewLine;
            constructor += "                                        <asp:CommandField ShowSelectButton=\"True\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"address_id\" HeaderText=\"address_id\" InsertVisible=\"False\" ReadOnly=\"True\" SortExpression=\"address_id\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"address_type_id\" HeaderText=\"address_type_id\" SortExpression=\"address_type_id\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"city\" HeaderText=\"city\" SortExpression=\"city\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"country\" HeaderText=\"country\" SortExpression=\"country\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"County_Township\" HeaderText=\"County_Township\" SortExpression=\"County_Township\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"longitude\" HeaderText=\"longitude\" SortExpression=\"longitude\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"latitude\" HeaderText=\"latitude\" SortExpression=\"latitude\" />" + Environment.NewLine;
            constructor += "                                    </Columns>" + Environment.NewLine;
            constructor += "                                </asp:GridView>" + Environment.NewLine;
            constructor += "                                <asp:SqlDataSource ID=\"Address_Insert_DS\" runat=\"server\" ConnectionString=\"<%$ ConnectionStrings:DefaultConnection %>\" SelectCommand=\"SELECT * FROM [address]\"></asp:SqlDataSource>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                        </div>" + Environment.NewLine;
            constructor += "                        <div class=\"col-lg-12\">" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">address_type_id</span>" + Environment.NewLine;
            constructor += "                                <div class=\"required-container\">" + Environment.NewLine;
            constructor += "                                    <asp:RequiredFieldValidator CssClass=\"required\" ControlToValidate=\"address_type_id_Insert_TextBox\" ID=\"address_type_id_Insert_TextBox_RequiredFieldValidator\" runat=\"server\" Text=\"* Required Field\" ErrorMessage=\"Required Field\" ValidationGroup=\"Insert_Group\"></asp:RequiredFieldValidator>" + Environment.NewLine;
            constructor += "                                </div>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"address_type_id_Insert_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">city</span>" + Environment.NewLine;
            constructor += "                                <div class=\"required-container\">" + Environment.NewLine;
            constructor += "                                    <asp:RequiredFieldValidator CssClass=\"required\" ControlToValidate=\"city_Insert_TextBox\" ID=\"city_Insert_TextBox_RequiredFieldValidator\" runat=\"server\" Text=\"* Required Field\" ErrorMessage=\"Required Field\" ValidationGroup=\"Insert_Group\"></asp:RequiredFieldValidator>" + Environment.NewLine;
            constructor += "                                </div>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"city_Insert_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">country</span>" + Environment.NewLine;
            constructor += "                                <div class=\"required-container\">" + Environment.NewLine;
            constructor += "                                    <asp:RequiredFieldValidator CssClass=\"required\" ControlToValidate=\"country_Insert_TextBox\" ID=\"country_Insert_TextBox_RequiredFieldValidator\" runat=\"server\" Text=\"* Required Field\" ErrorMessage=\"Required Field\" ValidationGroup=\"Insert_Group\"></asp:RequiredFieldValidator>" + Environment.NewLine;
            constructor += "                                </div>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"country_Insert_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">County_Township</span>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"County_Township_Insert_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">longitude</span>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"longitude_Insert_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">latitude</span>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"latitude_Insert_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">state</span>" + Environment.NewLine;
            constructor += "                                <div class=\"required-container\">" + Environment.NewLine;
            constructor += "                                    <asp:RequiredFieldValidator CssClass=\"required\" ControlToValidate=\"state_Insert_TextBox\" ID=\"state_Insert_TextBox_RequiredFieldValidator\" runat=\"server\" Text=\"* Required Field\" ErrorMessage=\"Required Field\" ValidationGroup=\"Insert_Group\"></asp:RequiredFieldValidator>" + Environment.NewLine;
            constructor += "                                </div>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"state_Insert_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">str_add</span>" + Environment.NewLine;
            constructor += "                                <div class=\"required-container\">" + Environment.NewLine;
            constructor += "                                    <asp:RequiredFieldValidator CssClass=\"required\" ControlToValidate=\"str_add_Insert_TextBox\" ID=\"str_add_Insert_TextBox_RequiredFieldValidator\" runat=\"server\" Text=\"* Required Field\" ErrorMessage=\"Required Field\" ValidationGroup=\"Insert_Group\"></asp:RequiredFieldValidator>" + Environment.NewLine;
            constructor += "                                </div>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"str_add_Insert_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">str_add2</span>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"str_add2_Insert_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">zip_plus_four</span>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"zip_plus_four_Insert_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                        </div>" + Environment.NewLine;
            constructor += "                        <hr />" + Environment.NewLine;
            constructor += "                        <div class=\"bottom-btn-container col-lg-12\">" + Environment.NewLine;
            constructor += "                            <asp:Button ID=\"Insert_Button\" runat=\"server\" Text=\"Create\" CssClass=\"btn btn-default btn-lg one-bottom-btn\" OnClick=\"Insert_Button_Click\" ValidationGroup=\"Insert_Group\" />" + Environment.NewLine;
            constructor += "                        </div>" + Environment.NewLine;
            constructor += "                    </ContentTemplate>" + Environment.NewLine;
            constructor += "                </ajaxToolkit:TabPanel>" + Environment.NewLine;
            constructor += "                <ajaxToolkit:TabPanel runat=\"server\" HeaderText=\"Update\" ID=\"Update_Tab\">" + Environment.NewLine;
            constructor += "                    <ContentTemplate>" + Environment.NewLine;
            constructor += "                        <div class=\"gridview-container\" align=\"center\">" + Environment.NewLine;
            constructor += "                            <div class=\"gridview-contents\">" + Environment.NewLine;
            constructor += "                                <asp:GridView" + Environment.NewLine;
            constructor += "                                    ID=\"Update_GridView\"" + Environment.NewLine;
            constructor += "                                    runat=\"server\"" + Environment.NewLine;
            constructor += "                                    AllowPaging=\"True\"" + Environment.NewLine;
            constructor += "                                    AllowSorting=\"True\"" + Environment.NewLine;
            constructor += "                                    AutoGenerateColumns=\"False\"" + Environment.NewLine;
            constructor += "                                    DataKeyNames=\"address_id\"" + Environment.NewLine;
            constructor += "                                    DataSourceID=\"Address_Update_DS\"" + Environment.NewLine;
            constructor += "                                    OnSelectedIndexChanged=\"Update_GridView_OnSelectedIndexChanged\"" + Environment.NewLine;
            constructor += "                                    GridLines=\"None\"" + Environment.NewLine;
            constructor += "                                    CssClass=\"mGrid\"" + Environment.NewLine;
            constructor += "                                    PagerStyle-CssClass=\"pgr\"" + Environment.NewLine;
            constructor += "                                    AlternatingRowStyle-CssClass=\"alt\"" + Environment.NewLine;
            constructor += "                                    SelectedRowStyle-CssClass=\"selected-row\">" + Environment.NewLine;
            constructor += "                                    <Columns>" + Environment.NewLine;
            constructor += "                                        <asp:CommandField ShowSelectButton=\"True\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"address_id\" HeaderText=\"address_id\" InsertVisible=\"False\" ReadOnly=\"True\" SortExpression=\"address_id\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"address_type_id\" HeaderText=\"address_type_id\" SortExpression=\"address_type_id\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"city\" HeaderText=\"city\" SortExpression=\"city\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"country\" HeaderText=\"country\" SortExpression=\"country\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"County_Township\" HeaderText=\"County_Township\" SortExpression=\"County_Township\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"longitude\" HeaderText=\"longitude\" SortExpression=\"longitude\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"latitude\" HeaderText=\"latitude\" SortExpression=\"latitude\" />" + Environment.NewLine;
            constructor += "                                        <%--<asp:BoundField DataField=\"state\" HeaderText=\"state\" SortExpression=\"state\" />" + Environment.NewLine;
            constructor += "                    <asp:BoundField DataField=\"str_add\" HeaderText=\"str_add\" SortExpression=\"str_add\" />" + Environment.NewLine;
            constructor += "                    <asp:BoundField DataField=\"str_add2\" HeaderText=\"str_add2\" SortExpression=\"str_add2\" />" + Environment.NewLine;
            constructor += "                    <asp:BoundField DataField=\"zip_plus_four\" HeaderText=\"zip_plus_four\" SortExpression=\"zip_plus_four\" />--%>" + Environment.NewLine;
            constructor += "                                    </Columns>" + Environment.NewLine;
            constructor += "                                </asp:GridView>" + Environment.NewLine;
            constructor += "                                <asp:SqlDataSource ID=\"Address_Update_DS\" runat=\"server\" ConnectionString=\"<%$ ConnectionStrings:DefaultConnection %>\" SelectCommand=\"SELECT * FROM [address]\"></asp:SqlDataSource>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                        </div>" + Environment.NewLine;
            constructor += "                        <div class=\"col-lg-12\">" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">address_id</span>" + Environment.NewLine;
            constructor += "                                <asp:TextBox disabled class=\"pull-right form-control disabled\" ID=\"address_id_Update_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">address_type_id</span>" + Environment.NewLine;
            constructor += "                                <div class=\"required-container\">" + Environment.NewLine;
            constructor += "                                    <asp:RequiredFieldValidator CssClass=\"required\" ControlToValidate=\"address_type_id_Update_TextBox\" ID=\"RequiredFieldValidator1\" runat=\"server\" Text=\"* Required Field\" ErrorMessage=\"Required Field\" ValidationGroup=\"Update_Group\"></asp:RequiredFieldValidator>" + Environment.NewLine;
            constructor += "                                </div>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"address_type_id_Update_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">city</span>" + Environment.NewLine;
            constructor += "                                <div class=\"required-container\">" + Environment.NewLine;
            constructor += "                                    <asp:RequiredFieldValidator CssClass=\"required\" ControlToValidate=\"city_Update_TextBox\" ID=\"RequiredFieldValidator2\" runat=\"server\" Text=\"* Required Field\" ErrorMessage=\"Required Field\" ValidationGroup=\"Update_Group\"></asp:RequiredFieldValidator>" + Environment.NewLine;
            constructor += "                                </div>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"city_Update_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">country</span>" + Environment.NewLine;
            constructor += "                                <div class=\"required-container\">" + Environment.NewLine;
            constructor += "                                    <asp:RequiredFieldValidator CssClass=\"required\" ControlToValidate=\"country_Update_TextBox\" ID=\"RequiredFieldValidator3\" runat=\"server\" Text=\"* Required Field\" ErrorMessage=\"Required Field\" ValidationGroup=\"Update_Group\"></asp:RequiredFieldValidator>" + Environment.NewLine;
            constructor += "                                </div>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"country_Update_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">County_Township</span>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"County_Township_Update_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">longitude</span>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"longitude_Update_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">latitude</span>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"latitude_Update_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">state</span>" + Environment.NewLine;
            constructor += "                                <div class=\"required-container\">" + Environment.NewLine;
            constructor += "                                    <asp:RequiredFieldValidator CssClass=\"required\" ControlToValidate=\"state_Update_TextBox\" ID=\"RequiredFieldValidator4\" runat=\"server\" Text=\"* Required Field\" ErrorMessage=\"Required Field\" ValidationGroup=\"Update_Group\"></asp:RequiredFieldValidator>" + Environment.NewLine;
            constructor += "                                </div>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"state_Update_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">str_add</span>" + Environment.NewLine;
            constructor += "                                <div class=\"required-container\">" + Environment.NewLine;
            constructor += "                                    <asp:RequiredFieldValidator CssClass=\"required\" ControlToValidate=\"str_add_Update_TextBox\" ID=\"RequiredFieldValidator5\" runat=\"server\" Text=\"* Required Field\" ErrorMessage=\"Required Field\" ValidationGroup=\"Update_Group\"></asp:RequiredFieldValidator>" + Environment.NewLine;
            constructor += "                                </div>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"str_add_Update_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">str_add2</span>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"str_add2_Update_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">zip_plus_four</span>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"zip_plus_four_Update_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <%--FREE SPACE--%>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                        </div>" + Environment.NewLine;
            constructor += "                        <hr />" + Environment.NewLine;
            constructor += "                        <div class=\"bottom-btn-container col-lg-12\">" + Environment.NewLine;
            constructor += "                            <asp:Button ID=\"Update_Button\" runat=\"server\" Text=\"Update\" CssClass=\"btn btn-default btn-lg one-bottom-btn\" OnClick=\"Update_Button_Click\" ValidationGroup=\"Update_Group\" />" + Environment.NewLine;
            constructor += "                        </div>" + Environment.NewLine;
            constructor += "                    </ContentTemplate>" + Environment.NewLine;
            constructor += "                </ajaxToolkit:TabPanel>" + Environment.NewLine;
            constructor += "                <ajaxToolkit:TabPanel runat=\"server\" HeaderText=\"Delete\" ID=\"Tab_Delete\">" + Environment.NewLine;
            constructor += "                    <ContentTemplate>" + Environment.NewLine;
            constructor += "                        <div class=\"gridview-container\" align=\"center\">" + Environment.NewLine;
            constructor += "                            <div class=\"gridview-contents\">" + Environment.NewLine;
            constructor += "                                <asp:GridView" + Environment.NewLine;
            constructor += "                                    ID=\"Delete_GridView\"" + Environment.NewLine;
            constructor += "                                    runat=\"server\"" + Environment.NewLine;
            constructor += "                                    AllowPaging=\"True\"" + Environment.NewLine;
            constructor += "                                    AllowSorting=\"True\"" + Environment.NewLine;
            constructor += "                                    AutoGenerateColumns=\"False\"" + Environment.NewLine;
            constructor += "                                    DataKeyNames=\"address_id\"" + Environment.NewLine;
            constructor += "                                    DataSourceID=\"Address_Delete_DS\"" + Environment.NewLine;
            constructor += "                                    OnSelectedIndexChanged=\"Delete_GridView_OnSelectedIndexChanged\"" + Environment.NewLine;
            constructor += "                                    GridLines=\"None\"" + Environment.NewLine;
            constructor += "                                    CssClass=\"mGrid\"" + Environment.NewLine;
            constructor += "                                    PagerStyle-CssClass=\"pgr\"" + Environment.NewLine;
            constructor += "                                    AlternatingRowStyle-CssClass=\"alt\"" + Environment.NewLine;
            constructor += "                                    SelectedRowStyle-CssClass=\"selected-row\">" + Environment.NewLine;
            constructor += "                                    <Columns>" + Environment.NewLine;
            constructor += "                                        <asp:CommandField ShowSelectButton=\"True\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"address_id\" HeaderText=\"address_id\" InsertVisible=\"False\" ReadOnly=\"True\" SortExpression=\"address_id\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"address_type_id\" HeaderText=\"address_type_id\" SortExpression=\"address_type_id\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"city\" HeaderText=\"city\" SortExpression=\"city\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"country\" HeaderText=\"country\" SortExpression=\"country\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"County_Township\" HeaderText=\"County_Township\" SortExpression=\"County_Township\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"longitude\" HeaderText=\"longitude\" SortExpression=\"longitude\" />" + Environment.NewLine;
            constructor += "                                        <asp:BoundField DataField=\"latitude\" HeaderText=\"latitude\" SortExpression=\"latitude\" />" + Environment.NewLine;
            constructor += "                                        <%--<asp:BoundField DataField=\"state\" HeaderText=\"state\" SortExpression=\"state\" />" + Environment.NewLine;
            constructor += "                        <asp:BoundField DataField=\"str_add\" HeaderText=\"str_add\" SortExpression=\"str_add\" />" + Environment.NewLine;
            constructor += "                        <asp:BoundField DataField=\"str_add2\" HeaderText=\"str_add2\" SortExpression=\"str_add2\" />" + Environment.NewLine;
            constructor += "                        <asp:BoundField DataField=\"zip_plus_four\" HeaderText=\"zip_plus_four\" SortExpression=\"zip_plus_four\" />--%>" + Environment.NewLine;
            constructor += "                                    </Columns>" + Environment.NewLine;
            constructor += "                                </asp:GridView>" + Environment.NewLine;
            constructor += "                                <asp:SqlDataSource ID=\"Address_Delete_DS\" runat=\"server\" ConnectionString=\"<%$ ConnectionStrings:DefaultConnection %>\" SelectCommand=\"SELECT * FROM [address]\"></asp:SqlDataSource>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                        </div>" + Environment.NewLine;
            constructor += "                        <div class=\"col-lg-12\">" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">address_id</span>" + Environment.NewLine;
            constructor += "                                <asp:TextBox disabled class=\"pull-right form-control form-control-disabled\" ID=\"address_id_Delete_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">address_type_id</span>" + Environment.NewLine;
            constructor += "                                <div class=\"required-container\">" + Environment.NewLine;
            constructor += "                                    <asp:RequiredFieldValidator CssClass=\"required\" ControlToValidate=\"address_type_id_Delete_TextBox\" ID=\"RequiredFieldValidator6\" runat=\"server\" Text=\"* Required Field\" ErrorMessage=\"Required Field\" ValidationGroup=\"Delete_Group\"></asp:RequiredFieldValidator>" + Environment.NewLine;
            constructor += "                                </div>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"address_type_id_Delete_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">city</span>" + Environment.NewLine;
            constructor += "                                <div class=\"required-container\">" + Environment.NewLine;
            constructor += "                                    <asp:RequiredFieldValidator CssClass=\"required\" ControlToValidate=\"city_Delete_TextBox\" ID=\"RequiredFieldValidator7\" runat=\"server\" Text=\"* Required Field\" ErrorMessage=\"Required Field\" ValidationGroup=\"Delete_Group\"></asp:RequiredFieldValidator>" + Environment.NewLine;
            constructor += "                                </div>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"city_Delete_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">country</span>" + Environment.NewLine;
            constructor += "                                <div class=\"required-container\">" + Environment.NewLine;
            constructor += "                                    <asp:RequiredFieldValidator CssClass=\"required\" ControlToValidate=\"country_Delete_TextBox\" ID=\"RequiredFieldValidator8\" runat=\"server\" Text=\"* Required Field\" ErrorMessage=\"Required Field\" ValidationGroup=\"Delete_Group\"></asp:RequiredFieldValidator>" + Environment.NewLine;
            constructor += "                                </div>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"country_Delete_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">County_Township</span>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"County_Township_Delete_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">longitude</span>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"longitude_Delete_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">latitude</span>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"latitude_Delete_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">state</span>" + Environment.NewLine;
            constructor += "                                <div class=\"required-container\">" + Environment.NewLine;
            constructor += "                                    <asp:RequiredFieldValidator CssClass=\"required\" ControlToValidate=\"state_Delete_TextBox\" ID=\"RequiredFieldValidator9\" runat=\"server\" Text=\"* Required Field\" ErrorMessage=\"Required Field\" ValidationGroup=\"Delete_Group\"></asp:RequiredFieldValidator>" + Environment.NewLine;
            constructor += "                                </div>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"state_Delete_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">str_add</span>" + Environment.NewLine;
            constructor += "                                <div class=\"required-container\">" + Environment.NewLine;
            constructor += "                                    <asp:RequiredFieldValidator CssClass=\"required\" ControlToValidate=\"str_add_Delete_TextBox\" ID=\"RequiredFieldValidator10\" runat=\"server\" Text=\"* Required Field\" ErrorMessage=\"Required Field\" ValidationGroup=\"Delete_Group\"></asp:RequiredFieldValidator>" + Environment.NewLine;
            constructor += "                                </div>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"str_add_Delete_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">str_add2</span>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"str_add2_Delete_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <span class=\"pull-left\">zip_plus_four</span>" + Environment.NewLine;
            constructor += "                                <asp:TextBox class=\"pull-right form-control\" ID=\"zip_plus_four_Delete_TextBox\" runat=\"server\"></asp:TextBox>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                            <div class=\"input-group text-center form-group\">" + Environment.NewLine;
            constructor += "                                <%--FREE SPACE--%>" + Environment.NewLine;
            constructor += "                            </div>" + Environment.NewLine;
            constructor += "                        </div>" + Environment.NewLine;
            constructor += "                        <hr />" + Environment.NewLine;
            constructor += "                        <div class=\"bottom-btn-container col-lg-12\">" + Environment.NewLine;
            constructor += "                            <asp:Button ID=\"Delete_Button\" runat=\"server\" Text=\"Delete\" CssClass=\"btn btn-default btn-lg one-bottom-btn\" OnClick=\"Delete_Button_Click\" ValidationGroup=\"Delete_Group\" />" + Environment.NewLine;
            constructor += "                        </div>" + Environment.NewLine;
            constructor += "                    </ContentTemplate>" + Environment.NewLine;
            constructor += "                </ajaxToolkit:TabPanel>" + Environment.NewLine;
            constructor += "            </ajaxToolkit:TabContainer>" + Environment.NewLine;
            constructor += "        </div>" + Environment.NewLine;
            constructor += "    </div>" + Environment.NewLine;

            constructor += "</asp:Content>" + Environment.NewLine;


            return constructor;
            //--------------------------------------------------------------------------
        }

        protected String cSharpFactory()
        {
            String constructor = "";
            constructor += "using System;" + Environment.NewLine;
            constructor += "using System.Collections.Generic;" + Environment.NewLine;
            constructor += "using System.Linq;" + Environment.NewLine;
            constructor += "using System.Web;" + Environment.NewLine;
            constructor += "using System.Web.UI;" + Environment.NewLine;
            constructor += "using System.Web.UI.WebControls;" + Environment.NewLine;

            constructor += "namespace Web.App" + Environment.NewLine;
            constructor += "{" + Environment.NewLine;
            constructor += "    public partial class " + tableName + "Class : System.Web.UI.Page" + Environment.NewLine;
            constructor += "    {" + Environment.NewLine;
            constructor += "        public address address = new address();" + Environment.NewLine;
            constructor += "        protected void Page_Load(object sender, EventArgs e)" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            if (!Page.IsPostBack) {" + Environment.NewLine;
            constructor += "            " + Environment.NewLine;
            constructor += "            }" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;

            constructor += "" + Environment.NewLine;        //GridView Functions" + Environment.NewLine;
            constructor += "        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            address = address_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            address = address_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            address = address_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        //Create Object Functions" + Environment.NewLine;
            constructor += "        public address address_selectForInsert(int ID)" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            address = address.Select(ID);" + Environment.NewLine;
            constructor += "            address_type_id_Insert_TextBox.Text = Convert.ToString(address.address_type_id);" + Environment.NewLine;
            constructor += "            city_Insert_TextBox.Text = Convert.ToString(address.city);" + Environment.NewLine;
            constructor += "            country_Insert_TextBox.Text = Convert.ToString(address.country);" + Environment.NewLine;
            constructor += "            County_Township_Insert_TextBox.Text = Convert.ToString(address.County_Township);" + Environment.NewLine;
            constructor += "            longitude_Insert_TextBox.Text = Convert.ToString(address.longitude);" + Environment.NewLine;
            constructor += "            latitude_Insert_TextBox.Text = Convert.ToString(address.latitude);" + Environment.NewLine;
            constructor += "            state_Insert_TextBox.Text = Convert.ToString(address.state);" + Environment.NewLine;
            constructor += "            str_add_Insert_TextBox.Text = Convert.ToString(address.str_add);" + Environment.NewLine;
            constructor += "            str_add2_Insert_TextBox.Text = Convert.ToString(address.str_add2);" + Environment.NewLine;
            constructor += "            zip_plus_four_Insert_TextBox.Text = Convert.ToString(address.zip_plus_four);" + Environment.NewLine;
            constructor += "            return address;" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        public address address_selectForUpdate(int ID)" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            address = address.Select(ID);" + Environment.NewLine;
            constructor += "            address_id_Update_TextBox.Text = Convert.ToString(address.address_id);" + Environment.NewLine;
            constructor += "            address_type_id_Update_TextBox.Text = Convert.ToString(address.address_type_id);" + Environment.NewLine;
            constructor += "            address_type_id_Update_TextBox.Text = Convert.ToString(address.address_type_id);" + Environment.NewLine;
            constructor += "            city_Update_TextBox.Text = Convert.ToString(address.city);" + Environment.NewLine;
            constructor += "            country_Update_TextBox.Text = Convert.ToString(address.country);" + Environment.NewLine;
            constructor += "            County_Township_Update_TextBox.Text = Convert.ToString(address.County_Township);" + Environment.NewLine;
            constructor += "            longitude_Update_TextBox.Text = Convert.ToString(address.longitude);" + Environment.NewLine;
            constructor += "            latitude_Update_TextBox.Text = Convert.ToString(address.latitude);" + Environment.NewLine;
            constructor += "            state_Update_TextBox.Text = Convert.ToString(address.state);" + Environment.NewLine;
            constructor += "            str_add_Update_TextBox.Text = Convert.ToString(address.str_add);" + Environment.NewLine;
            constructor += "            str_add2_Update_TextBox.Text = Convert.ToString(address.str_add2);" + Environment.NewLine;
            constructor += "            zip_plus_four_Update_TextBox.Text = Convert.ToString(address.zip_plus_four);" + Environment.NewLine;
            constructor += "            return address;" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        public address address_selectForDelete(int ID)" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            address = address.Select(ID);" + Environment.NewLine;
            constructor += "            address_id_Delete_TextBox.Text = Convert.ToString(address.address_id);" + Environment.NewLine;
            constructor += "            address_type_id_Delete_TextBox.Text = Convert.ToString(address.address_type_id);" + Environment.NewLine;
            constructor += "            address_type_id_Delete_TextBox.Text = Convert.ToString(address.address_type_id);" + Environment.NewLine;
            constructor += "            city_Delete_TextBox.Text = Convert.ToString(address.city);" + Environment.NewLine;
            constructor += "            country_Delete_TextBox.Text = Convert.ToString(address.country);" + Environment.NewLine;
            constructor += "            County_Township_Delete_TextBox.Text = Convert.ToString(address.County_Township);" + Environment.NewLine;
            constructor += "            longitude_Delete_TextBox.Text = Convert.ToString(address.longitude);" + Environment.NewLine;
            constructor += "            latitude_Delete_TextBox.Text = Convert.ToString(address.latitude);" + Environment.NewLine;
            constructor += "            state_Delete_TextBox.Text = Convert.ToString(address.state);" + Environment.NewLine;
            constructor += "            str_add_Delete_TextBox.Text = Convert.ToString(address.str_add);" + Environment.NewLine;
            constructor += "            str_add2_Delete_TextBox.Text = Convert.ToString(address.str_add2);" + Environment.NewLine;
            constructor += "            zip_plus_four_Delete_TextBox.Text = Convert.ToString(address.zip_plus_four);" + Environment.NewLine;
            constructor += "            return address;" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        //Database CRUD Call Functions" + Environment.NewLine;
            constructor += "        public address address_insert()" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            address.address_type_id = Convert.ToInt32(address_type_id_Insert_TextBox.Text);" + Environment.NewLine;
            constructor += "            address.city = city_Insert_TextBox.Text;" + Environment.NewLine;
            constructor += "            address.country = country_Insert_TextBox.Text;" + Environment.NewLine;
            constructor += "            address.County_Township = County_Township_Insert_TextBox.Text;" + Environment.NewLine;
            constructor += "            address.longitude = Convert.ToDecimal(longitude_Insert_TextBox.Text);" + Environment.NewLine;
            constructor += "            address.latitude = Convert.ToDecimal(latitude_Insert_TextBox.Text);" + Environment.NewLine;
            constructor += "            address.state = state_Insert_TextBox.Text;" + Environment.NewLine;
            constructor += "            address.str_add = str_add_Insert_TextBox.Text;" + Environment.NewLine;
            constructor += "            address.str_add2 = str_add2_Insert_TextBox.Text;" + Environment.NewLine;
            constructor += "            address.zip_plus_four = zip_plus_four_Insert_TextBox.Text;" + Environment.NewLine;
            constructor += "            address = address.Insert(address);" + Environment.NewLine;
            constructor += "            Insert_GridView.DataBind();" + Environment.NewLine;
            constructor += "            Update_GridView.DataBind();" + Environment.NewLine;
            constructor += "            Delete_GridView.DataBind();" + Environment.NewLine;
            constructor += "            return address;" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        public address address_update(int ID)" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            address = address.Select(ID);" + Environment.NewLine;
            constructor += "            address.address_id = Convert.ToInt32(address_id_Update_TextBox.Text);" + Environment.NewLine;
            constructor += "            address.address_type_id = Convert.ToInt32(address_type_id_Update_TextBox.Text);" + Environment.NewLine;
            constructor += "            address.city = city_Update_TextBox.Text;" + Environment.NewLine;
            constructor += "            address.country = country_Update_TextBox.Text;" + Environment.NewLine;
            constructor += "            address.County_Township = County_Township_Update_TextBox.Text;" + Environment.NewLine;
            constructor += "            address.longitude = Convert.ToDecimal(longitude_Update_TextBox.Text);" + Environment.NewLine;
            constructor += "            address.latitude = Convert.ToDecimal(latitude_Update_TextBox.Text);" + Environment.NewLine;
            constructor += "            address.state = state_Update_TextBox.Text;" + Environment.NewLine;
            constructor += "            address.str_add = str_add_Update_TextBox.Text;" + Environment.NewLine;
            constructor += "            address.str_add2 = str_add2_Update_TextBox.Text;" + Environment.NewLine;
            constructor += "            address.zip_plus_four = zip_plus_four_Update_TextBox.Text;" + Environment.NewLine;
            constructor += "            address.Update(address);" + Environment.NewLine;
            constructor += "            Insert_GridView.DataBind();" + Environment.NewLine;
            constructor += "            Update_GridView.DataBind();" + Environment.NewLine;
            constructor += "            Delete_GridView.DataBind();" + Environment.NewLine;
            constructor += "            return address;" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        public void address_delete(int ID)" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            address.Delete(ID);" + Environment.NewLine;
            constructor += "            Insert_GridView.DataBind();" + Environment.NewLine;
            constructor += "            Update_GridView.DataBind();" + Environment.NewLine;
            constructor += "            Delete_GridView.DataBind();" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        //Button Functions" + Environment.NewLine;
            constructor += "        protected void Insert_Button_Click(object sender, EventArgs e)" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            address = address_insert();" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        protected void Update_Button_Click(object sender, EventArgs e)" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            address = address_update(Convert.ToInt32(Update_GridView.SelectedValue));" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        protected void Delete_Button_Click(object sender, EventArgs e)" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            address_delete(Convert.ToInt32(Delete_GridView.SelectedValue));" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        " + Environment.NewLine;
            constructor += "    }" + Environment.NewLine;
            constructor += "" + Environment.NewLine;
            constructor += "}" + Environment.NewLine;
            return constructor;
        }

        protected String objectFactory()
        {
            String constructor = "";

            constructor += "using System;" + Environment.NewLine;
            constructor += "using System.IO;" + Environment.NewLine;
            constructor += "using System.Data;" + Environment.NewLine;
            constructor += "using System.Collections.Generic;" + Environment.NewLine;
            constructor += "using System.Text;" + Environment.NewLine;
            constructor += "using System.Data.SqlClient;" + Environment.NewLine;

            constructor += "namespace Web.App" + Environment.NewLine;
            constructor += "{" + Environment.NewLine;
            constructor += "    public class " + tableName + Environment.NewLine;
            constructor += "    {" + Environment.NewLine;
            constructor += "        public Int32 address_id" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            get;" + Environment.NewLine;
            constructor += "            set;" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        public Int32 address_type_id" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            get;" + Environment.NewLine;
            constructor += "            set;" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        public String city" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            get;" + Environment.NewLine;
            constructor += "            set;" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        public String country" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            get;" + Environment.NewLine;
            constructor += "            set;" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        public String County_Township" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            get;" + Environment.NewLine;
            constructor += "            set;" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        public Decimal longitude" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            get;" + Environment.NewLine;
            constructor += "            set;" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        public Decimal latitude" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            get;" + Environment.NewLine;
            constructor += "            set;" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        public String state" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            get;" + Environment.NewLine;
            constructor += "            set;" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        public String str_add" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            get;" + Environment.NewLine;
            constructor += "            set;" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        public String str_add2" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            get;" + Environment.NewLine;
            constructor += "            set;" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        public String zip_plus_four" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            get;" + Environment.NewLine;
            constructor += "            set;" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "" + Environment.NewLine;

            constructor += "        public void SetColumnDefaults()" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            address_id = 0;" + Environment.NewLine;
            constructor += "            address_type_id = 0;" + Environment.NewLine;
            constructor += "            city = \" \";" + Environment.NewLine;
            constructor += "            country = \" \";" + Environment.NewLine;
            constructor += "            County_Township = \" \";" + Environment.NewLine;
            constructor += "            longitude = 0;" + Environment.NewLine;
            constructor += "            latitude = 0;" + Environment.NewLine;
            constructor += "            state = \" \";" + Environment.NewLine;
            constructor += "            str_add = \" \";" + Environment.NewLine;
            constructor += "            str_add2 = \" \";" + Environment.NewLine;
            constructor += "            zip_plus_four = \" \";" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        public address Select(int id)" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            address address = new address();" + Environment.NewLine;
            constructor += "            string ConnectionString = IDManager.connection();" + Environment.NewLine;
            constructor += "            SqlConnection con = new SqlConnection(ConnectionString);" + Environment.NewLine;
            constructor += "            try" + Environment.NewLine;
            constructor += "            {" + Environment.NewLine;
            constructor += "                con.Open();" + Environment.NewLine;
            constructor += "                SqlCommand cmd = new SqlCommand(\"SP_DMCS_SELECT_ADDRESS\", con);" + Environment.NewLine;
            constructor += "                cmd.CommandType = System.Data.CommandType.StoredProcedure;" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@address_id\", id);" + Environment.NewLine;
            constructor += "                SqlDataReader rdr = cmd.ExecuteReader();" + Environment.NewLine;
            constructor += "                if (rdr.HasRows)" + Environment.NewLine;
            constructor += "                {" + Environment.NewLine;
            constructor += "                    rdr.Read();" + Environment.NewLine;
            constructor += "                    if (!rdr.IsDBNull(0))" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.address_id = rdr.GetInt32(0);" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    else" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.address_id = 0;" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    if (!rdr.IsDBNull(1))" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.address_type_id = rdr.GetInt32(1);" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    else" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.address_type_id = 0;" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    if (!rdr.IsDBNull(2))" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.city = rdr.GetString(2);" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    else" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.city = \" \";" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    if (!rdr.IsDBNull(3))" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.country = rdr.GetString(3);" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    else" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.country = \" \";" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    if (!rdr.IsDBNull(4))" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.County_Township = rdr.GetString(4);" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    else" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.County_Township = \" \";" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    if (!rdr.IsDBNull(5))" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.longitude = rdr.GetDecimal(5);" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    else" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.longitude = 0;" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    if (!rdr.IsDBNull(6))" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.latitude = rdr.GetDecimal(6);" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    else" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.latitude = 0;" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    if (!rdr.IsDBNull(7))" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.state = rdr.GetString(7);" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    else" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.state = \" \";" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    if (!rdr.IsDBNull(8))" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.str_add = rdr.GetString(8);" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    else" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.str_add = \" \";" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    if (!rdr.IsDBNull(9))" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.str_add2 = rdr.GetString(9);" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    else" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.str_add2 = \" \";" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    if (!rdr.IsDBNull(10))" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.zip_plus_four = rdr.GetString(10);" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                    else" + Environment.NewLine;
            constructor += "                    {" + Environment.NewLine;
            constructor += "                        address.zip_plus_four = \" \";" + Environment.NewLine;
            constructor += "                    }" + Environment.NewLine;
            constructor += "                }" + Environment.NewLine;
            constructor += "                else" + Environment.NewLine;
            constructor += "                {" + Environment.NewLine;
            constructor += "                    address.SetColumnDefaults();" + Environment.NewLine;
            constructor += "                }" + Environment.NewLine;
            constructor += "            }" + Environment.NewLine;
            constructor += "            catch (Exception ex)" + Environment.NewLine;
            constructor += "            {" + Environment.NewLine;
            constructor += "                address.SetColumnDefaults();" + Environment.NewLine;
            constructor += "                return address;" + Environment.NewLine;
            constructor += "            }" + Environment.NewLine;
            constructor += "            finally" + Environment.NewLine;
            constructor += "            {" + Environment.NewLine;
            constructor += "                con.Close();" + Environment.NewLine;
            constructor += "            }" + Environment.NewLine;
            constructor += "            return address;" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;

            constructor += "        public address Insert(address id)" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            string ConnectionString = IDManager.connection();" + Environment.NewLine;
            constructor += "            SqlConnection con = new SqlConnection(ConnectionString);" + Environment.NewLine;
            constructor += "            try" + Environment.NewLine;
            constructor += "            {" + Environment.NewLine;
            constructor += "                con.Open();" + Environment.NewLine;
            constructor += "                SqlCommand cmd = new SqlCommand(\"SP_DMCS_INSERT_ADDRESS\", con);" + Environment.NewLine;
            constructor += "                cmd.CommandType = System.Data.CommandType.StoredProcedure;" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@address_type_id\", id.address_type_id);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@city\", id.city);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@country\", id.country);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@County_Township\", id.County_Township);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@longitude\", id.longitude);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@latitude\", id.latitude);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@state\", id.state);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@str_add\", id.str_add);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@str_add2\", id.str_add2);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@zip_plus_four\", id.zip_plus_four);" + Environment.NewLine;
            constructor += "                cmd.ExecuteReader();" + Environment.NewLine;
            constructor += "                con.Close();" + Environment.NewLine;
            constructor += "                con.Open();" + Environment.NewLine;
            constructor += "                cmd = new SqlCommand(\"SP_DMCS_GET_ADDRESS\", con);" + Environment.NewLine;
            constructor += "                cmd.CommandType = System.Data.CommandType.StoredProcedure;" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@address_type_id\", id.address_type_id);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@city\", id.city);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@country\", id.country);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@County_Township\", id.County_Township);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@longitude\", id.longitude);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@latitude\", id.latitude);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@state\", id.state);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@str_add\", id.str_add);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@str_add2\", id.str_add2);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@zip_plus_four\", id.zip_plus_four);" + Environment.NewLine;
            constructor += "                SqlDataReader rdr = cmd.ExecuteReader();" + Environment.NewLine;
            constructor += "                if (rdr.HasRows)" + Environment.NewLine;
            constructor += "                {" + Environment.NewLine;
            constructor += "                    rdr.Read();" + Environment.NewLine;
            constructor += "                    id.address_id = rdr.GetInt32(0);" + Environment.NewLine;
            constructor += "                }" + Environment.NewLine;
            constructor += "            }" + Environment.NewLine;
            constructor += "            catch (Exception ex)" + Environment.NewLine;
            constructor += "            {" + Environment.NewLine;
            constructor += "                id.SetColumnDefaults();" + Environment.NewLine;
            constructor += "            }" + Environment.NewLine;
            constructor += "            finally" + Environment.NewLine;
            constructor += "            {" + Environment.NewLine;
            constructor += "                con.Close();" + Environment.NewLine;
            constructor += "            }" + Environment.NewLine;
            constructor += "            return id;" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        public Boolean Update(address id)" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            string ConnectionString = IDManager.connection();" + Environment.NewLine;
            constructor += "            SqlConnection con = new SqlConnection(ConnectionString);" + Environment.NewLine;
            constructor += "            try" + Environment.NewLine;
            constructor += "            {" + Environment.NewLine;
            constructor += "                con.Open();" + Environment.NewLine;
            constructor += "                SqlCommand cmd = new SqlCommand(\"SP_DMCS_UPDATE_ADDRESS\", con);" + Environment.NewLine;
            constructor += "                cmd.CommandType = System.Data.CommandType.StoredProcedure;" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@address_id\", id.address_id);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@address_type_id\", id.address_type_id);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@city\", id.city);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@country\", id.country);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@County_Township\", id.County_Township);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@longitude\", id.longitude);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@latitude\", id.latitude);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@state\", id.state);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@str_add\", id.str_add);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@str_add2\", id.str_add2);" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@zip_plus_four\", id.zip_plus_four);" + Environment.NewLine;
            constructor += "                cmd.ExecuteReader();" + Environment.NewLine;
            constructor += "                con.Close();" + Environment.NewLine;
            constructor += "                return true;" + Environment.NewLine;
            constructor += "            }" + Environment.NewLine;
            constructor += "            catch (Exception ex)" + Environment.NewLine;
            constructor += "            {" + Environment.NewLine;
            constructor += "                return false;" + Environment.NewLine;
            constructor += "            }" + Environment.NewLine;
            constructor += "            finally" + Environment.NewLine;
            constructor += "            {" + Environment.NewLine;
            constructor += "                con.Close();" + Environment.NewLine;
            constructor += "            }" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "        public Boolean Delete(int id)" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            string ConnectionString = IDManager.connection();" + Environment.NewLine;
            constructor += "            SqlConnection con = new SqlConnection(ConnectionString);" + Environment.NewLine;
            constructor += "            try" + Environment.NewLine;
            constructor += "            {" + Environment.NewLine;
            constructor += "                con.Open();" + Environment.NewLine;
            constructor += "                SqlCommand cmd = new SqlCommand(\"SP_DMCS_DELETE_ADDRESS\", con);" + Environment.NewLine;
            constructor += "                cmd.CommandType = System.Data.CommandType.StoredProcedure;" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@address_id\", id);" + Environment.NewLine;
            constructor += "                cmd.ExecuteReader();" + Environment.NewLine;
            constructor += "                con.Close();" + Environment.NewLine;
            constructor += "                return true;" + Environment.NewLine;
            constructor += "            }" + Environment.NewLine;
            constructor += "            catch (Exception ex)" + Environment.NewLine;
            constructor += "            {" + Environment.NewLine;
            constructor += "                return false;" + Environment.NewLine;
            constructor += "            }" + Environment.NewLine;
            constructor += "            finally" + Environment.NewLine;
            constructor += "            {" + Environment.NewLine;
            constructor += "                con.Close();" + Environment.NewLine;
            constructor += "            }" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;

            constructor += "        public DataTable Select(string whereclause)" + Environment.NewLine;
            constructor += "        {" + Environment.NewLine;
            constructor += "            DataTable alrows = new DataTable();" + Environment.NewLine;
            constructor += "            string ConnectionString = IDManager.connection();" + Environment.NewLine;
            constructor += "            SqlConnection con = new SqlConnection(ConnectionString);" + Environment.NewLine;
            constructor += "            try" + Environment.NewLine;
            constructor += "            {" + Environment.NewLine;
            constructor += "                con.Open();" + Environment.NewLine;
            constructor += "                SqlCommand cmd = new SqlCommand(\"SP_DMCS_SELECT_ADDRESS_WC\", con);" + Environment.NewLine;
            constructor += "                cmd.CommandType = System.Data.CommandType.StoredProcedure;" + Environment.NewLine;
            constructor += "                cmd.Parameters.AddWithValue(\"@wareclause\", whereclause);" + Environment.NewLine;
            constructor += "                SqlDataReader rdr = cmd.ExecuteReader();" + Environment.NewLine;
            constructor += "                alrows.Load(rdr);" + Environment.NewLine;
            constructor += "                return alrows;" + Environment.NewLine;
            constructor += "            }" + Environment.NewLine;
            constructor += "            catch (Exception ex)" + Environment.NewLine;
            constructor += "            {" + Environment.NewLine;
            constructor += "                return alrows;" + Environment.NewLine;
            constructor += "            }" + Environment.NewLine;
            constructor += "            finally" + Environment.NewLine;
            constructor += "            {" + Environment.NewLine;
            constructor += "                con.Close();" + Environment.NewLine;
            constructor += "            }" + Environment.NewLine;
            constructor += "        }" + Environment.NewLine;
            constructor += "    }" + Environment.NewLine;
            constructor += "}" + Environment.NewLine;

            return constructor;
        }

        protected String sqlFactory()
        {
            String constructor = "";

            constructor += "/****** Object:  Table [dbo].[" + tableName + "]    Script Date: " + DateTime.Now + " ******/" + Environment.NewLine;
            constructor += "SET ANSI_NULLS ON" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;
            constructor += "SET QUOTED_IDENTIFIER ON" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;
            constructor += "SET ANSI_PADDING ON" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;
            constructor += "CREATE TABLE [dbo].[" + tableName + "](" + Environment.NewLine;

            constructor += "  [" + DB_Names[0] + "] " + DB_Types[0] + " IDENTITY(1,1) " + Null_Names[0] + "," + Environment.NewLine;

            for (int i = 1; i < DB_Names.Count - 1; i++)
            {
                script_generator = script_generator.Select(tableName, DB_Names[i]);
                //check for percisionable value
                if (script_generator.result == 0)
                {
                    constructor += "  [" + DB_Names[i] + "] " + DB_Types[i] + " " + Null_Names[i] + "," + Environment.NewLine;
                }
                //check for MAX
                else if (script_generator.result == -1)
                {
                    constructor += "  [" + DB_Names[i] + "] " + DB_Types[i] + "(MAX) " + Null_Names[i] + "," + Environment.NewLine;
                }
                //All others
                else
                {
                    constructor += "  [" + DB_Names[i] + "] " + DB_Types[i] + "(" + script_generator.result + ") " + Null_Names[i] + "," + Environment.NewLine;

                }

            }


            constructor += " CONSTRAINT [" + tableName + "_" + DB_Names[0] + "_pk] PRIMARY KEY CLUSTERED " + Environment.NewLine;
            constructor += "(" + Environment.NewLine;
            constructor += "	[" + DB_Names[0] + "] ASC" + Environment.NewLine;
            constructor += ")WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]" + Environment.NewLine;
            constructor += ") ON [PRIMARY] " + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;
            constructor += "SET ANSI_PADDING OFF" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;
            constructor += "/*************************************************/" + Environment.NewLine;
            constructor += "/****** FK TEMPLATE - NEEDS ACCURATE DATA - ******/" + Environment.NewLine;
            constructor += "/*************************************************/" + Environment.NewLine;
            constructor += "/**********    ALTER TABLE [dbo].[THIS_tableName]  WITH CHECK ADD  CONSTRAINT [NAME_OF_CONSTRAINT] FOREIGN KEY([FK_ON_THIS_TABLE])    **********/" + Environment.NewLine;
            constructor += "/**********    REFERENCES [dbo].[OTHER_tableName] ([OTHER_TABLE_FK])    **********/" + Environment.NewLine;
            constructor += "/**********    GO    **********/" + Environment.NewLine;
            constructor += "/**********    ALTER TABLE [dbo].[THIS_tableName] CHECK CONSTRAINT [NAME_OF_CONSTRAINT]    **********/" + Environment.NewLine;
            constructor += "/**********    GO    **********/" + Environment.NewLine;


            constructor += "/***********************************************************/" + Environment.NewLine;
            constructor += "/*************************************************/" + Environment.NewLine;
            constructor += "/****** - SELECT STORED PROCEDURE -  ******/" + Environment.NewLine;
            constructor += "/*************************************************/" + Environment.NewLine;
            constructor += "/***********************************************************/" + Environment.NewLine;
            //SELECT
            constructor += "/****** Object:  StoredProcedure [dbo].[SP_DMCS_SELECT_" + tableName.ToUpper() + "]    Script Date: " + DateTime.Now + " ******/" + Environment.NewLine;
            constructor += "IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_SELECT_" + tableName.ToUpper() + "]') AND type in (N'P', N'PC'))" + Environment.NewLine;
            constructor += "DROP PROCEDURE [dbo].[SP_DMCS_SELECT_" + tableName.ToUpper() + "]" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;
            constructor += "SET ANSI_NULLS ON" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;
            constructor += "SET QUOTED_IDENTIFIER ON" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;
            constructor += "CREATE PROCEDURE [dbo].[SP_DMCS_SELECT_" + tableName.ToUpper() + "]" + Environment.NewLine;
            constructor += "           @" + DB_Names[0] + " as " + DB_Types[0] + Environment.NewLine;
            constructor += "AS" + Environment.NewLine;
            constructor += "BEGIN" + Environment.NewLine;
            constructor += "	-- SET NOCOUNT ON added to prevent extra result sets from" + Environment.NewLine;
            constructor += "	-- interfering with SELECT statements." + Environment.NewLine;
            constructor += "	SET NOCOUNT ON;" + Environment.NewLine;
            constructor += "SELECT [" + DB_Names[0] + "]" + Environment.NewLine;

            for (int i = 1; i < DB_Names.Count - 1; i++)
            {
                constructor += "      ,[" + DB_Names[i] + "]" + Environment.NewLine;
            }
            constructor += "  FROM [dbo].[" + tableName + "]" + Environment.NewLine;
            constructor += " WHERE " + DB_Names[0] + " = @" + DB_Names[0] + Environment.NewLine;
            constructor += "End" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;

            constructor += "/***********************************************************/" + Environment.NewLine;
            constructor += "/*************************************************/" + Environment.NewLine;
            constructor += "/****** - INSERT STORED PROCEDURE -  ******/" + Environment.NewLine;
            constructor += "/*************************************************/" + Environment.NewLine;
            constructor += "/***********************************************************/" + Environment.NewLine;
            //INSERT
            constructor += "/****** Object:  StoredProcedure [dbo].[SP_DMCS_INSERT_" + tableName.ToUpper() + "]    Script Date: " + DateTime.Now + " ******/" + Environment.NewLine;
            constructor += "IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_INSERT_" + tableName.ToUpper() + "]') AND type in (N'P', N'PC'))" + Environment.NewLine;
            constructor += "DROP PROCEDURE [dbo].[SP_DMCS_INSERT_" + tableName.ToUpper() + "]" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;
            constructor += "SET ANSI_NULLS ON" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;
            constructor += "SET QUOTED_IDENTIFIER ON" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;
            constructor += "CREATE PROCEDURE [dbo].[SP_DMCS_INSERT_" + tableName.ToUpper() + "]" + Environment.NewLine;
            //check to see if tables PK is sequential

            script_generator = script_generator.Check_Identity(tableName);
            //if not..
            if (script_generator.result == 0)
            {
                for (int i = 0; i < DB_Names.Count - 1; i++)
                {

                    script_generator = script_generator.Select(tableName, DB_Names[i]);
                    //check for percisionable value
                    if (script_generator.result == 0 || DB_Types[i] == "text" || DB_Types[i] == "geography" || DB_Types[i] == "image")
                    {
                        if (i == DB_Names.Count - 2)
                        {
                            constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + Environment.NewLine;
                        }
                        else
                        {
                            constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + "," + Environment.NewLine;
                        }
                    }
                    //check for MAX
                    else if (script_generator.result == -1)
                    {
                        if (i == DB_Names.Count - 2)
                        {
                            constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + "(MAX)" + Environment.NewLine;
                        }
                        else
                        {
                            constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + "(MAX)," + Environment.NewLine;
                        }
                    }
                    //All others
                    else
                    {
                        if (i == DB_Names.Count - 2)
                        {
                            constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + "(" + script_generator.result + ")" + Environment.NewLine;
                        }
                        else
                        {
                            constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + "(" + script_generator.result + ")," + Environment.NewLine;
                        }
                    }
                }
            }
            else
            {
                for (int i = 1; i < DB_Names.Count - 1; i++)
                {
                    script_generator = script_generator.Select(tableName, DB_Names[i]);
                    //check for percisionable value
                    if (script_generator.result == 0 || DB_Types[i] == "text" || DB_Types[i] == "geography" || DB_Types[i] == "image")
                    {
                        if (i == DB_Names.Count - 2)
                        {
                            constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + Environment.NewLine;
                        }
                        else
                        {
                            constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + "," + Environment.NewLine;
                        }
                    }
                    //check for MAX
                    else if (script_generator.result == -1)
                    {
                        if (i == DB_Names.Count - 2)
                        {
                            constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + "(MAX)" + Environment.NewLine;
                        }
                        else
                        {
                            constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + "(MAX)," + Environment.NewLine;
                        }
                    }
                    //All others
                    else
                    {
                        if (i == DB_Names.Count - 2)
                        {
                            constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + "(" + script_generator.result + ")" + Environment.NewLine;
                        }
                        else
                        {
                            constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + "(" + script_generator.result + ")," + Environment.NewLine;
                        }
                    }
                }
            }

            constructor += "AS" + Environment.NewLine;
            constructor += "BEGIN" + Environment.NewLine;
            constructor += "	-- SET NOCOUNT ON added to prevent extra result sets from" + Environment.NewLine;
            constructor += "	-- interfering with SELECT statements." + Environment.NewLine;
            constructor += "	SET NOCOUNT ON;" + Environment.NewLine;
            for (int i = 1; i < DB_Names.Count - 1; i++)
            {
                if (DB_Types[i] == "varchar" || DB_Types[i] == "char")
                {
                    constructor += "	  IF @" + DB_Names[i] + " = ''" + Environment.NewLine;
                    constructor += "    BEGIN" + Environment.NewLine;
                    constructor += "    SET @" + DB_Names[i] + " = null" + Environment.NewLine;
                    constructor += "    END" + Environment.NewLine;
                }
                else if (DB_Types[i] == "datetime")
                {
                    constructor += "	  IF @" + DB_Names[i] + " = '9/9/1900 12:00:00 AM'" + Environment.NewLine;
                    constructor += "    BEGIN" + Environment.NewLine;
                    constructor += "    SET @" + DB_Names[i] + " = null" + Environment.NewLine;
                    constructor += "    END" + Environment.NewLine;
                }
                else if (DB_Types[i] == "text" || DB_Types[i] == "geography" || DB_Types[i] == "image")
                {
                }
                else
                {
                    constructor += "	  IF @" + DB_Names[i] + " = 0" + Environment.NewLine;
                    constructor += "    BEGIN" + Environment.NewLine;
                    constructor += "    SET @" + DB_Names[i] + " = null" + Environment.NewLine;
                    constructor += "    END" + Environment.NewLine;
                }
            }
            constructor += "	Insert INTO [dbo].[" + tableName + "]" + Environment.NewLine;
            constructor += "           (" + Environment.NewLine;
            //check to see if tables PK is sequential
            script_generator = script_generator.Check_Identity(tableName);
            //if not..
            if (script_generator.result == 0)
            {
                for (int i = 0; i < DB_Names.Count - 1; i++)
                {
                    if (i == 0)
                    {
                        constructor += "            [" + DB_Names[i] + "]" + Environment.NewLine;
                    }
                    else
                    {
                        constructor += "           ,[" + DB_Names[i] + "]" + Environment.NewLine;
                    }
                }
                constructor += "            )" + Environment.NewLine;
                constructor += "     VALUES (" + Environment.NewLine;

                for (int i = 0; i < DB_Names.Count - 1; i++)
                {
                    if (i == 0)
                    {
                        constructor += "            @" + DB_Names[i] + Environment.NewLine;
                    }
                    else
                    {
                        constructor += "           ,@" + DB_Names[i] + Environment.NewLine;
                    }
                }
            }
            else
            {
                for (int i = 1; i < DB_Names.Count - 1; i++)
                {
                    if (i == 1)
                    {
                        constructor += "            [" + DB_Names[i] + "]" + Environment.NewLine;
                    }
                    else
                    {
                        constructor += "           ,[" + DB_Names[i] + "]" + Environment.NewLine;
                    }
                }
                constructor += "            )" + Environment.NewLine;
                constructor += "     VALUES (" + Environment.NewLine;

                for (int i = 1; i < DB_Names.Count - 1; i++)
                {
                    if (i == 1)
                    {
                        constructor += "            @" + DB_Names[i] + Environment.NewLine;
                    }
                    else
                    {
                        constructor += "           ,@" + DB_Names[i] + Environment.NewLine;
                    }
                }
            }
            constructor += "            )" + Environment.NewLine;
            constructor += "END" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;

            constructor += "/***********************************************************/" + Environment.NewLine;
            constructor += "/*************************************************/" + Environment.NewLine;
            constructor += "/****** - UPDATE STORED PROCEDURE -  ******/" + Environment.NewLine;
            constructor += "/*************************************************/" + Environment.NewLine;
            constructor += "/***********************************************************/" + Environment.NewLine;
            //UPDATE

            constructor += "/****** Object:  StoredProcedure [dbo].[SP_DMCS_UPDATE_" + tableName.ToUpper() + "]    Script Date: " + DateTime.Now + " ******/" + Environment.NewLine;
            constructor += "IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_UPDATE_" + tableName.ToUpper() + "]') AND type in (N'P', N'PC'))" + Environment.NewLine;
            constructor += "DROP PROCEDURE [dbo].[SP_DMCS_UPDATE_" + tableName.ToUpper() + "]" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;
            constructor += "SET ANSI_NULLS ON" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;
            constructor += "SET QUOTED_IDENTIFIER ON" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;
            constructor += "CREATE PROCEDURE [dbo].[SP_DMCS_UPDATE_" + tableName.ToUpper() + "]" + Environment.NewLine;

            for (int i = 0; i < DB_Names.Count - 1; i++)
            {
                script_generator = script_generator.Select(tableName, DB_Names[i]);
                //check for percisionable value
                if (script_generator.result == 0 || DB_Types[i] == "text" || DB_Types[i] == "geography" || DB_Types[i] == "image")
                {
                    if (i == DB_Names.Count - 2)
                    {
                        constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + Environment.NewLine;
                    }
                    else
                    {
                        constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + "," + Environment.NewLine;
                    }
                }
                //check for MAX
                else if (script_generator.result == -1)
                {
                    if (i == DB_Names.Count - 2)
                    {
                        constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + "(MAX)" + Environment.NewLine;
                    }
                    else
                    {
                        constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + "(MAX)," + Environment.NewLine;
                    }
                }
                //All others
                else
                {
                    if (i == DB_Names.Count - 2)
                    {
                        constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + "(" + script_generator.result + ")" + Environment.NewLine;
                    }
                    else
                    {
                        constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + "(" + script_generator.result + ")," + Environment.NewLine;
                    }
                }
            }

            constructor += "AS" + Environment.NewLine;
            constructor += "BEGIN" + Environment.NewLine;
            constructor += "	-- SET NOCOUNT ON added to prevent extra result sets from" + Environment.NewLine;
            constructor += "	-- interfering with SELECT statements." + Environment.NewLine;
            constructor += "	SET NOCOUNT ON;" + Environment.NewLine;
            for (int i = 1; i < DB_Names.Count - 1; i++)
            {
                if (DB_Types[i] == "varchar" || DB_Types[i] == "char")
                {
                    constructor += "	  IF @" + DB_Names[i] + " = ''" + Environment.NewLine;
                    constructor += "    BEGIN" + Environment.NewLine;
                    constructor += "    SET @" + DB_Names[i] + " = null" + Environment.NewLine;
                    constructor += "    END" + Environment.NewLine;
                }
                else if (DB_Types[i] == "datetime")
                {
                    constructor += "	  IF @" + DB_Names[i] + " = '9/9/1900 12:00:00 AM'" + Environment.NewLine;
                    constructor += "    BEGIN" + Environment.NewLine;
                    constructor += "    SET @" + DB_Names[i] + " = null" + Environment.NewLine;
                    constructor += "    END" + Environment.NewLine;
                }
                else if (DB_Types[i] == "text" || DB_Types[i] == "geography" || DB_Types[i] == "image")
                {
                }
                else
                {
                    constructor += "	  IF @" + DB_Names[i] + " = 0" + Environment.NewLine;
                    constructor += "    BEGIN" + Environment.NewLine;
                    constructor += "    SET @" + DB_Names[i] + " = null" + Environment.NewLine;
                    constructor += "    END" + Environment.NewLine;
                }
            }
            constructor += "	UPDATE [dbo].[" + tableName + "]" + Environment.NewLine;
            constructor += "       SET" + Environment.NewLine;

            for (int i = 1; i < DB_Names.Count - 1; i++)
            {
                if (i == DB_Names.Count - 1 - 1)
                {
                    constructor += "		   [" + DB_Names[i] + "] = @" + DB_Names[i] + Environment.NewLine;
                }
                else
                {
                    constructor += "		   [" + DB_Names[i] + "] = @" + DB_Names[i] + "," + Environment.NewLine;
                }
            }


            constructor += "       WHERE " + DB_Names[0] + " = @" + DB_Names[0] + Environment.NewLine;
            constructor += "END" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;



            constructor += "/***********************************************************/" + Environment.NewLine;
            constructor += "/*************************************************/" + Environment.NewLine;
            constructor += "/****** - DELETE STORED PROCEDURE -  ******/" + Environment.NewLine;
            constructor += "/*************************************************/" + Environment.NewLine;
            constructor += "/***********************************************************/" + Environment.NewLine;
            //DELETE

            constructor += "/****** Object:  StoredProcedure [dbo].[SP_DMCS_DELETE_" + tableName.ToUpper() + "]    Script Date: " + DateTime.Now + " ******/" + Environment.NewLine;
            constructor += "IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_DELETE_" + tableName.ToUpper() + "]') AND type in (N'P', N'PC'))" + Environment.NewLine;
            constructor += "DROP PROCEDURE [dbo].[SP_DMCS_DELETE_" + tableName.ToUpper() + "]" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;
            constructor += "SET ANSI_NULLS ON" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;
            constructor += "SET QUOTED_IDENTIFIER ON" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;
            constructor += "CREATE PROCEDURE [dbo].[SP_DMCS_DELETE_" + tableName.ToUpper() + "]" + Environment.NewLine;
            constructor += "	@" + DB_Names[0] + " " + DB_Types[0] + Environment.NewLine;
            constructor += "AS" + Environment.NewLine;
            constructor += "BEGIN" + Environment.NewLine;
            constructor += "	-- SET NOCOUNT ON added to prevent extra result sets from" + Environment.NewLine;
            constructor += "	-- interfering with SELECT statements." + Environment.NewLine;
            constructor += "	SET NOCOUNT ON;" + Environment.NewLine;
            constructor += "	Delete dbo." + tableName + Environment.NewLine;
            constructor += "	where " + DB_Names[0] + " = @" + DB_Names[0] + Environment.NewLine;
            constructor += "END" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;


            //GET SP
            constructor += "/***********************************************************/" + Environment.NewLine;
            constructor += "/*************************************************/" + Environment.NewLine;
            constructor += "/****** - GET STORED PROCEDURE -  ******/" + Environment.NewLine;
            constructor += "/*************************************************/" + Environment.NewLine;
            constructor += "/***********************************************************/" + Environment.NewLine;

            constructor += "/****** Object:  StoredProcedure [dbo].[SP_DMCS_GET_" + tableName.ToUpper() + "]    Script Date: " + DateTime.Now + " ******/" + Environment.NewLine;
            constructor += "IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DMCS_GET_" + tableName.ToUpper() + "]') AND type in (N'P', N'PC'))" + Environment.NewLine;
            constructor += "DROP PROCEDURE [dbo].[SP_DMCS_GET_" + tableName.ToUpper() + "]" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;
            constructor += "SET ANSI_NULLS ON" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;
            constructor += "SET QUOTED_IDENTIFIER ON" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;
            constructor += "CREATE PROCEDURE [dbo].[SP_DMCS_GET_" + tableName.ToUpper() + "]" + Environment.NewLine;
            for (int i = 1; i < DB_Names.Count - 1; i++)
            {
                script_generator = script_generator.Select(tableName, DB_Names[i]);
                //check for percisionable value
                if (script_generator.result == 0 || DB_Types[i] == "text" || DB_Types[i] == "geography" || DB_Types[i] == "image")
                {
                    if (i == DB_Names.Count - 2)
                    {
                        constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + Environment.NewLine;
                    }
                    else
                    {
                        constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + "," + Environment.NewLine;
                    }
                }
                //check for MAX
                else if (script_generator.result == -1)
                {
                    if (i == DB_Names.Count - 2)
                    {
                        constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + "(MAX)" + Environment.NewLine;
                    }
                    else
                    {
                        constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + "(MAX)," + Environment.NewLine;
                    }
                }
                //All others
                else
                {
                    if (i == DB_Names.Count - 2)
                    {
                        constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + "(" + script_generator.result + ")" + Environment.NewLine;
                    }
                    else
                    {
                        constructor += "	  @" + DB_Names[i] + " as " + DB_Types[i] + "(" + script_generator.result + ")," + Environment.NewLine;
                    }
                }
            }
            constructor += "AS" + Environment.NewLine;
            constructor += "BEGIN" + Environment.NewLine;
            constructor += "	-- SET NOCOUNT ON added to prevent extra result sets from" + Environment.NewLine;
            constructor += "	-- interfering with SELECT statements." + Environment.NewLine;
            constructor += "	SET NOCOUNT ON;" + Environment.NewLine;
            for (int i = 1; i < DB_Names.Count - 1; i++)
            {
                if (DB_Types[i] == "varchar" || DB_Types[i] == "char")
                {
                    constructor += "	  IF @" + DB_Names[i] + " = ''" + Environment.NewLine;
                    constructor += "    BEGIN" + Environment.NewLine;
                    constructor += "    SET @" + DB_Names[i] + " = null" + Environment.NewLine;
                    constructor += "    END" + Environment.NewLine;
                }
                else if (DB_Types[i] == "datetime")
                {
                    constructor += "	  IF @" + DB_Names[i] + " = '9/9/1900 12:00:00 AM'" + Environment.NewLine;
                    constructor += "    BEGIN" + Environment.NewLine;
                    constructor += "    SET @" + DB_Names[i] + " = null" + Environment.NewLine;
                    constructor += "    END" + Environment.NewLine;
                }
                else if (DB_Types[i] == "text" || DB_Types[i] == "geography" || DB_Types[i] == "image")
                {
                }
                else
                {
                    constructor += "	  IF @" + DB_Names[i] + " = 0" + Environment.NewLine;
                    constructor += "    BEGIN" + Environment.NewLine;
                    constructor += "    SET @" + DB_Names[i] + " = null" + Environment.NewLine;
                    constructor += "    END" + Environment.NewLine;
                }
            }
            constructor += "    SELECT [" + DB_Names[0] + "] " + Environment.NewLine;
            constructor += "      FROM [dbo].[" + tableName + "] " + Environment.NewLine;
            for (int i = 1; i < DB_Names.Count - 1; i++)
            {
                String Equal_Sign;
                if (DB_Types[i] == "varchar" || DB_Types[i] == "text")
                { Equal_Sign = "like"; }
                else { Equal_Sign = "="; }
                if (i == 1)
                {
                    if (DB_Types[i] != "geography" && DB_Types[i] != "image" && Null_Names[i] == "NOT NULL")
                    {
                        constructor += "       WHERE ([" + DB_Names[i] + "] " + Equal_Sign + " @" + DB_Names[i] + ")" + Environment.NewLine;
                    }
                    else if (DB_Types[i] != "geography" && DB_Types[i] != "image" && Null_Names[i] == "NULL")
                    {
                        constructor += "       WHERE ([" + DB_Names[i] + "] " + Equal_Sign + " @" + DB_Names[i] + " or [" + DB_Names[i] + "] is null)" + Environment.NewLine;
                    }
                }
                else
                {
                    if (DB_Types[i] != "geography" && DB_Types[i] != "image" && Null_Names[i] == "NOT NULL")
                    {
                        constructor += "       AND ([" + DB_Names[i] + "] " + Equal_Sign + " @" + DB_Names[i] + ")" + Environment.NewLine;
                    }
                    else if (DB_Types[i] != "geography" && DB_Types[i] != "image" && Null_Names[i] == "NULL")
                    {
                        constructor += "       AND ([" + DB_Names[i] + "] " + Equal_Sign + " @" + DB_Names[i] + " or [" + DB_Names[i] + "] is null)" + Environment.NewLine;
                    }
                }
            }

            constructor += "END" + Environment.NewLine;
            constructor += "GO" + Environment.NewLine;



            return constructor;
        }

        protected String angularJSFactory()
        {
            String constructor = "";

            constructor += "(function () {" + Environment.NewLine;
            constructor += "    'use strict';" + Environment.NewLine;
            constructor += "    /**" + Environment.NewLine;
            constructor += "     * @ngdoc controller" + Environment.NewLine;
            constructor += "     * @name app.controller:" + tableName + "Ctrl" + Environment.NewLine;
            constructor += "     *" + Environment.NewLine;
            constructor += "     * @description" + Environment.NewLine;
            constructor += "     * Define controller name, inject dependencies, point to def function." + Environment.NewLine;
            constructor += "     *" + Environment.NewLine;
            constructor += "     * @requires common" + Environment.NewLine;
            constructor += "     * @requires datacontext" + Environment.NewLine;
            constructor += "     */" + Environment.NewLine;
            constructor += "    var controllerId = '" + tableName + "Ctrl';" + Environment.NewLine;
            constructor += "    angular.module('app').controller(controllerId," + Environment.NewLine;
            constructor += "      ['$scope', " + tableName + "Ctrl]);" + Environment.NewLine;
            constructor += "        // 'Controller As' syntax" + Environment.NewLine;
            constructor += "        var vm = this;" + Environment.NewLine;
            constructor += "})();" + Environment.NewLine;

            return constructor;
        }
        //Helper functions ---------------------------------------------------------
        //--------------------------------------------------------------------------
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