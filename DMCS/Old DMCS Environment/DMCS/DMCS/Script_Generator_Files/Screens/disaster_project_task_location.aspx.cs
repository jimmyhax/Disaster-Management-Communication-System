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
public partial class disaster_project_task_location_ : System.Web.UI.Page
{
            public disaster_project_task_location disaster_project_task_location = new disaster_project_task_location();
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
        disaster_project_task_location = Insert_disaster_project_task_location_select(Convert.ToInt32(Insert_disaster_project_task_location_GridView.SelectedValue));
    }
    public disaster_project_task_location Insert_disaster_project_task_location_select(int ID)
    {
        disaster_project_task_location = disaster_project_task_location.Select(ID);
        Insert_disaster_id_txt.Text = Convert.ToString(disaster_project_task_location.disaster_id);
        Insert_project_id_txt.Text = Convert.ToString(disaster_project_task_location.project_id);
        Insert_task_id_txt.Text = Convert.ToString(disaster_project_task_location.task_id);
        Insert_demo_location_id_txt.Text = Convert.ToString(disaster_project_task_location.demo_location_id);
        Insert_demo_id_txt.Text = Convert.ToString(disaster_project_task_location.demo_id);
        Insert_est_task_hours_txt.Text = Convert.ToString(disaster_project_task_location.est_task_hours);
        Insert_est_task_costs_txt.Text = Convert.ToString(disaster_project_task_location.est_task_costs);
        Insert_auth_name_rec_perf_rating_txt.Text = Convert.ToString(disaster_project_task_location.auth_name_rec_perf_rating);
        Insert_date_rec_perf_date_txt.Text = Convert.ToString(disaster_project_task_location.date_rec_perf_date);
        Insert_aut_name_review_time_txt.Text = Convert.ToString(disaster_project_task_location.aut_name_review_time);
        Insert_date_ok_timesh_rep_txt.Text = Convert.ToString(disaster_project_task_location.date_ok_timesh_rep);
        Insert_auth_name_pay_rel_person_txt.Text = Convert.ToString(disaster_project_task_location.auth_name_pay_rel_person);
        Insert_date_person_paid_rel_txt.Text = Convert.ToString(disaster_project_task_location.date_person_paid_rel);
        Insert_aut_name_prod_inv_ck_pay_ven_txt.Text = Convert.ToString(disaster_project_task_location.aut_name_prod_inv_ck_pay_ven);
        Insert_aut_name_eq_ret_refurb_txt.Text = Convert.ToString(disaster_project_task_location.aut_name_eq_ret_refurb);
        Insert_date_prod_inv_rel_ven_paid_txt.Text = Convert.ToString(disaster_project_task_location.date_prod_inv_rel_ven_paid);
        Insert_date_eq_rel_ven_paid_txt.Text = Convert.ToString(disaster_project_task_location.date_eq_rel_ven_paid);
        Insert_task_authorized_name_reimburse_txt.Text = Convert.ToString(disaster_project_task_location.task_authorized_name_reimburse);
        Insert_date_task_reimburse_txt.Text = Convert.ToString(disaster_project_task_location.date_task_reimburse);
        Insert_ok_close_task_name_txt.Text = Convert.ToString(disaster_project_task_location.ok_close_task_name);
        Insert_close_task_date_txt.Text = Convert.ToString(disaster_project_task_location.close_task_date);
        return disaster_project_task_location;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        disaster_project_task_location = disaster_project_task_location_insert();
    }
    public disaster_project_task_location disaster_project_task_location_insert()
    {
        disaster_project_task_location.disaster_id = Convert.ToInt32(Insert_disaster_id_txt.Text);
        disaster_project_task_location.project_id = Convert.ToInt32(Insert_project_id_txt.Text);
        disaster_project_task_location.task_id = Convert.ToInt32(Insert_task_id_txt.Text);
        disaster_project_task_location.demo_location_id = Convert.ToInt32(Insert_demo_location_id_txt.Text);
        disaster_project_task_location.demo_id = Convert.ToInt32(Insert_demo_id_txt.Text);
        disaster_project_task_location.est_task_hours = Convert.ToDecimal(Insert_est_task_hours_txt.Text);
        disaster_project_task_location.est_task_costs = Convert.ToDecimal(Insert_est_task_costs_txt.Text);
        disaster_project_task_location.auth_name_rec_perf_rating = Insert_auth_name_rec_perf_rating_txt.Text;
        disaster_project_task_location.date_rec_perf_date = Convert.ToDateTime(Insert_date_rec_perf_date_txt.Text);
        disaster_project_task_location.aut_name_review_time = Insert_aut_name_review_time_txt.Text;
        disaster_project_task_location.date_ok_timesh_rep = Convert.ToDateTime(Insert_date_ok_timesh_rep_txt.Text);
        disaster_project_task_location.auth_name_pay_rel_person = Insert_auth_name_pay_rel_person_txt.Text;
        disaster_project_task_location.date_person_paid_rel = Convert.ToDateTime(Insert_date_person_paid_rel_txt.Text);
        disaster_project_task_location.aut_name_prod_inv_ck_pay_ven = Insert_aut_name_prod_inv_ck_pay_ven_txt.Text;
        disaster_project_task_location.aut_name_eq_ret_refurb = Insert_aut_name_eq_ret_refurb_txt.Text;
        disaster_project_task_location.date_prod_inv_rel_ven_paid = Convert.ToDateTime(Insert_date_prod_inv_rel_ven_paid_txt.Text);
        disaster_project_task_location.date_eq_rel_ven_paid = Convert.ToDateTime(Insert_date_eq_rel_ven_paid_txt.Text);
        disaster_project_task_location.task_authorized_name_reimburse = Insert_task_authorized_name_reimburse_txt.Text;
        disaster_project_task_location.date_task_reimburse = Convert.ToDateTime(Insert_date_task_reimburse_txt.Text);
        disaster_project_task_location.ok_close_task_name = Insert_ok_close_task_name_txt.Text;
        disaster_project_task_location.close_task_date = Convert.ToDateTime(Insert_close_task_date_txt.Text);
        disaster_project_task_location = disaster_project_task_location.Insert(disaster_project_task_location);
        Insert_disaster_project_task_location_GridView.DataBind();
        Update_disaster_project_task_location_GridView.DataBind();
        Delete_disaster_project_task_location_GridView.DataBind();
        return disaster_project_task_location;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        disaster_project_task_location = Update_disaster_project_task_location_select(Convert.ToInt32(Update_disaster_project_task_location_GridView.SelectedValue));
    }
    public disaster_project_task_location Update_disaster_project_task_location_select(int ID)
    {
        disaster_project_task_location = disaster_project_task_location.Select(ID);
        Update_disaster_project_task_location_id_txt.Text = Convert.ToString(disaster_project_task_location.disaster_project_task_location_id);
        Update_disaster_id_txt.Text = Convert.ToString(disaster_project_task_location.disaster_id);
        Update_project_id_txt.Text = Convert.ToString(disaster_project_task_location.project_id);
        Update_task_id_txt.Text = Convert.ToString(disaster_project_task_location.task_id);
        Update_demo_location_id_txt.Text = Convert.ToString(disaster_project_task_location.demo_location_id);
        Update_demo_id_txt.Text = Convert.ToString(disaster_project_task_location.demo_id);
        Update_est_task_hours_txt.Text = Convert.ToString(disaster_project_task_location.est_task_hours);
        Update_est_task_costs_txt.Text = Convert.ToString(disaster_project_task_location.est_task_costs);
        Update_auth_name_rec_perf_rating_txt.Text = Convert.ToString(disaster_project_task_location.auth_name_rec_perf_rating);
        Update_date_rec_perf_date_txt.Text = Convert.ToString(disaster_project_task_location.date_rec_perf_date);
        Update_aut_name_review_time_txt.Text = Convert.ToString(disaster_project_task_location.aut_name_review_time);
        Update_date_ok_timesh_rep_txt.Text = Convert.ToString(disaster_project_task_location.date_ok_timesh_rep);
        Update_auth_name_pay_rel_person_txt.Text = Convert.ToString(disaster_project_task_location.auth_name_pay_rel_person);
        Update_date_person_paid_rel_txt.Text = Convert.ToString(disaster_project_task_location.date_person_paid_rel);
        Update_aut_name_prod_inv_ck_pay_ven_txt.Text = Convert.ToString(disaster_project_task_location.aut_name_prod_inv_ck_pay_ven);
        Update_aut_name_eq_ret_refurb_txt.Text = Convert.ToString(disaster_project_task_location.aut_name_eq_ret_refurb);
        Update_date_prod_inv_rel_ven_paid_txt.Text = Convert.ToString(disaster_project_task_location.date_prod_inv_rel_ven_paid);
        Update_date_eq_rel_ven_paid_txt.Text = Convert.ToString(disaster_project_task_location.date_eq_rel_ven_paid);
        Update_task_authorized_name_reimburse_txt.Text = Convert.ToString(disaster_project_task_location.task_authorized_name_reimburse);
        Update_date_task_reimburse_txt.Text = Convert.ToString(disaster_project_task_location.date_task_reimburse);
        Update_ok_close_task_name_txt.Text = Convert.ToString(disaster_project_task_location.ok_close_task_name);
        Update_close_task_date_txt.Text = Convert.ToString(disaster_project_task_location.close_task_date);
        return disaster_project_task_location;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        disaster_project_task_location = disaster_project_task_location_update(Convert.ToInt32(Update_disaster_project_task_location_GridView.SelectedValue));
    }
    public disaster_project_task_location disaster_project_task_location_update(int ID)
    {
        disaster_project_task_location = disaster_project_task_location.Select(ID);
        disaster_project_task_location.disaster_project_task_location_id = Convert.ToInt32(Update_disaster_project_task_location_id_txt.Text);
        disaster_project_task_location.disaster_id = Convert.ToInt32(Update_disaster_id_txt.Text);
        disaster_project_task_location.project_id = Convert.ToInt32(Update_project_id_txt.Text);
        disaster_project_task_location.task_id = Convert.ToInt32(Update_task_id_txt.Text);
        disaster_project_task_location.demo_location_id = Convert.ToInt32(Update_demo_location_id_txt.Text);
        disaster_project_task_location.demo_id = Convert.ToInt32(Update_demo_id_txt.Text);
        disaster_project_task_location.est_task_hours = Convert.ToDecimal(Update_est_task_hours_txt.Text);
        disaster_project_task_location.est_task_costs = Convert.ToDecimal(Update_est_task_costs_txt.Text);
        disaster_project_task_location.auth_name_rec_perf_rating = Update_auth_name_rec_perf_rating_txt.Text;
        disaster_project_task_location.date_rec_perf_date = Convert.ToDateTime(Update_date_rec_perf_date_txt.Text);
        disaster_project_task_location.aut_name_review_time = Update_aut_name_review_time_txt.Text;
        disaster_project_task_location.date_ok_timesh_rep = Convert.ToDateTime(Update_date_ok_timesh_rep_txt.Text);
        disaster_project_task_location.auth_name_pay_rel_person = Update_auth_name_pay_rel_person_txt.Text;
        disaster_project_task_location.date_person_paid_rel = Convert.ToDateTime(Update_date_person_paid_rel_txt.Text);
        disaster_project_task_location.aut_name_prod_inv_ck_pay_ven = Update_aut_name_prod_inv_ck_pay_ven_txt.Text;
        disaster_project_task_location.aut_name_eq_ret_refurb = Update_aut_name_eq_ret_refurb_txt.Text;
        disaster_project_task_location.date_prod_inv_rel_ven_paid = Convert.ToDateTime(Update_date_prod_inv_rel_ven_paid_txt.Text);
        disaster_project_task_location.date_eq_rel_ven_paid = Convert.ToDateTime(Update_date_eq_rel_ven_paid_txt.Text);
        disaster_project_task_location.task_authorized_name_reimburse = Update_task_authorized_name_reimburse_txt.Text;
        disaster_project_task_location.date_task_reimburse = Convert.ToDateTime(Update_date_task_reimburse_txt.Text);
        disaster_project_task_location.ok_close_task_name = Update_ok_close_task_name_txt.Text;
        disaster_project_task_location.close_task_date = Convert.ToDateTime(Update_close_task_date_txt.Text);
        disaster_project_task_location.Update(disaster_project_task_location);
        Insert_disaster_project_task_location_GridView.DataBind();
        Update_disaster_project_task_location_GridView.DataBind();
        Delete_disaster_project_task_location_GridView.DataBind();
        return disaster_project_task_location;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        disaster_project_task_location = Delete_disaster_project_task_location_select(Convert.ToInt32(Delete_disaster_project_task_location_GridView.SelectedValue));
    }
    public disaster_project_task_location Delete_disaster_project_task_location_select(int ID)
    {
        disaster_project_task_location = disaster_project_task_location.Select(ID);
        Delete_disaster_project_task_location_id_txt_lbl.Text = Convert.ToString(disaster_project_task_location.disaster_project_task_location_id);
        Delete_disaster_id_txt_lbl.Text = Convert.ToString(disaster_project_task_location.disaster_id);
        Delete_project_id_txt_lbl.Text = Convert.ToString(disaster_project_task_location.project_id);
        Delete_task_id_txt_lbl.Text = Convert.ToString(disaster_project_task_location.task_id);
        Delete_demo_location_id_txt_lbl.Text = Convert.ToString(disaster_project_task_location.demo_location_id);
        Delete_demo_id_txt_lbl.Text = Convert.ToString(disaster_project_task_location.demo_id);
        Delete_est_task_hours_txt_lbl.Text = Convert.ToString(disaster_project_task_location.est_task_hours);
        Delete_est_task_costs_txt_lbl.Text = Convert.ToString(disaster_project_task_location.est_task_costs);
        Delete_auth_name_rec_perf_rating_txt_lbl.Text = Convert.ToString(disaster_project_task_location.auth_name_rec_perf_rating);
        Delete_date_rec_perf_date_txt_lbl.Text = Convert.ToString(disaster_project_task_location.date_rec_perf_date);
        Delete_aut_name_review_time_txt_lbl.Text = Convert.ToString(disaster_project_task_location.aut_name_review_time);
        Delete_date_ok_timesh_rep_txt_lbl.Text = Convert.ToString(disaster_project_task_location.date_ok_timesh_rep);
        Delete_auth_name_pay_rel_person_txt_lbl.Text = Convert.ToString(disaster_project_task_location.auth_name_pay_rel_person);
        Delete_date_person_paid_rel_txt_lbl.Text = Convert.ToString(disaster_project_task_location.date_person_paid_rel);
        Delete_aut_name_prod_inv_ck_pay_ven_txt_lbl.Text = Convert.ToString(disaster_project_task_location.aut_name_prod_inv_ck_pay_ven);
        Delete_aut_name_eq_ret_refurb_txt_lbl.Text = Convert.ToString(disaster_project_task_location.aut_name_eq_ret_refurb);
        Delete_date_prod_inv_rel_ven_paid_txt_lbl.Text = Convert.ToString(disaster_project_task_location.date_prod_inv_rel_ven_paid);
        Delete_date_eq_rel_ven_paid_txt_lbl.Text = Convert.ToString(disaster_project_task_location.date_eq_rel_ven_paid);
        Delete_task_authorized_name_reimburse_txt_lbl.Text = Convert.ToString(disaster_project_task_location.task_authorized_name_reimburse);
        Delete_date_task_reimburse_txt_lbl.Text = Convert.ToString(disaster_project_task_location.date_task_reimburse);
        Delete_ok_close_task_name_txt_lbl.Text = Convert.ToString(disaster_project_task_location.ok_close_task_name);
        Delete_close_task_date_txt_lbl.Text = Convert.ToString(disaster_project_task_location.close_task_date);
        return disaster_project_task_location;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        disaster_project_task_location_delete(Convert.ToInt32(Delete_disaster_project_task_location_GridView.SelectedValue));
    }
    public void disaster_project_task_location_delete(int ID)
    {
        disaster_project_task_location.Delete(ID);
        Insert_disaster_project_task_location_GridView.DataBind();
        Update_disaster_project_task_location_GridView.DataBind();
        Delete_disaster_project_task_location_GridView.DataBind();
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

