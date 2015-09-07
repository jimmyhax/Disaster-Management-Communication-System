using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class ClientWPets : System.Web.UI.Page
    {
        public Int32 CLIENTWPETS_ID
        {
            get;
            set;
        }
        public Int32 Pet_Record_ID
        {
            get;
            set;
        }
        public Int32 Client_id
        {
            get;
            set;
        }
        public Int32 Location_ID
        {
            get;
            set;
        }
        public DateTime cp_Date
        {
            get;
            set;
        }
        public String ownership
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            CLIENTWPETS_ID = 0;
            Pet_Record_ID = 0;
            Client_id = 0;
            Location_ID = 0;
            cp_Date = DateTime.Now;
            ownership = "";
        }
        public ClientWPets Select(int id)
        {
            ClientWPets ClientWPets = new ClientWPets();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_CLIENTWPETS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CLIENTWPETS_ID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        ClientWPets.CLIENTWPETS_ID = rdr.GetInt32(0);
                    }
                    else
                    {
                        ClientWPets.CLIENTWPETS_ID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        ClientWPets.Pet_Record_ID = rdr.GetInt32(1);
                    }
                    else
                    {
                        ClientWPets.Pet_Record_ID = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        ClientWPets.Client_id = rdr.GetInt32(2);
                    }
                    else
                    {
                        ClientWPets.Client_id = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        ClientWPets.Location_ID = rdr.GetInt32(3);
                    }
                    else
                    {
                        ClientWPets.Location_ID = 0;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        ClientWPets.cp_Date = rdr.GetDateTime(4);
                    }
                    else
                    {
                        ClientWPets.cp_Date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        ClientWPets.ownership = rdr.GetString(5);
                    }
                    else
                    {
                        ClientWPets.ownership = " ";
                    }
                    }
                    else
                    {
                    ClientWPets.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                ClientWPets.SetColumnDefaults();
                return ClientWPets;
                }
            finally
            {
                con.Close();
            }
            return ClientWPets;
        }

        public ClientWPets Insert(ClientWPets id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_CLIENTWPETS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Pet_Record_ID", id.Pet_Record_ID);
                cmd.Parameters.AddWithValue("@Client_id", id.Client_id);
                cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
                cmd.Parameters.AddWithValue("@cp_Date", id.cp_Date);
                cmd.Parameters.AddWithValue("@ownership", id.ownership);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_CLIENTWPETS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Pet_Record_ID", id.Pet_Record_ID);
                cmd.Parameters.AddWithValue("@Client_id", id.Client_id);
                cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
                cmd.Parameters.AddWithValue("@cp_Date", id.cp_Date);
                cmd.Parameters.AddWithValue("@ownership", id.ownership);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.CLIENTWPETS_ID = rdr.GetInt32(0);
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
        public Boolean Update(ClientWPets id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_CLIENTWPETS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CLIENTWPETS_ID", id.CLIENTWPETS_ID);
                cmd.Parameters.AddWithValue("@Pet_Record_ID", id.Pet_Record_ID);
                cmd.Parameters.AddWithValue("@Client_id", id.Client_id);
                cmd.Parameters.AddWithValue("@Location_ID", id.Location_ID);
                cmd.Parameters.AddWithValue("@cp_Date", id.cp_Date);
                cmd.Parameters.AddWithValue("@ownership", id.ownership);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_CLIENTWPETS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CLIENTWPETS_ID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_CLIENTWPETS_WC", con);
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




