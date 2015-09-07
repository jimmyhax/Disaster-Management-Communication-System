using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using DMCS.App_Code;

namespace DMCS.Moduals.Order_Products
{
    /// <summary>
    /// Summary description for Request_Data
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Request_Data : WebService
    {
        public products products = new products();
        [WebMethod]
        public string get_product_id(string ID)
        {
            products = products.Select(Convert.ToInt32(ID));

            return products.product_name;
        }

        [WebMethod]
        public string[] paseArrays(string[] ID, string[] Name, string[] searchedName)
        {
            List<string> id_List = new List<string>();
            for (int i = 0; i < searchedName.Length; i++)
            {
                for (int j = 0; j < Name.Length; j++)
                {
                    if (searchedName[i].CompareTo(Name[j]) == 0)
                    {
                        id_List.Add(ID[j]);
                    }
                    else{ //nothing
                    }
                }
            }

            return id_List.ToArray();
        }
    }
}
