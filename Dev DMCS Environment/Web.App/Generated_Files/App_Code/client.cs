using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class client : System.Web.UI.Page
    {
        public Int32 client_id
        {
            get;
            set;
        }
        public String client_status
        {
            get;
            set;
        }
        public String ethnicity
        {
            get;
            set;
        }
        public String eye_color
        {
            get;
            set;
        }
        public String hair_color
        {
            get;
            set;
        }
        public String height
        {
            get;
            set;
        }
        public byte[] picture
        {
            get;
            set;
        }
        public Int32 weight
        {
            get;
            set;
        }
        public String skin_color
        {
            get;
            set;
        }
        public String Info_Field
        {
            get;
            set;
        }
        public Int32 Client_Shelter_ID
        {
            get;
            set;
        }
        public String Emergency_Contact_Name
        {
            get;
            set;
        }
        public String Emergency_Contact_Number
        {
            get;
            set;
        }
        public String Subscribed_Alerts
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            client_id = 0;
            client_status = "";
            ethnicity = "";
            eye_color = "";
            hair_color = "";
            height = "";
            picture = null;
            weight = 0;
            skin_color = "";
            Info_Field = "";
            Client_Shelter_ID = 0;
            Emergency_Contact_Name = "";
            Emergency_Contact_Number = "";
            Subscribed_Alerts = "";
        }
        public client Select(int id)
        {
            client client = new client();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_CLIENT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@client_id", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        client.client_id = rdr.GetInt32(0);
                    }
                    else
                    {
                        client.client_id = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        client.client_status = rdr.GetString(1);
                    }
                    else
                    {
                        client.client_status = " ";
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        client.ethnicity = rdr.GetString(2);
                    }
                    else
                    {
                        client.ethnicity = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        client.eye_color = rdr.GetString(3);
                    }
                    else
                    {
                        client.eye_color = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        client.hair_color = rdr.GetString(4);
                    }
                    else
                    {
                        client.hair_color = " ";
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        client.height = rdr.GetString(5);
                    }
                    else
                    {
                        client.height = " ";
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        client.picture = (byte[])rdr["picture"];
                    }
                    else
                    {
                        client.picture = null;
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        client.weight = rdr.GetInt32(7);
                    }
                    else
                    {
                        client.weight = 0;
                    }
                    if (!rdr.IsDBNull(8))
                    {
                        client.skin_color = rdr.GetString(8);
                    }
                    else
                    {
                        client.skin_color = " ";
                    }
                    if (!rdr.IsDBNull(9))
                    {
                        client.Info_Field = rdr.GetString(9);
                    }
                    else
                    {
                        client.Info_Field = " ";
                    }
                    if (!rdr.IsDBNull(10))
                    {
                        client.Client_Shelter_ID = rdr.GetInt32(10);
                    }
                    else
                    {
                        client.Client_Shelter_ID = 0;
                    }
                    if (!rdr.IsDBNull(11))
                    {
                        client.Emergency_Contact_Name = rdr.GetString(11);
                    }
                    else
                    {
                        client.Emergency_Contact_Name = " ";
                    }
                    if (!rdr.IsDBNull(12))
                    {
                        client.Emergency_Contact_Number = rdr.GetString(12);
                    }
                    else
                    {
                        client.Emergency_Contact_Number = " ";
                    }
                    if (!rdr.IsDBNull(13))
                    {
                        client.Subscribed_Alerts = rdr.GetString(13);
                    }
                    else
                    {
                        client.Subscribed_Alerts = " ";
                    }
                    }
                    else
                    {
                    client.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                client.SetColumnDefaults();
                return client;
                }
            finally
            {
                con.Close();
            }
            return client;
        }

        public client Insert(client id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_CLIENT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@client_id", id.client_id);
                cmd.Parameters.AddWithValue("@client_status", id.client_status);
                cmd.Parameters.AddWithValue("@ethnicity", id.ethnicity);
                cmd.Parameters.AddWithValue("@eye_color", id.eye_color);
                cmd.Parameters.AddWithValue("@hair_color", id.hair_color);
                cmd.Parameters.AddWithValue("@height", id.height);
                cmd.Parameters.AddWithValue("@picture", id.picture);
                cmd.Parameters.AddWithValue("@weight", id.weight);
                cmd.Parameters.AddWithValue("@skin_color", id.skin_color);
                cmd.Parameters.AddWithValue("@Info_Field", id.Info_Field);
                cmd.Parameters.AddWithValue("@Client_Shelter_ID", id.Client_Shelter_ID);
                cmd.Parameters.AddWithValue("@Emergency_Contact_Name", id.Emergency_Contact_Name);
                cmd.Parameters.AddWithValue("@Emergency_Contact_Number", id.Emergency_Contact_Number);
                cmd.Parameters.AddWithValue("@Subscribed_Alerts", id.Subscribed_Alerts);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_CLIENT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@client_status", id.client_status);
                cmd.Parameters.AddWithValue("@ethnicity", id.ethnicity);
                cmd.Parameters.AddWithValue("@eye_color", id.eye_color);
                cmd.Parameters.AddWithValue("@hair_color", id.hair_color);
                cmd.Parameters.AddWithValue("@height", id.height);
                cmd.Parameters.AddWithValue("@picture", id.picture);
                cmd.Parameters.AddWithValue("@weight", id.weight);
                cmd.Parameters.AddWithValue("@skin_color", id.skin_color);
                cmd.Parameters.AddWithValue("@Info_Field", id.Info_Field);
                cmd.Parameters.AddWithValue("@Client_Shelter_ID", id.Client_Shelter_ID);
                cmd.Parameters.AddWithValue("@Emergency_Contact_Name", id.Emergency_Contact_Name);
                cmd.Parameters.AddWithValue("@Emergency_Contact_Number", id.Emergency_Contact_Number);
                cmd.Parameters.AddWithValue("@Subscribed_Alerts", id.Subscribed_Alerts);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.client_id = rdr.GetInt32(0);
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
        public Boolean Update(client id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_CLIENT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@client_id", id.client_id);
                cmd.Parameters.AddWithValue("@client_status", id.client_status);
                cmd.Parameters.AddWithValue("@ethnicity", id.ethnicity);
                cmd.Parameters.AddWithValue("@eye_color", id.eye_color);
                cmd.Parameters.AddWithValue("@hair_color", id.hair_color);
                cmd.Parameters.AddWithValue("@height", id.height);
                if (id.picture == null)
                {
                    Size size = new Size(100, 100);
                    System.Drawing.Image image = System.Drawing.Image.FromFile(Server.MapPath("~/Content/images/placeholders/petPlaceHolder.png"));
                    Web.App.ShowImage.resizeImage(image, size);
                    byte[] uploaded_picture = Web.App.ShowImage.imageToByteArray(image);
                    id.picture = uploaded_picture;
                }
                cmd.Parameters.AddWithValue("@picture", id.picture);
                cmd.Parameters.AddWithValue("@weight", id.weight);
                cmd.Parameters.AddWithValue("@skin_color", id.skin_color);
                cmd.Parameters.AddWithValue("@Info_Field", id.Info_Field);
                cmd.Parameters.AddWithValue("@Client_Shelter_ID", id.Client_Shelter_ID);
                cmd.Parameters.AddWithValue("@Emergency_Contact_Name", id.Emergency_Contact_Name);
                cmd.Parameters.AddWithValue("@Emergency_Contact_Number", id.Emergency_Contact_Number);
                cmd.Parameters.AddWithValue("@Subscribed_Alerts", id.Subscribed_Alerts);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_CLIENT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@client_id", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_CLIENT_WC", con);
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




