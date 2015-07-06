using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DMCS.SandBox
{
    public partial class test1 : System.Web.UI.Page
    {

        string[] individualNameArray;
        string firstName;
        string lastName;

        protected void Page_Load(object sender, EventArgs e)
        {

        }



        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    //Image1.Attributes["src"] = ResolveUrl("~/Images/ShowImage.aspx?Where_Clause=picture from client where client_id = 1&Image_Name=picture");
        //}

        public static string FirstCharToUpper(string input)
        {
            if (String.IsNullOrEmpty(input))
                throw new ArgumentException("ARGH!");
            input = input.ToLower();
            return input.First().ToString().ToUpper() + input.Substring(1);
        }


        protected void Button1_Click1(object sender, EventArgs e)
        {
            string[] nameArray = Regex.Split(recieverTextbox.Text, "\r\n");
            //loop throught complete list and exicute individually for each string array of mixed names
            for (int i = 0; i < nameArray.Length; i++)
            {
                //generatorTextbox.Text += array[i];
                individualNameArray = nameArray[i].Split(',');
                //check for a space char as first char of the last name and delete any that exist
                if (individualNameArray.Length > 1)
                {
                    string secondName = individualNameArray[1];
                    if (secondName.StartsWith(" "))
                    {
                        secondName = secondName.Substring(1);
                    }
                    //seperate second array name by new array
                    string[] constructingString = secondName.Split(' ');

                    if (secondName == "LLC" || secondName == "Inc.")
                    {
                        firstName = "DELETE";
                        lastName = "DELETE";
                    }
                    else
                    {
                        firstName = FirstCharToUpper(constructingString[0]);
                        lastName = FirstCharToUpper(individualNameArray[0]);
                    }
                }
                else
                {
                    firstName = "DELETE";
                    lastName = "DELETE";
                }

                generatorTextbox.Text += firstName + "|" + lastName + Environment.NewLine;

            }

        }


    }
}