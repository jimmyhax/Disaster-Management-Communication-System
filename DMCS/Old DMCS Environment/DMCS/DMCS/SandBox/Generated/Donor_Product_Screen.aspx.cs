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
public partial class Donor_Product_Screen : System.Web.UI.Page
{
            public Donor_Product Donor_Product = new Donor_Product();
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
        Donor_Product = Insert_Donor_Product_select(Convert.ToInt32(Insert_Donor_Product_GridView.SelectedValue));
    }
    public Donor_Product Insert_Donor_Product_select(int ID)
    {
        Donor_Product = Donor_Product.Select(ID);
        Insert_DonorID_txt.Text = Convert.ToString(Donor_Product.DonorID);
        Insert_ProductID_txt.Text = Convert.ToString(Donor_Product.ProductID);
        Insert_quantity_txt.Text = Convert.ToString(Donor_Product.quantity);
        Insert_other_info_txt.Text = Convert.ToString(Donor_Product.other_info);
        Insert_Product_rec_date_txt.Text = Convert.ToString(Donor_Product.Product_rec_date);
        Insert_AmountOfProdDonated_txt.Text = Convert.ToString(Donor_Product.AmountOfProdDonated);
        return Donor_Product;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Donor_Product = Donor_Product_insert();
    }
    public Donor_Product Donor_Product_insert()
    {
        Donor_Product.DonorID = Convert.ToInt32(Insert_DonorID_txt.Text);
        Donor_Product.ProductID = Convert.ToInt32(Insert_ProductID_txt.Text);
        Donor_Product.quantity = Convert.ToInt32(Insert_quantity_txt.Text);
        Donor_Product.other_info = Insert_other_info_txt.Text;
        Donor_Product.Product_rec_date = Convert.ToDateTime(Insert_Product_rec_date_txt.Text);
        Donor_Product.AmountOfProdDonated = Insert_AmountOfProdDonated_txt.Text;
        Donor_Product = Donor_Product.Insert(Donor_Product);
        Insert_Donor_Product_GridView.DataBind();
        Update_Donor_Product_GridView.DataBind();
        Delete_Donor_Product_GridView.DataBind();
        return Donor_Product;
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
        Donor_Product = Update_Donor_Product_select(Convert.ToInt32(Update_Donor_Product_GridView.SelectedValue));
    }
    public Donor_Product Update_Donor_Product_select(int ID)
    {
        Donor_Product = Donor_Product.Select(ID);
        Update_DonorProductID_txt.Text = Convert.ToString(Donor_Product.DonorProductID);
        Update_DonorID_txt.Text = Convert.ToString(Donor_Product.DonorID);
        Update_ProductID_txt.Text = Convert.ToString(Donor_Product.ProductID);
        Update_quantity_txt.Text = Convert.ToString(Donor_Product.quantity);
        Update_other_info_txt.Text = Convert.ToString(Donor_Product.other_info);
        Update_Product_rec_date_txt.Text = Convert.ToString(Donor_Product.Product_rec_date);
        Update_AmountOfProdDonated_txt.Text = Convert.ToString(Donor_Product.AmountOfProdDonated);
        return Donor_Product;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Donor_Product = Donor_Product_update(Convert.ToInt32(Update_Donor_Product_GridView.SelectedValue));
    }
    public Donor_Product Donor_Product_update(int ID)
    {
        Donor_Product = Donor_Product.Select(ID);
        Donor_Product.DonorProductID = Convert.ToInt32(Update_DonorProductID_txt.Text);
        Donor_Product.DonorID = Convert.ToInt32(Update_DonorID_txt.Text);
        Donor_Product.ProductID = Convert.ToInt32(Update_ProductID_txt.Text);
        Donor_Product.quantity = Convert.ToInt32(Update_quantity_txt.Text);
        Donor_Product.other_info = Update_other_info_txt.Text;
        Donor_Product.Product_rec_date = Convert.ToDateTime(Update_Product_rec_date_txt.Text);
        Donor_Product.AmountOfProdDonated = Update_AmountOfProdDonated_txt.Text;
        Donor_Product.Update(Donor_Product);
        Insert_Donor_Product_GridView.DataBind();
        Update_Donor_Product_GridView.DataBind();
        Delete_Donor_Product_GridView.DataBind();
        return Donor_Product;
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
        Donor_Product = Delete_Donor_Product_select(Convert.ToInt32(Delete_Donor_Product_GridView.SelectedValue));
    }
    public Donor_Product Delete_Donor_Product_select(int ID)
    {
        Donor_Product = Donor_Product.Select(ID);
        Delete_DonorProductID_txt_lbl.Text = Convert.ToString(Donor_Product.DonorProductID);
        Delete_DonorID_txt_lbl.Text = Convert.ToString(Donor_Product.DonorID);
        Delete_ProductID_txt_lbl.Text = Convert.ToString(Donor_Product.ProductID);
        Delete_quantity_txt_lbl.Text = Convert.ToString(Donor_Product.quantity);
        Delete_other_info_txt_lbl.Text = Convert.ToString(Donor_Product.other_info);
        Delete_Product_rec_date_txt_lbl.Text = Convert.ToString(Donor_Product.Product_rec_date);
        Delete_AmountOfProdDonated_txt_lbl.Text = Convert.ToString(Donor_Product.AmountOfProdDonated);
        return Donor_Product;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Donor_Product_delete(Convert.ToInt32(Delete_Donor_Product_GridView.SelectedValue));
    }
    public void Donor_Product_delete(int ID)
    {
        Donor_Product.Delete(ID);
        Insert_Donor_Product_GridView.DataBind();
        Update_Donor_Product_GridView.DataBind();
        Delete_Donor_Product_GridView.DataBind();
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

