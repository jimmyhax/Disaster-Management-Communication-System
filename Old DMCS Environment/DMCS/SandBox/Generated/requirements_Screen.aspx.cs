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
public partial class requirements_Screen : System.Web.UI.Page
{
            public requirements requirements = new requirements();
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
        requirements = Insert_requirements_select(Convert.ToInt32(Insert_requirements_GridView.SelectedValue));
    }
    public requirements Insert_requirements_select(int ID)
    {
        requirements = requirements.Select(ID);
        Insert_requirement_desc_txt.Text = Convert.ToString(requirements.requirement_desc);
        return requirements;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        requirements = requirements_insert();
    }
    public requirements requirements_insert()
    {
        requirements.requirement_desc = Insert_requirement_desc_txt.Text;
        requirements = requirements.Insert(requirements);
        Insert_requirements_GridView.DataBind();
        Update_requirements_GridView.DataBind();
        Delete_requirements_GridView.DataBind();
        return requirements;
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
        requirements = Update_requirements_select(Convert.ToInt32(Update_requirements_GridView.SelectedValue));
    }
    public requirements Update_requirements_select(int ID)
    {
        requirements = requirements.Select(ID);
        Update_req_id_txt.Text = Convert.ToString(requirements.req_id);
        Update_requirement_desc_txt.Text = Convert.ToString(requirements.requirement_desc);
        return requirements;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        requirements = requirements_update(Convert.ToInt32(Update_requirements_GridView.SelectedValue));
    }
    public requirements requirements_update(int ID)
    {
        requirements = requirements.Select(ID);
        requirements.req_id = Convert.ToInt32(Update_req_id_txt.Text);
        requirements.requirement_desc = Update_requirement_desc_txt.Text;
        requirements.Update(requirements);
        Insert_requirements_GridView.DataBind();
        Update_requirements_GridView.DataBind();
        Delete_requirements_GridView.DataBind();
        return requirements;
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
        requirements = Delete_requirements_select(Convert.ToInt32(Delete_requirements_GridView.SelectedValue));
    }
    public requirements Delete_requirements_select(int ID)
    {
        requirements = requirements.Select(ID);
        Delete_req_id_txt_lbl.Text = Convert.ToString(requirements.req_id);
        Delete_requirement_desc_txt_lbl.Text = Convert.ToString(requirements.requirement_desc);
        return requirements;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        requirements_delete(Convert.ToInt32(Delete_requirements_GridView.SelectedValue));
    }
    public void requirements_delete(int ID)
    {
        requirements.Delete(ID);
        Insert_requirements_GridView.DataBind();
        Update_requirements_GridView.DataBind();
        Delete_requirements_GridView.DataBind();
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

