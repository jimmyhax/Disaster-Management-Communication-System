using System;
using System.Text;
using System.IO;
using System.Collections;
using System.Collections.Generic;


namespace Web.Admin.Logic
{
    /// <summary>
    /// Represents collection dictionaries of labels in different laguages.
    /// </summary>
    public class Dictionaries 
    {
        /// <summary>
        /// Dictionaries hash table.
        /// </summary>
        private Hashtable _dictionaries = new Hashtable();
        
        /// <summary>
        /// Label files current path.
        /// </summary>
        private string _path;

        /// <summary>
        /// Current language.
        /// </summary>
        public string CurrentLanguage { get; set; }
        
        /// <summary>
        /// Default language. It will use if current laguage is not selected. 
        /// </summary>
        public string DefaultLanguage { get; set; }
        
        /// <summary>
        /// Gets base path.
        /// </summary>
        /// <returns></returns>
        public string GetBasePath()
        {
            return _path;
        }

        /// <summary>
        /// The class constructor.
        /// </summary>
        public Dictionaries()
        {
            DefaultLanguage = "eng";
            CurrentLanguage = DefaultLanguage;
        }

        /// <summary>
        /// Set Label files current path. Must be executed before using. 
        /// </summary>
        /// <param name="Path"></param>
        public void Initialize(string Path)
        {
            _path = Path;
        }

        /// <summary>
        /// Reloads all label files.
        /// </summary>
        public void RefreshAll()
        {
            foreach (String _key in _dictionaries.Keys)
            {
                Dictionary _dictionary = (Dictionary)_dictionaries[_key];
                _dictionary.Refresh(_path);
            }

            System.GC.Collect();
        }

        /// <summary>
        /// Gets all language keys which are in the object. 
        /// </summary>
        /// <returns></returns>
        public List<String> GetAllKeys()
        {
            List<String> result = new List<String>();
            
            foreach (String _key in _dictionaries.Keys)
            {
                result.Add(_key);
            }

            return result;
        }

        /// <summary>
        /// Gets  total number of labels in a specific dictionary.
        /// </summary>
        /// <param name="LanguageID"></param>
        /// <returns></returns>
        public int WordsCountByLanguage(String LanguageID)
        {
            Dictionary _dictionary = (Dictionary)_dictionaries[LanguageID];

            if (_dictionary != null)
                return _dictionary.WordsCount();
            else
                return 0;
        }

        /// <summary>
        /// Reloads  a dictionary by language key.
        /// </summary>
        /// <param name="LanguageID"></param>
        public void RefreshByLanguage(String LanguageID)
        {
            Dictionary _dictionary = (Dictionary)_dictionaries[LanguageID];

            if (_dictionary != null)
                _dictionary.Refresh(_path);
        }

        /// <summary>
        /// Gets text by label name according to current language.
        /// </summary>
        /// <param name="Name"></param>
        /// <returns></returns>
        public string GetLabel(string Name)
        {
            return GetLabelByLanguage(Name, CurrentLanguage);
        }
        
        /// <summary>
        /// Gets text by label name according to language ID.
        /// </summary>
        /// <param name="Name">Label name</param>
        /// <param name="LanguageID">Languag unique identifier.</param>
        /// <returns>Text by label name according to language ID.</returns>
        public string GetLabelByLanguage(String Name, String LanguageID)
        {
            if (_dictionaries[CurrentLanguage] != null)
            {
                Dictionary _dictionary = (Dictionary)_dictionaries[LanguageID];
                if (_dictionary != null)
                    return _dictionary.Get(Name);
                else
                    return String.Empty;
            }
            else
                return String.Empty;
        }

        /// <summary>
        ///  Returns text by label prefix according to language ID.
        /// </summary>
        /// <param name="Prefix">Label prefix.</param>
        /// <param name="LanguageID">Language unique identifier.</param>
        /// <returns></returns>
        public object[] GetLabelsByPrefixLanguage(String Prefix, String LanguageID)
        {
            object[] _objects = null;
            if (_dictionaries[CurrentLanguage] != null)
            {
                Dictionary _dictionary = (Dictionary)_dictionaries[LanguageID];
                if (_dictionary != null)
                {
                    List<DictionaryItem> _items = _dictionary.GetByPrefix(Prefix);
                    if (_items.Count > 0)
                    {
                        int i = 0;
                        _objects = new object[_items.Count];
                        foreach (DictionaryItem _item in _items)
                            _objects[i++] = (object)_item;
                    }
                }
            }

            return _objects;
        }

        /// <summary>
        /// Loads labels from a file to dictionary collection
        /// </summary>
        /// <param name="LanguageID">Language unique identifier.</param>
        /// <param name="EncodingName">Encodign name.</param>
        /// <param name="FileName">File name.</param>
        public void AddFromFlatFile(String LanguageID, String EncodingName, String FileName)
        {
            Dictionary _dictionary = null;
            if (_dictionaries[LanguageID] != null)
            {
                _dictionary = (Dictionary)_dictionaries[LanguageID];
                
                if (_dictionary.WasFileAdded(FileName))
                    return;
                
                _dictionary.Load(_path, FileName);
            }
            else
            {
                _dictionary = new Dictionary(LanguageID, EncodingName);
                _dictionary.Load(_path, FileName);
                
                lock (_dictionaries.SyncRoot)
                    _dictionaries.Add(LanguageID, _dictionary);
            }
        }
    }
}
