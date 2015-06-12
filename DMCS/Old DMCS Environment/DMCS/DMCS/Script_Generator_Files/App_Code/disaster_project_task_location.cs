using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class disaster_project_task_location
{
    public Int32 disaster_project_task_location_id
    {
        get;
        set;
    }
    public Int32 disaster_id
    {
        get;
        set;
    }
    public Int32 project_id
    {
        get;
        set;
    }
    public Int32 task_id
    {
        get;
        set;
    }
    public Int32 demo_location_id
    {
        get;
        set;
    }
    public Int32 demo_id
    {
        get;
        set;
    }
    public Decimal est_task_hours
    {
        get;
        set;
    }
    public Decimal est_task_costs
    {
        get;
        set;
    }
    public String auth_name_rec_perf_rating
    {
        get;
        set;
    }
    public DateTime date_rec_perf_date
    {
        get;
        set;
    }
    public String aut_name_review_time
    {
        get;
        set;
    }
    public DateTime date_ok_timesh_rep
    {
        get;
        set;
    }
    public String auth_name_pay_rel_person
    {
        get;
        set;
    }
    public DateTime date_person_paid_rel
    {
        get;
        set;
    }
    public String aut_name_prod_inv_ck_pay_ven
    {
        get;
        set;
    }
    public String aut_name_eq_ret_refurb
    {
        get;
        set;
    }
    public DateTime date_prod_inv_rel_ven_paid
    {
        get;
        set;
    }
    public DateTime date_eq_rel_ven_paid
    {
        get;
        set;
    }
    public String task_authorized_name_reimburse
    {
        get;
        set;
    }
    public DateTime date_task_reimburse
    {
        get;
        set;
    }
    public String ok_close_task_name
    {
        get;
        set;
    }
    public DateTime close_task_date
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        disaster_project_task_location_id = 0;
        disaster_id = 0;
        project_id = 0;
        task_id = 0;
        demo_location_id = 0;
        demo_id = 0;
        est_task_hours = 0;
        est_task_costs = 0;
        auth_name_rec_perf_rating = " ";
        date_rec_perf_date = DateTime.Now;
        aut_name_review_time = " ";
        date_ok_timesh_rep = DateTime.Now;
        auth_name_pay_rel_person = " ";
        date_person_paid_rel = DateTime.Now;
        aut_name_prod_inv_ck_pay_ven = " ";
        aut_name_eq_ret_refurb = " ";
        date_prod_inv_rel_ven_paid = DateTime.Now;
        date_eq_rel_ven_paid = DateTime.Now;
        task_authorized_name_reimburse = " ";
        date_task_reimburse = DateTime.Now;
        ok_close_task_name = " ";
        close_task_date = DateTime.Now;
    }
    public disaster_project_task_location Select(int id)
    {
        disaster_project_task_location disaster_project_task_location = new disaster_project_task_location();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DISASTER_PROJECT_TASK_LOCATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@disaster_project_task_location_id", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    disaster_project_task_location.disaster_project_task_location_id = rdr.GetInt32(0);
                }
                else
                {
                    disaster_project_task_location.disaster_project_task_location_id = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    disaster_project_task_location.disaster_id = rdr.GetInt32(1);
                }
                else
                {
                    disaster_project_task_location.disaster_id = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    disaster_project_task_location.project_id = rdr.GetInt32(2);
                }
                else
                {
                    disaster_project_task_location.project_id = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    disaster_project_task_location.task_id = rdr.GetInt32(3);
                }
                else
                {
                    disaster_project_task_location.task_id = 0;
                }
                if (!rdr.IsDBNull(4))
                {
                    disaster_project_task_location.demo_location_id = rdr.GetInt32(4);
                }
                else
                {
                    disaster_project_task_location.demo_location_id = 0;
                }
                if (!rdr.IsDBNull(5))
                {
                    disaster_project_task_location.demo_id = rdr.GetInt32(5);
                }
                else
                {
                    disaster_project_task_location.demo_id = 0;
                }
                if (!rdr.IsDBNull(6))
                {
                    disaster_project_task_location.est_task_hours = rdr.GetDecimal(6);
                }
                else
                {
                    disaster_project_task_location.est_task_hours = 0;
                }
                if (!rdr.IsDBNull(7))
                {
                    disaster_project_task_location.est_task_costs = rdr.GetDecimal(7);
                }
                else
                {
                    disaster_project_task_location.est_task_costs = 0;
                }
                if (!rdr.IsDBNull(8))
                {
                    disaster_project_task_location.auth_name_rec_perf_rating = rdr.GetString(8);
                }
                else
                {
                    disaster_project_task_location.auth_name_rec_perf_rating = " ";
                }
                if (!rdr.IsDBNull(9))
                {
                    disaster_project_task_location.date_rec_perf_date = rdr.GetDateTime(9);
                }
                else
                {
                    disaster_project_task_location.date_rec_perf_date = DateTime.Now;
                }
                if (!rdr.IsDBNull(10))
                {
                    disaster_project_task_location.aut_name_review_time = rdr.GetString(10);
                }
                else
                {
                    disaster_project_task_location.aut_name_review_time = " ";
                }
                if (!rdr.IsDBNull(11))
                {
                    disaster_project_task_location.date_ok_timesh_rep = rdr.GetDateTime(11);
                }
                else
                {
                    disaster_project_task_location.date_ok_timesh_rep = DateTime.Now;
                }
                if (!rdr.IsDBNull(12))
                {
                    disaster_project_task_location.auth_name_pay_rel_person = rdr.GetString(12);
                }
                else
                {
                    disaster_project_task_location.auth_name_pay_rel_person = " ";
                }
                if (!rdr.IsDBNull(13))
                {
                    disaster_project_task_location.date_person_paid_rel = rdr.GetDateTime(13);
                }
                else
                {
                    disaster_project_task_location.date_person_paid_rel = DateTime.Now;
                }
                if (!rdr.IsDBNull(14))
                {
                    disaster_project_task_location.aut_name_prod_inv_ck_pay_ven = rdr.GetString(14);
                }
                else
                {
                    disaster_project_task_location.aut_name_prod_inv_ck_pay_ven = " ";
                }
                if (!rdr.IsDBNull(15))
                {
                    disaster_project_task_location.aut_name_eq_ret_refurb = rdr.GetString(15);
                }
                else
                {
                    disaster_project_task_location.aut_name_eq_ret_refurb = " ";
                }
                if (!rdr.IsDBNull(16))
                {
                    disaster_project_task_location.date_prod_inv_rel_ven_paid = rdr.GetDateTime(16);
                }
                else
                {
                    disaster_project_task_location.date_prod_inv_rel_ven_paid = DateTime.Now;
                }
                if (!rdr.IsDBNull(17))
                {
                    disaster_project_task_location.date_eq_rel_ven_paid = rdr.GetDateTime(17);
                }
                else
                {
                    disaster_project_task_location.date_eq_rel_ven_paid = DateTime.Now;
                }
                if (!rdr.IsDBNull(18))
                {
                    disaster_project_task_location.task_authorized_name_reimburse = rdr.GetString(18);
                }
                else
                {
                    disaster_project_task_location.task_authorized_name_reimburse = " ";
                }
                if (!rdr.IsDBNull(19))
                {
                    disaster_project_task_location.date_task_reimburse = rdr.GetDateTime(19);
                }
                else
                {
                    disaster_project_task_location.date_task_reimburse = DateTime.Now;
                }
                if (!rdr.IsDBNull(20))
                {
                    disaster_project_task_location.ok_close_task_name = rdr.GetString(20);
                }
                else
                {
                    disaster_project_task_location.ok_close_task_name = " ";
                }
                if (!rdr.IsDBNull(21))
                {
                    disaster_project_task_location.close_task_date = rdr.GetDateTime(21);
                }
                else
                {
                    disaster_project_task_location.close_task_date = DateTime.Now;
                }
                }
                else
                {
                    disaster_project_task_location.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            disaster_project_task_location.SetColumnDefaults();
            return disaster_project_task_location;
            }
        finally
        {
            con.Close();
        }
        return disaster_project_task_location;
    }

    public disaster_project_task_location Insert(disaster_project_task_location id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_DISASTER_PROJECT_TASK_LOCATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@disaster_id", id.disaster_id);
            cmd.Parameters.AddWithValue("@project_id", id.project_id);
            cmd.Parameters.AddWithValue("@task_id", id.task_id);
            cmd.Parameters.AddWithValue("@demo_location_id", id.demo_location_id);
            cmd.Parameters.AddWithValue("@demo_id", id.demo_id);
            cmd.Parameters.AddWithValue("@est_task_hours", id.est_task_hours);
            cmd.Parameters.AddWithValue("@est_task_costs", id.est_task_costs);
            cmd.Parameters.AddWithValue("@auth_name_rec_perf_rating", id.auth_name_rec_perf_rating);
            cmd.Parameters.AddWithValue("@date_rec_perf_date", id.date_rec_perf_date);
            cmd.Parameters.AddWithValue("@aut_name_review_time", id.aut_name_review_time);
            cmd.Parameters.AddWithValue("@date_ok_timesh_rep", id.date_ok_timesh_rep);
            cmd.Parameters.AddWithValue("@auth_name_pay_rel_person", id.auth_name_pay_rel_person);
            cmd.Parameters.AddWithValue("@date_person_paid_rel", id.date_person_paid_rel);
            cmd.Parameters.AddWithValue("@aut_name_prod_inv_ck_pay_ven", id.aut_name_prod_inv_ck_pay_ven);
            cmd.Parameters.AddWithValue("@aut_name_eq_ret_refurb", id.aut_name_eq_ret_refurb);
            cmd.Parameters.AddWithValue("@date_prod_inv_rel_ven_paid", id.date_prod_inv_rel_ven_paid);
            cmd.Parameters.AddWithValue("@date_eq_rel_ven_paid", id.date_eq_rel_ven_paid);
            cmd.Parameters.AddWithValue("@task_authorized_name_reimburse", id.task_authorized_name_reimburse);
            cmd.Parameters.AddWithValue("@date_task_reimburse", id.date_task_reimburse);
            cmd.Parameters.AddWithValue("@ok_close_task_name", id.ok_close_task_name);
            cmd.Parameters.AddWithValue("@close_task_date", id.close_task_date);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_DISASTER_PROJECT_TASK_LOCATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@disaster_id", id.disaster_id);
            cmd.Parameters.AddWithValue("@project_id", id.project_id);
            cmd.Parameters.AddWithValue("@task_id", id.task_id);
            cmd.Parameters.AddWithValue("@demo_location_id", id.demo_location_id);
            cmd.Parameters.AddWithValue("@demo_id", id.demo_id);
            cmd.Parameters.AddWithValue("@est_task_hours", id.est_task_hours);
            cmd.Parameters.AddWithValue("@est_task_costs", id.est_task_costs);
            cmd.Parameters.AddWithValue("@auth_name_rec_perf_rating", id.auth_name_rec_perf_rating);
            cmd.Parameters.AddWithValue("@date_rec_perf_date", id.date_rec_perf_date);
            cmd.Parameters.AddWithValue("@aut_name_review_time", id.aut_name_review_time);
            cmd.Parameters.AddWithValue("@date_ok_timesh_rep", id.date_ok_timesh_rep);
            cmd.Parameters.AddWithValue("@auth_name_pay_rel_person", id.auth_name_pay_rel_person);
            cmd.Parameters.AddWithValue("@date_person_paid_rel", id.date_person_paid_rel);
            cmd.Parameters.AddWithValue("@aut_name_prod_inv_ck_pay_ven", id.aut_name_prod_inv_ck_pay_ven);
            cmd.Parameters.AddWithValue("@aut_name_eq_ret_refurb", id.aut_name_eq_ret_refurb);
            cmd.Parameters.AddWithValue("@date_prod_inv_rel_ven_paid", id.date_prod_inv_rel_ven_paid);
            cmd.Parameters.AddWithValue("@date_eq_rel_ven_paid", id.date_eq_rel_ven_paid);
            cmd.Parameters.AddWithValue("@task_authorized_name_reimburse", id.task_authorized_name_reimburse);
            cmd.Parameters.AddWithValue("@date_task_reimburse", id.date_task_reimburse);
            cmd.Parameters.AddWithValue("@ok_close_task_name", id.ok_close_task_name);
            cmd.Parameters.AddWithValue("@close_task_date", id.close_task_date);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.disaster_project_task_location_id = rdr.GetInt32(0);
            }
        }
        catch (Exception ex)
        {
            id.SetColumnDefaults();
        }
        finally
        {
            con.Close();
        }
        return id;
    }
    public Boolean Update(disaster_project_task_location id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_DISASTER_PROJECT_TASK_LOCATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@disaster_project_task_location_id", id.disaster_project_task_location_id);
            cmd.Parameters.AddWithValue("@disaster_id", id.disaster_id);
            cmd.Parameters.AddWithValue("@project_id", id.project_id);
            cmd.Parameters.AddWithValue("@task_id", id.task_id);
            cmd.Parameters.AddWithValue("@demo_location_id", id.demo_location_id);
            cmd.Parameters.AddWithValue("@demo_id", id.demo_id);
            cmd.Parameters.AddWithValue("@est_task_hours", id.est_task_hours);
            cmd.Parameters.AddWithValue("@est_task_costs", id.est_task_costs);
            cmd.Parameters.AddWithValue("@auth_name_rec_perf_rating", id.auth_name_rec_perf_rating);
            cmd.Parameters.AddWithValue("@date_rec_perf_date", id.date_rec_perf_date);
            cmd.Parameters.AddWithValue("@aut_name_review_time", id.aut_name_review_time);
            cmd.Parameters.AddWithValue("@date_ok_timesh_rep", id.date_ok_timesh_rep);
            cmd.Parameters.AddWithValue("@auth_name_pay_rel_person", id.auth_name_pay_rel_person);
            cmd.Parameters.AddWithValue("@date_person_paid_rel", id.date_person_paid_rel);
            cmd.Parameters.AddWithValue("@aut_name_prod_inv_ck_pay_ven", id.aut_name_prod_inv_ck_pay_ven);
            cmd.Parameters.AddWithValue("@aut_name_eq_ret_refurb", id.aut_name_eq_ret_refurb);
            cmd.Parameters.AddWithValue("@date_prod_inv_rel_ven_paid", id.date_prod_inv_rel_ven_paid);
            cmd.Parameters.AddWithValue("@date_eq_rel_ven_paid", id.date_eq_rel_ven_paid);
            cmd.Parameters.AddWithValue("@task_authorized_name_reimburse", id.task_authorized_name_reimburse);
            cmd.Parameters.AddWithValue("@date_task_reimburse", id.date_task_reimburse);
            cmd.Parameters.AddWithValue("@ok_close_task_name", id.ok_close_task_name);
            cmd.Parameters.AddWithValue("@close_task_date", id.close_task_date);
            cmd.ExecuteReader();
            con.Close();
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
        finally
        {
            con.Close();
        }
    }
    public Boolean Delete(int id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_DISASTER_PROJECT_TASK_LOCATION", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@disaster_project_task_location_id", id);
            cmd.ExecuteReader();
            con.Close();
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
        finally
        {
            con.Close();
        }
    }

    public DataTable Select(string whereclause)
    {
        DataTable alrows = new DataTable();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DISASTER_PROJECT_TASK_LOCATION_WC", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@wareclause", whereclause);
            SqlDataReader rdr = cmd.ExecuteReader();
            alrows.Load(rdr);
            return alrows;
        }
        catch (Exception ex)
        {
            return alrows;
        }
        finally
        {
            con.Close();
        }
    }
}

}




