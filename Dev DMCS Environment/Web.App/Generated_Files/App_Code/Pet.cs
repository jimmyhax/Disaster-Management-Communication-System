using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
namespace Web.App
{
    public class Pet
    {
        public Int32 Pet_Record_ID
        {
            get;
            set;
        }
        public Int32 Pet_Location_Found_ID
        {
            get;
            set;
        }
        public Int32 Pet_Type_ID
        {
            get;
            set;
        }
        public String Pet_Vet_ID
        {
            get;
            set;
        }
        public String Pet_License_Tag
        {
            get;
            set;
        }
        public String Pet_RFID
        {
            get;
            set;
        }
        public String Pet_Tatoo_No
        {
            get;
            set;
        }
        public String Pet_Name
        {
            get;
            set;
        }
        public String Pet_Gender
        {
            get;
            set;
        }
        public String Pet_Color
        {
            get;
            set;
        }
        public Int32 Pet_Weight
        {
            get;
            set;
        }
        public String Pet_Description
        {
            get;
            set;
        }
        public String Pet_Condition
        {
            get;
            set;
        }
        public String Pet_Status
        {
            get;
            set;
        }
        public DateTime Pet_Date_Of_Birth
        {
            get;
            set;
        }
        public byte[] Pet_Picture
        {
            get;
            set;
        }
        public String Pet_Sterilized
        {
            get;
            set;
        }
        public DateTime Date_Modified
        {
            get;
            set;
        }
        public DateTime Date_Created
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            Pet_Record_ID = 0;
            Pet_Location_Found_ID = 0;
            Pet_Type_ID = 0;
            Pet_Vet_ID = "";
            Pet_License_Tag = "";
            Pet_RFID = "";
            Pet_Tatoo_No = "";
            Pet_Name = "";
            Pet_Gender = "";
            Pet_Color = "";
            Pet_Weight = 0;
            Pet_Description = "";
            Pet_Condition = "";
            Pet_Status = "";
            Pet_Date_Of_Birth = DateTime.Now;
            Pet_Picture = null;
            Pet_Sterilized = "";
            Date_Modified = DateTime.Now;
            Date_Created = DateTime.Now;
        }
        public Pet Select(int id)
        {
            Pet Pet = new Pet();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PET", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Pet_Record_ID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        Pet.Pet_Record_ID = rdr.GetInt32(0);
                    }
                    else
                    {
                        Pet.Pet_Record_ID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        Pet.Pet_Location_Found_ID = rdr.GetInt32(1);
                    }
                    else
                    {
                        Pet.Pet_Location_Found_ID = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        Pet.Pet_Type_ID = rdr.GetInt32(2);
                    }
                    else
                    {
                        Pet.Pet_Type_ID = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        Pet.Pet_Vet_ID = rdr.GetString(3);
                    }
                    else
                    {
                        Pet.Pet_Vet_ID = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        Pet.Pet_License_Tag = rdr.GetString(4);
                    }
                    else
                    {
                        Pet.Pet_License_Tag = " ";
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        Pet.Pet_RFID = rdr.GetString(5);
                    }
                    else
                    {
                        Pet.Pet_RFID = " ";
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        Pet.Pet_Tatoo_No = rdr.GetString(6);
                    }
                    else
                    {
                        Pet.Pet_Tatoo_No = " ";
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        Pet.Pet_Name = rdr.GetString(7);
                    }
                    else
                    {
                        Pet.Pet_Name = " ";
                    }
                    if (!rdr.IsDBNull(8))
                    {
                        Pet.Pet_Gender = rdr.GetString(8);
                    }
                    else
                    {
                        Pet.Pet_Gender = " ";
                    }
                    if (!rdr.IsDBNull(9))
                    {
                        Pet.Pet_Color = rdr.GetString(9);
                    }
                    else
                    {
                        Pet.Pet_Color = " ";
                    }
                    if (!rdr.IsDBNull(10))
                    {
                        Pet.Pet_Weight = rdr.GetInt32(10);
                    }
                    else
                    {
                        Pet.Pet_Weight = 0;
                    }
                    if (!rdr.IsDBNull(11))
                    {
                        Pet.Pet_Description = rdr.GetString(11);
                    }
                    else
                    {
                        Pet.Pet_Description = " ";
                    }
                    if (!rdr.IsDBNull(12))
                    {
                        Pet.Pet_Condition = rdr.GetString(12);
                    }
                    else
                    {
                        Pet.Pet_Condition = " ";
                    }
                    if (!rdr.IsDBNull(13))
                    {
                        Pet.Pet_Status = rdr.GetString(13);
                    }
                    else
                    {
                        Pet.Pet_Status = " ";
                    }
                    if (!rdr.IsDBNull(14))
                    {
                        Pet.Pet_Date_Of_Birth = rdr.GetDateTime(14);
                    }
                    else
                    {
                        Pet.Pet_Date_Of_Birth = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(15))
                    {
                        Pet.Pet_Picture = (byte[])rdr["Pet_Picture"];
                    }
                    else
                    {
                        Pet.Pet_Picture = null;
                    }
                    if (!rdr.IsDBNull(16))
                    {
                        Pet.Pet_Sterilized = rdr.GetString(16);
                    }
                    else
                    {
                        Pet.Pet_Sterilized = " ";
                    }
                    if (!rdr.IsDBNull(17))
                    {
                        Pet.Date_Modified = rdr.GetDateTime(17);
                    }
                    else
                    {
                        Pet.Date_Modified = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(18))
                    {
                        Pet.Date_Created = rdr.GetDateTime(18);
                    }
                    else
                    {
                        Pet.Date_Created = DateTime.Now;
                    }
                    }
                    else
                    {
                    Pet.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                Pet.SetColumnDefaults();
                return Pet;
                }
            finally
            {
                con.Close();
            }
            return Pet;
        }

        public Pet Insert(Pet id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_PET", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Pet_Location_Found_ID", id.Pet_Location_Found_ID);
            cmd.Parameters.AddWithValue("@Pet_Type_ID", id.Pet_Type_ID);
            cmd.Parameters.AddWithValue("@Pet_Vet_ID", id.Pet_Vet_ID);
            cmd.Parameters.AddWithValue("@Pet_License_Tag", id.Pet_License_Tag);
            cmd.Parameters.AddWithValue("@Pet_RFID", id.Pet_RFID);
            cmd.Parameters.AddWithValue("@Pet_Tatoo_No", id.Pet_Tatoo_No);
            cmd.Parameters.AddWithValue("@Pet_Name", id.Pet_Name);
            cmd.Parameters.AddWithValue("@Pet_Gender", id.Pet_Gender);
            cmd.Parameters.AddWithValue("@Pet_Color", id.Pet_Color);
            cmd.Parameters.AddWithValue("@Pet_Weight", id.Pet_Weight);
            cmd.Parameters.AddWithValue("@Pet_Description", id.Pet_Description);
            cmd.Parameters.AddWithValue("@Pet_Condition", id.Pet_Condition);
            cmd.Parameters.AddWithValue("@Pet_Status", id.Pet_Status);
            cmd.Parameters.AddWithValue("@Pet_Date_Of_Birth", id.Pet_Date_Of_Birth);
            if (id.Pet_Picture == null)
            {
                Size size = new Size(100, 100);
                System.Drawing.Image image = System.Drawing.Image.FromFile(Server.MapPath("~/Content/images/placeholders/petPlaceHolder.png"));
                Web.App.ShowImage.resizeImage(image, size);
                byte[] uploaded_picture = Web.App.ShowImage.imageToByteArray(image);
                id.Pet_Picture = uploaded_picture;
            }
                cmd.Parameters.AddWithValue("@Pet_Picture", id.Pet_Picture);
            cmd.Parameters.AddWithValue("@Pet_Sterilized", id.Pet_Sterilized);
            cmd.Parameters.AddWithValue("@Date_Modified", id.Date_Modified);
            cmd.Parameters.AddWithValue("@Date_Created", id.Date_Created);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_PET", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Pet_Location_Found_ID", id.Pet_Location_Found_ID);
                cmd.Parameters.AddWithValue("@Pet_Type_ID", id.Pet_Type_ID);
                cmd.Parameters.AddWithValue("@Pet_Vet_ID", id.Pet_Vet_ID);
                cmd.Parameters.AddWithValue("@Pet_License_Tag", id.Pet_License_Tag);
                cmd.Parameters.AddWithValue("@Pet_RFID", id.Pet_RFID);
                cmd.Parameters.AddWithValue("@Pet_Tatoo_No", id.Pet_Tatoo_No);
                cmd.Parameters.AddWithValue("@Pet_Name", id.Pet_Name);
                cmd.Parameters.AddWithValue("@Pet_Gender", id.Pet_Gender);
                cmd.Parameters.AddWithValue("@Pet_Color", id.Pet_Color);
                cmd.Parameters.AddWithValue("@Pet_Weight", id.Pet_Weight);
                cmd.Parameters.AddWithValue("@Pet_Description", id.Pet_Description);
                cmd.Parameters.AddWithValue("@Pet_Condition", id.Pet_Condition);
                cmd.Parameters.AddWithValue("@Pet_Status", id.Pet_Status);
                cmd.Parameters.AddWithValue("@Pet_Date_Of_Birth", id.Pet_Date_Of_Birth);
                cmd.Parameters.AddWithValue("@Pet_Picture", id.Pet_Picture);
                cmd.Parameters.AddWithValue("@Pet_Sterilized", id.Pet_Sterilized);
                cmd.Parameters.AddWithValue("@Date_Modified", id.Date_Modified);
                cmd.Parameters.AddWithValue("@Date_Created", id.Date_Created);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.Pet_Record_ID = rdr.GetInt32(0);
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
        public Boolean Update(Pet id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_PET", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Pet_Record_ID", id.Pet_Record_ID);
            cmd.Parameters.AddWithValue("@Pet_Location_Found_ID", id.Pet_Location_Found_ID);
            cmd.Parameters.AddWithValue("@Pet_Type_ID", id.Pet_Type_ID);
            cmd.Parameters.AddWithValue("@Pet_Vet_ID", id.Pet_Vet_ID);
            cmd.Parameters.AddWithValue("@Pet_License_Tag", id.Pet_License_Tag);
            cmd.Parameters.AddWithValue("@Pet_RFID", id.Pet_RFID);
            cmd.Parameters.AddWithValue("@Pet_Tatoo_No", id.Pet_Tatoo_No);
            cmd.Parameters.AddWithValue("@Pet_Name", id.Pet_Name);
            cmd.Parameters.AddWithValue("@Pet_Gender", id.Pet_Gender);
            cmd.Parameters.AddWithValue("@Pet_Color", id.Pet_Color);
            cmd.Parameters.AddWithValue("@Pet_Weight", id.Pet_Weight);
            cmd.Parameters.AddWithValue("@Pet_Description", id.Pet_Description);
            cmd.Parameters.AddWithValue("@Pet_Condition", id.Pet_Condition);
            cmd.Parameters.AddWithValue("@Pet_Status", id.Pet_Status);
            cmd.Parameters.AddWithValue("@Pet_Date_Of_Birth", id.Pet_Date_Of_Birth);
            if (id.Pet_Picture == null)
            {
                Size size = new Size(100, 100);
                System.Drawing.Image image = System.Drawing.Image.FromFile(Server.MapPath("~/Content/images/placeholders/petPlaceHolder.png"));
                Web.App.ShowImage.resizeImage(image, size);
                byte[] uploaded_picture = Web.App.ShowImage.imageToByteArray(image);
                id.Pet_Picture = uploaded_picture;
            }
                cmd.Parameters.AddWithValue("@Pet_Picture", id.Pet_Picture);
            cmd.Parameters.AddWithValue("@Pet_Sterilized", id.Pet_Sterilized);
            cmd.Parameters.AddWithValue("@Date_Modified", id.Date_Modified);
            cmd.Parameters.AddWithValue("@Date_Created", id.Date_Created);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_PET", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Pet_Record_ID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PET_WC", con);
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




