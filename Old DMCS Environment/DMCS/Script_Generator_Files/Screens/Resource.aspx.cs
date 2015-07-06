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
public partial class Resource_ : System.Web.UI.Page
{
            public Resource Resource = new Resource();
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
        Resource = Insert_Resource_select(Convert.ToInt32(Insert_Resource_GridView.SelectedValue));
    }
    public Resource Insert_Resource_select(int ID)
    {
        Resource = Resource.Select(ID);
        Insert_Resource_Type_ID_txt.Text = Convert.ToString(Resource.Resource_Type_ID);
        Insert_Description_txt.Text = Convert.ToString(Resource.Description);
        Insert_Address_txt.Text = Convert.ToString(Resource.Address);
        Insert_City_txt.Text = Convert.ToString(Resource.City);
        Insert_State_txt.Text = Convert.ToString(Resource.State);
        Insert_Zip Code_txt.Text = Convert.ToString(Resource.Zip Code);
        Insert_PayType_txt.Text = Convert.ToString(Resource.PayType);
        Insert_PayRate_txt.Text = Convert.ToString(Resource.PayRate);
        Insert_AvailabilityDate_txt.Text = Convert.ToString(Resource.AvailabilityDate);
        Insert_AvailabilityHours_txt.Text = Convert.ToString(Resource.AvailabilityHours);
        return Resource;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Resource = Resource_insert();
    }
    public Resource Resource_insert()
    {
        Resource.Resource_Type_ID = Convert.ToInt32(Insert_Resource_Type_ID_txt.Text);
        Resource.Description = Insert_Description_txt.Text;
        Resource.Address = Insert_Address_txt.Text;
        Resource.City = Insert_City_txt.Text;
        Resource.State = Insert_State_txt.Text;
        Resource.Zip Code = Insert_Zip Code_txt.Text;
        Resource.PayType = Insert_PayType_txt.Text;
        Resource.PayRate = Convert.ToDecimal(Insert_PayRate_txt.Text);
        Resource.AvailabilityDate = Convert.ToDateTime(Insert_AvailabilityDate_txt.Text);
        Resource.AvailabilityHours = Convert.ToDateTime(Insert_AvailabilityHours_txt.Text);
        Resource = Resource.Insert(Resource);
        Insert_Resource_GridView.DataBind();
        Update_Resource_GridView.DataBind();
        Delete_Resource_GridView.DataBind();
        return Resource;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        Resource = Update_Resource_select(Convert.ToInt32(Update_Resource_GridView.SelectedValue));
    }
    public Resource Update_Resource_select(int ID)
    {
        Resource = Resource.Select(ID);
        Update_Resource_ID_txt.Text = Convert.ToString(Resource.Resource_ID);
        Update_Resource_Type_ID_txt.Text = Convert.ToString(Resource.Resource_Type_ID);
        Update_Description_txt.Text = Convert.ToString(Resource.Description);
        Update_Address_txt.Text = Convert.ToString(Resource.Address);
        Update_City_txt.Text = Convert.ToString(Resource.City);
        Update_State_txt.Text = Convert.ToString(Resource.State);
        Update_Zip Code_txt.Text = Convert.ToString(Resource.Zip Code);
        Update_PayType_txt.Text = Convert.ToString(Resource.PayType);
        Update_PayRate_txt.Text = Convert.ToString(Resource.PayRate);
        Update_AvailabilityDate_txt.Text = Convert.ToString(Resource.AvailabilityDate);
        Update_AvailabilityHours_txt.Text = Convert.ToString(Resource.AvailabilityHours);
        return Resource;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Resource = Resource_update(Convert.ToInt32(Update_Resource_GridView.SelectedValue));
    }
    public Resource Resource_update(int ID)
    {
        Resource = Resource.Select(ID);
        Resource.Resource_ID = Convert.ToInt32(Update_Resource_ID_txt.Text);
        Resource.Resource_Type_ID = Convert.ToInt32(Update_Resource_Type_ID_txt.Text);
        Resource.Description = Update_Description_txt.Text;
        Resource.Address = Update_Address_txt.Text;
        Resource.City = Update_City_txt.Text;
        Resource.State = Update_State_txt.Text;
        Resource.Zip Code = Update_Zip Code_txt.Text;
        Resource.PayType = Update_PayType_txt.Text;
        Resource.PayRate = Convert.ToDecimal(Update_PayRate_txt.Text);
        Resource.AvailabilityDate = Convert.ToDateTime(Update_AvailabilityDate_txt.Text);
        Resource.AvailabilityHours = Convert.ToDateTime(Update_AvailabilityHours_txt.Text);
        Resource.Update(Resource);
        Insert_Resource_GridView.DataBind();
        Update_Resource_GridView.DataBind();
        Delete_Resource_GridView.DataBind();
        return Resource;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        Resource = Delete_Resource_select(Convert.ToInt32(Delete_Resource_GridView.SelectedValue));
    }
    public Resource Delete_Resource_select(int ID)
    {
        Resource = Resource.Select(ID);
        Delete_Resource_ID_txt_lbl.Text = Convert.ToString(Resource.Resource_ID);
        Delete_Resource_Type_ID_txt_lbl.Text = Convert.ToString(Resource.Resource_Type_ID);
        Delete_Description_txt_lbl.Text = Convert.ToString(Resource.Description);
        Delete_Address_txt_lbl.Text = Convert.ToString(Resource.Address);
        Delete_City_txt_lbl.Text = Convert.ToString(Resource.City);
        Delete_State_txt_lbl.Text = Convert.ToString(Resource.State);
        Delete_Zip Code_txt_lbl.Text = Convert.ToString(Resource.Zip Code);
        Delete_PayType_txt_lbl.Text = Convert.ToString(Resource.PayType);
        Delete_PayRate_txt_lbl.Text = Convert.ToString(Resource.PayRate);
        Delete_AvailabilityDate_txt_lbl.Text = Convert.ToString(Resource.AvailabilityDate);
        Delete_AvailabilityHours_txt_lbl.Text = Convert.ToString(Resource.AvailabilityHours);
        return Resource;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Resource_delete(Convert.ToInt32(Delete_Resource_GridView.SelectedValue));
    }
    public void Resource_delete(int ID)
    {
        Resource.Delete(ID);
        Insert_Resource_GridView.DataBind();
        Update_Resource_GridView.DataBind();
        Delete_Resource_GridView.DataBind();
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

