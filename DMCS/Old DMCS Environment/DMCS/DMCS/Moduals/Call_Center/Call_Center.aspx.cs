using System;
using System.Collections;
using System.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using DMCS.App_Code;

namespace DMCS.Moduals.Call_Center
{
    public partial class Call_Center : System.Web.UI.Page
    {

        public address clientAddress = new address();
        public address clientAddress2 = new address();
        public address clientEmplrAddress = new address();
        public case_client clientcase = new case_client();
        public military clientMilitary = new military();
        public client client = new client();
        public person clientperson = new person();
        public debt clientdebt = new debt();
        public expense clientexpense = new expense();
        public income_source clientincome = new income_source();
        public vehicle clientvehicle = new vehicle();
        public case_intake clientCase_intake = new case_intake();
        public disaster casedisaster = new disaster();
        public disaster_encounter disasterEncounter = new disaster_encounter();
        public encounter clientencounter = new encounter();
        public Pet clientPets = new Pet();
        public employer clientemployer = new employer();
        public call_center EncCallCenter = new call_center();
        public ClientWPets CLWPets = new ClientWPets();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DDL_Call_Center.ClearSelection();

                ddlPrev_st.DataSource = GlobalVariables.GetAllStates();
                ddlPrev_st.DataBind();

                ddlCurr_st.DataSource = GlobalVariables.GetAllStates();
                ddlCurr_st.DataBind();

