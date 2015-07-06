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
public partial class Pet_Missing_Screen : System.Web.UI.Page
{
            public Pet_Missing Pet_Missing = new Pet_Missing();
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
        Pet_Missing = Insert_Pet_Missing_select(Convert.ToInt32(Insert_Pet_Missing_GridView.SelectedValue));
    }
    public Pet_Missing Insert_Pet_Missing_select(int ID)
    {
        Pet_Missing = Pet_Missing.Select(ID);
        Insert_Last_Known_Location_ID_txt.Text = Convert.ToString(Pet_Missing.Last_Known_Location_ID);
        Insert_Date_Missing_txt.Text = Convert.ToString(Pet_Missing.Date_Missing);
        Insert_Date_Reported_txt.Text = Convert.ToString(Pet_Missing.Date_Reported);
        Insert_Collar_Description_txt.Text = Convert.ToString(Pet_Missing.Collar_Description);
        Insert_Time_Lost_txt.Text = Convert.ToString(Pet_Missing.Time_Lost);
        Insert_Lost_Explanation_txt.Text = Convert.ToString(Pet_Missing.Lost_Explanation);
        Insert_Length_Owned_txt.Text = Convert.ToString(Pet_Missing.Length_Owned);
        Insert_Reward_Amt_txt.Text = Convert.ToString(Pet_Missing.Reward_Amt);
        Insert_Breeder_txt.Text = Convert.ToString(Pet_Missing.Breeder);
        Insert_Date_Created_txt.Text = Convert.ToString(Pet_Missing.Date_Created);
        Insert_Date_Modified_txt.Text = Convert.ToString(Pet_Missing.Date_Modified);
        return Pet_Missing;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Pet_Missing = Pet_Missing_insert();
    }
    public Pet_Missing Pet_Missing_insert()
    {
        Pet_Missing.Last_Known_Location_ID = Convert.ToInt32(Insert_Last_Known_Location_ID_txt.Text);
        Pet_Missing.Date_Missing = Convert.ToDateTime(Insert_Date_Missing_txt.Text);
        Pet_Missing.Date_Reported = Convert.ToDateTime(Insert_Date_Reported_txt.Text);
        Pet_Missing.Collar_Description = Insert_Collar_Description_txt.Text;
        Pet_Missing.Time_Lost = Convert.ToDateTime(Insert_Time_Lost_txt.Text);
        Pet_Missing.Lost_Explanation = Insert_Lost_Explanation_txt.Text;
        Pet_Missing.Length_Owned = Convert.ToInt32(Insert_Length_Owned_txt.Text);
        Pet_Missing.Reward_Amt = Convert.ToDecimal(Insert_Reward_Amt_txt.Text);
        Pet_Missing.Breeder = Insert_Breeder_txt.Text;
        Pet_Missing.Date_Created = Convert.ToDateTime(Insert_Date_Created_txt.Text);
        Pet_Missing.Date_Modified = Convert.ToDateTime(Insert_Date_Modified_txt.Text);
        Pet_Missing = Pet_Missing.Insert(Pet_Missing);
        Insert_Pet_Missing_GridView.DataBind();
        Update_Pet_Missing_GridView.DataBind();
        Delete_Pet_Missing_GridView.DataBind();
        return Pet_Missing;
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
        Pet_Missing = Update_Pet_Missing_select(Convert.ToInt32(Update_Pet_Missing_GridView.SelectedValue));
    }
    public Pet_Missing Update_Pet_Missing_select(int ID)
    {
        Pet_Missing = Pet_Missing.Select(ID);
        Update_Pet_Missing_ID_txt.Text = Convert.ToString(Pet_Missing.Pet_Missing_ID);
        Update_Last_Known_Location_ID_txt.Text = Convert.ToString(Pet_Missing.Last_Known_Location_ID);
        Update_Date_Missing_txt.Text = Convert.ToString(Pet_Missing.Date_Missing);
        Update_Date_Reported_txt.Text = Convert.ToString(Pet_Missing.Date_Reported);
        Update_Collar_Description_txt.Text = Convert.ToString(Pet_Missing.Collar_Description);
        Update_Time_Lost_txt.Text = Convert.ToString(Pet_Missing.Time_Lost);
        Update_Lost_Explanation_txt.Text = Convert.ToString(Pet_Missing.Lost_Explanation);
        Update_Length_Owned_txt.Text = Convert.ToString(Pet_Missing.Length_Owned);
        Update_Reward_Amt_txt.Text = Convert.ToString(Pet_Missing.Reward_Amt);
        Update_Breeder_txt.Text = Convert.ToString(Pet_Missing.Breeder);
        Update_Date_Created_txt.Text = Convert.ToString(Pet_Missing.Date_Created);
        Update_Date_Modified_txt.Text = Convert.ToString(Pet_Missing.Date_Modified);
        return Pet_Missing;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Pet_Missing = Pet_Missing_update(Convert.ToInt32(Update_Pet_Missing_GridView.SelectedValue));
    }
    public Pet_Missing Pet_Missing_update(int ID)
    {
        Pet_Missing = Pet_Missing.Select(ID);
        Pet_Missing.Pet_Missing_ID = Convert.ToInt32(Update_Pet_Missing_ID_txt.Text);
        Pet_Missing.Last_Known_Location_ID = Convert.ToInt32(Update_Last_Known_Location_ID_txt.Text);
        Pet_Missing.Date_Missing = Convert.ToDateTime(Update_Date_Missing_txt.Text);
        Pet_Missing.Date_Reported = Convert.ToDateTime(Update_Date_Reported_txt.Text);
        Pet_Missing.Collar_Description = Update_Collar_Description_txt.Text;
        Pet_Missing.Time_Lost = Convert.ToDateTime(Update_Time_Lost_txt.Text);
        Pet_Missing.Lost_Explanation = Update_Lost_Explanation_txt.Text;
        Pet_Missing.Length_Owned = Convert.ToInt32(Update_Length_Owned_txt.Text);
        Pet_Missing.Reward_Amt = Convert.ToDecimal(Update_Reward_Amt_txt.Text);
        Pet_Missing.Breeder = Update_Breeder_txt.Text;
        Pet_Missing.Date_Created = Convert.ToDateTime(Update_Date_Created_txt.Text);
        Pet_Missing.Date_Modified = Convert.ToDateTime(Update_Date_Modified_txt.Text);
        Pet_Missing.Update(Pet_Missing);
        Insert_Pet_Missing_GridView.DataBind();
        Update_Pet_Missing_GridView.DataBind();
        Delete_Pet_Missing_GridView.DataBind();
        return Pet_Missing;
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
        Pet_Missing = Delete_Pet_Missing_select(Convert.ToInt32(Delete_Pet_Missing_GridView.SelectedValue));
    }
    public Pet_Missing Delete_Pet_Missing_select(int ID)
    {
        Pet_Missing = Pet_Missing.Select(ID);
        Delete_Pet_Missing_ID_txt_lbl.Text = Convert.ToString(Pet_Missing.Pet_Missing_ID);
        Delete_Last_Known_Location_ID_txt_lbl.Text = Convert.ToString(Pet_Missing.Last_Known_Location_ID);
        Delete_Date_Missing_txt_lbl.Text = Convert.ToString(Pet_Missing.Date_Missing);
        Delete_Date_Reported_txt_lbl.Text = Convert.ToString(Pet_Missing.Date_Reported);
        Delete_Collar_Description_txt_lbl.Text = Convert.ToString(Pet_Missing.Collar_Description);
        Delete_Time_Lost_txt_lbl.Text = Convert.ToString(Pet_Missing.Time_Lost);
        Delete_Lost_Explanation_txt_lbl.Text = Convert.ToString(Pet_Missing.Lost_Explanation);
        Delete_Length_Owned_txt_lbl.Text = Convert.ToString(Pet_Missing.Length_Owned);
        Delete_Reward_Amt_txt_lbl.Text = Convert.ToString(Pet_Missing.Reward_Amt);
        Delete_Breeder_txt_lbl.Text = Convert.ToString(Pet_Missing.Breeder);
        Delete_Date_Created_txt_lbl.Text = Convert.ToString(Pet_Missing.Date_Created);
        Delete_Date_Modified_txt_lbl.Text = Convert.ToString(Pet_Missing.Date_Modified);
        return Pet_Missing;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Pet_Missing_delete(Convert.ToInt32(Delete_Pet_Missing_GridView.SelectedValue));
    }
    public void Pet_Missing_delete(int ID)
    {
        Pet_Missing.Delete(ID);
        Insert_Pet_Missing_GridView.DataBind();
        Update_Pet_Missing_GridView.DataBind();
        Delete_Pet_Missing_GridView.DataBind();
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

