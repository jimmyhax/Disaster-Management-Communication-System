using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DMCS.Moduals.Client__Case_Reports
{
    public partial class Client_Case_Reports : System.Web.UI.Page
    {
        public client client = new client();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //gridview and search
        protected void clientSearch_btn_Click(object sender, EventArgs e)
        {
            try
            {

                String whereclause = "";

                if (firstName_txt.Text != "")
                {
                    whereclause += "AND f_name LIKE '%" + firstName_txt.Text.Replace("'", "''") + "%'";
                }
                else if (lastName_txt.Text != "")
                {
                    whereclause += "AND l_name LIKE '%" + lastName_txt.Text.Replace("'", "''") + "%'";
                }
                else if (dateOfBirth_txt.Text != "")
                {
                    whereclause += "AND birthdate = '" + dateOfBirth_txt.Text.Replace("'", "''") + "'";
                }
                else if (address_txt.Text != "")
                {
                    whereclause += "AND str_add LIKE '%" + address_txt.Text.Replace("'", "''") + "%'";
                }
                else { lbl_Client_Error.Text = "At least one text box needs to be filled to search."; }


                gvClientSearchresult.DataSource = client.Search_Client(whereclause);
                gvClientSearchresult.DataBind();
            }
            catch (Exception ex)
            {
                lbl_Client_Error.Text = "Error looking for Client";
            }
        }
        protected void RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Find the value in the c04_oprogrs column. You'll have to use

                string client_status = e.Row.Cells[4].Text;
                string Gender = e.Row.Cells[5].Text;
                //string DOB = e.Row.Cells[7].Text;

                if (client_status == "M")
                {
                    e.Row.Cells[4].Text = "Missing";
                }
                else if (client_status == "D")
                {
                    e.Row.Cells[4].Text = "Deceased";
                }
                if (Gender == "M")
                {
                    e.Row.Cells[5].Text = "Male";
                }
                else if (Gender == "F")
                {
                    e.Row.Cells[5].Text = "Female";
                }

                e.Row.Cells[7].Text = DateTime.Parse(e.Row.Cells[7].Text).ToShortDateString(); 

            }
        }
        protected void gvClientSearchresult_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}