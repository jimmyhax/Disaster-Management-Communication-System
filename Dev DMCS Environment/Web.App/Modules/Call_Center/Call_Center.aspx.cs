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

namespace Web.App.Modules.Call_Center
{
    public partial class Call_Center : System.Web.UI.Page
    {

        public address clientAddress = new address();
        public address clientAddress2 = new address();
        public address clientEmplrAddress = new address();
        //public case_client clientcase = new case_client();
        //public military clientMilitary = new military();
        //public client client = new client();
        //public person clientperson = new person();
        //public debt clientdebt = new debt();
        //public expense clientexpense = new expense();
        //public income_source clientincome = new income_source();
        //public vehicle clientvehicle = new vehicle();
        //public case_intake clientCase_intake = new case_intake();
        //public disaster casedisaster = new disaster();
        //public disaster_encounter disasterEncounter = new disaster_encounter();
        //public encounter clientencounter = new encounter();
        //public Pet clientPets = new Pet();
        //public employer clientemployer = new employer();
        //public call_center EncCallCenter = new call_center();
        //public ClientWPets CLWPets = new ClientWPets();

        protected void Page_Load(object sender, EventArgs e) { }

        protected void BtnNameSearch_Click(object sender, EventArgs e) { }

        protected void gvClientSearchresult_SelectedIndexChanged(object sender, EventArgs e) { }

        protected void gvClientSearchresult_PageIndexChanging(object sender, GridViewPageEventArgs e) { }

        protected void refreshcase() { }

        protected void refreshclient() { }

        protected void GVcases_SelectedIndexChanged(object sender, EventArgs e) { }

        protected void GVcases_PageIndexChanging(object sender, GridViewPageEventArgs e) { }

        protected void BtnPaymntSave_Click(object sender, EventArgs e) { }

        protected void Gvpayment_RowDeleting(object sender, GridViewDeleteEventArgs e) { }

        protected void BtnAddVeh_Click(object sender, EventArgs e) { }

        protected void GVVehicle_RowDeleting(object sender, GridViewDeleteEventArgs e) { }

        protected void BtnAddPets_Click(object sender, EventArgs e) { }

        protected void GVpetInfo_RowDeleting(object sender, GridViewDeleteEventArgs e) { }

        protected void BtnAddDebt_Click(object sender, EventArgs e) { }

        protected void GVDebt_RowDeleting(object sender, GridViewDeleteEventArgs e) { }

        protected void BtnSave_Click(object sender, EventArgs e) { }

        protected void BtnClose_Click(object sender, EventArgs e) { }

        protected void BtnBack_Click(object sender, EventArgs e) { }

        protected void fill_Client_information() { }

        protected void get_visa_type() { }

        protected void fill_Case_information() { }

        protected void fill_pet_info() { }

        protected void fill_employer_info() { }

        protected void fill_Income_info() { }

        protected void Fill_Expense_info() { }

        protected void Fill_vehicle_info() { }

        protected void Fill_Debt_info() { }

        protected void fill_military_info() { }

        protected void fill_Disaster_encouter() { }

        private void Create_case() { }

        protected void BtnClear_Click(object sender, EventArgs e) { }

        private void Clear_Client_information() { }

        protected void Clear_Case_information() { }

        protected void Clear_Pet_info() { }

        protected void Clear_Income_info() { }

        protected void Clear_Employer_info() { }

        protected void Clear_Expense_info() { }

        protected void Clear_Vehicale_info() { }

        protected void Clear_Military_info() { }

        protected void Clear_Debt_info() { }

        protected void Set_Visa_Type() { }

        protected void Save_Client_information() { }

        protected void Save_Case_information() { }

        protected void Save_pets_info() { }

        protected void Save_Income_info() { }

        protected void Save_Employer_info() { }

        protected void Save_client_Expenses() { }

        protected void Save_Vehicles_info() { }

        protected void Save_military_info() { }

        protected void Save_Debt_info() { }

        protected void Save_Disaster_Enconter_info() { }


    }
}