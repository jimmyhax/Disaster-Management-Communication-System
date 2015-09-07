using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class propertyClass : System.Web.UI.Page
    {
        public property property = new property();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            property = property_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            property = property_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            property = property_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public property property_selectForInsert(int ID)
        {
            property = property.Select(ID);
            approx_mrkt_value_Insert_TextBox.Text = Convert.ToString(property.approx_mrkt_value);
            address_id_Insert_TextBox.Text = Convert.ToString(property.address_id);
            case_id_Insert_TextBox.Text = Convert.ToString(property.case_id);
            client_id_Insert_TextBox.Text = Convert.ToString(property.client_id);
            Homeowners_Insurance_Payment_Insert_TextBox.Text = Convert.ToString(property.Homeowners_Insurance_Payment);
            monthly_property_payment_Insert_TextBox.Text = Convert.ToString(property.monthly_property_payment);
            mortg_comp_Insert_TextBox.Text = Convert.ToString(property.mortg_comp);
            Property_Tax_Payment_Insert_TextBox.Text = Convert.ToString(property.Property_Tax_Payment);
            own_prop_Insert_TextBox.Text = Convert.ToString(property.own_prop);
            rent_prop_Insert_TextBox.Text = Convert.ToString(property.rent_prop);
            date_purchased_Insert_TextBox.Text = Convert.ToString(property.date_purchased);
            return property;
        }
        public property property_selectForUpdate(int ID)
        {
            property = property.Select(ID);
            property_id_Update_TextBox.Text = Convert.ToString(property.property_id);
            approx_mrkt_value_Update_TextBox.Text = Convert.ToString(property.approx_mrkt_value);
            address_id_Update_TextBox.Text = Convert.ToString(property.address_id);
            case_id_Update_TextBox.Text = Convert.ToString(property.case_id);
            client_id_Update_TextBox.Text = Convert.ToString(property.client_id);
            Homeowners_Insurance_Payment_Update_TextBox.Text = Convert.ToString(property.Homeowners_Insurance_Payment);
            monthly_property_payment_Update_TextBox.Text = Convert.ToString(property.monthly_property_payment);
            mortg_comp_Update_TextBox.Text = Convert.ToString(property.mortg_comp);
            Property_Tax_Payment_Update_TextBox.Text = Convert.ToString(property.Property_Tax_Payment);
            own_prop_Update_TextBox.Text = Convert.ToString(property.own_prop);
            rent_prop_Update_TextBox.Text = Convert.ToString(property.rent_prop);
            date_purchased_Update_TextBox.Text = Convert.ToString(property.date_purchased);
            return property;
        }
        public property property_selectForDelete(int ID)
        {
            property = property.Select(ID);
            property_id_Delete_TextBox.Text = Convert.ToString(property.property_id);
            approx_mrkt_value_Delete_TextBox.Text = Convert.ToString(property.approx_mrkt_value);
            address_id_Delete_TextBox.Text = Convert.ToString(property.address_id);
            case_id_Delete_TextBox.Text = Convert.ToString(property.case_id);
            client_id_Delete_TextBox.Text = Convert.ToString(property.client_id);
            Homeowners_Insurance_Payment_Delete_TextBox.Text = Convert.ToString(property.Homeowners_Insurance_Payment);
            monthly_property_payment_Delete_TextBox.Text = Convert.ToString(property.monthly_property_payment);
            mortg_comp_Delete_TextBox.Text = Convert.ToString(property.mortg_comp);
            Property_Tax_Payment_Delete_TextBox.Text = Convert.ToString(property.Property_Tax_Payment);
            own_prop_Delete_TextBox.Text = Convert.ToString(property.own_prop);
            rent_prop_Delete_TextBox.Text = Convert.ToString(property.rent_prop);
            date_purchased_Delete_TextBox.Text = Convert.ToString(property.date_purchased);
            return property;
        }
        //Database CRUD Call Functions
        public property property_insert()
        {
            property.approx_mrkt_value = Convert.ToDecimal(approx_mrkt_value_Insert_TextBox.Text);
            property.address_id = Convert.ToInt32(address_id_Insert_TextBox.Text);
            property.case_id = Convert.ToInt32(case_id_Insert_TextBox.Text);
            property.client_id = Convert.ToInt32(client_id_Insert_TextBox.Text);
            property.Homeowners_Insurance_Payment = Convert.ToDecimal(Homeowners_Insurance_Payment_Insert_TextBox.Text);
            property.monthly_property_payment = Convert.ToDecimal(monthly_property_payment_Insert_TextBox.Text);
            property.mortg_comp = mortg_comp_Insert_TextBox.Text;
            property.Property_Tax_Payment = Convert.ToDecimal(Property_Tax_Payment_Insert_TextBox.Text);
            property.own_prop = own_prop_Insert_TextBox.Text;
            property.rent_prop = rent_prop_Insert_TextBox.Text;
            property.date_purchased = Convert.ToInt32(date_purchased_Insert_TextBox.Text);
            property = property.Insert(property);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return property;
        }
        public property property_update(int ID)
        {
            property = property.Select(ID);
            property.property_id = Convert.ToInt32(Update_GridView.SelectedValue);
            property.approx_mrkt_value = Convert.ToDecimal(approx_mrkt_value_Update_TextBox.Text);
            property.address_id = Convert.ToInt32(address_id_Update_TextBox.Text);
            property.case_id = Convert.ToInt32(case_id_Update_TextBox.Text);
            property.client_id = Convert.ToInt32(client_id_Update_TextBox.Text);
            property.Homeowners_Insurance_Payment = Convert.ToDecimal(Homeowners_Insurance_Payment_Update_TextBox.Text);
            property.monthly_property_payment = Convert.ToDecimal(monthly_property_payment_Update_TextBox.Text);
            property.mortg_comp = mortg_comp_Update_TextBox.Text;
            property.Property_Tax_Payment = Convert.ToDecimal(Property_Tax_Payment_Update_TextBox.Text);
            property.own_prop = own_prop_Update_TextBox.Text;
            property.rent_prop = rent_prop_Update_TextBox.Text;
            property.date_purchased = Convert.ToInt32(date_purchased_Update_TextBox.Text);
            property.Update(property);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return property;
        }
        public void property_delete(int ID)
        {
            property.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            property = property_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            property = property_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            property_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