                ddlempr_st.DataSource = GlobalVariables.GetAllStates();
                ddlempr_st.DataBind();

            }
        }

        protected void BtnNameSearch_Click(object sender, EventArgs e)
        {

            if ((txtfirstname.Text != "") && (txtlastname.Text != ""))
            {
                refreshclient();
            }
            else
            {
                lblSearchErrormsg.Text = "You must enter a first and last name in order to search clients.";
            }
        }

        protected void gvClientSearchresult_SelectedIndexChanged(object sender, EventArgs e)
        {

            clientperson = clientperson.Select(Convert.ToInt32(gvClientSearchresult.SelectedDataKey.Value));
            GlobalVariables.PersonID = Convert.ToInt32(gvClientSearchresult.SelectedDataKey.Value);

            fill_Client_information();

            refreshcase();
        }

        protected void gvClientSearchresult_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvClientSearchresult.PageIndex = e.NewPageIndex;
            refreshclient();
        }

        protected void refreshcase()
        {
            DataTable vlcaslst = new DataTable();
            DataTable casedt = new DataTable();
            DataRow caserow = vlcaslst.NewRow();


            vlcaslst.Columns.Add("Case_id", Type.GetType("System.Int32"));
            vlcaslst.Columns.Add("applic_end_Date_time", Type.GetType("System.DateTime"));
            vlcaslst.Columns.Add("applic_Start_Date_time", Type.GetType("System.DateTime"));

            String whereclause = "Client_id = " + clientperson.person_id;
            casedt = clientcase.Select(whereclause);

            if (casedt.Rows.Count > 0)
            {
                foreach (DataRow cr in casedt.Rows)
                {

                    clientCase_intake = clientCase_intake.Select(Convert.ToInt32(cr["Case_id"]));

                    caserow.SetField(0, clientCase_intake.case_id);
                    caserow.SetField(1, clientCase_intake.applic_end_date_time);
                    caserow.SetField(2, clientCase_intake.applic_start_date_time);

                    vlcaslst.Rows.Add(caserow);

                }

                GVcases.DataSource = vlcaslst;
                GVcases.DataBind();


            }
            else
            {
                lblSearchErrormsg.Text = "No case information exists";
            }
        }

        protected void refreshclient()
        {
            try
            {

                String whereclause = "person_type='C' AND f_name LIKE '%" + txtfirstname.Text.Replace("'", "''") + "%' AND l_name LIKE '%" + txtlastname.Text.Replace("'", "''") + "%'";

                gvClientSearchresult.DataSource = clientperson.Select(whereclause);
                gvClientSearchresult.DataBind();

            }
            catch (Exception ex)
            {
                lblSearchErrormsg.Text = "Error looking for client";
            }
        }

        protected void GVcases_SelectedIndexChanged(object sender, EventArgs e)
        {
            clientCase_intake = clientCase_intake.Select(Convert.ToInt32(GVcases.SelectedDataKey.Value));
            clientcase = clientcase.Select(Convert.ToInt32(GVcases.SelectedDataKey.Value), Convert.ToInt32(GlobalVariables.PersonID));

            GlobalVariables.CaseID = clientcase.case_id;
            GlobalVariables.ClientID = clientcase.client_id;

            fill_Case_information();
            fill_pet_info();
            fill_employer_info();
            fill_Income_info();
            Fill_Expense_info();
            Fill_vehicle_info();
            fill_military_info();
            Fill_Debt_info();
            fill_Disaster_encouter();


        }

        protected void GVcases_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVcases.PageIndex = e.NewPageIndex;
            refreshcase();
        }

        protected void BtnPaymntSave_Click(object sender, EventArgs e)
        {

            DataTable dvrows = new DataTable();
            DataRow gvrow = dvrows.NewRow();

            dvrows.Columns.Add("Date_paid", Type.GetType("System.String"));
            dvrows.Columns.Add("Expense_amt_paid", Type.GetType("System.String"));
            dvrows.Columns.Add("Expense_amt_paid_to", Type.GetType("System.String"));
            dvrows.Columns.Add("expense_id", Type.GetType("System.String"));


            int rowcount = Gvpayment.Rows.Count;

            if (rowcount > 0)
            {
                foreach (GridViewRow rows in Gvpayment.Rows)
                {
                    gvrow = dvrows.NewRow();

                    if (rows.Cells[1].Text != null)
                    {
                        gvrow.SetField(0, rows.Cells[1].Text);
                    }
                    if (rows.Cells[2].Text != null)
                    {
                        gvrow.SetField(1, rows.Cells[2].Text);
                    }
                    if (rows.Cells[3].Text != null)
                    {
                        gvrow.SetField(2, rows.Cells[3].Text);
                    }
                    if (rows.Cells[4].Text != null)
                    {
                        gvrow.SetField(3, rows.Cells[4].Text);
                    }

                    dvrows.Rows.Add(gvrow);

                }

            }

            gvrow = dvrows.NewRow();

            gvrow.SetField(0, txt_Date_Paid.Text);
            gvrow.SetField(1, txt_Expense_Amt_Paid.Text);
            gvrow.SetField(2, txt_Expense_Amt_Paid_To.Text);

            dvrows.Rows.Add(gvrow);

            Gvpayment.DataSource = dvrows;
            Gvpayment.DataBind();

            txt_Date_Paid.Text = "";
            txt_Expense_Amt_Paid.Text = "";
            txt_Expense_Amt_Paid_To.Text = "";

        }

        protected void Gvpayment_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataRow gvrow;
            DataTable dvrows = new DataTable();

            dvrows.Columns.Add("Date_paid", Type.GetType("System.String"));
            dvrows.Columns.Add("Expense_amt_paid", Type.GetType("System.String"));
            dvrows.Columns.Add("Expense_amt_paid_to", Type.GetType("System.String"));
            dvrows.Columns.Add("expense_id", Type.GetType("System.String"));

            int rowindex = 0;
            int selectedindex = e.RowIndex;

            foreach (GridViewRow rows in Gvpayment.Rows)
            {
                if (rowindex != selectedindex)
                {
                    gvrow = dvrows.NewRow();

                    if (rows.Cells[1].Text != null)
                    {
                        gvrow.SetField(0, rows.Cells[1].Text);
                    }
                    if (rows.Cells[2].Text != null)
                    {
                        gvrow.SetField(1, rows.Cells[2].Text);
                    }
                    if (rows.Cells[3].Text != null)
                    {
                        gvrow.SetField(2, rows.Cells[3].Text);
                    }
                    if (rows.Cells[4].Text != null)
                    {
                        gvrow.SetField(3, rows.Cells[4].Text);
                    }
                    dvrows.Rows.Add(gvrow);

                    rowindex = rowindex + 1;
                }
            }
            if (rowindex > 0)
            {
                Gvpayment.DataSource = dvrows;
            }

            Gvpayment.DataBind();
        }

        protected void BtnAddVeh_Click(object sender, EventArgs e)
        {

            DataTable dvrows = new DataTable();
            DataRow gvrow = dvrows.NewRow();

            dvrows.Columns.Add("vehicle_Type", Type.GetType("System.String"));
            dvrows.Columns.Add("vehicle_Make", Type.GetType("System.String"));
            dvrows.Columns.Add("vehicle_Model", Type.GetType("System.String"));
            dvrows.Columns.Add("vehicle_Year", Type.GetType("System.String"));
            dvrows.Columns.Add("Vin", Type.GetType("System.String"));
            dvrows.Columns.Add("PlateNumber", Type.GetType("System.String"));
            dvrows.Columns.Add("Insured", Type.GetType("System.String"));
            dvrows.Columns.Add("vehicle_Desc", Type.GetType("System.String"));
            dvrows.Columns.Add("vehicle_id", Type.GetType("System.String"));

            int rowcount = GVVehicle.Rows.Count;

            if (rowcount > 0)
            {
                foreach (GridViewRow rows in GVVehicle.Rows)
                {
                    gvrow = dvrows.NewRow();

                    if (rows.Cells[1].Text != null)
                    {
                        gvrow.SetField(0, rows.Cells[1].Text);
                    }
                    if (rows.Cells[2].Text != null)
                    {
                        gvrow.SetField(1, rows.Cells[2].Text);
                    }
                    if (rows.Cells[3].Text != null)
                    {
                        gvrow.SetField(2, rows.Cells[3].Text);
                    }
                    if (rows.Cells[4].Text != null)
                    {
                        gvrow.SetField(3, rows.Cells[4].Text);
                    }
                    if (rows.Cells[5].Text != null)
                    {
                        gvrow.SetField(4, rows.Cells[5].Text);
                    }
                    if (rows.Cells[6].Text != null)
                    {
                        gvrow.SetField(5, rows.Cells[6].Text);
                    }
                    if (rows.Cells[7].Text != null)
                    {
                        gvrow.SetField(6, rows.Cells[7].Text);
                    }
                    if (rows.Cells[8].Text != null)
                    {
                        gvrow.SetField(7, rows.Cells[8].Text);
                    }
                    if (rows.Cells[9].Text != null)
                    {
                        gvrow.SetField(8, rows.Cells[9].Text);
                    }

                    dvrows.Rows.Add(gvrow);

                }

            }

            gvrow = dvrows.NewRow();

            gvrow.SetField(0, ddl_v_type.SelectedValue.ToString());
            gvrow.SetField(1, Txt_v_Make.Text);
            gvrow.SetField(2, Txt_v_model.Text);
            gvrow.SetField(3, txt_v_year.Text);
            gvrow.SetField(4, txt_v_Vin.Text);
            gvrow.SetField(5, Txt_v_Plate.Text);
            gvrow.SetField(6, ddl_V_ins.SelectedValue.ToString());
            gvrow.SetField(7, Txt_v_desc.Text);


            dvrows.Rows.Add(gvrow);

            GVVehicle.DataSource = dvrows;
            GVVehicle.DataBind();

            Txt_v_Make.Text = "";
            Txt_v_model.Text = "";
            txt_v_year.Text = "";
            txt_v_Vin.Text = "";
            Txt_v_Plate.Text = "";
            Txt_v_desc.Text = "";
            ddl_v_type.SelectedValue = "";
            ddl_V_ins.SelectedValue = "";

        }

        protected void GVVehicle_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataRow gvrow;
            DataTable dvrows = new DataTable();

            dvrows.Columns.Add("vehicle_Type", Type.GetType("System.String"));
            dvrows.Columns.Add("vehicle_Make", Type.GetType("System.String"));
            dvrows.Columns.Add("vehicle_Model", Type.GetType("System.String"));
            dvrows.Columns.Add("vehicle_Year", Type.GetType("System.String"));
            dvrows.Columns.Add("Vin", Type.GetType("System.String"));
            dvrows.Columns.Add("PlateNumber", Type.GetType("System.String"));
            dvrows.Columns.Add("Insured", Type.GetType("System.String"));
            dvrows.Columns.Add("vehicle_Desc", Type.GetType("System.String"));
            dvrows.Columns.Add("vehicle_id", Type.GetType("System.String"));

            int rowindex = 0;
            int selectedindex = e.RowIndex;

            foreach (GridViewRow rows in GVVehicle.Rows)
            {
                if (rowindex != selectedindex)
                {
                    gvrow = dvrows.NewRow();

                    if (rows.Cells[1].Text != null)
                    {
                        gvrow.SetField(0, rows.Cells[1].Text);
                    }
                    if (rows.Cells[2].Text != null)
                    {
                        gvrow.SetField(1, rows.Cells[2].Text);
                    }
                    if (rows.Cells[3].Text != null)
                    {
                        gvrow.SetField(2, rows.Cells[3].Text);
                    }
                    if (rows.Cells[4].Text != null)
                    {
                        gvrow.SetField(3, rows.Cells[4].Text);
                    }
                    if (rows.Cells[5].Text != null)
                    {
                        gvrow.SetField(4, rows.Cells[5].Text);
                    }
                    if (rows.Cells[6].Text != null)
                    {
                        gvrow.SetField(5, rows.Cells[6].Text);
                    }
                    if (rows.Cells[7].Text != null)
                    {
                        gvrow.SetField(6, rows.Cells[7].Text);
                    }
                    if (rows.Cells[8].Text != null)
                    {
                        gvrow.SetField(7, rows.Cells[8].Text);
                    }
                    if (rows.Cells[9].Text != null)
                    {
                        gvrow.SetField(8, rows.Cells[9].Text);
                    }

                    dvrows.Rows.Add(gvrow);

                    rowindex = rowindex + 1;
                }
            }
            if (rowindex > 0)
            {
                GVVehicle.DataSource = dvrows;
            }

            GVVehicle.DataBind();
        }

        protected void BtnAddPets_Click(object sender, EventArgs e)
        {

            DataTable dvrows = new DataTable();
            DataRow gvrow = dvrows.NewRow();

            dvrows.Columns.Add("Pet_Name", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_Age", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_Description", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_Type", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_Gender", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_Color", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_tag", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_tatoo", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_spay_nuet", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_record_id", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_Status", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_Chip_id", Type.GetType("System.String"));

            int rowcount = GVpetInfo.Rows.Count;
            if (TxtPetName.Text != "" && txtPetdesc.Text != "" && DDL_PetGender.SelectedValue != "" &&
               TxtPetColor.Text != "" && DDLPetStatus.SelectedValue != "")
            {
                if (rowcount > 0)
                {
                    foreach (GridViewRow rows in GVpetInfo.Rows)
                    {
                        gvrow = dvrows.NewRow();

                        if (rows.Cells[1].Text != null)
                        {
                            gvrow.SetField(0, rows.Cells[1].Text);
                        }
                        if (rows.Cells[2].Text != null)
                        {
                            gvrow.SetField(1, rows.Cells[2].Text);
                        }
                        if (rows.Cells[3].Text != null)
                        {
                            gvrow.SetField(2, rows.Cells[3].Text);
                        }
                        if (rows.Cells[4].Text != null)
                        {
                            gvrow.SetField(3, rows.Cells[4].Text);
                        }
                        if (rows.Cells[5].Text != null)
                        {
                            gvrow.SetField(4, rows.Cells[5].Text);
                        }
                        if (rows.Cells[6].Text != null)
                        {
                            gvrow.SetField(5, rows.Cells[6].Text);
                        }
                        if (rows.Cells[7].Text != null)
                        {
                            gvrow.SetField(6, rows.Cells[7].Text);
                        }
                        if (rows.Cells[8].Text != null)
                        {
                            gvrow.SetField(7, rows.Cells[8].Text);
                        }
                        if (rows.Cells[9].Text != null)
                        {
                            gvrow.SetField(8, rows.Cells[9].Text);
                        }
                        if (rows.Cells[10].Text != null)
                        {
                            gvrow.SetField(9, rows.Cells[10].Text);
                        }
                        if (rows.Cells[11].Text != null)
                        {
                            gvrow.SetField(10, rows.Cells[11].Text);
                        }
                        if (rows.Cells[12].Text != null)
                        {
                            gvrow.SetField(11, rows.Cells[12].Text);
                        }
                        dvrows.Rows.Add(gvrow);

                    }

                }

                gvrow = dvrows.NewRow();

                gvrow.SetField(0, TxtPetName.Text);
                gvrow.SetField(1, TxtPetAge.Text);
                gvrow.SetField(2, txtPetdesc.Text);
                gvrow.SetField(3, DDL_PetType.SelectedValue.ToString());
                gvrow.SetField(4, DDL_PetGender.SelectedValue.ToString());
                gvrow.SetField(5, TxtPetColor.Text);
                gvrow.SetField(6, TxtLiscTag.Text);
                gvrow.SetField(7, TxtTatooNum.Text);
                gvrow.SetField(8, DDL_Spay_neuter.SelectedValue.ToString());
                gvrow.SetField(10, DDLPetStatus.SelectedValue);
                gvrow.SetField(11, TxtPetChipID.Text);

                dvrows.Rows.Add(gvrow);

                GVpetInfo.DataSource = dvrows;
                GVpetInfo.DataBind();

                TxtPetName.Text = "";
                TxtPetAge.Text = "";
                txtPetdesc.Text = "";
                TxtPetColor.Text = "";
                TxtLiscTag.Text = "";
                TxtTatooNum.Text = "";
                TxtPetChipID.Text = "";
                DDL_PetType.SelectedValue = "0";
                DDL_PetGender.SelectedValue = "";
                DDL_Spay_neuter.SelectedValue = "";
                DDLPetStatus.SelectedValue = "";
            }
            else
            {
                lblSearchErrormsg.Text = "Not all required pet info was not added";
            }

        }

        protected void GVpetInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataRow gvrow;
            DataTable dvrows = new DataTable();

            dvrows.Columns.Add("Pet_Name", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_Age", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_Description", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_Type", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_Gender", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_Color", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_tag", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_tatoo", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_spay_nuet", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_record_id", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_Status", Type.GetType("System.String"));
            dvrows.Columns.Add("Pet_Chip_id", Type.GetType("System.String"));

            int rowindex = 0;
            int selectedindex = e.RowIndex;

            foreach (GridViewRow rows in GVpetInfo.Rows)
            {
                if (rowindex != selectedindex)
                {
                    gvrow = dvrows.NewRow();

                    if (rows.Cells[1].Text != null)
                    {
                        gvrow.SetField(0, rows.Cells[1].Text);
                    }
                    if (rows.Cells[2].Text != null)
                    {
                        gvrow.SetField(1, rows.Cells[2].Text);
                    }
                    if (rows.Cells[3].Text != null)
                    {
                        gvrow.SetField(2, rows.Cells[3].Text);
                    }
                    if (rows.Cells[4].Text != null)
                    {
                        gvrow.SetField(3, rows.Cells[4].Text);
                    }
                    if (rows.Cells[5].Text != null)
                    {
                        gvrow.SetField(4, rows.Cells[5].Text);
                    }
                    if (rows.Cells[6].Text != null)
                    {
                        gvrow.SetField(5, rows.Cells[6].Text);
                    }
                    if (rows.Cells[7].Text != null)
                    {
                        gvrow.SetField(6, rows.Cells[7].Text);
                    }
                    if (rows.Cells[8].Text != null)
                    {
                        gvrow.SetField(7, rows.Cells[8].Text);
                    }
                    if (rows.Cells[9].Text != null)
                    {
                        gvrow.SetField(8, rows.Cells[9].Text);
                    }
                    if (rows.Cells[10].Text != null)
                    {
                        gvrow.SetField(9, rows.Cells[10].Text);
                    }
                    if (rows.Cells[110].Text != null)
                    {
                        gvrow.SetField(10, rows.Cells[11].Text);
                    }
                    if (rows.Cells[12].Text != null)
                    {
                        gvrow.SetField(11, rows.Cells[12].Text);
                    }
                    dvrows.Rows.Add(gvrow);

                    rowindex = rowindex + 1;
                }
            }
            if (rowindex > 0)
            {
                GVpetInfo.DataSource = dvrows;
            }

            GVpetInfo.DataBind();
        }

        protected void BtnAddDebt_Click(object sender, EventArgs e)
        {
            DataTable dvrows = new DataTable();
            DataRow gvrow = dvrows.NewRow();

            dvrows.Columns.Add("Creditor_Name", Type.GetType("System.String"));
            dvrows.Columns.Add("Debt_amt", Type.GetType("System.String"));
            dvrows.Columns.Add("Item_Purchased", Type.GetType("System.String"));
            dvrows.Columns.Add("last_payment_Date", Type.GetType("System.String"));
            dvrows.Columns.Add("purchase_date", Type.GetType("System.String"));
            dvrows.Columns.Add("Value_amt", Type.GetType("System.String"));
            dvrows.Columns.Add("Debt_id", Type.GetType("System.String"));

            int rowcount = GVDebt.Rows.Count;

            if (rowcount > 0)
            {
                foreach (GridViewRow rows in GVDebt.Rows)
                {
                    gvrow = dvrows.NewRow();

                    if (rows.Cells[1].Text != null)
                    {
                        gvrow.SetField(0, rows.Cells[1].Text);
                    }
                    if (rows.Cells[2].Text != null)
                    {
                        gvrow.SetField(1, rows.Cells[2].Text);
                    }
                    if (rows.Cells[3].Text != null)
                    {
                        gvrow.SetField(2, rows.Cells[3].Text);
                    }
                    if (rows.Cells[4].Text != null)
                    {
                        gvrow.SetField(3, rows.Cells[4].Text);
                    }
                    if (rows.Cells[5].Text != null)
                    {
                        gvrow.SetField(4, rows.Cells[5].Text);
                    }
                    if (rows.Cells[6].Text != null)
                    {
                        gvrow.SetField(5, rows.Cells[6].Text);
                    }
                    if (rows.Cells[7].Text != null)
                    {
                        gvrow.SetField(6, rows.Cells[7].Text);
                    }

                    dvrows.Rows.Add(gvrow);

                }

            }

            gvrow = dvrows.NewRow();

            gvrow.SetField(0, Txt_Creditor_Name.Text);
            gvrow.SetField(1, Txt_debt_amount.Text);
            gvrow.SetField(2, Txt_item.Text);
            gvrow.SetField(3, Txt_lst_pymnt_date.Text);
            gvrow.SetField(4, Txt_Purch_date.Text);
            gvrow.SetField(5, Txt_value.Text);

            dvrows.Rows.Add(gvrow);

            GVDebt.DataSource = dvrows;
            GVDebt.DataBind();

            Txt_Creditor_Name.Text = "";
            Txt_debt_amount.Text = "";
            Txt_item.Text = "";
            Txt_lst_pymnt_date.Text = "";
            Txt_Purch_date.Text = "";
            Txt_value.Text = "";

        }

        protected void GVDebt_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataRow gvrow;
            DataTable dvrows = new DataTable();

            dvrows.Columns.Add("Creditor_Name", Type.GetType("System.String"));
            dvrows.Columns.Add("Debt_amt", Type.GetType("System.String"));
            dvrows.Columns.Add("Item_Purchased", Type.GetType("System.String"));
            dvrows.Columns.Add("last_payment_Date", Type.GetType("System.String"));
            dvrows.Columns.Add("purchase_date", Type.GetType("System.String"));
            dvrows.Columns.Add("Value_amt", Type.GetType("System.String"));
            dvrows.Columns.Add("Debt_id", Type.GetType("System.String"));

            int rowindex = 0;
            int selectedindex = e.RowIndex;

            foreach (GridViewRow rows in GVDebt.Rows)
            {
                if (rowindex != selectedindex)
                {
                    gvrow = dvrows.NewRow();

                    if (rows.Cells[1].Text != null)
                    {
                        gvrow.SetField(0, rows.Cells[1].Text);
                    }
                    if (rows.Cells[2].Text != null)
                    {
                        gvrow.SetField(1, rows.Cells[2].Text);
                    }
                    if (rows.Cells[3].Text != null)
                    {
                        gvrow.SetField(2, rows.Cells[3].Text);
                    }
                    if (rows.Cells[4].Text != null)
                    {
                        gvrow.SetField(3, rows.Cells[4].Text);
                    }
                    if (rows.Cells[5].Text != null)
                    {
                        gvrow.SetField(4, rows.Cells[5].Text);
                    }
                    if (rows.Cells[6].Text != null)
                    {
                        gvrow.SetField(5, rows.Cells[6].Text);
                    }
                    if (rows.Cells[7].Text != null)
                    {
                        gvrow.SetField(6, rows.Cells[7].Text);
                    }

                    dvrows.Rows.Add(gvrow);

                    rowindex = rowindex + 1;
                }
            }
            if (rowindex > 0)
            {
                GVDebt.DataSource = dvrows;
            }

            GVDebt.DataBind();
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {


            if (txt_F_Name.Text != "" && txt_L_Name.Text != "" && txtCurr_str_addr.Text != "" &&
                txtCurr_city.Text != "" && TxtCurr_Country.Text != "" && ddlCurr_st.SelectedValue != "" &&
                DDL_Call_Center.SelectedValue != "0" && DDlDisasters.SelectedValue != "0")
            {
                Save_Client_information();
                Save_Case_information();
                Save_Income_info();

                if (TxtEmplr_Name.Text != "")
                {
                    Save_Employer_info();
                }

                if (GVpetInfo.Rows.Count > 0)
                {
                    Save_pets_info();
                }

                if (Gvpayment.Rows.Count > 0)
                {
                    Save_client_Expenses();
                }

                if (GVDebt.Rows.Count > 0)
                {
                    Save_Debt_info();
                }

                if (GVVehicle.Rows.Count > 0)
                {
                    Save_Vehicles_info();
                }

                if (TxtMilbranch.Text != "" && Txtmilserialnum.Text != "")
                {
                    Save_military_info();
                }

                Save_Disaster_Enconter_info();

                Response.Redirect("SrvWelcome.aspx");
            }
            else
            {
                lblSearchErrormsg.Text = "Please enter at least a first and last name, current address information, and a callcenter and a disaster";
                lblSearchErrormsg.Visible = true;
            }
        }

        protected void BtnClose_Click(object sender, EventArgs e)
        {

            if (clientCase_intake.case_id != 0 && Convert.ToString(clientCase_intake.applic_end_date_time) == "")
            {
                clientCase_intake.applic_end_date_time = DateTime.Today;
                clientCase_intake.Update(clientCase_intake);

                Clear_Client_information();
                Clear_Case_information();
                Clear_Pet_info();
                Clear_Employer_info();
                Clear_Income_info();
                Clear_Expense_info();
                Clear_Vehicale_info();
                Clear_Military_info();

                txt_F_Name.Text = "";
                txt_L_Name.Text = "";
                DDL_Call_Center.ClearSelection();
                DDlDisasters.ClearSelection();

                gvClientSearchresult.DataSource = "";
                gvClientSearchresult.DataBind();

                GVcases.DataSource = "";
                GVcases.DataBind();
            }
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainMenu.aspx");
        }

        protected void fill_Client_information()
        {

            client = client.Select(GlobalVariables.PersonID);
            GlobalVariables.ClientID = client.client_id;

            clientAddress = clientAddress.Select(clientperson.address_id);
            clientAddress2 = clientAddress2.Select(clientperson.address_id2);

            GlobalVariables.ClientAddressID = clientAddress.address_id;
            GlobalVariables.ClientAddressID2 = clientAddress2.address_id;

            ddl_client_status.SelectedValue = client.client_status;
            txt_L_Name.Text = clientperson.l_name.ToString();
            txt_F_Name.Text = clientperson.f_name.ToString();
            txt_M_Initial.Text = clientperson.m_initial.ToString();
            txt_email.Text = clientperson.email.ToString();
            txt_Maiden_Name.Text = clientperson.Maiden_Name.ToString();
            ddl_Gender.SelectedValue = clientperson.gender;
            txt_SSN.Text = clientperson.ssn.ToString();
            txt_DrvLic.Text = clientperson.Driver_State_ID;
            txt_Birthdate.Text = clientperson.birthdate.ToString();
            txt_Phone_Primary.Text = clientperson.phone_primary;
            txt_Phone_Secondary.Text = clientperson.phone_secondary;
            ddl_Marital_Status.SelectedValue = clientperson.Marital_Status;
            ddl_CitizenShip.SelectedValue = clientperson.Citizenship;

            get_visa_type();

            TxtVisaIssDate.Text = clientperson.Visa_Issue_Date.ToString();
            TxtVisaExpDate.Text = clientperson.Visa_Expire_Date.ToString();
            TxtUSCISNum.Text = clientperson.Perm_Resident_Alien_USCIS_number.ToString();
            TxtANumber.Text = clientperson.Perm_Resident_Alien_A_number.ToString();
            TxtresDate.Text = clientperson.Perm_Resident_Alien_Resid_Date.ToString();
            TxtResExpDate.Text = clientperson.Perm_Resident_Alien_Expire_Date.ToString();
            TxtCountryOfBirth.Text = clientperson.Perm_Resident_Alien_Birth_Country;
            TxtCategory.Text = clientperson.Perm_Resident_Alien_Category;

            txtCurr_str_addr.Text = clientAddress.str_add;
            TxtCurr_str_addr2.Text = clientAddress.str_add2;
            txtCurr_city.Text = clientAddress.city;
            if (clientAddress.state != null)
            {
                ddlCurr_st.SelectedValue = clientAddress.state;
            }
            txtCurr_zip.Text = clientAddress.zip_plus_four.ToString();
            TxtCurr_Country.Text = clientAddress.country;
            TxtCurr_CountyTownship.Text = clientAddress.County_Township;

            txtPrev_str_addr.Text = clientAddress2.str_add;
            txtPrev_str_addr2.Text = clientAddress2.str_add2;
            txtPrev_city.Text = clientAddress2.city;
            if (clientAddress2.state != "")
            {
                ddlPrev_st.SelectedValue = clientAddress2.state;
            }
            txtPrev_zip.Text = clientAddress2.zip_plus_four.ToString();
            TxtPrev_Country.Text = clientAddress2.country;
            TxtPrev_countyTownship.Text = clientAddress2.County_Township;

        }

        protected void get_visa_type()
        {
            if (clientperson.Visa_Selected_Value_B_2 == 1)
            {
                ddl_visaTypes.SelectedValue = "B_2";
            }
            else if (clientperson.Visa_Selected_Value_B1 == 1)
            {
                ddl_visaTypes.SelectedValue = "B1";
            }
            else if (clientperson.Visa_Selected_Value_B2 == 1)
            {
                ddl_visaTypes.SelectedValue = "B2";
            }
            else if (clientperson.Visa_Selected_Value_F1 == 1)
            {
                ddl_visaTypes.SelectedValue = "F1";
            }
            else if (clientperson.Visa_Selected_Value_H_1B == 1)
            {
                ddl_visaTypes.SelectedValue = "H1B";
            }
            else if (clientperson.Visa_Selected_Value_H_2B == 1)
            {
                ddl_visaTypes.SelectedValue = "H2B";
            }
            else if (clientperson.Visa_Selected_Value_H4 == 1)
            {
                ddl_visaTypes.SelectedValue = "H4";
            }
            else if (clientperson.Visa_Selected_Value_J1 == 1)
            {
                ddl_visaTypes.SelectedValue = "J1";
            }
            else if (clientperson.Visa_Selected_Value_K1 == 1)
            {
                ddl_visaTypes.SelectedValue = "K1";
            }
            else if (clientperson.Visa_Selected_Value_K3 == 1)
            {
                ddl_visaTypes.SelectedValue = "K3";
            }
            else if (clientperson.Visa_Selected_Value_L1 == 1)
            {
                ddl_visaTypes.SelectedValue = "L1";
            }
            else if (clientperson.Visa_Selected_Value_L2 == 1)
            {
                ddl_visaTypes.SelectedValue = "L2";
            }
            else if (clientperson.Visa_Selected_Value_M1 == 1)
            {
                ddl_visaTypes.SelectedValue = "M1";
            }
            else if (clientperson.Visa_Selected_Value_Schengen == 1)
            {
                ddl_visaTypes.SelectedValue = "";
            }

        }

        protected void fill_Case_information()
        {

            GlobalVariables.CaseID = clientcase.case_id;
            //Missing Client info
            TxtCurr_addr_date_ocup.Text = clientcase.curr_residence_date.ToString();
            TxtPrev_addr_date_ocup.Text = clientcase.prev_residence_date.ToString();
            txt_Mtg_Amt_Owed_Today.Text = Convert.ToString(Decimal.Round(clientcase.mtg_amt_owed_today, 2));
            txt_Electric_Amt_Owed_Today.Text = Convert.ToString(Decimal.Round(clientcase.electric_amt_owed_today, 2));
            txt_Gas_or_Heating_Amt_Owed_Today.Text = Convert.ToString(Decimal.Round(clientcase.gas_or_heating_amt_owed_today, 2));
            txt_Water_Amt_Owed_Today.Text = Convert.ToString(Decimal.Round(clientcase.water_amt_owed_today, 2));
            txt_Cable_Amt_Owed_Today.Text = Convert.ToString(Decimal.Round(clientcase.cable_amt_owed_today, 2));
            txt_Telephone_Amt_Owed_Today.Text = Convert.ToString(Decimal.Round(clientcase.telephone_amt_owed_today, 2));
            txt_Sewage_Amt_Owed_Today.Text = Convert.ToString(Decimal.Round(clientcase.sewage_amt_owed_today, 2));
            txt_Trash_Removal_Amt_Owed_Today.Text = Convert.ToString(Decimal.Round(clientcase.trash_removal_amt_owed_today, 2));

            //Case Info
            if (clientCase_intake.circum_no_income == "Fal")
            {
                CbNoIncome.Checked = false;
            }
            else
            {
                CbNoIncome.Checked = true;
            }

            if (clientCase_intake.circum_not_enough_income == "Fal")
            {
                CbNotenoughIncome.Checked = false;
            }
            else
            {
                CbNotenoughIncome.Checked = true;
            }

            if (clientCase_intake.circum_income_stolen == "Fal")
            {
                CbStolanincome.Checked = false;
            }
            else
            {
                CbStolanincome.Checked = true;
            }

            if (clientCase_intake.circum_emergency_event == "Fal")
            {
                CBEmgEvent.Checked = false;
            }
            else
            {
                CBEmgEvent.Checked = true;
            }

            txt_Circum_Memo.Text = clientCase_intake.circum_memo.ToString();
            txt_Circum_Help_Request_Memo.Text = clientCase_intake.circum_help_request_memo.ToString();
            txt_welfr_fraud_memo.Text = clientcase.welfr_fraud_memo.ToString();
            txt_AFDC_denial_memo.Text = clientcase.denial_memo.ToString();

        }

        protected void fill_pet_info()
        {

            DataTable dt2 = new DataTable();
            DataRow gvrow = dt2.NewRow();

            dt2.Columns.Add("Pet_Name", Type.GetType("System.String"));
            dt2.Columns.Add("Pet_Age", Type.GetType("System.String"));
            dt2.Columns.Add("Pet_Description", Type.GetType("System.String"));
            dt2.Columns.Add("Pet_Type", Type.GetType("System.String"));
            dt2.Columns.Add("Pet_Gender", Type.GetType("System.String"));
            dt2.Columns.Add("Pet_Color", Type.GetType("System.String"));
            dt2.Columns.Add("Pet_tag", Type.GetType("System.String"));
            dt2.Columns.Add("Pet_tatoo", Type.GetType("System.String"));
            dt2.Columns.Add("Pet_spay_nuet", Type.GetType("System.String"));
            dt2.Columns.Add("Pet_record_id", Type.GetType("System.String"));
            dt2.Columns.Add("Pet_Status", Type.GetType("System.String"));
            dt2.Columns.Add("Pet_Chip_id", Type.GetType("System.String"));

            String whereclause = "Client_id = " + clientcase.client_id;

            DataTable dt = CLWPets.Select(whereclause);

            if (dt.Rows.Count > 0)
            {
                foreach (DataRow rows in dt.Rows)
                {
                    clientPets = clientPets.Select(Convert.ToInt32(rows["Pet_id"]));

                    gvrow = dt2.NewRow();

                    if (clientPets.Pet_Name != null)
                    {
                        gvrow.SetField(0, clientPets.Pet_Name);
                    }
                    if (clientPets.Pet_Date_Of_Birth != null)
                    {
                        gvrow.SetField(1, clientPets.Pet_Date_Of_Birth);
                    }
                    if (clientPets.Pet_Description != null)
                    {
                        gvrow.SetField(2, clientPets.Pet_Description);
                    }
                    if (clientPets.Pet_Type_ID != null)
                    {
                        gvrow.SetField(3, clientPets.Pet_Type_ID);
                    }
                    if (clientPets.Pet_Gender != null)
                    {
                        gvrow.SetField(4, clientPets.Pet_Gender);
                    }
                    if (clientPets.Pet_Color != null)
                    {
                        gvrow.SetField(5, clientPets.Pet_Color);
                    }
                    if (clientPets.Pet_License_Tag != null)
                    {
                        gvrow.SetField(6, clientPets.Pet_License_Tag);
                    }
                    if (clientPets.Pet_Tatoo_No != null)
                    {
                        gvrow.SetField(7, clientPets.Pet_Tatoo_No);
                    }
                    if (clientPets.Pet_Sterilized != null)
                    {
                        gvrow.SetField(8, clientPets.Pet_Sterilized);
                    }
                    if (clientPets.Pet_Record_ID != null)
                    {
                        gvrow.SetField(9, clientPets.Pet_Record_ID);
                    }
                    /*if (clientPets.Pet_Status != null)
                    {
                        gvrow.SetField(10, clientPets.Pet_Status);
                    }
                    if (clientPets.Pet_Chip_ID != null)
                    {
                        gvrow.SetField(11, clientPets.Pet_Chip_ID);
                    }
                    
                    dt2.Rows.Add(gvrow);*/
                }

                GVpetInfo.DataSource = dt2;
                GVpetInfo.DataBind();
            }
        }

        protected void fill_employer_info()
        {
            String whereclause = "Client_id = " + clientcase.client_id + " and Case_Id = " + clientcase.case_id;

            DataTable dt = clientemployer.Select(whereclause);


            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                TxtEmplr_Name.Text = dr.Field<String>(4);
                TxtEmplr_Phone.Text = dr.Field<String>(5);
                TxtEmpSrtDate.Text = Convert.ToString(dr.Field<DateTime>(7));
                TxtEmpEndDate.Text = Convert.ToString(dr.Field<DateTime>(6));
                TxtTermReas.Text = dr.Field<String>(8);

                clientEmplrAddress = clientEmplrAddress.Select(dr.Field<int>(3));
                GlobalVariables.EmplrAddressID = dr.Field<int>(3);
                GlobalVariables.EmployerID = dr.Field<int>(0);

                if (clientEmplrAddress.address_id != 0)
                {
                    txtempr_str_addr.Text = clientEmplrAddress.str_add;
                    Txtempr_str_addr2.Text = clientEmplrAddress.str_add2;
                    txtempr_city.Text = clientEmplrAddress.city;
                    ddlempr_st.SelectedValue = clientEmplrAddress.state;
                    txtempr_zip.Text = clientEmplrAddress.zip_plus_four.ToString();
                    TxtEmpr_Country.Text = clientEmplrAddress.country;
                    Txtempr_CountyTownship.Text = clientEmplrAddress.County_Township;
                }
            }
        }

        protected void fill_Income_info()
        {
            String whereclause = "Client_id = " + clientcase.client_id + " and Case_Id = " + clientcase.case_id;

            DataTable dt = clientincome.Select(whereclause);


            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                GlobalVariables.IncomeSourceID = dr.Field<int>(0);
                txt_Cash_Amt.Text = Convert.ToString(Decimal.Round(dr.Field<decimal>(2), 2));
                ddl_Cash_on_Hand.SelectedValue = dr.Field<String>(3);
                ddl_Ckg_Acct.SelectedValue = dr.Field<String>(17);
                txt_Ckg_Balance.Text = Convert.ToString(Decimal.Round(dr.Field<decimal>(18), 2));
                txt_Ckg_Bank.Text = dr.Field<String>(19);
                ddl_Claims.SelectedValue = dr.Field<String>(20);
                txt_Claims_Memo.Text = dr.Field<String>(21);
                ddl_Investments.SelectedValue = dr.Field<String>(25);
                ddl_Life_Ins.SelectedValue = dr.Field<String>(26);
                txt_Pension_Amt.Text = Convert.ToString(Decimal.Round(dr.Field<decimal>(28), 2));
                cbl_inc_src_Pension.SelectedValue = dr.Field<String>(29);
                txt_Strike_Benefits_Amt.Text = Convert.ToString(Decimal.Round(dr.Field<decimal>(30), 2));
                cbl_inc_StrikeBen.SelectedValue = dr.Field<String>(31);
                txt_Support_Amt.Text = Convert.ToString(Decimal.Round(dr.Field<decimal>(32), 2));
                ddlSupport.SelectedValue = dr.Field<String>(33);
                ddl_Svgs_Acct.SelectedValue = dr.Field<String>(36);
                txt_Svgs_Balance.Text = Convert.ToString(Decimal.Round(dr.Field<decimal>(37), 2));
                txt_Svgs_Bank.Text = dr.Field<String>(38);
                txt_Wages_Amt.Text = Convert.ToString(Decimal.Round(dr.Field<decimal>(39), 2));
                cbl_inc_src_wages.SelectedValue = dr.Field<String>(40);

            }

            ddlHousingStatus.SelectedValue = clientcase.housing_status;
            ddlIncomeStatus.SelectedValue = clientcase.income_status;
            ddlEmpStatus.SelectedValue = clientcase.employment_status;
            TxtutilallAmt.Text = Convert.ToString(Decimal.Round(clientcase.util_allot_amt, 2));
            TxtutilallDate.Text = clientcase.util_allot_app_date.ToString();
            ddlUtilall.SelectedValue = clientcase.utilities_incl;
            TxtFoodstmpAmt.Text = Convert.ToString(Decimal.Round(clientcase.fd_stmps_amt, 2));
            TxtFoodstmpDate.Text = clientcase.fd_stmps_app_date.ToString();
            ddlFoodstmp.SelectedValue = clientcase.fd_Inc;
            TxtAFDCAmt.Text = Convert.ToString(Decimal.Round(clientcase.afdc_amt, 2));
            TxtAFDCDate.Text = clientcase.afdc_app_date.ToString();
            ddlAFDC.SelectedValue = clientcase.afdc_Inc;
            TxtTrustOffAmt.Text = Convert.ToString(Decimal.Round(clientcase.oth_trustee_amt, 2));
            TxtTrustOffDate.Text = clientcase.oth_trustee_app_date.ToString();
            ddlTrustOff.SelectedValue = clientcase.oth_trustee_Inc;
            txtssAmt.Text = Convert.ToString(Decimal.Round(clientcase.ss_amt, 2));
            txtssDate.Text = clientcase.ss_app_date.ToString();
            ddlSS.SelectedValue = clientincome.support_inc;
            txtVAAmt.Text = Convert.ToString(Decimal.Round(clientcase.va_amt, 2));
            txtVADate.Text = clientcase.va_app_date.ToString();
            ddlVA.SelectedValue = clientcase.va_Inc;
            txtEAPAmt.Text = Convert.ToString(Decimal.Round(clientcase.eap_amt, 2));
            txtEAPDate.Text = clientcase.eap_app_date.ToString();
            ddlEAP.SelectedValue = clientcase.eap_Inc;
            TxtFemaAmt.Text = Convert.ToString(Decimal.Round(clientcase.fema_amt, 2));
            TxtFEMADate.Text = clientcase.fema_app_date.ToString();
            ddlFema.SelectedValue = clientcase.fema_Inc;
            txtUnemplAmt.Text = Convert.ToString(Decimal.Round(clientcase.unempl_amt, 2));
            txtUnemplDate.Text = clientcase.unempl_app_date.ToString();
            ddlUnemployment.SelectedValue = clientcase.unempl_Inc;
            txtGrantLoanAmt.Text = Convert.ToString(Decimal.Round(clientcase.grants_loans_amt, 2));
            txtGrantLoanDate.Text = clientcase.grants_loans_app_date.ToString();
            ddlGrantloan.SelectedValue = clientcase.grants_Inc;
            TxtotherhelpAmt.Text = Convert.ToString(Decimal.Round(clientcase.other_amt, 2));
            TxtotherhelpDate.Text = clientcase.other_app_date.ToString();
            ddlOtherhelp.SelectedValue = clientcase.oth_trustee_Inc;

        }

        protected void Fill_Expense_info()
        {
            String whereclause = "Client_id = " + clientcase.client_id + " and Case_Id = " + clientcase.case_id;

            Gvpayment.DataSource = clientexpense.Select(whereclause); ;
            Gvpayment.DataBind();
        }

        protected void Fill_vehicle_info()
        {
            String whereclause = "Client_id = " + clientcase.client_id + " and Case_Id = " + clientcase.case_id;

            GVVehicle.DataSource = clientvehicle.Select(whereclause);
            GVVehicle.DataBind();

        }

        protected void Fill_Debt_info()
        {
            String whereclause = "Client_id = " + clientcase.client_id + " and Case_Id = " + clientcase.case_id;

            GVDebt.DataSource = clientdebt.Select(whereclause);
            GVDebt.DataBind();

        }

        protected void fill_military_info()
        {
            String whereclause = "Client_id = " + clientcase.client_id + " and Case_Id = " + clientcase.case_id;

            DataTable dt = clientMilitary.Select(whereclause);


            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                TxtMilbranch.Text = dr.Field<String>(5);
                Txtmilserialnum.Text = Convert.ToString(dr.Field<Int32>(6));
                TxtmilEnlistdATE.Text = Convert.ToString(dr.Field<DateTime>(4));
                TxtmildschrgDate.Text = Convert.ToString(dr.Field<DateTime>(3));
            }
        }

        protected void fill_Disaster_encouter()
        {
            String whereclause = "Client_id = " + clientcase.client_id + " and Case_Id = " + clientcase.case_id;

            DataTable dt = clientencounter.Select(whereclause);


            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                clientencounter.encounter_id = dr.Field<int>(0);
                GlobalVariables.EncounterID = dr.Field<int>(0);
                clientencounter.case_id = dr.Field<int>(1);

                if (!dr.IsNull(2))
                {
                    clientencounter.agency_id = dr.Field<int>(2);
                }

                clientencounter.call_center_id = dr.Field<int>(3);
                clientencounter.client_id = dr.Field<int>(4);
                clientencounter.create_date = dr.Field<DateTime>(5);
                clientencounter.close_date = dr.Field<DateTime>(6);
            }

            whereclause = "encounter_id = " + clientencounter.encounter_id;

            dt = disasterEncounter.Select(whereclause);


            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                disasterEncounter.disaster_encounter_id = dr.Field<int>(0);
                disasterEncounter.disaster_id = dr.Field<int>(1);
                disasterEncounter.encounter_id = dr.Field<int>(2);
                //disasterEncounter.address_id = dr.Field<int>(3);
                GlobalVariables.DisasterID = dr.Field<int>(3);
                GlobalVariables.DisterEncounterID = dr.Field<int>(0);
            }

        }

        private void Create_case()
        {

            clientCase_intake.applic_start_date_time = DateTime.Today;

            if (CBEmgEvent.Checked == false)
            {
                clientCase_intake.circum_emergency_event = "0";
            }
            else
            {
                clientCase_intake.circum_emergency_event = "1";
            }


            if (CbStolanincome.Checked == false)
            {
                clientCase_intake.circum_income_stolen = "0";
            }
            else
            {
                clientCase_intake.circum_income_stolen = "1";
            }

            if (CbNoIncome.Checked == false)
            {
                clientCase_intake.circum_no_income = "0";
            }
            else
            {
                clientCase_intake.circum_no_income = "1";
            }

            if (CbNotenoughIncome.Checked == false)
            {
                clientCase_intake.circum_not_enough_income = "0";
            }
            else
            {
                clientCase_intake.circum_not_enough_income = "1";
            }

            clientCase_intake.circum_help_request_memo = txt_Circum_Help_Request_Memo.Text;
            clientCase_intake.circum_memo = txt_Circum_Memo.Text;

            clientCase_intake = clientCase_intake.Insert(clientCase_intake);

        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            Clear_Client_information();
            Clear_Case_information();
            Clear_Pet_info();
            Clear_Employer_info();
            Clear_Income_info();
            Clear_Expense_info();
            Clear_Vehicale_info();
            Clear_Military_info();
            Clear_Debt_info();

            txt_F_Name.Text = "";
            txt_L_Name.Text = "";
            DDL_Call_Center.ClearSelection();
            DDlDisasters.ClearSelection();

            gvClientSearchresult.DataSource = "";
            //       gvClientSearchresult.DataBind();

            GVcases.DataSource = "";
            //      GVcases.DataBind();

        }

        private void Clear_Client_information()
        {
            ddl_client_status.ClearSelection();
            LblCasenum.Text = "";
            txtlastname.Text = "";
            txtfirstname.Text = "";
            txt_M_Initial.Text = "";
            txt_Maiden_Name.Text = "";
            ddl_Gender.ClearSelection();
            txt_SSN.Text = "";
            txt_DrvLic.Text = "";
            txt_Birthdate.Text = "";
            txt_Phone_Primary.Text = "";
            txt_Phone_Secondary.Text = "";
            ddl_Marital_Status.ClearSelection();
            ddl_CitizenShip.ClearSelection();
            ddl_visaTypes.ClearSelection();
            TxtVisaIssDate.Text = "";
            TxtVisaExpDate.Text = "";
            TxtUSCISNum.Text = "";
            TxtANumber.Text = "";
            TxtresDate.Text = "";
            TxtResExpDate.Text = "";
            TxtCountryOfBirth.Text = "";
            TxtCategory.Text = "";
            txtCurr_str_addr.Text = "";
            TxtCurr_str_addr2.Text = "";
            TxtCurr_addr_date_ocup.Text = "";
            txtCurr_city.Text = "";
            ddlCurr_st.ClearSelection();
            txtCurr_zip.Text = "";
            TxtCurr_Country.Text = "";
            TxtCurr_CountyTownship.Text = "";
            txtPrev_str_addr.Text = "";
            txtPrev_str_addr2.Text = "";
            TxtPrev_addr_date_ocup.Text = "";
            txtPrev_city.Text = "";
            ddlPrev_st.ClearSelection();
            txtPrev_zip.Text = "";
            TxtPrev_Country.Text = "";
            TxtPrev_countyTownship.Text = "";

        }

        protected void Clear_Case_information()
        {
            CbNoIncome.Checked = false;
            CbNotenoughIncome.Checked = false;
            CbStolanincome.Checked = false;
            CBEmgEvent.Checked = false;
            txt_Circum_Memo.Text = "";
            txt_Circum_Help_Request_Memo.Text = "";
            txt_AFDC_denial_memo.Text = "";
            txt_welfr_fraud_memo.Text = "";

        }

        protected void Clear_Pet_info()
        {
            TxtPetName.Text = "";
            TxtPetAge.Text = "";
            txtPetdesc.Text = "";
            DDL_PetType.ClearSelection();
            DDL_PetGender.ClearSelection();
            TxtPetColor.Text = "";
            TxtLiscTag.Text = "";
            TxtTatooNum.Text = "";
            DDL_Spay_neuter.ClearSelection();
            TxtPetChipID.Text = "";
            DDLPetStatus.ClearSelection();

            GVpetInfo.DataSource = "";
            GVpetInfo.DataBind();


        }

        protected void Clear_Income_info()
        {
            ddlHousingStatus.ClearSelection();
            ddlIncomeStatus.ClearSelection();
            ddlEmpStatus.ClearSelection();
            txt_Wages_Amt.Text = "";
            cbl_inc_src_wages.ClearSelection();
            txt_Strike_Benefits_Amt.Text = "";
            cbl_inc_StrikeBen.ClearSelection();
            txt_Pension_Amt.Text = "";
            cbl_inc_src_Pension.ClearSelection();
            txt_Support_Amt.Text = "";
            ddlSupport.ClearSelection();
            TxtutilallAmt.Text = "";
            TxtutilallDate.Text = "";
            ddlUtilall.ClearSelection();
            TxtFoodstmpAmt.Text = "";
            TxtFoodstmpDate.Text = "";
            ddlFoodstmp.ClearSelection();
            TxtAFDCAmt.Text = "";
            TxtAFDCDate.Text = "";
            ddlAFDC.ClearSelection();
            TxtTrustOffAmt.Text = "";
            TxtTrustOffDate.Text = "";
            ddlTrustOff.ClearSelection();
            txtssAmt.Text = "";
            txtssDate.Text = "";
            ddlSS.ClearSelection();
            txtVAAmt.Text = "";
            txtVADate.Text = "";
            ddlVA.ClearSelection();
            txtEAPAmt.Text = "";
            txtEAPDate.Text = "";
            ddlEAP.ClearSelection();
            TxtFemaAmt.Text = "";
            TxtFEMADate.Text = "";
            ddlFema.ClearSelection();
            txtUnemplAmt.Text = "";
            txtUnemplDate.Text = "";
            ddlUnemployment.ClearSelection();
            txtGrantLoanAmt.Text = "";
            txtGrantLoanDate.Text = "";
            ddlGrantloan.ClearSelection();
            TxtotherhelpAmt.Text = "";
            TxtotherhelpDate.Text = "";
            ddlOtherhelp.ClearSelection();
            ddl_Life_Ins.ClearSelection();
            ddl_Investments.ClearSelection();
            ddl_Cash_on_Hand.ClearSelection();
            txt_Cash_Amt.Text = "";
            txt_Ckg_Balance.Text = "";
            txt_Ckg_Bank.Text = "";
            ddl_Ckg_Acct.ClearSelection();
            txt_Svgs_Balance.Text = "";
            txt_Svgs_Bank.Text = "";
            ddl_Svgs_Acct.ClearSelection();
            ddl_Claims.ClearSelection();
            txt_Claims_Memo.Text = "";

        }

        protected void Clear_Employer_info()
        {
            TxtEmplr_Name.Text = "";
            TxtEmplr_Phone.Text = "";
            txtempr_str_addr.Text = "";
            Txtempr_str_addr2.Text = "";
            txtempr_city.Text = "";
            ddlempr_st.ClearSelection();
            txtempr_zip.Text = "";
            TxtEmpr_Country.Text = "";
            Txtempr_CountyTownship.Text = "";
            TxtEmpSrtDate.Text = "";
            TxtEmpEndDate.Text = "";
            TxtTermReas.Text = "";

        }

        protected void Clear_Expense_info()
        {
            txt_Mtg_Amt_Owed_Today.Text = "";
            txt_Electric_Amt_Owed_Today.Text = "";
            txt_Gas_or_Heating_Amt_Owed_Today.Text = "";
            txt_Water_Amt_Owed_Today.Text = "";
            txt_Cable_Amt_Owed_Today.Text = "";
            txt_Telephone_Amt_Owed_Today.Text = "";
            txt_Sewage_Amt_Owed_Today.Text = "";
            txt_Trash_Removal_Amt_Owed_Today.Text = "";

            txt_Expense_Amt_Paid.Text = "";
            txt_Expense_Amt_Paid_To.Text = "";
            txt_Date_Paid.Text = "";

            Gvpayment.DataSource = "";
            Gvpayment.DataBind();

        }

        protected void Clear_Vehicale_info()
        {
            ddl_v_type.ClearSelection();
            txt_v_year.Text = "";
            Txt_v_model.Text = "";
            Txt_v_Make.Text = "";
            txt_v_Vin.Text = "";
            Txt_v_Plate.Text = "";
            ddl_V_ins.ClearSelection();
            Txt_v_desc.Text = "";

            GVVehicle.DataSource = "";
            GVVehicle.DataBind();
        }

        protected void Clear_Military_info()
        {

            TxtMilbranch.Text = "";
            Txtmilserialnum.Text = "";
            TxtmilEnlistdATE.Text = "";
            TxtmildschrgDate.Text = "";

        }

        protected void Clear_Debt_info()
        {
            Txt_Creditor_Name.Text = "";
            Txt_debt_amount.Text = "";
            Txt_item.Text = "";
            Txt_lst_pymnt_date.Text = "";
            Txt_Purch_date.Text = "";
            Txt_value.Text = "";

            GVDebt.DataSource = "";
            GVDebt.DataBind();
        }

        protected void Set_Visa_Type()
        {
            clientperson.Visa_Selected_Value_B_2 = 0;
            clientperson.Visa_Selected_Value_B1 = 0;
            clientperson.Visa_Selected_Value_B2 = 0;
            clientperson.Visa_Selected_Value_F1 = 0;
            clientperson.Visa_Selected_Value_H_1B = 0;
            clientperson.Visa_Selected_Value_H_2B = 0;
            clientperson.Visa_Selected_Value_H4 = 0;
            clientperson.Visa_Selected_Value_J1 = 0;
            clientperson.Visa_Selected_Value_K1 = 0;
            clientperson.Visa_Selected_Value_K3 = 0;
            clientperson.Visa_Selected_Value_L1 = 0;
            clientperson.Visa_Selected_Value_L2 = 0;
            clientperson.Visa_Selected_Value_M1 = 0;

            switch (ddl_visaTypes.SelectedValue.ToString())
            {
                case "B1":
                    {
                        clientperson.Visa_Selected_Value_B1 = 1;
                        return;
                    }
                case "B_2":
                    {
                        clientperson.Visa_Selected_Value_B_2 = 1;
                        return;
                    }
                case "B2":
                    {
                        clientperson.Visa_Selected_Value_B2 = 1;
                        return;
                    }
                case "F1":
                    {
                        clientperson.Visa_Selected_Value_F1 = 1;
                        return;
                    }
                case "HB1":
                    {
                        clientperson.Visa_Selected_Value_H_1B = 1;
                        return;
                    }
                case "H2B":
                    {
                        clientperson.Visa_Selected_Value_H_2B = 1;
                        return;
                    }
                case "H4":
                    {
                        clientperson.Visa_Selected_Value_H4 = 1;
                        return;
                    }
                case "J1":
                    {
                        clientperson.Visa_Selected_Value_J1 = 1;
                        return;
                    }
                case "K1":
                    {
                        clientperson.Visa_Selected_Value_K1 = 1;
                        return;
                    }
                case "K3":
                    {
                        clientperson.Visa_Selected_Value_K3 = 1;
                        return;
                    }
                case "L1":
                    {
                        clientperson.Visa_Selected_Value_L1 = 1;
                        return;
                    }
                case "M1":
                    {
                        clientperson.Visa_Selected_Value_M1 = 1;
                        return;
                    }
                case "L2":
                    {
                        clientperson.Visa_Selected_Value_L2 = 1;
                        return;
                    }
                default:
                    {
                        return;
                    }
            }
        }

        protected void Save_Client_information()
        {
            decimal[] add1cord = new decimal[2];
            decimal[] add2cord = new decimal[2];

            clientperson.SetColumnDefaults();
            clientAddress.SetColumnDefaults();
            clientAddress2.SetColumnDefaults();
            client.SetColumnDefaults();

            clientperson.person_id = GlobalVariables.PersonID;
            clientperson.address_id = GlobalVariables.ClientAddressID;
            clientperson.address_id2 = GlobalVariables.ClientAddressID2;
            clientAddress.address_id = GlobalVariables.ClientAddressID;
            clientAddress2.address_id = GlobalVariables.ClientAddressID2;

            client.client_id = GlobalVariables.ClientID;
            client.Info_Field = null;

            clientperson.f_name = txt_F_Name.Text;
            clientperson.l_name = txt_L_Name.Text;
            clientperson.person_type = "C";
            clientperson.m_initial = txt_M_Initial.Text;
            clientperson.Maiden_Name = txt_Maiden_Name.Text;
            clientperson.gender = ddl_Gender.SelectedValue;
            clientperson.email = txt_email.Text;
            if (txt_SSN.Text != "")
            {
                clientperson.ssn = Convert.ToInt32(txt_SSN.Text);
            }
            clientperson.Driver_State_ID = txt_DrvLic.Text;
            if (txt_Birthdate.Text != "")
            {
                clientperson.birthdate = Convert.ToDateTime(txt_Birthdate.Text);
            }
            clientperson.phone_primary = txt_Phone_Primary.Text;
            clientperson.phone_secondary = txt_Phone_Secondary.Text;
            clientperson.Marital_Status = ddl_Marital_Status.SelectedValue.ToString();
            clientperson.Citizenship = ddl_CitizenShip.SelectedValue.ToString();
            Set_Visa_Type();
            if (TxtVisaIssDate.Text != "")
            {
                clientperson.Visa_Issue_Date = Convert.ToDateTime(TxtVisaIssDate.Text.ToString());
            }
            if (TxtVisaExpDate.Text != "")
            {
                clientperson.Visa_Expire_Date = Convert.ToDateTime(TxtVisaExpDate.Text.ToString());
            }
            if (TxtUSCISNum.Text != "")
            {
                clientperson.Perm_Resident_Alien_USCIS_number = Convert.ToInt32(TxtUSCISNum.Text);
            }
            if (TxtANumber.Text != "")
            {
                clientperson.Perm_Resident_Alien_A_number = Convert.ToInt32(TxtANumber.Text);
            }
            if (TxtresDate.Text != "")
            {
                clientperson.Perm_Resident_Alien_Resid_Date = Convert.ToDateTime(TxtresDate.Text);
            }
            if (TxtResExpDate.Text != "")
            {
                clientperson.Perm_Resident_Alien_Expire_Date = Convert.ToDateTime(TxtResExpDate.Text);
            }
            clientperson.Perm_Resident_Alien_Birth_Country = TxtCountryOfBirth.Text;
            clientperson.Perm_Resident_Alien_Category = TxtCategory.Text;

            clientAddress.address_type_id = 2;
            clientAddress.str_add = txtCurr_str_addr.Text;
            clientAddress.str_add2 = TxtCurr_str_addr2.Text;
            clientAddress.city = txtCurr_city.Text;
            clientAddress.state = ddlCurr_st.SelectedValue;
            clientAddress.zip_plus_four = txtCurr_zip.Text;
            clientAddress.country = TxtCurr_Country.Text;
            clientAddress.County_Township = TxtCurr_CountyTownship.Text;

            add1cord = GeoLocation.getCoordinates(clientAddress.str_add, clientAddress.str_add2, clientAddress.city, clientAddress.state, clientAddress.zip_plus_four, "DMCS");

            clientAddress.latitude = add1cord[0];
            clientAddress.longitude = add1cord[1];


            client.client_status = ddl_client_status.SelectedValue;

            if (clientAddress.address_id == 0)
            {
                clientAddress = clientAddress.Insert(clientAddress);
                clientperson.address_id = clientAddress.address_id;
            }
            else
            {
                clientAddress.Update(clientAddress);
            }

            if (txtPrev_city.Text != "" && TxtPrev_Country.Text != "" &&
               ddlPrev_st.SelectedValue != "" && txtPrev_str_addr.Text != "")
            {
                clientAddress2.address_type_id = 3;
                clientAddress2.str_add = txtPrev_str_addr.Text;
                clientAddress2.str_add2 = txtPrev_str_addr2.Text;
                clientAddress2.city = txtPrev_city.Text;
                clientAddress2.state = ddlPrev_st.SelectedValue;
                clientAddress2.zip_plus_four = txtPrev_zip.Text;
                clientAddress2.str_add2 = txtPrev_str_addr2.Text;
                clientAddress2.country = TxtPrev_Country.Text;
                clientAddress2.County_Township = TxtPrev_countyTownship.Text;

                add2cord = GeoLocation.getCoordinates(clientAddress2.str_add, clientAddress2.str_add2, clientAddress2.city, clientAddress2.state, clientAddress2.zip_plus_four, "DMCS");

                clientAddress2.latitude = add2cord[0];
                clientAddress2.longitude = add2cord[1];

                if (clientAddress2.address_id == 0)
                {
                    clientAddress2 = clientAddress2.Insert(clientAddress2);
                    clientperson.address_id2 = clientAddress2.address_id;
                }
                else
                {
                    clientAddress2.Update(clientAddress2);
                }

            }


            if (clientperson.person_id == 0)
            {
                clientperson = clientperson.Insert(clientperson);
            }
            else
            {
                clientperson.Update(clientperson);
            }

            if (client.client_id == 0)
            {
                client.client_id = clientperson.person_id;
                client = client.Insert(client);
            }
            else
            {
                client.Update(client);
            }

        }

        protected void Save_Case_information()
        {

            clientCase_intake.SetColumnDefaults();
            clientcase.SetColumnDefaults();

            clientCase_intake.circum_no_income = Convert.ToString(CbNoIncome.Checked);
            clientCase_intake.circum_not_enough_income = Convert.ToString(CbNotenoughIncome.Checked);
            clientCase_intake.circum_income_stolen = Convert.ToString(CbStolanincome.Checked);
            clientCase_intake.circum_emergency_event = Convert.ToString(CBEmgEvent.Checked);
            clientCase_intake.circum_memo = txt_Circum_Memo.Text;
            clientCase_intake.circum_help_request_memo = txt_Circum_Help_Request_Memo.Text;
            clientCase_intake.applic_start_date_time = DateTime.Now;
            clientCase_intake.applic_end_date_time = DateTime.MaxValue;
            clientCase_intake.call_center_id = Convert.ToInt32(DDL_Call_Center.SelectedValue);
            clientCase_intake.case_id = GlobalVariables.CaseID;
            clientcase.case_id = GlobalVariables.CaseID;
            clientcase.client_id = GlobalVariables.ClientID;
            clientcase.address_id = GlobalVariables.ClientAddressID;

            if (clientCase_intake.case_id == 0)
            {
                clientCase_intake = clientCase_intake.Insert(clientCase_intake);
            }
            else
            {
                clientCase_intake.Update(clientCase_intake);
            }



            clientcase.housing_status = ddlHousingStatus.SelectedValue;
            clientcase.income_status = ddlIncomeStatus.SelectedValue;
            clientcase.employment_status = ddlEmpStatus.SelectedValue;
            clientcase.welfr_fraud_memo = txt_welfr_fraud_memo.Text;
            clientcase.denial_memo = txt_AFDC_denial_memo.Text;

            if (TxtCurr_addr_date_ocup.Text != "")
            {
                clientcase.curr_residence_date = Convert.ToDateTime(TxtCurr_addr_date_ocup.Text);
            }

            if (TxtPrev_addr_date_ocup.Text != "")
            {
                clientcase.prev_residence_date = Convert.ToDateTime(TxtPrev_addr_date_ocup.Text);
            }

            if (TxtutilallAmt.Text != "")
            {
                clientcase.util_allot_amt = Convert.ToDecimal(TxtutilallAmt.Text);
            }

            if (TxtutilallDate.Text != "")
            {
                clientcase.util_allot_app_date = Convert.ToDateTime(TxtutilallDate.Text);
            }
            clientcase.utilities_incl = ddlUtilall.SelectedValue;

            if (TxtFoodstmpAmt.Text != "")
            {
                clientcase.fd_stmps_amt = Convert.ToDecimal(TxtFoodstmpAmt.Text);
            }

            if (TxtFoodstmpDate.Text != "")
            {
                clientcase.fd_stmps_app_date = Convert.ToDateTime(TxtFoodstmpDate.Text);
            }
            clientcase.fd_Inc = ddlFoodstmp.SelectedValue;

            if (TxtAFDCAmt.Text != "")
            {
                clientcase.afdc_amt = Convert.ToDecimal(TxtAFDCAmt.Text);
            }

            if (TxtAFDCDate.Text != "")
            {
                clientcase.afdc_app_date = Convert.ToDateTime(TxtAFDCDate.Text);
            }
            clientcase.afdc_Inc = ddlAFDC.SelectedValue;

            if (TxtTrustOffAmt.Text != "")
            {
                clientcase.oth_trustee_amt = Convert.ToDecimal(TxtTrustOffAmt.Text);
            }

            if (TxtTrustOffDate.Text != "")
            {
                clientcase.oth_trustee_app_date = Convert.ToDateTime(TxtTrustOffDate.Text);
            }
            clientcase.oth_trustee_Inc = ddlOtherhelp.SelectedValue;
            if (txtssAmt.Text != "")
            {
                clientcase.ss_amt = Convert.ToDecimal(txtssAmt.Text);
            }
            if (txtssDate.Text != "")
            {
                clientcase.ss_app_date = Convert.ToDateTime(txtssDate.Text);
            }
            clientcase.ss_Inc = ddlSS.SelectedValue;
            if (txtVAAmt.Text != "")
            {
                clientcase.va_amt = Convert.ToDecimal(txtVAAmt.Text);
            }
            if (TxtutilallDate.Text != "")
            {
                clientcase.va_app_date = Convert.ToDateTime(TxtutilallDate.Text);
            }
            clientcase.va_Inc = ddlVA.SelectedValue;
            if (txtEAPAmt.Text != "")
            {
                clientcase.eap_amt = Convert.ToDecimal(txtEAPAmt.Text);
            }
            if (txtEAPDate.Text != "")
            {
                clientcase.eap_app_date = Convert.ToDateTime(txtEAPDate.Text);
            }
            clientcase.eap_Inc = ddlEAP.SelectedValue;
            if (TxtFemaAmt.Text != "")
            {
                clientcase.fema_amt = Convert.ToDecimal(TxtFemaAmt.Text);
            }
            if (TxtFEMADate.Text != "")
            {
                clientcase.fema_app_date = Convert.ToDateTime(TxtFEMADate.Text);
            }
            clientcase.fema_Inc = ddlFema.SelectedValue;
            if (txtUnemplAmt.Text != "")
            {
                clientcase.unempl_amt = Convert.ToDecimal(txtUnemplAmt.Text);
            }
            if (txtUnemplDate.Text != "")
            {
                clientcase.unempl_app_date = Convert.ToDateTime(txtUnemplDate.Text);
            }
            clientcase.unempl_Inc = ddlUnemployment.SelectedValue;
            if (txtGrantLoanAmt.Text != "")
            {
                clientcase.grants_loans_amt = Convert.ToDecimal(txtGrantLoanAmt.Text);
            }
            if (txtGrantLoanDate.Text != "")
            {
                clientcase.grants_loans_app_date = Convert.ToDateTime(txtGrantLoanDate.Text);
            }
            clientcase.grants_Inc = ddlGrantloan.SelectedValue;
            if (TxtotherhelpAmt.Text != "")
            {
                clientcase.other_amt = Convert.ToDecimal(TxtotherhelpAmt.Text);
            }
            if (TxtotherhelpDate.Text != "")
            {
                clientcase.other_app_date = Convert.ToDateTime(TxtotherhelpDate.Text);
            }
            clientcase.other_Inc = ddlOtherhelp.SelectedValue;
            if (txt_Mtg_Amt_Owed_Today.Text != "")
            {
                clientcase.mtg_amt_owed_today = Convert.ToDecimal(txt_Mtg_Amt_Owed_Today.Text);
            }
            if (txt_Electric_Amt_Owed_Today.Text != "")
            {
                clientcase.electric_amt_owed_today = Convert.ToDecimal(txt_Electric_Amt_Owed_Today.Text);
            }
            if (txt_Gas_or_Heating_Amt_Owed_Today.Text != "")
            {
                clientcase.gas_or_heating_amt_owed_today = Convert.ToDecimal(txt_Gas_or_Heating_Amt_Owed_Today.Text);
            }
            if (txt_Water_Amt_Owed_Today.Text != "")
            {
                clientcase.water_amt_owed_today = Convert.ToDecimal(txt_Water_Amt_Owed_Today.Text);
            }
            if (txt_Cable_Amt_Owed_Today.Text != "")
            {
                clientcase.cable_amt_owed_today = Convert.ToDecimal(txt_Cable_Amt_Owed_Today.Text);
            }
            if (txt_Telephone_Amt_Owed_Today.Text != "")
            {
                clientcase.telephone_amt_owed_today = Convert.ToDecimal(txt_Telephone_Amt_Owed_Today.Text);
            }
            if (txt_Sewage_Amt_Owed_Today.Text != "")
            {
                clientcase.sewage_amt_owed_today = Convert.ToDecimal(txt_Sewage_Amt_Owed_Today.Text);
            }
            if (txt_Trash_Removal_Amt_Owed_Today.Text != "")
            {
                clientcase.trash_removal_amt_owed_today = Convert.ToDecimal(txt_Trash_Removal_Amt_Owed_Today.Text);
            }


            if (clientcase.case_id == 0 && clientcase.client_id == 0)
            {
                clientcase.client_id = clientperson.person_id;
                clientcase.case_id = clientCase_intake.case_id;
                clientcase.address_id = clientAddress.address_id;
                clientcase = clientcase.Insert(clientcase);
            }
            else
            {
                clientcase.Update(clientcase);
            }


        }

        protected void Save_pets_info()
        {

            CLWPets.Client_id = client.client_id;

            foreach (GridViewRow rows in GVpetInfo.Rows)
            {
                if (rows.Cells[1].Text != null && rows.Cells[1].Text != "&nbsp;")
                {
                    clientPets.Pet_Name = rows.Cells[1].Text;
                }
                else
                {
                    clientPets.Pet_Name = null;
                }

                if (rows.Cells[2].Text != null && rows.Cells[2].Text != "&nbsp;")
                {
                    clientPets.Pet_Date_Of_Birth = Convert.ToDateTime(rows.Cells[2].Text);
                }
                else
                {
                    clientPets.Pet_Date_Of_Birth = Convert.ToDateTime("1/1/1");
                }

                if (rows.Cells[3].Text != null && rows.Cells[3].Text != "&nbsp;")
                {
                    clientPets.Pet_Description = rows.Cells[3].Text;
                }
                else
                {
                    clientPets.Pet_Description = null;
                }

                if (rows.Cells[4].Text != null && rows.Cells[4].Text != "&nbsp;")
                {
                    clientPets.Pet_Type_ID = Convert.ToInt32(rows.Cells[4].Text);
                }
                else
                {
                    clientPets.Pet_Type_ID = 0;
                }

                if (rows.Cells[5].Text != null && rows.Cells[5].Text != "&nbsp;")
                {
                    clientPets.Pet_Gender = rows.Cells[5].Text;
                }
                else
                {
                    clientPets.Pet_Gender = null;
                }

                if (rows.Cells[6].Text != null && rows.Cells[6].Text != "&nbsp;")
                {
                    clientPets.Pet_Color = rows.Cells[6].Text;
                }
                else
                {
                    clientPets.Pet_Color = null;
                }

                if (rows.Cells[7].Text != null && rows.Cells[7].Text != "&nbsp;")
                {
                    clientPets.Pet_License_Tag = rows.Cells[7].Text;
                }
                else
                {
                    clientPets.Pet_License_Tag = null;
                }

                if (rows.Cells[8].Text != null && rows.Cells[8].Text != "&nbsp;")
                {
                    clientPets.Pet_Tatoo_No = rows.Cells[8].Text;
                }
                else
                {
                    clientPets.Pet_Tatoo_No = null;
                }

                if (rows.Cells[9].Text != null && rows.Cells[9].Text != "&nbsp;")
                {
                    clientPets.Pet_Sterilized = rows.Cells[9].Text;
                }
                else
                {
                    clientPets.Pet_Sterilized  = null;
                }


                if (rows.Cells[11].Text != null && rows.Cells[11].Text != "&nbsp;")
                {
                    //clientPets.Pet_Status = rows.Cells[11].Text;
                }
                else
                {
                    //clientPets.Pet_Status = null;
                }


                if (rows.Cells[12].Text != null && rows.Cells[12].Text != "&nbsp;")
                {
                    //clientPets.Pet_Chip_ID = rows.Cells[12].Text;
                }
                else
                {
                    //clientPets.Pet_Chip_ID = null;
                }

                if (rows.Cells[10].Text == null || rows.Cells[10].Text == "&nbsp;")
                {
                    clientPets.Date_Created = DateTime.Now;
                    clientPets.Date_Modified = DateTime.Now;
                    clientPets = clientPets.Insert(clientPets);
                    //CLWPets.Pet_id = clientPets.Pet_Record_ID;

                    CLWPets = CLWPets.Insert(CLWPets);

                }
                else
                {
                    clientPets.Date_Modified = DateTime.Now;
                    clientPets.Pet_Record_ID = Convert.ToInt32((rows.Cells[10].Text));
                    clientPets.Update(clientPets);
                }
            }

        }

        protected void Save_Income_info()
        {

            clientincome.income_source_id = GlobalVariables.IncomeSourceID;

            if (txt_Wages_Amt.Text != "")
            {
                clientincome.wages_amt = Convert.ToDecimal(txt_Wages_Amt.Text);
            }
            else
            {
                clientincome.wages_amt = 0;
            }
            clientincome.wages_inc = cbl_inc_src_wages.SelectedValue;

            if (txt_Pension_Amt.Text != "")
            {
                clientincome.pension_amt = Convert.ToDecimal(txt_Pension_Amt.Text);
            }
            else
            {
                clientincome.pension_amt = 0;
            }
            clientincome.pension_inc = cbl_inc_src_Pension.SelectedValue;

            if (txt_Strike_Benefits_Amt.Text != "")
            {
                clientincome.strike_benefits_amt = Convert.ToDecimal(txt_Strike_Benefits_Amt.Text);
            }
            else
            {
                clientincome.strike_benefits_amt = 0;
            }
            clientincome.strike_benefits_inc = cbl_inc_StrikeBen.SelectedValue;

            if (txt_Support_Amt.Text != "")
            {
                clientincome.support_amt = Convert.ToDecimal(txt_Support_Amt.Text);
            }
            else
            {
                clientincome.support_amt = 0;
            }

            clientincome.support_inc = ddlSupport.SelectedValue;
            clientincome.life_ins = ddl_Life_Ins.SelectedValue;
            clientincome.investments = ddl_Investments.SelectedValue;
            clientincome.cash_on_hand = ddl_Cash_on_Hand.SelectedValue;
            if (txt_Cash_Amt.Text != "")
            {
                clientincome.cash_amt = Convert.ToDecimal(txt_Cash_Amt.Text);
            }
            else
            {
                clientincome.cash_amt = 0;
            }

            if (txt_Ckg_Balance.Text != "")
            {
                clientincome.ckg_balance = Convert.ToDecimal(txt_Ckg_Balance.Text);
            }
            else
            {
                clientincome.ckg_balance = 0;
            }
            clientincome.ckg_bank = txt_Ckg_Bank.Text;
            clientincome.ckg_acct = ddl_Ckg_Acct.SelectedValue;

            if (txt_Svgs_Balance.Text != "")
            {
                clientincome.svgs_balance = Convert.ToDecimal(txt_Svgs_Balance.Text);
            }
            else
            {
                clientincome.svgs_balance = 0;
            }
            clientincome.svgs_bank = txt_Svgs_Bank.Text;
            clientincome.svgs_acct = ddl_Svgs_Acct.SelectedValue;
            clientincome.claims = ddl_Claims.SelectedValue;
            clientincome.claims_memo = txt_Claims_Memo.Text;
            clientincome.client_id = GlobalVariables.ClientID;
            clientincome.case_id = GlobalVariables.CaseID;

            if (clientincome.income_source_id == 0)
            {
                clientincome.client_id = clientperson.person_id;
                clientincome.case_id = clientCase_intake.case_id;
                clientincome = clientincome.Insert(clientincome);
            }
            else
            {
                clientincome.Update(clientincome);
            }

        }

        protected void Save_Employer_info()
        {
            decimal[] emplradd = new decimal[2];

            clientEmplrAddress.address_id = GlobalVariables.EmplrAddressID;
            clientemployer.emplr_id = GlobalVariables.EmployerID;

            clientEmplrAddress.address_type_id = 2;
            clientEmplrAddress.str_add = txtempr_str_addr.Text;
            clientEmplrAddress.str_add2 = Txtempr_str_addr2.Text;
            clientEmplrAddress.city = txtempr_city.Text;
            clientEmplrAddress.state = ddlempr_st.SelectedValue;
            clientEmplrAddress.zip_plus_four = txtempr_zip.Text;
            clientEmplrAddress.country = TxtEmpr_Country.Text;
            clientEmplrAddress.County_Township = Txtempr_CountyTownship.Text;

            emplradd = GeoLocation.getCoordinates(clientEmplrAddress.str_add, clientEmplrAddress.str_add2, clientEmplrAddress.city, clientEmplrAddress.state, clientEmplrAddress.zip_plus_four, "DMCS");

            clientEmplrAddress.latitude = emplradd[0];
            clientEmplrAddress.longitude = emplradd[1];

            if (clientEmplrAddress.address_id == 0)
            {
                clientEmplrAddress = clientEmplrAddress.Insert(clientEmplrAddress);
            }
            else
            {
                clientEmplrAddress.Update(clientEmplrAddress);
            }

            clientemployer.address_id = clientEmplrAddress.address_id;
            clientemployer.case_id = clientCase_intake.case_id;
            clientemployer.client_id = client.client_id;
            clientemployer.emplr_name = TxtEmplr_Name.Text;
            clientemployer.emplr_phone = TxtEmplr_Phone.Text;
            if (TxtEmpSrtDate.Text != "")
            {
                clientemployer.strt_date = Convert.ToDateTime(TxtEmpSrtDate.Text);
            }


            if (TxtEmpEndDate.Text != "")
            {
                clientemployer.end_date = Convert.ToDateTime(TxtEmpEndDate.Text);
            }
            else
            {
                clientemployer.end_date = Convert.ToDateTime("9/9/9999");
            }

            clientemployer.term_reason = TxtTermReas.Text;

            if (clientemployer.emplr_id == 0)
            {
                clientemployer = clientemployer.Insert(clientemployer);
            }
            else
            {
                clientemployer.Update(clientemployer);
            }

        }

        protected void Save_client_Expenses()
        {

            clientexpense.case_id = clientCase_intake.case_id;
            clientexpense.client_id = clientperson.person_id;

            foreach (GridViewRow rows in Gvpayment.Rows)
            {
                if (rows.Cells[1].Text != null && rows.Cells[1].Text != "&nbsp;")
                {
                    clientexpense.date_paid = Convert.ToDateTime(rows.Cells[1].Text);
                }
                else
                {
                    clientexpense.date_paid = DateTime.Now;
                }

                if (rows.Cells[2].Text != null && rows.Cells[2].Text != "&nbsp;")
                {
                    clientexpense.expense_amt_paid = Convert.ToDecimal(rows.Cells[2].Text);
                }
                else
                {
                    clientexpense.expense_amt_paid = 0;
                }

                if (rows.Cells[3].Text != null && rows.Cells[3].Text != "&nbsp;")
                {
                    clientexpense.expense_amt_paid_to = rows.Cells[3].Text;
                }
                else
                {
                    clientexpense.expense_amt_paid_to = null;
                }

                if (rows.Cells[4].Text == null || rows.Cells[4].Text == "&nbsp;")
                {
                    clientexpense = clientexpense.Insert(clientexpense);
                }
                else
                {
                    clientexpense.expense_id = Convert.ToInt32(rows.Cells[4].Text);
                    clientexpense.Update(clientexpense);
                }
            }


        }

        protected void Save_Vehicles_info()
        {
            clientvehicle.client_id = clientperson.person_id;
            clientvehicle.case_id = clientCase_intake.case_id;
            clientvehicle.FUELTYPE = "0";
            clientvehicle.MPH = 0;

            foreach (GridViewRow rows in GVVehicle.Rows)
            {

                if (rows.Cells[1].Text != null && rows.Cells[1].Text != "&nbsp;")
                {
                    clientvehicle.vehicle_type = rows.Cells[1].Text;
                }
                else
                {
                    clientvehicle.vehicle_type = null;
                }

                if (rows.Cells[2].Text != null && rows.Cells[2].Text != "&nbsp;")
                {
                    clientvehicle.vehicle_make = rows.Cells[2].Text;
                }
                else
                {
                    clientvehicle.vehicle_make = null;
                }

                if (rows.Cells[3].Text != null && rows.Cells[3].Text != "&nbsp;")
                {
                    clientvehicle.vehicle_model = rows.Cells[3].Text;
                }
                else
                {
                    clientvehicle.vehicle_model = null;
                }

                if (rows.Cells[4].Text != null && rows.Cells[4].Text != "&nbsp;")
                {
                    clientvehicle.vehicle_year = Convert.ToInt32(rows.Cells[4].Text);
                }
                else
                {
                    clientvehicle.vehicle_year = 0;
                }

                if (rows.Cells[5].Text != null && rows.Cells[5].Text != "&nbsp;")
                {
                    clientvehicle.vin = rows.Cells[5].Text;
                }
                else
                {
                    clientvehicle.vin = null;
                }

                if (rows.Cells[6].Text != null && rows.Cells[6].Text != "&nbsp;")
                {
                    clientvehicle.PLATENUMBER = rows.Cells[6].Text;
                }
                else
                {
                    clientvehicle.PLATENUMBER = null;
                }

                if (rows.Cells[7].Text != null && rows.Cells[7].Text != "&nbsp;")
                {
                    clientvehicle.INSURED = rows.Cells[7].Text;
                }
                else
                {
                    clientvehicle.INSURED = null;
                }

                if (rows.Cells[8].Text != null && rows.Cells[8].Text != "&nbsp;")
                {
                    clientvehicle.vehicle_desc = rows.Cells[8].Text;
                }
                else
                {
                    clientvehicle.vehicle_desc = null;
                }

                clientvehicle.first_service_date = Convert.ToDateTime("09/09/9999");
                clientvehicle.last_service_date = Convert.ToDateTime("09/09/9999");

                if (rows.Cells[9].Text == null || rows.Cells[9].Text == "&nbsp;")
                {
                    clientvehicle = clientvehicle.Insert(clientvehicle);
                }
                else
                {
                    clientvehicle.vehicle_id = Convert.ToInt32(rows.Cells[9].Text);
                    clientvehicle.Update(clientvehicle);
                }

            }

        }

        protected void Save_military_info()
        {
            clientMilitary.military_branch = TxtMilbranch.Text;
            clientMilitary.serial_num = Convert.ToInt32(Txtmilserialnum.Text);

            clientMilitary.military_id = GlobalVariables.MilitaryID;

            if (TxtmilEnlistdATE.Text != "")
            {
                clientMilitary.enlistment_date = Convert.ToDateTime(TxtmilEnlistdATE.Text);
            }
            else
            {
                clientMilitary.enlistment_date = Convert.ToDateTime("9/9/9999");
            }

            if (TxtmildschrgDate.Text != "")
            {
                clientMilitary.discharge_date = Convert.ToDateTime(TxtmildschrgDate.Text);
            }
            else
            {
                clientMilitary.discharge_date = Convert.ToDateTime("9/9/9999");
            }

            clientMilitary.client_id = clientperson.person_id;
            clientMilitary.case_id = clientCase_intake.case_id;

            if (clientMilitary.military_id == 0)
            {
                clientMilitary = clientMilitary.Insert(clientMilitary);
            }
            else
            {
                clientMilitary.Update(clientMilitary);
            }
        }

        protected void Save_Debt_info()
        {
            clientdebt.client_id = clientperson.person_id;
            clientdebt.case_id = clientCase_intake.case_id;

            foreach (GridViewRow rows in GVDebt.Rows)
            {

                if (rows.Cells[1].Text != null && rows.Cells[1].Text != "&nbsp;")
                {
                    clientdebt.creditor_name = rows.Cells[1].Text;
                }
                else
                {
                    clientdebt.creditor_name = null;
                }

                if (rows.Cells[2].Text != null && rows.Cells[2].Text != "&nbsp;")
                {
                    clientdebt.amt_paid = Convert.ToDecimal(rows.Cells[2].Text);
                }
                else
                {
                    clientdebt.amt_paid = 0;
                }

                if (rows.Cells[3].Text != null && rows.Cells[3].Text != "&nbsp;")
                {
                    clientdebt.item_purchased = rows.Cells[3].Text;
                }
                else
                {
                    clientdebt.item_purchased = null;
                }

                if (rows.Cells[4].Text != null && rows.Cells[4].Text != "&nbsp;")
                {
                    clientdebt.last_payment_date = Convert.ToDateTime(rows.Cells[4].Text);
                }
                else
                {
                    clientdebt.last_payment_date = DateTime.Now;
                }
                if (rows.Cells[5].Text != null && rows.Cells[5].Text != "&nbsp;")
                {
                    clientdebt.purchase_date = Convert.ToDateTime(rows.Cells[5].Text);
                }
                else
                {
                    clientdebt.purchase_date = DateTime.Now;
                }
                if (rows.Cells[6].Text != null && rows.Cells[6].Text != "&nbsp;")
                {
                    clientdebt.value_amt = Decimal.Round(Convert.ToDecimal(rows.Cells[6].Text), 0);
                }
                else
                {
                    clientdebt.value_amt = 0;
                }


                if (rows.Cells[7].Text == null || rows.Cells[7].Text == "&nbsp;")
                {
                    clientdebt = clientdebt.Insert(clientdebt);
                }
                else
                {
                    clientdebt.debt_id = Convert.ToInt32(rows.Cells[7].Text);
                    clientdebt.Update(clientdebt);
                }

            }
        }

        protected void Save_Disaster_Enconter_info()
        {
            clientencounter.case_id = GlobalVariables.CaseID;
            clientencounter.client_id = GlobalVariables.ClientID;
            clientencounter.encounter_id = GlobalVariables.EncounterID;

            clientencounter.call_center_id = Convert.ToInt32(DDL_Call_Center.SelectedValue);
            clientencounter.create_date = DateTime.Now;
            clientencounter.close_date = Convert.ToDateTime("9/9/9999");

            EncCallCenter = EncCallCenter.Select(clientencounter.call_center_id);

            if (clientencounter.encounter_id == 0)
            {
                clientencounter = clientencounter.Insert(clientencounter);
            }
            else
            {
                clientencounter.Update(clientencounter);
            }

            disasterEncounter.disaster_id = Convert.ToInt32(DDlDisasters.SelectedValue);
            GlobalVariables.DisasterID = disasterEncounter.disaster_id;
            disasterEncounter.encounter_id = clientencounter.encounter_id;
            GlobalVariables.EncounterID = clientencounter.encounter_id;
            //disasterEncounter.address_id = EncCallCenter.address_id;

            if (disasterEncounter.disaster_encounter_id == 0)
            {
                disasterEncounter = disasterEncounter.Insert(disasterEncounter);
            }
            else
            {
                disasterEncounter.Update(disasterEncounter);
            }
        }
        
      
    }
}