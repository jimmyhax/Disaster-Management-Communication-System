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
using System.Web.Mvc;
using DMCS.App_Code;

namespace DMCS.SandBox.Generated
{
public partial class client_Screen : System.Web.UI.Page
{
    public client client = new client();
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
    ////////////////////
    ///////////////////
    //////////////////
    /////////////////
    ////////////////
    ///////////////
    //Insert Tab Methods
    protected void Insert_ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            disaster disaster = new disaster();
            GlobalVariables.DisasterID = Convert.ToInt32(Insert_ddlDisaster.SelectedItem.Value);
        }
        catch { }
    }
    protected void Insert_Select_Record(object sender, EventArgs e)
    {
        client = Insert_client_select(Convert.ToInt32(Insert_Client_GridView.SelectedValue));
    }
    public client Insert_client_select(int ID)
    {
        client = client.Select(ID);
        Insert_client_id_txt.Text = Convert.ToString(client.client_id);
        Insert_client_status_txt.Text = Convert.ToString(client.client_status);
        Insert_ethnicity_txt.Text = Convert.ToString(client.ethnicity);
        Insert_eye_color_txt.Text = Convert.ToString(client.eye_color);

        return client;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        client = client_insert();
    }
    public client client_insert()
    {
        client.client_status = Insert_client_status_txt.Text;
        client.ethnicity = Insert_ethnicity_txt.Text;
        client.eye_color = Insert_eye_color_txt.Text;
        client = client.Insert(client);
        Insert_Client_GridView.DataBind();
        return client;
    }
    ////////////////////
    ///////////////////
    //////////////////
    /////////////////
    ////////////////
    ///////////////
    //Update Tab Methods
    protected void Update_ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            disaster disaster = new disaster();
            GlobalVariables.DisasterID = Convert.ToInt32(Update_ddlDisaster.SelectedItem.Value);
        }
        catch { }
    }
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        client = Update_client_select(Convert.ToInt32(Update_Client_GridView.SelectedValue));
    }
    public client Update_client_select(int ID)
    {
        client = client.Select(ID);
        Update_client_id_txt.Text = Convert.ToString(client.client_id);
        Update_client_status_txt.Text = Convert.ToString(client.client_status);
        Update_ethnicity_txt.Text = Convert.ToString(client.ethnicity);
        Update_eye_color_txt.Text = Convert.ToString(client.eye_color);

        return client;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        client = client_update(Convert.ToInt32(Update_Client_GridView.SelectedValue));
    }
    public client client_update(int ID)
    {
        client = client.Select(ID);
        client.client_id = Convert.ToInt32(Update_client_id_txt.Text);
        client.client_status = Update_client_status_txt.Text;
        client.ethnicity = Update_ethnicity_txt.Text;
        client.eye_color = Update_eye_color_txt.Text;
        client.Update(client);
        Update_Client_GridView.DataBind();
        return client;
    }
    ////////////////////
    ///////////////////
    //////////////////
    /////////////////
    ////////////////
    ///////////////
    //Delete Tab Methods
    protected void Delete_ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            disaster disaster = new disaster();
            GlobalVariables.DisasterID = Convert.ToInt32(Delete_ddlDisaster.SelectedItem.Value);
        }
        catch { }
    }
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        client = Delete_client_select(Convert.ToInt32(Delete_Client_GridView.SelectedValue));
    }
    public client Delete_client_select(int ID)
    {
        client = client.Select(ID);
        Delete_client_id_txt_lbl.Text = Convert.ToString(client.client_id);
        Delete_client_status_txt_lbl.Text = Convert.ToString(client.client_status);
        Delete_ethnicity_txt_lbl.Text = Convert.ToString(client.ethnicity);
        Delete_eye_color_txt_lbl.Text = Convert.ToString(client.eye_color);

        return client;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        client_delete(Convert.ToInt32(Delete_Client_GridView.SelectedValue));
    }
    public void client_delete(int ID)
    {
        client.Delete(ID);
        Delete_Client_GridView.DataBind();
    }
    ///////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////
    ////////////////////////
    //Universial Methods To Call
    /// <summary>
    /// Change the value of Chars, bools'n such in a gridview.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
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

