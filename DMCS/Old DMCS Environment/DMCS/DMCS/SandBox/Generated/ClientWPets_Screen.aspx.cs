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

namespace DMCS.SandBox.Generated
{
public partial class ClientWPets_Screen : System.Web.UI.Page
{
            public ClientWPets ClientWPets = new ClientWPets();
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
        ClientWPets = Insert_ClientWPets_select(Convert.ToInt32(Insert_ClientWPets_GridView.SelectedValue));
    }
    public ClientWPets Insert_ClientWPets_select(int ID)
    {
        ClientWPets = ClientWPets.Select(ID);
        Insert_Pet_Record_ID_txt.Text = Convert.ToString(ClientWPets.Pet_Record_ID);
        Insert_Client_id_txt.Text = Convert.ToString(ClientWPets.Client_id);
        Insert_Location_ID_txt.Text = Convert.ToString(ClientWPets.Location_ID);
        Insert_cp_Date_txt.Text = Convert.ToString(ClientWPets.cp_Date);
        Insert_ownership_txt.Text = Convert.ToString(ClientWPets.ownership);
        return ClientWPets;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        ClientWPets = ClientWPets_insert();
    }
    public ClientWPets ClientWPets_insert()
    {
        ClientWPets.Pet_Record_ID = Convert.ToInt32(Insert_Pet_Record_ID_txt.Text);
        ClientWPets.Client_id = Convert.ToInt32(Insert_Client_id_txt.Text);
        ClientWPets.Location_ID = Convert.ToInt32(Insert_Location_ID_txt.Text);
        ClientWPets.cp_Date = Convert.ToDateTime(Insert_cp_Date_txt.Text);
        ClientWPets.ownership = Insert_ownership_txt.Text;
        ClientWPets = ClientWPets.Insert(ClientWPets);
        Insert_ClientWPets_GridView.DataBind();
        Update_ClientWPets_GridView.DataBind();
        Delete_ClientWPets_GridView.DataBind();
        return ClientWPets;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
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
        ClientWPets = Update_ClientWPets_select(Convert.ToInt32(Update_ClientWPets_GridView.SelectedValue));
    }
    public ClientWPets Update_ClientWPets_select(int ID)
    {
        ClientWPets = ClientWPets.Select(ID);
        Update_CLIENTWPETS_ID_txt.Text = Convert.ToString(ClientWPets.CLIENTWPETS_ID);
        Update_Pet_Record_ID_txt.Text = Convert.ToString(ClientWPets.Pet_Record_ID);
        Update_Client_id_txt.Text = Convert.ToString(ClientWPets.Client_id);
        Update_Location_ID_txt.Text = Convert.ToString(ClientWPets.Location_ID);
        Update_cp_Date_txt.Text = Convert.ToString(ClientWPets.cp_Date);
        Update_ownership_txt.Text = Convert.ToString(ClientWPets.ownership);
        return ClientWPets;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        ClientWPets = ClientWPets_update(Convert.ToInt32(Update_ClientWPets_GridView.SelectedValue));
    }
    public ClientWPets ClientWPets_update(int ID)
    {
        ClientWPets = ClientWPets.Select(ID);
        ClientWPets.CLIENTWPETS_ID = Convert.ToInt32(Update_CLIENTWPETS_ID_txt.Text);
        ClientWPets.Pet_Record_ID = Convert.ToInt32(Update_Pet_Record_ID_txt.Text);
        ClientWPets.Client_id = Convert.ToInt32(Update_Client_id_txt.Text);
        ClientWPets.Location_ID = Convert.ToInt32(Update_Location_ID_txt.Text);
        ClientWPets.cp_Date = Convert.ToDateTime(Update_cp_Date_txt.Text);
        ClientWPets.ownership = Update_ownership_txt.Text;
        ClientWPets.Update(ClientWPets);
        Insert_ClientWPets_GridView.DataBind();
        Update_ClientWPets_GridView.DataBind();
        Delete_ClientWPets_GridView.DataBind();
        return ClientWPets;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
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
        ClientWPets = Delete_ClientWPets_select(Convert.ToInt32(Delete_ClientWPets_GridView.SelectedValue));
    }
    public ClientWPets Delete_ClientWPets_select(int ID)
    {
        ClientWPets = ClientWPets.Select(ID);
        Delete_CLIENTWPETS_ID_txt_lbl.Text = Convert.ToString(ClientWPets.CLIENTWPETS_ID);
        Delete_Pet_Record_ID_txt_lbl.Text = Convert.ToString(ClientWPets.Pet_Record_ID);
        Delete_Client_id_txt_lbl.Text = Convert.ToString(ClientWPets.Client_id);
        Delete_Location_ID_txt_lbl.Text = Convert.ToString(ClientWPets.Location_ID);
        Delete_cp_Date_txt_lbl.Text = Convert.ToString(ClientWPets.cp_Date);
        Delete_ownership_txt_lbl.Text = Convert.ToString(ClientWPets.ownership);
        return ClientWPets;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        ClientWPets_delete(Convert.ToInt32(Delete_ClientWPets_GridView.SelectedValue));
    }
    public void ClientWPets_delete(int ID)
    {
        ClientWPets.Delete(ID);
        Insert_ClientWPets_GridView.DataBind();
        Update_ClientWPets_GridView.DataBind();
        Delete_ClientWPets_GridView.DataBind();
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

