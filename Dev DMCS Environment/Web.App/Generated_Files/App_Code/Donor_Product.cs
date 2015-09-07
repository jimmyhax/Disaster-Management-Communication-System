using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
namespace Web.App
{
    public class Donor_Product : System.Web.UI.Page
    {
        public Int32 DonorProductID
        {
            get;
            set;
        }
        public Int32 DonorID
        {
            get;
            set;
        }
        public Int32 ProductID
        {
            get;
            set;
        }
        public Int32 quantity
        {
            get;
            set;
        }
        public String other_info
        {
            get;
            set;
        }
        public DateTime Product_rec_date
        {
            get;
            set;
        }
        public String AmountOfProdDonated
        {
            get;
            set;
        }

        public void SetColumnDefaults()
        {
            DonorProductID = 0;
            DonorID = 0;
            ProductID = 0;
            quantity = 0;
            other_info = "";
            Product_rec_date = DateTime.Now;
            AmountOfProdDonated = "";
        }
        public Donor_Product Select(int id)
        {
            Donor_Product Donor_Product = new Donor_Product();
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DONOR_PRODUCT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DonorProductID", id);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    if (!rdr.IsDBNull(0))
                    {
                        Donor_Product.DonorProductID = rdr.GetInt32(0);
                    }
                    else
                    {
                        Donor_Product.DonorProductID = 0;
                    }
                    if (!rdr.IsDBNull(1))
                    {
                        Donor_Product.DonorID = rdr.GetInt32(1);
                    }
                    else
                    {
                        Donor_Product.DonorID = 0;
                    }
                    if (!rdr.IsDBNull(2))
                    {
                        Donor_Product.ProductID = rdr.GetInt32(2);
                    }
                    else
                    {
                        Donor_Product.ProductID = 0;
                    }
                    if (!rdr.IsDBNull(3))
                    {
                        Donor_Product.quantity = rdr.GetInt32(3);
                    }
                    else
                    {
                        Donor_Product.quantity = 0;
                    }
                    if (!rdr.IsDBNull(4))
                    {
                        Donor_Product.other_info = rdr.GetString(4);
                    }
                    else
                    {
                        Donor_Product.other_info = " ";
                    }
                    if (!rdr.IsDBNull(5))
                    {
                        Donor_Product.Product_rec_date = rdr.GetDateTime(5);
                    }
                    else
                    {
                        Donor_Product.Product_rec_date = DateTime.Now;
                    }
                    if (!rdr.IsDBNull(6))
                    {
                        Donor_Product.AmountOfProdDonated = rdr.GetString(6);
                    }
                    else
                    {
                        Donor_Product.AmountOfProdDonated = " ";
                    }
                    }
                    else
                    {
                    Donor_Product.SetColumnDefaults();
                    }
                }
                catch (Exception ex)
                {
                Donor_Product.SetColumnDefaults();
                return Donor_Product;
                }
            finally
            {
                con.Close();
            }
            return Donor_Product;
        }

        public Donor_Product Insert(Donor_Product id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_INSERT_DONOR_PRODUCT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DonorID", id.DonorID);
                cmd.Parameters.AddWithValue("@ProductID", id.ProductID);
                cmd.Parameters.AddWithValue("@quantity", id.quantity);
                cmd.Parameters.AddWithValue("@other_info", id.other_info);
                cmd.Parameters.AddWithValue("@Product_rec_date", id.Product_rec_date);
                cmd.Parameters.AddWithValue("@AmountOfProdDonated", id.AmountOfProdDonated);
                cmd.ExecuteReader();
                con.Close();
                con.Open();
                cmd = new SqlCommand("SP_DMCS_GET_DONOR_PRODUCT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DonorID", id.DonorID);
                cmd.Parameters.AddWithValue("@ProductID", id.ProductID);
                cmd.Parameters.AddWithValue("@quantity", id.quantity);
                cmd.Parameters.AddWithValue("@other_info", id.other_info);
                cmd.Parameters.AddWithValue("@Product_rec_date", id.Product_rec_date);
                cmd.Parameters.AddWithValue("@AmountOfProdDonated", id.AmountOfProdDonated);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    id.DonorProductID = rdr.GetInt32(0);
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
        public Boolean Update(Donor_Product id)
        {
            string ConnectionString = IDManager.connection();
            SqlConnection con = new SqlConnection(ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DMCS_UPDATE_DONOR_PRODUCT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DonorProductID", id.DonorProductID);
                cmd.Parameters.AddWithValue("@DonorID", id.DonorID);
                cmd.Parameters.AddWithValue("@ProductID", id.ProductID);
                cmd.Parameters.AddWithValue("@quantity", id.quantity);
                cmd.Parameters.AddWithValue("@other_info", id.other_info);
                cmd.Parameters.AddWithValue("@Product_rec_date", id.Product_rec_date);
                cmd.Parameters.AddWithValue("@AmountOfProdDonated", id.AmountOfProdDonated);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_DELETE_DONOR_PRODUCT", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DonorProductID", id);
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
                SqlCommand cmd = new SqlCommand("SP_DMCS_SELECT_DONOR_PRODUCT_WC", con);
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




