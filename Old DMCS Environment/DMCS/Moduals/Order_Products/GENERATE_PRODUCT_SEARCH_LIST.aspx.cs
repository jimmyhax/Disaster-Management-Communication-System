using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DMCS.App_Code;
using System.Data;
using System.IO;

namespace DMCS.Moduals.Order_Products
{
    public partial class GENERATE_PRODUCT_SEARCH_LIST : System.Web.UI.Page
    {
        xml_datasource_generator xml_datasource_generator = new xml_datasource_generator();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void update_datasource_Click(object sender, EventArgs e)
        {
            //place xml data in this string to be written to file
            GENERATE_PRODUCT_XML();

        }
        protected string GENERATE_PRODUCT_XML()
        {
            //START FEMA PRODUCTS
            ////////////////////////////////////////////////////////
            string constructor_string = "";

            //grab data
            DataTable dt = xml_datasource_generator.SelectFemaProduct();
            //construct xml text
            constructor_string += "<?xml version=\"1.0\" encoding=\"utf-8\" ?>" + Environment.NewLine;
            constructor_string += "<products>" + Environment.NewLine;
            for (int i = 0; dt.Rows.Count > i; i++)
            {
                string product = dt.Rows[i]["product_name"].ToString();
                string product_id = dt.Rows[i]["product_id"].ToString();
                constructor_string += "  <product label=\"" + product + "\" value=\"" + product_id + "\" />" + Environment.NewLine;
            }


            //START GENERAL PRODUCTS
            ////////////////////////////////////////////////////////
            //grab data
            dt = xml_datasource_generator.SelectProduct();
            //construct xml text
            for (int i = 0; dt.Rows.Count > i; i++)
            {
                string product = dt.Rows[i]["product_name"].ToString();
                string product_id = dt.Rows[i]["product_id"].ToString();
                constructor_string += "  <product label=\"" + product + "\" value=\"" + product_id + "\" />" + Environment.NewLine;
            }
            constructor_string += "</products>" + Environment.NewLine;

            if (File.Exists(Server.MapPath("~/Content/Search_List_Datasource/search_product_results.xml")))
            {
                File.Delete(Server.MapPath("~/Content/Search_List_Datasource/search_product_results.xml"));
            }

            try
            {
                File.AppendAllText(Server.MapPath("~/Content/Search_List_Datasource/search_product_results.xml"), constructor_string + Environment.NewLine);
            }
            catch
            { }

            return constructor_string;
        }
        public static string FirstCharToUpper(string input)
        {
            if (String.IsNullOrEmpty(input))
                throw new ArgumentException("ARGH!");
            input = input.ToLower();
            return input.First().ToString().ToUpper() + input.Substring(1);
        }


    }
}