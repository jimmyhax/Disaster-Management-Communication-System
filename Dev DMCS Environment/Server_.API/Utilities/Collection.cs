using System;
using System.Linq;
using System.Text;
using System.Net;
using System.IO;
using System.Runtime.Serialization.Json;
using System.Collections.Generic;


namespace Server_.API.Utilities
{
    /// <summary>
    /// Provides methods to help deserialize object or object collection from JSON string.
    /// </summary>
    /// <typeparam name="T">Expected object type in JSON string.</typeparam>
    public class Collection<T>
    {
        /// <summary>
        /// Gets the type of response collection.
        /// </summary>
        public static Type Type {get { return typeof(Response<List<T>>);}}
        
        /// <summary>
        /// Gets the collection of objects from the response JSON string. 
        /// </summary>
        /// <param name="sr">Response stream.</param>
        /// <returns>Collection of an objects for specified type.</returns>
        public static List<T> GetCollection(StreamReader sr)
        {
            DataContractJsonSerializer ser = new DataContractJsonSerializer(Type);
            Response<List<T>> Response = (Response<List<T>>)ser.ReadObject(sr.BaseStream);
            
            sr.Close();
            sr.Dispose();

            if (Response.Message.Length == 0)
                return (List<T>) Response.Data;
            else
                throw new Exception(Response.Message);        
        }

        /// <summary>
        /// Gets an objects from the response JSON string. 
        /// </summary>
        /// <param name="sr">Response stream.</param>
        /// <returns>An object for specified type.</returns>
        public static T GetItem(StreamReader sr)
        {
            DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(Response<T>));
            Response<T> Response = (Response<T>)ser.ReadObject(sr.BaseStream);

            sr.Close();
            sr.Dispose();

            if (Response.Message.Length == 0)
                return (T) Response.Data;
            else
                throw new Exception(Response.Message);
        }
    }
}
