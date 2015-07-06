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
public partial class users2_ : System.Web.UI.Page
{
            public users2 users2 = new users2();
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
        users2 = Insert_users2_select(Convert.ToInt32(Insert_users2_GridView.SelectedValue));
    }
    public users2 Insert_users2_select(int ID)
    {
        users2 = users2.Select(ID);
        Insert_firstName_txt.Text = Convert.ToString(users2.firstName);
        Insert_lastName_txt.Text = Convert.ToString(users2.lastName);
        return users2;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        users2 = users2_insert();
    }
    public users2 users2_insert()
    {
        users2.firstName = Insert_firstName_txt.Text;
        users2.lastName = Insert_lastName_txt.Text;
        users2 = users2.Insert(users2);
        Insert_users2_GridView.DataBind();
        Update_users2_GridView.DataBind();
        Delete_users2_GridView.DataBind();
        return users2;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        users2 = Update_users2_select(Convert.ToInt32(Update_users2_GridView.SelectedValue));
    }
    public users2 Update_users2_select(int ID)
    {
        users2 = users2.Select(ID);
        Update_id_txt.Text = Convert.ToString(users2.id);
        Update_firstName_txt.Text = Convert.ToString(users2.firstName);
        Update_lastName_txt.Text = Convert.ToString(users2.lastName);
        return users2;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        users2 = users2_update(Convert.ToInt32(Update_users2_GridView.SelectedValue));
    }
    public users2 users2_update(int ID)
    {
        users2 = users2.Select(ID);
        users2.id = Convert.ToInt32(Update_id_txt.Text);
        users2.firstName = Update_firstName_txt.Text;
        users2.lastName = Update_lastName_txt.Text;
        users2.Update(users2);
        Insert_users2_GridView.DataBind();
        Update_users2_GridView.DataBind();
        Delete_users2_GridView.DataBind();
        return users2;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        users2 = Delete_users2_select(Convert.ToInt32(Delete_users2_GridView.SelectedValue));
    }
    public users2 Delete_users2_select(int ID)
    {
        users2 = users2.Select(ID);
        Delete_id_txt_lbl.Text = Convert.ToString(users2.id);
        Delete_firstName_txt_lbl.Text = Convert.ToString(users2.firstName);
        Delete_lastName_txt_lbl.Text = Convert.ToString(users2.lastName);
        return users2;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        users2_delete(Convert.ToInt32(Delete_users2_GridView.SelectedValue));
    }
    public void users2_delete(int ID)
    {
        users2.Delete(ID);
        Insert_users2_GridView.DataBind();
        Update_users2_GridView.DataBind();
        Delete_users2_GridView.DataBind();
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

