using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Web.App
{
    public partial class productsClass : System.Web.UI.Page
    {
        public products products = new products();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
            
            }
        }

        protected void Insert_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            products = products_selectForInsert(Convert.ToInt32(Insert_GridView.SelectedValue));
        }
        protected void Update_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            products = products_selectForUpdate(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_GridView_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            products = products_selectForDelete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        //Create Object Functions
        public products products_selectForInsert(int ID)
        {
            products = products.Select(ID);
            Resource_ID_Insert_TextBox.Text = Convert.ToString(products.Resource_ID);
            product_name_Insert_TextBox.Text = Convert.ToString(products.product_name);
            product_type_Insert_TextBox.Text = Convert.ToString(products.product_type);
            product_qty_Insert_TextBox.Text = Convert.ToString(products.product_qty);
            product_desc_Insert_TextBox.Text = Convert.ToString(products.product_desc);
            product_color_Insert_TextBox.Text = Convert.ToString(products.product_color);
            product_size_Insert_TextBox.Text = Convert.ToString(products.product_size);
            product_cost_Insert_TextBox.Text = Convert.ToString(products.product_cost);
            Product_exp_date_Insert_TextBox.Text = Convert.ToString(products.Product_exp_date);
            Product_Alergy_info_Insert_TextBox.Text = Convert.ToString(products.Product_Alergy_info);
            Product_refrigde_Insert_TextBox.Text = Convert.ToString(products.Product_refrigde);
            Product_Flammable_Insert_TextBox.Text = Convert.ToString(products.Product_Flammable);
            Product_Hazard_Insert_TextBox.Text = Convert.ToString(products.Product_Hazard);
            Product_Other_Insert_TextBox.Text = Convert.ToString(products.Product_Other);
            Product_Min_Inv_Insert_TextBox.Text = Convert.ToString(products.Product_Min_Inv);
            Product_Barcode_Insert_TextBox.Text = Convert.ToString(products.Product_Barcode);
            Product_subtype_Insert_TextBox.Text = Convert.ToString(products.Product_subtype);
            Make_Insert_TextBox.Text = Convert.ToString(products.Make);
            Model_Insert_TextBox.Text = Convert.ToString(products.Model);
            FEMA_Description_Insert_TextBox.Text = Convert.ToString(products.FEMA_Description);
            Year_Insert_TextBox.Text = Convert.ToString(products.Year);
            RFID_Insert_TextBox.Text = Convert.ToString(products.RFID);
            GPS_Insert_TextBox.Text = Convert.ToString(products.GPS);
            Serial_Number_Insert_TextBox.Text = Convert.ToString(products.Serial_Number);
            Height_Insert_TextBox.Text = Convert.ToString(products.Height);
            Length_Insert_TextBox.Text = Convert.ToString(products.Length);
            Depth_Insert_TextBox.Text = Convert.ToString(products.Depth);
            Weight_Insert_TextBox.Text = Convert.ToString(products.Weight);
            OAI_Insert_TextBox.Text = Convert.ToString(products.OAI);
            OAI_Type_Insert_TextBox.Text = Convert.ToString(products.OAI_Type);
            Use_Insert_TextBox.Text = Convert.ToString(products.Use);
            Brand_Insert_TextBox.Text = Convert.ToString(products.Brand);
            Power_Supply_Insert_TextBox.Text = Convert.ToString(products.Power_Supply);
            Gas_Type_Insert_TextBox.Text = Convert.ToString(products.Gas_Type);
            Needs_Gas_Insert_TextBox.Text = Convert.ToString(products.Needs_Gas);
            Needs_Electricity_Insert_TextBox.Text = Convert.ToString(products.Needs_Electricity);
            Availability_Insert_TextBox.Text = Convert.ToString(products.Availability);
            Datetime_Insert_TextBox.Text = Convert.ToString(products.Datetime);
            OpenStatus_Insert_TextBox.Text = Convert.ToString(products.OpenStatus);
            return products;
        }
        public products products_selectForUpdate(int ID)
        {
            products = products.Select(ID);
            product_id_Update_TextBox.Text = Convert.ToString(products.product_id);
            Resource_ID_Update_TextBox.Text = Convert.ToString(products.Resource_ID);
            product_name_Update_TextBox.Text = Convert.ToString(products.product_name);
            product_type_Update_TextBox.Text = Convert.ToString(products.product_type);
            product_qty_Update_TextBox.Text = Convert.ToString(products.product_qty);
            product_desc_Update_TextBox.Text = Convert.ToString(products.product_desc);
            product_color_Update_TextBox.Text = Convert.ToString(products.product_color);
            product_size_Update_TextBox.Text = Convert.ToString(products.product_size);
            product_cost_Update_TextBox.Text = Convert.ToString(products.product_cost);
            Product_exp_date_Update_TextBox.Text = Convert.ToString(products.Product_exp_date);
            Product_Alergy_info_Update_TextBox.Text = Convert.ToString(products.Product_Alergy_info);
            Product_refrigde_Update_TextBox.Text = Convert.ToString(products.Product_refrigde);
            Product_Flammable_Update_TextBox.Text = Convert.ToString(products.Product_Flammable);
            Product_Hazard_Update_TextBox.Text = Convert.ToString(products.Product_Hazard);
            Product_Other_Update_TextBox.Text = Convert.ToString(products.Product_Other);
            Product_Min_Inv_Update_TextBox.Text = Convert.ToString(products.Product_Min_Inv);
            Product_Barcode_Update_TextBox.Text = Convert.ToString(products.Product_Barcode);
            Product_subtype_Update_TextBox.Text = Convert.ToString(products.Product_subtype);
            Make_Update_TextBox.Text = Convert.ToString(products.Make);
            Model_Update_TextBox.Text = Convert.ToString(products.Model);
            FEMA_Description_Update_TextBox.Text = Convert.ToString(products.FEMA_Description);
            Year_Update_TextBox.Text = Convert.ToString(products.Year);
            RFID_Update_TextBox.Text = Convert.ToString(products.RFID);
            GPS_Update_TextBox.Text = Convert.ToString(products.GPS);
            Serial_Number_Update_TextBox.Text = Convert.ToString(products.Serial_Number);
            Height_Update_TextBox.Text = Convert.ToString(products.Height);
            Length_Update_TextBox.Text = Convert.ToString(products.Length);
            Depth_Update_TextBox.Text = Convert.ToString(products.Depth);
            Weight_Update_TextBox.Text = Convert.ToString(products.Weight);
            OAI_Update_TextBox.Text = Convert.ToString(products.OAI);
            OAI_Type_Update_TextBox.Text = Convert.ToString(products.OAI_Type);
            Use_Update_TextBox.Text = Convert.ToString(products.Use);
            Brand_Update_TextBox.Text = Convert.ToString(products.Brand);
            Power_Supply_Update_TextBox.Text = Convert.ToString(products.Power_Supply);
            Gas_Type_Update_TextBox.Text = Convert.ToString(products.Gas_Type);
            Needs_Gas_Update_TextBox.Text = Convert.ToString(products.Needs_Gas);
            Needs_Electricity_Update_TextBox.Text = Convert.ToString(products.Needs_Electricity);
            Availability_Update_TextBox.Text = Convert.ToString(products.Availability);
            Datetime_Update_TextBox.Text = Convert.ToString(products.Datetime);
            OpenStatus_Update_TextBox.Text = Convert.ToString(products.OpenStatus);
            return products;
        }
        public products products_selectForDelete(int ID)
        {
            products = products.Select(ID);
            product_id_Delete_TextBox.Text = Convert.ToString(products.product_id);
            Resource_ID_Delete_TextBox.Text = Convert.ToString(products.Resource_ID);
            product_name_Delete_TextBox.Text = Convert.ToString(products.product_name);
            product_type_Delete_TextBox.Text = Convert.ToString(products.product_type);
            product_qty_Delete_TextBox.Text = Convert.ToString(products.product_qty);
            product_desc_Delete_TextBox.Text = Convert.ToString(products.product_desc);
            product_color_Delete_TextBox.Text = Convert.ToString(products.product_color);
            product_size_Delete_TextBox.Text = Convert.ToString(products.product_size);
            product_cost_Delete_TextBox.Text = Convert.ToString(products.product_cost);
            Product_exp_date_Delete_TextBox.Text = Convert.ToString(products.Product_exp_date);
            Product_Alergy_info_Delete_TextBox.Text = Convert.ToString(products.Product_Alergy_info);
            Product_refrigde_Delete_TextBox.Text = Convert.ToString(products.Product_refrigde);
            Product_Flammable_Delete_TextBox.Text = Convert.ToString(products.Product_Flammable);
            Product_Hazard_Delete_TextBox.Text = Convert.ToString(products.Product_Hazard);
            Product_Other_Delete_TextBox.Text = Convert.ToString(products.Product_Other);
            Product_Min_Inv_Delete_TextBox.Text = Convert.ToString(products.Product_Min_Inv);
            Product_Barcode_Delete_TextBox.Text = Convert.ToString(products.Product_Barcode);
            Product_subtype_Delete_TextBox.Text = Convert.ToString(products.Product_subtype);
            Make_Delete_TextBox.Text = Convert.ToString(products.Make);
            Model_Delete_TextBox.Text = Convert.ToString(products.Model);
            FEMA_Description_Delete_TextBox.Text = Convert.ToString(products.FEMA_Description);
            Year_Delete_TextBox.Text = Convert.ToString(products.Year);
            RFID_Delete_TextBox.Text = Convert.ToString(products.RFID);
            GPS_Delete_TextBox.Text = Convert.ToString(products.GPS);
            Serial_Number_Delete_TextBox.Text = Convert.ToString(products.Serial_Number);
            Height_Delete_TextBox.Text = Convert.ToString(products.Height);
            Length_Delete_TextBox.Text = Convert.ToString(products.Length);
            Depth_Delete_TextBox.Text = Convert.ToString(products.Depth);
            Weight_Delete_TextBox.Text = Convert.ToString(products.Weight);
            OAI_Delete_TextBox.Text = Convert.ToString(products.OAI);
            OAI_Type_Delete_TextBox.Text = Convert.ToString(products.OAI_Type);
            Use_Delete_TextBox.Text = Convert.ToString(products.Use);
            Brand_Delete_TextBox.Text = Convert.ToString(products.Brand);
            Power_Supply_Delete_TextBox.Text = Convert.ToString(products.Power_Supply);
            Gas_Type_Delete_TextBox.Text = Convert.ToString(products.Gas_Type);
            Needs_Gas_Delete_TextBox.Text = Convert.ToString(products.Needs_Gas);
            Needs_Electricity_Delete_TextBox.Text = Convert.ToString(products.Needs_Electricity);
            Availability_Delete_TextBox.Text = Convert.ToString(products.Availability);
            Datetime_Delete_TextBox.Text = Convert.ToString(products.Datetime);
            OpenStatus_Delete_TextBox.Text = Convert.ToString(products.OpenStatus);
            return products;
        }
        //Database CRUD Call Functions
        public products products_insert()
        {
            products.Resource_ID = Convert.ToInt32(Resource_ID_Insert_TextBox.Text);
            products.product_name = product_name_Insert_TextBox.Text;
            products.product_type = product_type_Insert_TextBox.Text;
            products.product_qty = Convert.ToInt32(product_qty_Insert_TextBox.Text);
            products.product_desc = product_desc_Insert_TextBox.Text;
            products.product_color = product_color_Insert_TextBox.Text;
            products.product_size = product_size_Insert_TextBox.Text;
            products.product_cost = Convert.ToDecimal(product_cost_Insert_TextBox.Text);
            products.Product_exp_date = Convert.ToDateTime(Product_exp_date_Insert_TextBox.Text);
            products.Product_Alergy_info = Product_Alergy_info_Insert_TextBox.Text;
            products.Product_refrigde = Product_refrigde_Insert_TextBox.Text;
            products.Product_Flammable = Product_Flammable_Insert_TextBox.Text;
            products.Product_Hazard = Product_Hazard_Insert_TextBox.Text;
            products.Product_Other = Product_Other_Insert_TextBox.Text;
            products.Product_Min_Inv = Convert.ToInt32(Product_Min_Inv_Insert_TextBox.Text);
            products.Product_Barcode = Product_Barcode_Insert_TextBox.Text;
            products.Product_subtype = Product_subtype_Insert_TextBox.Text;
            products.Make = Make_Insert_TextBox.Text;
            products.Model = Model_Insert_TextBox.Text;
            products.FEMA_Description = FEMA_Description_Insert_TextBox.Text;
            products.Year = Year_Insert_TextBox.Text;
            products.RFID = RFID_Insert_TextBox.Text;
            products.Serial_Number = Serial_Number_Insert_TextBox.Text;
            products.Height = Height_Insert_TextBox.Text;
            products.Length = Length_Insert_TextBox.Text;
            products.Depth = Depth_Insert_TextBox.Text;
            products.Weight = Weight_Insert_TextBox.Text;
            products.OAI = OAI_Insert_TextBox.Text;
            products.OAI_Type = OAI_Type_Insert_TextBox.Text;
            products.Use = Use_Insert_TextBox.Text;
            products.Brand = Brand_Insert_TextBox.Text;
            products.Power_Supply = Power_Supply_Insert_TextBox.Text;
            products.Gas_Type = Gas_Type_Insert_TextBox.Text;
            products.Needs_Gas = Convert.ToBoolean(Needs_Gas_Insert_TextBox.Text);
            products.Needs_Electricity = Convert.ToBoolean(Needs_Electricity_Insert_TextBox.Text);
            products.Availability = Availability_Insert_TextBox.Text;
            products.Datetime = Convert.ToDateTime(Datetime_Insert_TextBox.Text);
            products.OpenStatus = OpenStatus_Insert_TextBox.Text;
            products = products.Insert(products);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return products;
        }
        public products products_update(int ID)
        {
            products = products.Select(ID);
            products.product_id = Convert.ToInt32(Update_GridView.SelectedValue);
            products.Resource_ID = Convert.ToInt32(Resource_ID_Update_TextBox.Text);
            products.product_name = product_name_Update_TextBox.Text;
            products.product_type = product_type_Update_TextBox.Text;
            products.product_qty = Convert.ToInt32(product_qty_Update_TextBox.Text);
            products.product_desc = product_desc_Update_TextBox.Text;
            products.product_color = product_color_Update_TextBox.Text;
            products.product_size = product_size_Update_TextBox.Text;
            products.product_cost = Convert.ToDecimal(product_cost_Update_TextBox.Text);
            products.Product_exp_date = Convert.ToDateTime(Product_exp_date_Update_TextBox.Text);
            products.Product_Alergy_info = Product_Alergy_info_Update_TextBox.Text;
            products.Product_refrigde = Product_refrigde_Update_TextBox.Text;
            products.Product_Flammable = Product_Flammable_Update_TextBox.Text;
            products.Product_Hazard = Product_Hazard_Update_TextBox.Text;
            products.Product_Other = Product_Other_Update_TextBox.Text;
            products.Product_Min_Inv = Convert.ToInt32(Product_Min_Inv_Update_TextBox.Text);
            products.Product_Barcode = Product_Barcode_Update_TextBox.Text;
            products.Product_subtype = Product_subtype_Update_TextBox.Text;
            products.Make = Make_Update_TextBox.Text;
            products.Model = Model_Update_TextBox.Text;
            products.FEMA_Description = FEMA_Description_Update_TextBox.Text;
            products.Year = Year_Update_TextBox.Text;
            products.RFID = RFID_Update_TextBox.Text;
            products.Serial_Number = Serial_Number_Update_TextBox.Text;
            products.Height = Height_Update_TextBox.Text;
            products.Length = Length_Update_TextBox.Text;
            products.Depth = Depth_Update_TextBox.Text;
            products.Weight = Weight_Update_TextBox.Text;
            products.OAI = OAI_Update_TextBox.Text;
            products.OAI_Type = OAI_Type_Update_TextBox.Text;
            products.Use = Use_Update_TextBox.Text;
            products.Brand = Brand_Update_TextBox.Text;
            products.Power_Supply = Power_Supply_Update_TextBox.Text;
            products.Gas_Type = Gas_Type_Update_TextBox.Text;
            products.Needs_Gas = Convert.ToBoolean(Needs_Gas_Update_TextBox.Text);
            products.Needs_Electricity = Convert.ToBoolean(Needs_Electricity_Update_TextBox.Text);
            products.Availability = Availability_Update_TextBox.Text;
            products.Datetime = Convert.ToDateTime(Datetime_Update_TextBox.Text);
            products.OpenStatus = OpenStatus_Update_TextBox.Text;
            products.Update(products);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
            return products;
        }
        public void products_delete(int ID)
        {
            products.Delete(ID);
            Insert_GridView.DataBind();
            Update_GridView.DataBind();
            Delete_GridView.DataBind();
        }
        //Button Functions
        protected void Insert_Button_Click(object sender, EventArgs e)
        {
            products = products_insert();
        }
        protected void Update_Button_Click(object sender, EventArgs e)
        {
            products = products_update(Convert.ToInt32(Update_GridView.SelectedValue));
        }
        protected void Delete_Button_Click(object sender, EventArgs e)
        {
            products_delete(Convert.ToInt32(Delete_GridView.SelectedValue));
        }
        
    }

}

