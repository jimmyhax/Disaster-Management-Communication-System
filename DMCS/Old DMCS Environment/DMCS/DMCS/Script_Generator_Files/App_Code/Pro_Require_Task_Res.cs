using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DMCS;
namespace DMCS
{
public class Pro_Require_Task_Res
{
    public Int32 Proj_Require_Task_Res_ID
    {
        get;
        set;
    }
    public Int32 project_id
    {
        get;
        set;
    }
    public Int32 Requirement_ID
    {
        get;
        set;
    }
    public Int32 task_id
    {
        get;
        set;
    }
    public Int32 Resource_ID
    {
        get;
        set;
    }
    public String Project_Catagory
    {
        get;
        set;
    }
    public String Proj_Require_Description
    {
        get;
        set;
    }
    public String Project_Task_Description
    {
        get;
        set;
    }
    public String Applicant_Name
    {
        get;
        set;
    }
    public String Equipment_Description
    {
        get;
        set;
    }
    public String Vehicle
    {
        get;
        set;
    }


    public void SetColumnDefaults()
    {
        Proj_Require_Task_Res_ID = 0;
        project_id = 0;
        Requirement_ID = 0;
        task_id = 0;
        Resource_ID = 0;
        Project_Catagory = " ";
        Proj_Require_Description = " ";
        Project_Task_Description = " ";
        Applicant_Name = " ";
        Equipment_Description = " ";
        Vehicle = " ";
    }
    public Pro_Require_Task_Res Select(int id)
    {
        Pro_Require_Task_Res Pro_Require_Task_Res = new Pro_Require_Task_Res();
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PRO_REQUIRE_TASK_RES", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Proj_Require_Task_Res_ID", id);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (!rdr.IsDBNull(0))
                {
                    Pro_Require_Task_Res.Proj_Require_Task_Res_ID = rdr.GetInt32(0);
                }
                else
                {
                    Pro_Require_Task_Res.Proj_Require_Task_Res_ID = 0;
                }
                if (!rdr.IsDBNull(1))
                {
                    Pro_Require_Task_Res.project_id = rdr.GetInt32(1);
                }
                else
                {
                    Pro_Require_Task_Res.project_id = 0;
                }
                if (!rdr.IsDBNull(2))
                {
                    Pro_Require_Task_Res.Requirement_ID = rdr.GetInt32(2);
                }
                else
                {
                    Pro_Require_Task_Res.Requirement_ID = 0;
                }
                if (!rdr.IsDBNull(3))
                {
                    Pro_Require_Task_Res.task_id = rdr.GetInt32(3);
                }
                else
                {
                    Pro_Require_Task_Res.task_id = 0;
                }
                if (!rdr.IsDBNull(4))
                {
                    Pro_Require_Task_Res.Resource_ID = rdr.GetInt32(4);
                }
                else
                {
                    Pro_Require_Task_Res.Resource_ID = 0;
                }
                if (!rdr.IsDBNull(5))
                {
                    Pro_Require_Task_Res.Project_Catagory = rdr.GetString(5);
                }
                else
                {
                    Pro_Require_Task_Res.Project_Catagory = " ";
                }
                if (!rdr.IsDBNull(6))
                {
                    Pro_Require_Task_Res.Proj_Require_Description = rdr.GetString(6);
                }
                else
                {
                    Pro_Require_Task_Res.Proj_Require_Description = " ";
                }
                if (!rdr.IsDBNull(7))
                {
                    Pro_Require_Task_Res.Project_Task_Description = rdr.GetString(7);
                }
                else
                {
                    Pro_Require_Task_Res.Project_Task_Description = " ";
                }
                if (!rdr.IsDBNull(8))
                {
                    Pro_Require_Task_Res.Applicant_Name = rdr.GetString(8);
                }
                else
                {
                    Pro_Require_Task_Res.Applicant_Name = " ";
                }
                if (!rdr.IsDBNull(9))
                {
                    Pro_Require_Task_Res.Equipment_Description = rdr.GetString(9);
                }
                else
                {
                    Pro_Require_Task_Res.Equipment_Description = " ";
                }
                if (!rdr.IsDBNull(10))
                {
                    Pro_Require_Task_Res.Vehicle = rdr.GetString(10);
                }
                else
                {
                    Pro_Require_Task_Res.Vehicle = " ";
                }
                }
                else
                {
                    Pro_Require_Task_Res.SetColumnDefaults();
                }
            }
            catch (Exception ex)
            {
            Pro_Require_Task_Res.SetColumnDefaults();
            return Pro_Require_Task_Res;
            }
        finally
        {
            con.Close();
        }
        return Pro_Require_Task_Res;
    }

    public Pro_Require_Task_Res Insert(Pro_Require_Task_Res id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_PRO_REQUIRE_TASK_RES", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@project_id", id.project_id);
            cmd.Parameters.AddWithValue("@Requirement_ID", id.Requirement_ID);
            cmd.Parameters.AddWithValue("@task_id", id.task_id);
            cmd.Parameters.AddWithValue("@Resource_ID", id.Resource_ID);
            cmd.Parameters.AddWithValue("@Project_Catagory", id.Project_Catagory);
            cmd.Parameters.AddWithValue("@Proj_Require_Description", id.Proj_Require_Description);
            cmd.Parameters.AddWithValue("@Project_Task_Description", id.Project_Task_Description);
            cmd.Parameters.AddWithValue("@Applicant_Name", id.Applicant_Name);
            cmd.Parameters.AddWithValue("@Equipment_Description", id.Equipment_Description);
            cmd.Parameters.AddWithValue("@Vehicle", id.Vehicle);
            cmd.ExecuteReader();
            con.Close();
            con.Open();
            cmd = new SqlCommand("SP_DMCS_GET_PRO_REQUIRE_TASK_RES", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@project_id", id.project_id);
            cmd.Parameters.AddWithValue("@Requirement_ID", id.Requirement_ID);
            cmd.Parameters.AddWithValue("@task_id", id.task_id);
            cmd.Parameters.AddWithValue("@Resource_ID", id.Resource_ID);
            cmd.Parameters.AddWithValue("@Project_Catagory", id.Project_Catagory);
            cmd.Parameters.AddWithValue("@Proj_Require_Description", id.Proj_Require_Description);
            cmd.Parameters.AddWithValue("@Project_Task_Description", id.Project_Task_Description);
            cmd.Parameters.AddWithValue("@Applicant_Name", id.Applicant_Name);
            cmd.Parameters.AddWithValue("@Equipment_Description", id.Equipment_Description);
            cmd.Parameters.AddWithValue("@Vehicle", id.Vehicle);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                id.Proj_Require_Task_Res_ID = rdr.GetInt32(0);
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
    public Boolean Update(Pro_Require_Task_Res id)
    {
        string ConnectionString = IDManager.connection();
        SqlConnection con = new SqlConnection(ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_PRO_REQUIRE_TASK_RES", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Proj_Require_Task_Res_ID", id.Proj_Require_Task_Res_ID);
            cmd.Parameters.AddWithValue("@project_id", id.project_id);
            cmd.Parameters.AddWithValue("@Requirement_ID", id.Requirement_ID);
            cmd.Parameters.AddWithValue("@task_id", id.task_id);
            cmd.Parameters.AddWithValue("@Resource_ID", id.Resource_ID);
            cmd.Parameters.AddWithValue("@Project_Catagory", id.Project_Catagory);
            cmd.Parameters.AddWithValue("@Proj_Require_Description", id.Proj_Require_Description);
            cmd.Parameters.AddWithValue("@Project_Task_Description", id.Project_Task_Description);
            cmd.Parameters.AddWithValue("@Applicant_Name", id.Applicant_Name);
            cmd.Parameters.AddWithValue("@Equipment_Description", id.Equipment_Description);
            cmd.Parameters.AddWithValue("@Vehicle", id.Vehicle);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_PRO_REQUIRE_TASK_RES", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Proj_Require_Task_Res_ID", id);
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
            SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PRO_REQUIRE_TASK_RES_WC", con);
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




