using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using DMCS;
namespace DMCS
{
    public class GeoLocation
    {
        public static decimal[] getCoordinates(string address1, string address2,
            string city, string state, string zipcode, string appId)
        {
            string retVal;
            decimal[] coordinates = new decimal[2];

            System.Net.WebClient webClient = new System.Net.WebClient();
            string request = "http://where.yahooapis.com/geocode?location="
                + address1 + "+" + address2 + "+" + city + "+" + state + "+" + zipcode
                + "&" + appId;

            byte[] responseXML;
            try
            {
                responseXML = webClient.DownloadData(request);
                System.Text.UTF8Encoding objUTF8 = new System.Text.UTF8Encoding();
                retVal = objUTF8.GetString(responseXML) + "\n";
            }
            catch (System.Exception ex)
            {
                retVal = ex.Message;
            }

            // parse the return values
            XmlDocument xml = new XmlDocument();
            xml.LoadXml(retVal);
            XmlNode ndLatitude = xml.SelectSingleNode("//latitude");
            XmlNode ndLongitude = xml.SelectSingleNode("//longitude");

            coordinates[0] = Convert.ToDecimal(ndLatitude.InnerText);
            coordinates[1] = Convert.ToDecimal(ndLongitude.InnerText);

            return coordinates;
        }
    }



}




