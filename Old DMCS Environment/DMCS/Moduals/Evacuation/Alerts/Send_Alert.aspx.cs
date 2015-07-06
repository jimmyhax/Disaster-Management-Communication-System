using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DMCS.App_Code;
using System.Data;
using System.Threading;
using System.Net.Mail;

namespace DMCS.Moduals.Evacuation.Alerts
{
    public partial class Send_Alert : System.Web.UI.Page
    {
        public Alert Alert = new Alert();
        public person Person = new person();
        public string[] County_Array;
        public DataTable alert_Phone_Numbers_DT;
        public Email_To_Text_Provider Email_To_Text_Provider = new Email_To_Text_Provider();
        public string[] email_To_Text_Provider_Arr;

        //disaster locations
        public Decimal nLat;
        public Decimal nLong;

        public Decimal sLat;
        public Decimal sLong;

        public Decimal eLat;
        public Decimal eLong;

        public Decimal wLat;
        public Decimal wLong;

        //on initial loading of the page-- load initialize() *This starts the Map from the beginning*
        protected void Page_Load(object sender, EventArgs e)
        {


            //save countylist after postback to complete insert
            if (ViewState["HF_Counties_txt.Value"] != null)
            {
                HF_Counties_txt.Value = (String)ViewState["HF_Counties_txt.Value"];
            }

            if (!ClientScript.IsStartupScriptRegistered("initialize"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                "initialize", "initialize();", true);
            }

            if (!Page.IsPostBack)
            {

            }
            
            Date_TextBox.Text = Convert.ToString(DateTime.Now);
            Alert_Message_TextBox.Text = Environment.NewLine + Environment.NewLine +
                "DO NOT RESPOND TO THIS MESSAGE." + Environment.NewLine +
                "THIS WAS A AUTOMATED MESSAGE SENT FROM THE DMSC SERVERS.";
        }

        //display the disaster on screen 
        protected void ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                disaster disaster = new disaster();
                GlobalVariables.DisasterID = Convert.ToInt32(ddlDisaster.SelectedItem.Value);
                disaster = disaster.Select(Convert.ToInt32(ddlDisaster.SelectedItem.Value));
                nLat = disaster.disaster_north_latitude;
                nLong = disaster.disaster_north_longitude;

                sLat = disaster.disaster_south_latitude;
                sLong = disaster.disaster_south_longitude;

                eLat = disaster.disaster_east_latitude;
                eLong = disaster.disaster_east_longitude;

                wLat = disaster.disaster_west_latitude;
                wLong = disaster.disaster_west_longitude;

                Alert_Type_TextBox.Text = "Disaster Related: " + Convert.ToString(disaster.disaster_name);

                Page page = HttpContext.Current.Handler as Page;
                ScriptManager.RegisterStartupScript(page, page.GetType(),
                "plotPoly", "plotPoly();", true);

            }
            catch { }
        }
        protected void Select_Record(object sender, EventArgs e)
        {
            Alert = Alert.Select(Convert.ToInt32(GridView1.SelectedValue));
            Alert_Message_TextBox.Text = Convert.ToString(Alert.Alert_Message);
            Alert_Type_TextBox.Text = Convert.ToString(Alert.Alert_Type);
            Date_TextBox.Text = Convert.ToString(Alert.Date);
        }




        protected void INSERT(object sender, EventArgs e)
        {
            //call javascript function
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "getCounties()", "getCounties()", true);
            //String DataString = HF_Counties_txt.Value;
            ////update variable from past saved instance befor click event
            //ViewState.Add("DataString", HF_Counties_txt.Value);

            ////insert Alert
            //Alert.Alert_Message = Alert_Message_TextBox.Text;
            //Alert.Alert_Type = Alert_Type_TextBox.Text;
            //Alert.Date = DateTime.Now;
            //Alert = Alert.Insert(Alert);



            try
            {
                County_Array = HF_Counties_txt.Value.Split(',');
                //get datatable of people from the respected counties of the alert
                for (int i = 0; i < County_Array.Length - 1; i++)
                {
                    alert_Phone_Numbers_DT = Alert.Send_Text_Alert("address.County_Township = '" + County_Array[i] + "'");
                }
                email_To_Text_Provider_Arr = Email_To_Text_Provider.Email_List();
                if (CBox_HTML.Checked == true)//HTML message
                {
                    //send email/text one by one
                    for (int i = 0; i < alert_Phone_Numbers_DT.Rows.Count; i++)
                    {
                        for (int j = 0; j < email_To_Text_Provider_Arr.Length; j++)
                        {
                            var number = Convert.ToString(alert_Phone_Numbers_DT.Rows[i]["phone_primary"]) + email_To_Text_Provider_Arr[j];
                            var message = new MailMessage(number, number);
                            // here is an important part:

                            message.Body = Alert_Message_TextBox.Text;
                            //Set html to true! This allows for more then just a string with no breaks.
                            message.IsBodyHtml = true;
                            var client = new SmtpClient();
                            client.EnableSsl = true;
                            client.Send(message);
                        }
                    }
                }
                else//nonHTML message
                {
                    //send email/text one by one
                    for (int i = 0; i < alert_Phone_Numbers_DT.Rows.Count; i++)
                    {
                        for (int j = 0; j < email_To_Text_Provider_Arr.Length; j++)
                        {
                            var number = Convert.ToString(alert_Phone_Numbers_DT.Rows[i]["phone_primary"]) + email_To_Text_Provider_Arr[j];
                            var message = new MailMessage(number, number);
                            // here is an important part:

                            message.Body = Alert_Message_TextBox.Text;
                            //Set html to true! This allows for more then just a string with no breaks.
                            message.IsBodyHtml = false;
                            var client = new SmtpClient();
                            client.EnableSsl = true;
                            client.Send(message);
                        }
                    }
                }
            }
            catch
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "alert('Couldnt insert Person_Alert')", true);
            }

            GridView1.DataBind();
        }
    }
}