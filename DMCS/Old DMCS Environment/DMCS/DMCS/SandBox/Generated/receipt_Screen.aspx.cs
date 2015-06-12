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
public partial class receipt_Screen : System.Web.UI.Page
{
            public receipt receipt = new receipt();
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
        receipt = Insert_receipt_select(Convert.ToInt32(Insert_receipt_GridView.SelectedValue));
    }
    public receipt Insert_receipt_select(int ID)
    {
        receipt = receipt.Select(ID);
        Insert_Account_ID_txt.Text = Convert.ToString(receipt.Account_ID);
        Insert_Check_Num_txt.Text = Convert.ToString(receipt.Check_Num);
        Insert_DLN_txt.Text = Convert.ToString(receipt.DLN);
        Insert_Phone_txt.Text = Convert.ToString(receipt.Phone);
        Insert_Pay_Type_txt.Text = Convert.ToString(receipt.Pay_Type);
        Insert_Amount_txt.Text = Convert.ToString(receipt.Amount);
        Insert_Transfer_txt.Text = Convert.ToString(receipt.Transfer);
        Insert_Recieve_txt.Text = Convert.ToString(receipt.Recieve);
        return receipt;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        receipt = receipt_insert();
    }
    public receipt receipt_insert()
    {
        receipt.Account_ID = Convert.ToInt32(Insert_Account_ID_txt.Text);
        receipt.Check_Num = Convert.ToInt32(Insert_Check_Num_txt.Text);
        receipt.DLN = Convert.ToInt32(Insert_DLN_txt.Text);
        receipt.Phone = Convert.ToInt32(Insert_Phone_txt.Text);
        receipt.Pay_Type = Convert.ToInt32(Insert_Pay_Type_txt.Text);
        receipt.Amount = Convert.ToInt32(Insert_Amount_txt.Text);
        receipt.Transfer = Convert.ToBoolean(Insert_Transfer_txt.Text);
        receipt.Recieve = Convert.ToBoolean(Insert_Recieve_txt.Text);
        receipt = receipt.Insert(receipt);
        Insert_receipt_GridView.DataBind();
        Update_receipt_GridView.DataBind();
        Delete_receipt_GridView.DataBind();
        return receipt;
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
        receipt = Update_receipt_select(Convert.ToInt32(Update_receipt_GridView.SelectedValue));
    }
    public receipt Update_receipt_select(int ID)
    {
        receipt = receipt.Select(ID);
        Update_Receipt_ID_txt.Text = Convert.ToString(receipt.Receipt_ID);
        Update_Account_ID_txt.Text = Convert.ToString(receipt.Account_ID);
        Update_Check_Num_txt.Text = Convert.ToString(receipt.Check_Num);
        Update_DLN_txt.Text = Convert.ToString(receipt.DLN);
        Update_Phone_txt.Text = Convert.ToString(receipt.Phone);
        Update_Pay_Type_txt.Text = Convert.ToString(receipt.Pay_Type);
        Update_Amount_txt.Text = Convert.ToString(receipt.Amount);
        Update_Transfer_txt.Text = Convert.ToString(receipt.Transfer);
        Update_Recieve_txt.Text = Convert.ToString(receipt.Recieve);
        return receipt;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        receipt = receipt_update(Convert.ToInt32(Update_receipt_GridView.SelectedValue));
    }
    public receipt receipt_update(int ID)
    {
        receipt = receipt.Select(ID);
        receipt.Receipt_ID = Convert.ToInt32(Update_Receipt_ID_txt.Text);
        receipt.Account_ID = Convert.ToInt32(Update_Account_ID_txt.Text);
        receipt.Check_Num = Convert.ToInt32(Update_Check_Num_txt.Text);
        receipt.DLN = Convert.ToInt32(Update_DLN_txt.Text);
        receipt.Phone = Convert.ToInt32(Update_Phone_txt.Text);
        receipt.Pay_Type = Convert.ToInt32(Update_Pay_Type_txt.Text);
        receipt.Amount = Convert.ToInt32(Update_Amount_txt.Text);
        receipt.Transfer = Convert.ToBoolean(Update_Transfer_txt.Text);
        receipt.Recieve = Convert.ToBoolean(Update_Recieve_txt.Text);
        receipt.Update(receipt);
        Insert_receipt_GridView.DataBind();
        Update_receipt_GridView.DataBind();
        Delete_receipt_GridView.DataBind();
        return receipt;
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
        receipt = Delete_receipt_select(Convert.ToInt32(Delete_receipt_GridView.SelectedValue));
    }
    public receipt Delete_receipt_select(int ID)
    {
        receipt = receipt.Select(ID);
        Delete_Receipt_ID_txt_lbl.Text = Convert.ToString(receipt.Receipt_ID);
        Delete_Account_ID_txt_lbl.Text = Convert.ToString(receipt.Account_ID);
        Delete_Check_Num_txt_lbl.Text = Convert.ToString(receipt.Check_Num);
        Delete_DLN_txt_lbl.Text = Convert.ToString(receipt.DLN);
        Delete_Phone_txt_lbl.Text = Convert.ToString(receipt.Phone);
        Delete_Pay_Type_txt_lbl.Text = Convert.ToString(receipt.Pay_Type);
        Delete_Amount_txt_lbl.Text = Convert.ToString(receipt.Amount);
        Delete_Transfer_txt_lbl.Text = Convert.ToString(receipt.Transfer);
        Delete_Recieve_txt_lbl.Text = Convert.ToString(receipt.Recieve);
        return receipt;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        receipt_delete(Convert.ToInt32(Delete_receipt_GridView.SelectedValue));
    }
    public void receipt_delete(int ID)
    {
        receipt.Delete(ID);
        Insert_receipt_GridView.DataBind();
        Update_receipt_GridView.DataBind();
        Delete_receipt_GridView.DataBind();
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

