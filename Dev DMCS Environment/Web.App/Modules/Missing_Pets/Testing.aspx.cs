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

namespace DMCS.Moduals.Missing_Pets
{
    public partial class person_Insert_Update_Delete : System.Web.UI.Page
    {

        private Pet Pet = new Pet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!ClientScript.IsStartupScriptRegistered("initialize"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                    "initialize", "initialize();", true);
            }
            if (!Page.IsPostBack)
            { }
        }

        protected void Select_Record(object sender, EventArgs e)
        {
            Pet = Pet_select(Convert.ToInt32(GridView1.SelectedValue));
        }
        protected void INSERT(object sender, EventArgs e)
        {
            Pet = Pet_insert();
        }
        protected void UPDATE(object sender, EventArgs e)
        {
            Pet = Pet_update(Convert.ToInt32(GridView1.SelectedValue));
        }
        protected void DELETE(object sender, EventArgs e)
        {
            Pet_delete(Convert.ToInt32(GridView1.SelectedValue));
        }
        /////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////
        //////////////////////
        //Methods To Call
        public Pet Pet_select(int ID)
        {
            Pet = Pet.Select(ID);
            Pet_Record_ID_txt.Text = Convert.ToString(Pet.Pet_Record_ID);
            Pet_Location_Found_ID_txt.Text = Convert.ToString(Pet.Pet_Location_Found_ID);
            Pet_Type_ID_txt.Text = Convert.ToString(Pet.Pet_Type_ID);
            Pet_Vet_ID_txt.Text = Convert.ToString(Pet.Pet_Vet_ID);
            Pet_License_Tag_txt.Text = Convert.ToString(Pet.Pet_License_Tag);
            Pet_RFID_txt.Text = Convert.ToString(Pet.Pet_RFID);
            Pet_Tatoo_No_txt.Text = Convert.ToString(Pet.Pet_Tatoo_No);
            Pet_Name_txt.Text = Convert.ToString(Pet.Pet_Name);
            Pet_Gender_txt.Text = Convert.ToString(Pet.Pet_Gender);
            Pet_Color_txt.Text = Convert.ToString(Pet.Pet_Color);
            Pet_Weight_txt.Text = Convert.ToString(Pet.Pet_Weight);
            Pet_Description_txt.Text = Convert.ToString(Pet.Pet_Description);
            Pet_Condition_txt.Text = Convert.ToString(Pet.Pet_Condition);
            Pet_Status_txt.Text = Convert.ToString(Pet.Pet_Status);
            Pet_Date_Of_Birth_txt.Text = Convert.ToString(Pet.Pet_Date_Of_Birth);
            //Pet_Picture_txt.Text = Convert.ToString(Pet.Pet_Picture);
            Pet_Sterilized_txt.Text = Convert.ToString(Pet.Pet_Sterilized);
            Date_Modified_txt.Text = Convert.ToString(Pet.Date_Modified);
            Date_Created_txt.Text = Convert.ToString(Pet.Date_Created);
            return Pet;
        }
        public Pet Pet_insert()
        {
            Pet.Pet_Location_Found_ID = Convert.ToInt32(Pet_Location_Found_ID_txt.Text);
            Pet.Pet_Type_ID = Convert.ToInt32(Pet_Type_ID_txt.Text);
            Pet.Pet_Vet_ID = Pet_Vet_ID_txt.Text;
            Pet.Pet_License_Tag = Pet_License_Tag_txt.Text;
            Pet.Pet_RFID = Pet_RFID_txt.Text;
            Pet.Pet_Tatoo_No = Pet_Tatoo_No_txt.Text;
            Pet.Pet_Name = Pet_Name_txt.Text;
            Pet.Pet_Gender = Pet_Gender_txt.Text;
            Pet.Pet_Color = Pet_Color_txt.Text;
            Pet.Pet_Weight = Convert.ToInt32(Pet_Weight_txt.Text);
            Pet.Pet_Description = Pet_Description_txt.Text;
            Pet.Pet_Condition = Pet_Condition_txt.Text;
            Pet.Pet_Status = Pet_Status_txt.Text;
            Pet.Pet_Date_Of_Birth = Convert.ToDateTime(Pet_Date_Of_Birth_txt.Text);
            byte[] uploaded_picture = FileUpload1.FileBytes;
            Pet.Pet_Picture = uploaded_picture;
            Pet.Pet_Sterilized = Pet_Sterilized_txt.Text;
            Pet.Date_Modified = Convert.ToDateTime(Date_Modified_txt.Text);
            Pet.Date_Created = Convert.ToDateTime(Date_Created_txt.Text);
            Pet = Pet.Insert(Pet);
            GridView1.DataBind();
            return Pet;
        }
        public Pet Pet_update(int ID)
        {
            Pet = Pet.Select(ID);
            Pet.Pet_Record_ID = Convert.ToInt32(Pet_Record_ID_txt.Text);
            Pet.Pet_Location_Found_ID = Convert.ToInt32(Pet_Location_Found_ID_txt.Text);
            Pet.Pet_Type_ID = Convert.ToInt32(Pet_Type_ID_txt.Text);
            Pet.Pet_Vet_ID = Pet_Vet_ID_txt.Text;
            Pet.Pet_License_Tag = Pet_License_Tag_txt.Text;
            Pet.Pet_RFID = Pet_RFID_txt.Text;
            Pet.Pet_Tatoo_No = Pet_Tatoo_No_txt.Text;
            Pet.Pet_Name = Pet_Name_txt.Text;
            Pet.Pet_Gender = Pet_Gender_txt.Text;
            Pet.Pet_Color = Pet_Color_txt.Text;
            Pet.Pet_Weight = Convert.ToInt32(Pet_Weight_txt.Text);
            Pet.Pet_Description = Pet_Description_txt.Text;
            Pet.Pet_Condition = Pet_Condition_txt.Text;
            Pet.Pet_Status = Pet_Status_txt.Text;
            Pet.Pet_Date_Of_Birth = Convert.ToDateTime(Pet_Date_Of_Birth_txt.Text);
            byte[] uploaded_picture = FileUpload1.FileBytes;
            Pet.Pet_Picture = uploaded_picture;
            Pet.Pet_Sterilized = Pet_Sterilized_txt.Text;
            Pet.Date_Modified = Convert.ToDateTime(Date_Modified_txt.Text);
            Pet.Date_Created = Convert.ToDateTime(Date_Created_txt.Text);
            Pet.Update(Pet);
            GridView1.DataBind();
            return Pet;
        }
        public void Pet_delete(int ID)
        {
            Pet.Delete(ID);
            GridView1.DataBind();
        }


    }
}
