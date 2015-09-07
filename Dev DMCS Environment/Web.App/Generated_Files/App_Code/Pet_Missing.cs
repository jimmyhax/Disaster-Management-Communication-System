using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class Pet_Missing : System.Web.UI.Page
    {
        public Int32 Pet_Missing_ID
        {
            get;
            set;
        }
        public Int32 Last_Known_Location_ID
        {
            get;
            set;
        }
        public DateTime Date_Missing
        {
            get;
            set;
        }
        public DateTime Date_Reported
        {
            get;
            set;
        }
        public String Collar_Description
        {
            get;
            set;
        }
        public DateTime Time_Lost
        {
            get;
            set;
        }
        public String Lost_Explanation
        {
            get;
            set;
        }
        public Int32 Length_Owned
        {
            get;
            set;
        }
        public Decimal Reward_Amt
        {
            get;
            set;
        }
        public String Breeder
        {
            get;
            set;
        }
        public DateTime Date_Created
        {
            get;
            set;
        }
        public DateTime Date_Modified
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            Pet_Missing_ID = 0;
            Last_Known_Location_ID = 0;
            Date_Missing = DateTime.Now;
            Date_Reported = DateTime.Now;
            Collar_Description = "";
            Time_Lost = DateTime.Now;
            Lost_Explanation = "";
            Length_Owned = 0;
            Reward_Amt = 0;
            Breeder = "";
            Date_Created = DateTime.Now;
            Date_Modified = DateTime.Now;
        }
        public Pet_Missing Select(int id)
        {
            Pet_Missing Pet_Missing = new Pet_Missing();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PET_MISSING", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Pet_Missing_ID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        Pet_Missing.Pet_Missing_ID = rdr.GetInt32(0);
                    }
                    else
                    {
                        Pet_Missing.Pet_Missing_ID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        Pet_Missing.Last_Known_Location_ID = rdr.GetInt32(1);
                    }
                    else
                    {
                        Pet_Missing.Last_Known_Location_ID = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        Pet_Missing.Date_Missing = rdr.GetDateTime(2);
                    }
                    else
                    {
                        Pet_Missing.Date_Missing = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        Pet_Missing.Date_Reported = rdr.GetDateTime(3);
                    }
                    else
                    {
                        Pet_Missing.Date_Reported = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        Pet_Missing.Collar_Description = rdr.GetString(4);
                    }
                    else
                    {
                        Pet_Missing.Collar_Description = " ";
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        Pet_Missing.Time_Lost = rdr.GetDateTime(5);
                    }
                    else
                    {
                        Pet_Missing.Time_Lost = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        Pet_Missing.Lost_Explanation = rdr.GetString(6);
                    }
                    else
                    {
                        Pet_Missing.Lost_Explanation = " ";
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        Pet_Missing.Length_Owned = rdr.GetInt32(7);
                    }
                    else
                    {
                        Pet_Missing.Length_Owned = 0;
                    }
                    if (!rdr.IsDBNull(8))
                    {
                        Pet_Missing.Reward_Amt = rdr.GetDecimal(8);
                    }
                    else
                    {
                        Pet_Missing.Reward_Amt = 0;
                    }
                    if (!rdr.IsDBNull(9))
                    {
                        Pet_Missing.Breeder = rdr.GetString(9);
                    }
                    else
                    {
                        Pet_Missing.Breeder = " ";
                    }
                    if (!rdr.IsDBNull(10))
                    {
                        Pet_Missing.Date_Created = rdr.GetDateTime(10);
                    }
                    else
                    {
                        Pet_Missing.Date_Created = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(11))
                    {
                        Pet_Missing.Date_Modified = rdr.GetDateTime(11);
                    }
                    else
                    {
                        Pet_Missing.Date_Modified = DateTime.Now;
                    }
                    }
                    else
                    {
                    Pet_Missing.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                Pet_Missing.SetColumnDefaults();
                return Pet_Missing;
                }
            finally
            {
                con.Close();
            }
            return Pet_Missing;
        }

        public Pet_Missing Insert(Pet_Missing id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_PET_MISSING", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Pet_Missing_ID", id.Pet_Missing_ID);
                cmd.Parameters.AddWithValue("@Last_Known_Location_ID", id.Last_Known_Location_ID);
                cmd.Parameters.AddWithValue("@Date_Missing", id.Date_Missing);
                cmd.Parameters.AddWithValue("@Date_Reported", id.Date_Reported);
                cmd.Parameters.AddWithValue("@Collar_Description", id.Collar_Description);
                cmd.Parameters.AddWithValue("@Time_Lost", id.Time_Lost);
                cmd.Parameters.AddWithValue("@Lost_Explanation", id.Lost_Explanation);
                cmd.Parameters.AddWithValue("@Length_Owned", id.Length_Owned);
                cmd.Parameters.AddWithValue("@Reward_Amt", id.Reward_Amt);
                cmd.Parameters.AddWithValue("@Breeder", id.Breeder);
                cmd.Parameters.AddWithValue("@Date_Created", id.Date_Created);
                cmd.Parameters.AddWithValue("@Date_Modified", id.Date_Modified);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_PET_MISSING", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Last_Known_Location_ID", id.Last_Known_Location_ID);
                cmd.Parameters.AddWithValue("@Date_Missing", id.Date_Missing);
                cmd.Parameters.AddWithValue("@Date_Reported", id.Date_Reported);
                cmd.Parameters.AddWithValue("@Collar_Description", id.Collar_Description);
                cmd.Parameters.AddWithValue("@Time_Lost", id.Time_Lost);
                cmd.Parameters.AddWithValue("@Lost_Explanation", id.Lost_Explanation);
                cmd.Parameters.AddWithValue("@Length_Owned", id.Length_Owned);
                cmd.Parameters.AddWithValue("@Reward_Amt", id.Reward_Amt);
                cmd.Parameters.AddWithValue("@Breeder", id.Breeder);
                cmd.Parameters.AddWithValue("@Date_Created", id.Date_Created);
                cmd.Parameters.AddWithValue("@Date_Modified", id.Date_Modified);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.Pet_Missing_ID = rdr.GetInt32(0);
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
        public Boolean Update(Pet_Missing id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_PET_MISSING", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Pet_Missing_ID", id.Pet_Missing_ID);
                cmd.Parameters.AddWithValue("@Last_Known_Location_ID", id.Last_Known_Location_ID);
                cmd.Parameters.AddWithValue("@Date_Missing", id.Date_Missing);
                cmd.Parameters.AddWithValue("@Date_Reported", id.Date_Reported);
                cmd.Parameters.AddWithValue("@Collar_Description", id.Collar_Description);
                cmd.Parameters.AddWithValue("@Time_Lost", id.Time_Lost);
                cmd.Parameters.AddWithValue("@Lost_Explanation", id.Lost_Explanation);
                cmd.Parameters.AddWithValue("@Length_Owned", id.Length_Owned);
                cmd.Parameters.AddWithValue("@Reward_Amt", id.Reward_Amt);
                cmd.Parameters.AddWithValue("@Breeder", id.Breeder);
                cmd.Parameters.AddWithValue("@Date_Created", id.Date_Created);
                cmd.Parameters.AddWithValue("@Date_Modified", id.Date_Modified);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_PET_MISSING", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Pet_Missing_ID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PET_MISSING_WC", con);
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




