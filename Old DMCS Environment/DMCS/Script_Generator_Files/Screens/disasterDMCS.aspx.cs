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
public partial class disasterDMCS_ : System.Web.UI.Page
{
            public disasterDMCS disasterDMCS = new disasterDMCS();
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
        disasterDMCS = Insert_disasterDMCS_select(Convert.ToInt32(Insert_disasterDMCS_GridView.SelectedValue));
    }
    public disasterDMCS Insert_disasterDMCS_select(int ID)
    {
        disasterDMCS = disasterDMCS.Select(ID);
        Insert_disaster_description_txt.Text = Convert.ToString(disasterDMCS.disaster_description);
        return disasterDMCS;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        disasterDMCS = disasterDMCS_insert();
    }
    public disasterDMCS disasterDMCS_insert()
    {
        disasterDMCS.disaster_description = Insert_disaster_description_txt.Text;
        disasterDMCS = disasterDMCS.Insert(disasterDMCS);
        Insert_disasterDMCS_GridView.DataBind();
        Update_disasterDMCS_GridView.DataBind();
        Delete_disasterDMCS_GridView.DataBind();
        return disasterDMCS;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        disasterDMCS = Update_disasterDMCS_select(Convert.ToInt32(Update_disasterDMCS_GridView.SelectedValue));
    }
    public disasterDMCS Update_disasterDMCS_select(int ID)
    {
        disasterDMCS = disasterDMCS.Select(ID);
        Update_disaster_id_txt.Text = Convert.ToString(disasterDMCS.disaster_id);
        Update_disaster_description_txt.Text = Convert.ToString(disasterDMCS.disaster_description);
        return disasterDMCS;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        disasterDMCS = disasterDMCS_update(Convert.ToInt32(Update_disasterDMCS_GridView.SelectedValue));
    }
    public disasterDMCS disasterDMCS_update(int ID)
    {
        disasterDMCS = disasterDMCS.Select(ID);
        disasterDMCS.disaster_id = Convert.ToInt32(Update_disaster_id_txt.Text);
        disasterDMCS.disaster_description = Update_disaster_description_txt.Text;
        disasterDMCS.Update(disasterDMCS);
        Insert_disasterDMCS_GridView.DataBind();
        Update_disasterDMCS_GridView.DataBind();
        Delete_disasterDMCS_GridView.DataBind();
        return disasterDMCS;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        disasterDMCS = Delete_disasterDMCS_select(Convert.ToInt32(Delete_disasterDMCS_GridView.SelectedValue));
    }
    public disasterDMCS Delete_disasterDMCS_select(int ID)
    {
        disasterDMCS = disasterDMCS.Select(ID);
        Delete_disaster_id_txt_lbl.Text = Convert.ToString(disasterDMCS.disaster_id);
        Delete_disaster_description_txt_lbl.Text = Convert.ToString(disasterDMCS.disaster_description);
        return disasterDMCS;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        disasterDMCS_delete(Convert.ToInt32(Delete_disasterDMCS_GridView.SelectedValue));
    }
    public void disasterDMCS_delete(int ID)
    {
        disasterDMCS.Delete(ID);
        Insert_disasterDMCS_GridView.DataBind();
        Update_disasterDMCS_GridView.DataBind();
        Delete_disasterDMCS_GridView.DataBind();
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

