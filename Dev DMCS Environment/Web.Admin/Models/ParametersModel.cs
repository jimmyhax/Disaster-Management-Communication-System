using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Web.Admin.Helpers;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;


namespace Web.Admin.Models
{
    public class ParametersModel
    {
        private List<Parameter> _Parameters { get; set; }
        
        public ParametersModel()
        {
            this._Parameters = Parameters.Get();
            
        }

        public Parameter GetParameter(String Name){
            return Parameters.GetParameter(_Parameters, Name);
        }
        
    }
}