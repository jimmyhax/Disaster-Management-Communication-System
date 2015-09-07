using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class Languages : System.Web.UI.Page
    {
        public Int32 LanguageID
        {
            get;
            set;
        }
        public String Code
        {
            get;
            set;
        }
        public String EnglishName
        {
            get;
            set;
        }
        public String NativeName
        {
            get;
            set;
        }
        public Int32 IsEnabled
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            LanguageID = 0;
            Code = "";
            EnglishName = "";
            NativeName = "";
            IsEnabled = 0;
        }
        public Languages Select(int id)
        {
            Languages Languages = new Languages();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_LANGUAGES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@LanguageID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        Languages.LanguageID = rdr.GetInt32(0);
                    }
                    else
                    {
                        Languages.LanguageID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        Languages.Code = rdr.GetString(1);
                    }
                    else
                    {
                        Languages.Code = " ";
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        Languages.EnglishName = rdr.GetString(2);
                    }
                    else
                    {
                        Languages.EnglishName = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        Languages.NativeName = rdr.GetString(3);
                    }
                    else
                    {
                        Languages.NativeName = " ";
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        Languages.IsEnabled = rdr.GetInt32(4);
                    }
                    else
                    {
                        Languages.IsEnabled = 0;
                    }
                    }
                    else
                    {
                    Languages.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                Languages.SetColumnDefaults();
                return Languages;
                }
            finally
            {
                con.Close();
            }
            return Languages;
        }

        public Languages Insert(Languages id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_LANGUAGES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@LanguageID", id.LanguageID);
                cmd.Parameters.AddWithValue("@Code", id.Code);
                cmd.Parameters.AddWithValue("@EnglishName", id.EnglishName);
                cmd.Parameters.AddWithValue("@NativeName", id.NativeName);
                cmd.Parameters.AddWithValue("@IsEnabled", id.IsEnabled);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_LANGUAGES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Code", id.Code);
                cmd.Parameters.AddWithValue("@EnglishName", id.EnglishName);
                cmd.Parameters.AddWithValue("@NativeName", id.NativeName);
                cmd.Parameters.AddWithValue("@IsEnabled", id.IsEnabled);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.LanguageID = rdr.GetInt32(0);
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
        public Boolean Update(Languages id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_LANGUAGES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@LanguageID", id.LanguageID);
                cmd.Parameters.AddWithValue("@Code", id.Code);
                cmd.Parameters.AddWithValue("@EnglishName", id.EnglishName);
                cmd.Parameters.AddWithValue("@NativeName", id.NativeName);
                cmd.Parameters.AddWithValue("@IsEnabled", id.IsEnabled);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_LANGUAGES", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@LanguageID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_LANGUAGES_WC", con);
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




