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
public partial class Pet_Screen : System.Web.UI.Page
{
            public Pet Pet = new Pet();
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
        Pet = Insert_Pet_select(Convert.ToInt32(Insert_Pet_GridView.SelectedValue));
    }
    public Pet Insert_Pet_select(int ID)
    {
        Pet = Pet.Select(ID);
        Insert_Pet_Location_Found_ID_txt.Text = Convert.ToString(Pet.Pet_Location_Found_ID);
        Insert_Pet_Type_ID_txt.Text = Convert.ToString(Pet.Pet_Type_ID);
        Insert_Pet_Vet_ID_txt.Text = Convert.ToString(Pet.Pet_Vet_ID);
        Insert_Pet_License_Tag_txt.Text = Convert.ToString(Pet.Pet_License_Tag);
        Insert_Pet_RFID_txt.Text = Convert.ToString(Pet.Pet_RFID);
        Insert_Pet_Tatoo_No_txt.Text = Convert.ToString(Pet.Pet_Tatoo_No);
        Insert_Pet_Name_txt.Text = Convert.ToString(Pet.Pet_Name);
        Insert_Pet_Gender_txt.Text = Convert.ToString(Pet.Pet_Gender);
        Insert_Pet_Color_txt.Text = Convert.ToString(Pet.Pet_Color);
        Insert_Pet_Weight_txt.Text = Convert.ToString(Pet.Pet_Weight);
        Insert_Pet_Description_txt.Text = Convert.ToString(Pet.Pet_Description);
        Insert_Pet_Condition_txt.Text = Convert.ToString(Pet.Pet_Condition);
        Insert_Pet_Status_txt.Text = Convert.ToString(Pet.Pet_Status);
        Insert_Pet_Date_Of_Birth_txt.Text = Convert.ToString(Pet.Pet_Date_Of_Birth);
        Insert_Pet_Picture_Image.Attributes["src"] = ResolveUrl("~/Images/ShowImage.aspx?Table_Name=Pet&Image_Name=Pet_Picture&ID=Pet_Record_ID=" + ID);
        Insert_Pet_Sterilized_txt.Text = Convert.ToString(Pet.Pet_Sterilized);
        Insert_Date_Modified_txt.Text = Convert.ToString(Pet.Date_Modified);
        Insert_Date_Created_txt.Text = Convert.ToString(Pet.Date_Created);
        return Pet;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Pet = Pet_insert();
    }
    public Pet Pet_insert()
    {
        Pet.Pet_Location_Found_ID = Convert.ToInt32(Insert_Pet_Location_Found_ID_txt.Text);
        Pet.Pet_Type_ID = Convert.ToInt32(Insert_Pet_Type_ID_txt.Text);
        Pet.Pet_Vet_ID = Insert_Pet_Vet_ID_txt.Text;
        Pet.Pet_License_Tag = Insert_Pet_License_Tag_txt.Text;
        Pet.Pet_RFID = Insert_Pet_RFID_txt.Text;
        Pet.Pet_Tatoo_No = Insert_Pet_Tatoo_No_txt.Text;
        Pet.Pet_Name = Insert_Pet_Name_txt.Text;
        Pet.Pet_Gender = Insert_Pet_Gender_txt.Text;
        Pet.Pet_Color = Insert_Pet_Color_txt.Text;
        Pet.Pet_Weight = Convert.ToInt32(Insert_Pet_Weight_txt.Text);
        Pet.Pet_Description = Insert_Pet_Description_txt.Text;
        Pet.Pet_Condition = Insert_Pet_Condition_txt.Text;
        Pet.Pet_Status = Insert_Pet_Status_txt.Text;
        Pet.Pet_Date_Of_Birth = Convert.ToDateTime(Insert_Pet_Date_Of_Birth_txt.Text);
        byte[] uploaded_picture = Insert_Pet_Picture_FileUpload.FileBytes;
        Pet.Pet_Picture = uploaded_picture;
        Pet.Pet_Sterilized = Insert_Pet_Sterilized_txt.Text;
        Pet.Date_Modified = Convert.ToDateTime(Insert_Date_Modified_txt.Text);
        Pet.Date_Created = Convert.ToDateTime(Insert_Date_Created_txt.Text);
        Pet = Pet.Insert(Pet);
        Insert_Pet_GridView.DataBind();
        Update_Pet_GridView.DataBind();
        Delete_Pet_GridView.DataBind();
        return Pet;
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
        Pet = Update_Pet_select(Convert.ToInt32(Update_Pet_GridView.SelectedValue));
    }
    public Pet Update_Pet_select(int ID)
    {
        Pet = Pet.Select(ID);
        Update_Pet_Record_ID_txt.Text = Convert.ToString(Pet.Pet_Record_ID);
        Update_Pet_Location_Found_ID_txt.Text = Convert.ToString(Pet.Pet_Location_Found_ID);
        Update_Pet_Type_ID_txt.Text = Convert.ToString(Pet.Pet_Type_ID);
        Update_Pet_Vet_ID_txt.Text = Convert.ToString(Pet.Pet_Vet_ID);
        Update_Pet_License_Tag_txt.Text = Convert.ToString(Pet.Pet_License_Tag);
        Update_Pet_RFID_txt.Text = Convert.ToString(Pet.Pet_RFID);
        Update_Pet_Tatoo_No_txt.Text = Convert.ToString(Pet.Pet_Tatoo_No);
        Update_Pet_Name_txt.Text = Convert.ToString(Pet.Pet_Name);
        Update_Pet_Gender_txt.Text = Convert.ToString(Pet.Pet_Gender);
        Update_Pet_Color_txt.Text = Convert.ToString(Pet.Pet_Color);
        Update_Pet_Weight_txt.Text = Convert.ToString(Pet.Pet_Weight);
        Update_Pet_Description_txt.Text = Convert.ToString(Pet.Pet_Description);
        Update_Pet_Condition_txt.Text = Convert.ToString(Pet.Pet_Condition);
        Update_Pet_Status_txt.Text = Convert.ToString(Pet.Pet_Status);
        Update_Pet_Date_Of_Birth_txt.Text = Convert.ToString(Pet.Pet_Date_Of_Birth);
        Update_Pet_Picture_Image.Attributes["src"] = ResolveUrl("~/Images/ShowImage.aspx?Table_Name=Pet&Image_Name=Pet_Picture&ID=Pet_Record_ID=" + ID);
        Update_Pet_Sterilized_txt.Text = Convert.ToString(Pet.Pet_Sterilized);
        Update_Date_Modified_txt.Text = Convert.ToString(Pet.Date_Modified);
        Update_Date_Created_txt.Text = Convert.ToString(Pet.Date_Created);
        return Pet;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Pet = Pet_update(Convert.ToInt32(Update_Pet_GridView.SelectedValue));
    }
    public Pet Pet_update(int ID)
    {
        Pet = Pet.Select(ID);
        Pet.Pet_Record_ID = Convert.ToInt32(Update_Pet_Record_ID_txt.Text);
        Pet.Pet_Location_Found_ID = Convert.ToInt32(Update_Pet_Location_Found_ID_txt.Text);
        Pet.Pet_Type_ID = Convert.ToInt32(Update_Pet_Type_ID_txt.Text);
        Pet.Pet_Vet_ID = Update_Pet_Vet_ID_txt.Text;
        Pet.Pet_License_Tag = Update_Pet_License_Tag_txt.Text;
        Pet.Pet_RFID = Update_Pet_RFID_txt.Text;
        Pet.Pet_Tatoo_No = Update_Pet_Tatoo_No_txt.Text;
        Pet.Pet_Name = Update_Pet_Name_txt.Text;
        Pet.Pet_Gender = Update_Pet_Gender_txt.Text;
        Pet.Pet_Color = Update_Pet_Color_txt.Text;
        Pet.Pet_Weight = Convert.ToInt32(Update_Pet_Weight_txt.Text);
        Pet.Pet_Description = Update_Pet_Description_txt.Text;
        Pet.Pet_Condition = Update_Pet_Condition_txt.Text;
        Pet.Pet_Status = Update_Pet_Status_txt.Text;
        Pet.Pet_Date_Of_Birth = Convert.ToDateTime(Update_Pet_Date_Of_Birth_txt.Text);
        byte[] uploaded_picture = Update_Pet_Picture_FileUpload.FileBytes;
        Pet.Pet_Picture = uploaded_picture;
        Pet.Pet_Sterilized = Update_Pet_Sterilized_txt.Text;
        Pet.Date_Modified = Convert.ToDateTime(Update_Date_Modified_txt.Text);
        Pet.Date_Created = Convert.ToDateTime(Update_Date_Created_txt.Text);
        Pet.Update(Pet);
        Insert_Pet_GridView.DataBind();
        Update_Pet_GridView.DataBind();
        Delete_Pet_GridView.DataBind();
        return Pet;
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
        Pet = Delete_Pet_select(Convert.ToInt32(Delete_Pet_GridView.SelectedValue));
    }
    public Pet Delete_Pet_select(int ID)
    {
        Pet = Pet.Select(ID);
        Delete_Pet_Record_ID_txt_lbl.Text = Convert.ToString(Pet.Pet_Record_ID);
        Delete_Pet_Location_Found_ID_txt_lbl.Text = Convert.ToString(Pet.Pet_Location_Found_ID);
        Delete_Pet_Type_ID_txt_lbl.Text = Convert.ToString(Pet.Pet_Type_ID);
        Delete_Pet_Vet_ID_txt_lbl.Text = Convert.ToString(Pet.Pet_Vet_ID);
        Delete_Pet_License_Tag_txt_lbl.Text = Convert.ToString(Pet.Pet_License_Tag);
        Delete_Pet_RFID_txt_lbl.Text = Convert.ToString(Pet.Pet_RFID);
        Delete_Pet_Tatoo_No_txt_lbl.Text = Convert.ToString(Pet.Pet_Tatoo_No);
        Delete_Pet_Name_txt_lbl.Text = Convert.ToString(Pet.Pet_Name);
        Delete_Pet_Gender_txt_lbl.Text = Convert.ToString(Pet.Pet_Gender);
        Delete_Pet_Color_txt_lbl.Text = Convert.ToString(Pet.Pet_Color);
        Delete_Pet_Weight_txt_lbl.Text = Convert.ToString(Pet.Pet_Weight);
        Delete_Pet_Description_txt_lbl.Text = Convert.ToString(Pet.Pet_Description);
        Delete_Pet_Condition_txt_lbl.Text = Convert.ToString(Pet.Pet_Condition);
        Delete_Pet_Status_txt_lbl.Text = Convert.ToString(Pet.Pet_Status);
        Delete_Pet_Date_Of_Birth_txt_lbl.Text = Convert.ToString(Pet.Pet_Date_Of_Birth);
        Delete_Pet_Picture_Image.Attributes["src"] = ResolveUrl("~/Images/ShowImage.aspx?Table_Name=Pet&Image_Name=Pet_Picture&ID=Pet_Record_ID=" + ID);
        Delete_Pet_Sterilized_txt_lbl.Text = Convert.ToString(Pet.Pet_Sterilized);
        Delete_Date_Modified_txt_lbl.Text = Convert.ToString(Pet.Date_Modified);
        Delete_Date_Created_txt_lbl.Text = Convert.ToString(Pet.Date_Created);
        return Pet;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Pet_delete(Convert.ToInt32(Delete_Pet_GridView.SelectedValue));
    }
    public void Pet_delete(int ID)
    {
        Pet.Delete(ID);
        Insert_Pet_GridView.DataBind();
        Update_Pet_GridView.DataBind();
        Delete_Pet_GridView.DataBind();
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

