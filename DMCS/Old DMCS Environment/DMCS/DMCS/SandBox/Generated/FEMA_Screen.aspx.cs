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
public partial class FEMA_Screen : System.Web.UI.Page
{
            public FEMA FEMA = new FEMA();
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
        FEMA = Insert_FEMA_select(Convert.ToInt32(Insert_FEMA_GridView.SelectedValue));
    }
    public FEMA Insert_FEMA_select(int ID)
    {
        FEMA = FEMA.Select(ID);
        Insert_Cost_Code_txt.Text = Convert.ToString(FEMA.Cost_Code);
        Insert_Equipment_txt.Text = Convert.ToString(FEMA.Equipment);
        Insert_Specification_txt.Text = Convert.ToString(FEMA.Specification);
        Insert_Capacity_Size_txt.Text = Convert.ToString(FEMA.Capacity_Size);
        Insert_HP_txt.Text = Convert.ToString(FEMA.HP);
        Insert_Notes_txt.Text = Convert.ToString(FEMA.Notes);
        Insert_Unit_txt.Text = Convert.ToString(FEMA.Unit);
        Insert_Rate_txt.Text = Convert.ToString(FEMA.Rate);
        return FEMA;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        FEMA = FEMA_insert();
    }
    public FEMA FEMA_insert()
    {
        FEMA.Cost_Code = Convert.ToInt32(Insert_Cost_Code_txt.Text);
        FEMA.Equipment = Insert_Equipment_txt.Text;
        FEMA.Specification = Insert_Specification_txt.Text;
        FEMA.Capacity_Size = Insert_Capacity_Size_txt.Text;
        FEMA.HP = Insert_HP_txt.Text;
        FEMA.Notes = Insert_Notes_txt.Text;
        FEMA.Unit = Insert_Unit_txt.Text;
        FEMA.Rate = Insert_Rate_txt.Text;
        FEMA = FEMA.Insert(FEMA);
        Insert_FEMA_GridView.DataBind();
        Update_FEMA_GridView.DataBind();
        Delete_FEMA_GridView.DataBind();
        return FEMA;
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
        FEMA = Update_FEMA_select(Convert.ToInt32(Update_FEMA_GridView.SelectedValue));
    }
    public FEMA Update_FEMA_select(int ID)
    {
        FEMA = FEMA.Select(ID);
        Update_FEMA_ID_txt.Text = Convert.ToString(FEMA.FEMA_ID);
        Update_Cost_Code_txt.Text = Convert.ToString(FEMA.Cost_Code);
        Update_Equipment_txt.Text = Convert.ToString(FEMA.Equipment);
        Update_Specification_txt.Text = Convert.ToString(FEMA.Specification);
        Update_Capacity_Size_txt.Text = Convert.ToString(FEMA.Capacity_Size);
        Update_HP_txt.Text = Convert.ToString(FEMA.HP);
        Update_Notes_txt.Text = Convert.ToString(FEMA.Notes);
        Update_Unit_txt.Text = Convert.ToString(FEMA.Unit);
        Update_Rate_txt.Text = Convert.ToString(FEMA.Rate);
        return FEMA;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        FEMA = FEMA_update(Convert.ToInt32(Update_FEMA_GridView.SelectedValue));
    }
    public FEMA FEMA_update(int ID)
    {
        FEMA = FEMA.Select(ID);
        FEMA.FEMA_ID = Convert.ToInt32(Update_FEMA_ID_txt.Text);
        FEMA.Cost_Code = Convert.ToInt32(Update_Cost_Code_txt.Text);
        FEMA.Equipment = Update_Equipment_txt.Text;
        FEMA.Specification = Update_Specification_txt.Text;
        FEMA.Capacity_Size = Update_Capacity_Size_txt.Text;
        FEMA.HP = Update_HP_txt.Text;
        FEMA.Notes = Update_Notes_txt.Text;
        FEMA.Unit = Update_Unit_txt.Text;
        FEMA.Rate = Update_Rate_txt.Text;
        FEMA.Update(FEMA);
        Insert_FEMA_GridView.DataBind();
        Update_FEMA_GridView.DataBind();
        Delete_FEMA_GridView.DataBind();
        return FEMA;
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
        FEMA = Delete_FEMA_select(Convert.ToInt32(Delete_FEMA_GridView.SelectedValue));
    }
    public FEMA Delete_FEMA_select(int ID)
    {
        FEMA = FEMA.Select(ID);
        Delete_FEMA_ID_txt_lbl.Text = Convert.ToString(FEMA.FEMA_ID);
        Delete_Cost_Code_txt_lbl.Text = Convert.ToString(FEMA.Cost_Code);
        Delete_Equipment_txt_lbl.Text = Convert.ToString(FEMA.Equipment);
        Delete_Specification_txt_lbl.Text = Convert.ToString(FEMA.Specification);
        Delete_Capacity_Size_txt_lbl.Text = Convert.ToString(FEMA.Capacity_Size);
        Delete_HP_txt_lbl.Text = Convert.ToString(FEMA.HP);
        Delete_Notes_txt_lbl.Text = Convert.ToString(FEMA.Notes);
        Delete_Unit_txt_lbl.Text = Convert.ToString(FEMA.Unit);
        Delete_Rate_txt_lbl.Text = Convert.ToString(FEMA.Rate);
        return FEMA;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        FEMA_delete(Convert.ToInt32(Delete_FEMA_GridView.SelectedValue));
    }
    public void FEMA_delete(int ID)
    {
        FEMA.Delete(ID);
        Insert_FEMA_GridView.DataBind();
        Update_FEMA_GridView.DataBind();
        Delete_FEMA_GridView.DataBind();
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

