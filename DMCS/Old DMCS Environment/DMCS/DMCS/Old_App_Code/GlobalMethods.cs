using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Web.UI.WebControls;

namespace DMCS.App_Code
{
    public class GlobalMethods
    {

        public GlobalMethods()
        {

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