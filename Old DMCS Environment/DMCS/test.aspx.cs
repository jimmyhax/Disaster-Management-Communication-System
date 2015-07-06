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
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.IO;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Xml;
using System.Web.Services;
using System.Web.Mvc;
using DMCS.App_Code;

namespace DMCS
{
public partial class test_ : System.Web.UI.Page
{
            public test test = new test();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!ClientScript.IsStartupScriptRegistered("initialize"))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(),
                "initialize", "initialize();", true);
        }
        if (!Page.IsPostBack)
        {   }
    }
    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Insert Tab Methods
    protected void Insert_Select_Record(object sender, EventArgs e)
    {
        test = Insert_test_select(Convert.ToInt32(Insert_test_GridView.SelectedValue));
    }
    public test Insert_test_select(int ID)
    {
        test = test.Select(ID);
        Insert_firstName_txt.Text = Convert.ToString(test.firstName);
        Insert_lastName_txt.Text = Convert.ToString(test.lastName);
        return test;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        test = test_insert();
    }
    public test test_insert()
    {
        test.firstName = Insert_firstName_txt.Text;
        test.lastName = Insert_lastName_txt.Text;
        test = test.Insert(test);
        Insert_test_GridView.DataBind();
        Update_test_GridView.DataBind();
        Delete_test_GridView.DataBind();
        return test;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        test = Update_test_select(Convert.ToInt32(Update_test_GridView.SelectedValue));
    }
    public test Update_test_select(int ID)
    {
        test = test.Select(ID);
        Update_id_txt.Text = Convert.ToString(test.id);
        Update_firstName_txt.Text = Convert.ToString(test.firstName);
        Update_lastName_txt.Text = Convert.ToString(test.lastName);
        return test;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        test = test_update(Convert.ToInt32(Update_test_GridView.SelectedValue));
    }
    public test test_update(int ID)
    {
        test = test.Select(ID);
        test.id = Convert.ToInt32(Update_id_txt.Text);
        test.firstName = Update_firstName_txt.Text;
        test.lastName = Update_lastName_txt.Text;
        test.Update(test);
        Insert_test_GridView.DataBind();
        Update_test_GridView.DataBind();
        Delete_test_GridView.DataBind();
        return test;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        test = Delete_test_select(Convert.ToInt32(Delete_test_GridView.SelectedValue));
    }
    public test Delete_test_select(int ID)
    {
        test = test.Select(ID);
        Delete_id_txt_lbl.Text = Convert.ToString(test.id);
        Delete_firstName_txt_lbl.Text = Convert.ToString(test.firstName);
        Delete_lastName_txt_lbl.Text = Convert.ToString(test.lastName);
        return test;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        test_delete(Convert.ToInt32(Delete_test_GridView.SelectedValue));
    }
    public void test_delete(int ID)
    {
        test.Delete(ID);
        Insert_test_GridView.DataBind();
        Update_test_GridView.DataBind();
        Delete_test_GridView.DataBind();
    }





    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Universial Methods
    protected void RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // EXAMPLE:
            // client_status = e.Row.Cells[5].Text;
            // Gender = e.Row.Cells[4].Text;

            //if (e.Row.Cells[5].Text == "M")
            //{
            //    e.Row.Cells[5].Text = "Missing";
            //}
            //else if (e.Row.Cells[5].Text == "D")
            //{
            //    e.Row.Cells[5].Text = "Deceased";
            //}
            //if (e.Row.Cells[4].Text == "M")
            //{
            //    e.Row.Cells[4].Text = "Male";
            //}
            //else if (e.Row.Cells[4].Text == "F")
            //{
            //    e.Row.Cells[4].Text = "Female";
            //}
        }
    }




  }
}

