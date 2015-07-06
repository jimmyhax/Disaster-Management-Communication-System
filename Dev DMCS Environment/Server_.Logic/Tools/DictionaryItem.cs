using System;
using System.Text;
using System.IO;
using System.Collections;
using System.Collections.Generic;

namespace Web.Admin.Logic
{
    /// <summary>
    /// Represents dictionary item which contains pair label name and text.
    /// </summary>
    public class DictionaryItem
    {
        /// <summary>
        /// Label name.
        /// </summary>
        public String Name{get; set;}
        
        /// <summary>
        /// label text. 
        /// </summary>
        public String Text { get; set; }

        /// <summary>
        /// The class constructor.
        /// </summary>
        /// <param name="Name">Label name.</param>
        /// <param name="Text">Label text.</param>
        public DictionaryItem(String Name, String Text)
        {
            this.Name = Name.Replace("\"", "").Trim();
            this.Text = Text.Replace("\"", "").Trim();
        }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public DictionaryItem()
        {

        }
    }

}
