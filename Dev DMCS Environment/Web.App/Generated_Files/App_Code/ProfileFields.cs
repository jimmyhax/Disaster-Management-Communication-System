using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class ProfileFields : System.Web.UI.Page
    {
        public Int32 FieldID
        {
            get;
            set;
        }
        public Int32 FieldTypeID
        {
            get;
            set;
        }
        public String FieldName
        {
            get;
            set;
        }
        public No Type Comment
        {
            get;
            set;
        }
        public No Type PossibleValues
        {
            get;
            set;
        }
        public String TextSelectValue
        {
            get;
            set;
        }
        public Int32 IsMandatory
        {
            get;
            set;
        }
        public Int32 ShowInSignUp
        {
            get;
            set;
        }
        public Int32 FieldGroupID
        {
            get;
            set;
        }
        public Int32 OrderID
        {
            get;
            set;
        }
        public DateTime Created
        {
            get;
            set;
        }
        public DateTime Modified
        {
            get;
            set;
        }
        public Int32 SortValues
        {
            get;
            set;
        }
        public Int32 IsActive
        {
            get;
            set;
        }
        public Int32 AdminUseOnly
        {
            get;
            set;
        }
        public Int32 VerticalLayout
        {
            get;
            set;
        }
        public Int32 Encrypted
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            FieldID = 0;
            FieldTypeID = 0;
            FieldName = "";
            Comment = ;
            PossibleValues = ;
            TextSelectValue = "";
            IsMandatory = 0;
            ShowInSignUp = 0;
            FieldGroupID = 0;
            OrderID = 0;
            Created = DateTime.Now;
            Modified = DateTime.Now;
            SortValues = 0;
            IsActive = 0;
            AdminUseOnly = 0;
            VerticalLayout = 0;
            Encrypted = 0;
        }
        public ProfileFields Select(int id)
        {
            ProfileFields ProfileFields = new ProfileFields();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PROFILEFIELDS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FieldID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        ProfileFields.FieldID = rdr.GetInt32(0);
                    }
                    else
                    {
                        ProfileFields.FieldID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        ProfileFields.FieldTypeID = rdr.GetInt32(1);
                    }
                    else
                    {
                        ProfileFields.FieldTypeID = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        ProfileFields.FieldName = rdr.GetString(2);
                    }
                    else
                    {
                        ProfileFields.FieldName = " ";
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        ProfileFields.Comment = 
                    }
                    else
                    {
                        ProfileFields.Comment = ;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        ProfileFields.PossibleValues = 
                    }
                    else
                    {
                        ProfileFields.PossibleValues = ;
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        ProfileFields.TextSelectValue = rdr.GetString(5);
                    }
                    else
                    {
                        ProfileFields.TextSelectValue = " ";
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        ProfileFields.IsMandatory = rdr.GetInt32(6);
                    }
                    else
                    {
                        ProfileFields.IsMandatory = 0;
                    }
                    if (!rdr.IsDBNull(7))
                    {
                        ProfileFields.ShowInSignUp = rdr.GetInt32(7);
                    }
                    else
                    {
                        ProfileFields.ShowInSignUp = 0;
                    }
                    if (!rdr.IsDBNull(8))
                    {
                        ProfileFields.FieldGroupID = rdr.GetInt32(8);
                    }
                    else
                    {
                        ProfileFields.FieldGroupID = 0;
                    }
                    if (!rdr.IsDBNull(9))
                    {
                        ProfileFields.OrderID = rdr.GetInt32(9);
                    }
                    else
                    {
                        ProfileFields.OrderID = 0;
                    }
                    if (!rdr.IsDBNull(10))
                    {
                        ProfileFields.Created = rdr.GetDateTime(10);
                    }
                    else
                    {
                        ProfileFields.Created = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(11))
                    {
                        ProfileFields.Modified = rdr.GetDateTime(11);
                    }
                    else
                    {
                        ProfileFields.Modified = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(12))
                    {
                        ProfileFields.SortValues = rdr.GetInt32(12);
                    }
                    else
                    {
                        ProfileFields.SortValues = 0;
                    }
                    if (!rdr.IsDBNull(13))
                    {
                        ProfileFields.IsActive = rdr.GetInt32(13);
                    }
                    else
                    {
                        ProfileFields.IsActive = 0;
                    }
                    if (!rdr.IsDBNull(14))
                    {
                        ProfileFields.AdminUseOnly = rdr.GetInt32(14);
                    }
                    else
                    {
                        ProfileFields.AdminUseOnly = 0;
                    }
                    if (!rdr.IsDBNull(15))
                    {
                        ProfileFields.VerticalLayout = rdr.GetInt32(15);
                    }
                    else
                    {
                        ProfileFields.VerticalLayout = 0;
                    }
                    if (!rdr.IsDBNull(16))
                    {
                        ProfileFields.Encrypted = rdr.GetInt32(16);
                    }
                    else
                    {
                        ProfileFields.Encrypted = 0;
                    }
                    }
                    else
                    {
                    ProfileFields.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                ProfileFields.SetColumnDefaults();
                return ProfileFields;
                }
            finally
            {
                con.Close();
            }
            return ProfileFields;
        }

        public ProfileFields Insert(ProfileFields id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_PROFILEFIELDS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FieldTypeID", id.FieldTypeID);
                cmd.Parameters.AddWithValue("@FieldName", id.FieldName);
                cmd.Parameters.AddWithValue("@Comment", id.Comment);
                cmd.Parameters.AddWithValue("@PossibleValues", id.PossibleValues);
                cmd.Parameters.AddWithValue("@TextSelectValue", id.TextSelectValue);
                cmd.Parameters.AddWithValue("@IsMandatory", id.IsMandatory);
                cmd.Parameters.AddWithValue("@ShowInSignUp", id.ShowInSignUp);
                cmd.Parameters.AddWithValue("@FieldGroupID", id.FieldGroupID);
                cmd.Parameters.AddWithValue("@OrderID", id.OrderID);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
                cmd.Parameters.AddWithValue("@SortValues", id.SortValues);
                cmd.Parameters.AddWithValue("@IsActive", id.IsActive);
                cmd.Parameters.AddWithValue("@AdminUseOnly", id.AdminUseOnly);
                cmd.Parameters.AddWithValue("@VerticalLayout", id.VerticalLayout);
                cmd.Parameters.AddWithValue("@Encrypted", id.Encrypted);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_PROFILEFIELDS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FieldTypeID", id.FieldTypeID);
                cmd.Parameters.AddWithValue("@FieldName", id.FieldName);
                cmd.Parameters.AddWithValue("@Comment", id.Comment);
                cmd.Parameters.AddWithValue("@PossibleValues", id.PossibleValues);
                cmd.Parameters.AddWithValue("@TextSelectValue", id.TextSelectValue);
                cmd.Parameters.AddWithValue("@IsMandatory", id.IsMandatory);
                cmd.Parameters.AddWithValue("@ShowInSignUp", id.ShowInSignUp);
                cmd.Parameters.AddWithValue("@FieldGroupID", id.FieldGroupID);
                cmd.Parameters.AddWithValue("@OrderID", id.OrderID);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
                cmd.Parameters.AddWithValue("@SortValues", id.SortValues);
                cmd.Parameters.AddWithValue("@IsActive", id.IsActive);
                cmd.Parameters.AddWithValue("@AdminUseOnly", id.AdminUseOnly);
                cmd.Parameters.AddWithValue("@VerticalLayout", id.VerticalLayout);
                cmd.Parameters.AddWithValue("@Encrypted", id.Encrypted);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.FieldID = rdr.GetInt32(0);
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
        public Boolean Update(ProfileFields id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_PROFILEFIELDS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FieldID", id.FieldID);
                cmd.Parameters.AddWithValue("@FieldTypeID", id.FieldTypeID);
                cmd.Parameters.AddWithValue("@FieldName", id.FieldName);
                cmd.Parameters.AddWithValue("@Comment", id.Comment);
                cmd.Parameters.AddWithValue("@PossibleValues", id.PossibleValues);
                cmd.Parameters.AddWithValue("@TextSelectValue", id.TextSelectValue);
                cmd.Parameters.AddWithValue("@IsMandatory", id.IsMandatory);
                cmd.Parameters.AddWithValue("@ShowInSignUp", id.ShowInSignUp);
                cmd.Parameters.AddWithValue("@FieldGroupID", id.FieldGroupID);
                cmd.Parameters.AddWithValue("@OrderID", id.OrderID);
                cmd.Parameters.AddWithValue("@Created", id.Created);
                cmd.Parameters.AddWithValue("@Modified", id.Modified);
                cmd.Parameters.AddWithValue("@SortValues", id.SortValues);
                cmd.Parameters.AddWithValue("@IsActive", id.IsActive);
                cmd.Parameters.AddWithValue("@AdminUseOnly", id.AdminUseOnly);
                cmd.Parameters.AddWithValue("@VerticalLayout", id.VerticalLayout);
                cmd.Parameters.AddWithValue("@Encrypted", id.Encrypted);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_PROFILEFIELDS", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FieldID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_PROFILEFIELDS_WC", con);
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




