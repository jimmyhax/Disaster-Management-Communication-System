using System;
using System.Text;
using System.IO;
using System.Collections;
using System.Collections.Generic;

namespace Web.Admin.Logic
{
    /// <summary>
    /// Dictionary collection items. It represents set of labels with their text.
    /// </summary>
    public class Dictionary
    {
        /// <summary>
        /// Label text pair hashtable.
        /// </summary>
        private Hashtable _items;
        
        /// <summary>
        /// Lable names hashtable. 
        /// </summary>
        private Hashtable _names;

        /// <summary>
        /// Label text pair hashtable.
        /// </summary>
        public Hashtable Items { get { return _items; } }
        
        /// <summary>
        /// File encoding name.
        /// </summary>
        public string EncodingName{ get; set; }
        
        /// <summary>
        /// Language 
        /// </summary>
        public string LanguageID{ get; set; }


        /// <summary>
        /// Checks if lable file was loaded.
        /// </summary>
        /// <param name="FileName">File name/</param>
        /// <returns>True if the label file was already loaded.</returns>
        public bool WasFileAdded(string FileName)
        {
            foreach(String _name in _names.Keys)
            {
                if(_name.ToLower() == FileName.ToLower())
                    return true;
            }

            return false;
        }

        /// <summary>
        /// The class constructor.
        /// </summary>
        /// <param name="LanguageID">Language unique identifier.</param>
        /// <param name="EncodingName">File Encoding name.</param>
        public Dictionary(String LanguageID, String EncodingName)
        {
            _items = new Hashtable();
            _names = new Hashtable();
            this.EncodingName   = EncodingName;
            this.LanguageID     = LanguageID;
        }

        /// <summary>
        /// Gets count of words in the dictionary
        /// </summary>
        /// <returns></returns>
        public int WordsCount()
        {
            if (_items != null)
                return _items.Count;
            else
                return 0;
        }

        /// <summary>
        /// Adds item to the dictionary
        /// </summary>
        /// <param name="Item">Label text pair object.</param>
        public void Add(DictionaryItem Item) 
        {
            lock (_items.SyncRoot)
            {
                if (_items[Item.Name] != null)
                    _items.Remove(Item.Name);

                _items.Add(Item.Name, Item);
            }
        }

        /// <summary>
        /// Adds item to the dictionary
        /// </summary>
        /// <param name="Name">Label name.</param>
        /// <param name="Text">Label text.</param>
        public void AddItem(String Name, String Text)
        {
            lock (_items.SyncRoot)
            {
                DictionaryItem Item = new DictionaryItem(Name, Text);
                
                if (_items[Item.Name] != null)
                    _items.Remove(Item.Name);

                _items.Add(Item.Name, Item);
            }
        }

        /// <summary>
        /// Gets the list of dictionary items by label prefix.
        /// </summary>
        /// <param name="Prefix">Label prefix.</param>
        /// <returns>List of dictionary items by label prefix.</returns>
        public List<DictionaryItem> GetByPrefix(String Prefix)
        {
            lock (_items.SyncRoot)
            {
                List<DictionaryItem> _result = new List<DictionaryItem>();
                foreach (String _item_key in _items.Keys)
                {
                    DictionaryItem _d_item = (DictionaryItem)_items[_item_key];
                    if (_item_key.IndexOf(Prefix) == 0)
                    {
                        _result.Add((DictionaryItem)_items[_item_key]);
                    }
                }

                return _result;
            }
        }

        /// <summary>
        /// Get text by label name.
        /// </summary>
        /// <param name="Name">Label name.</param>
        /// <returns>Text by label name.</returns>
        public string Get(String Name)
        {
            lock (_items.SyncRoot)
            {
                if (_items[Name] != null)
                    return ((DictionaryItem)_items[Name]).Text;
                else
                    return "";
            }
        }

        /// <summary>
        /// Reloads label file from hard disk.
        /// </summary>
        /// <param name="FilePath">Lable file path.</param>
        public void Refresh(String FilePath)
        {
            lock (_items.SyncRoot)
            {
                _items.Clear();
                foreach (String _file_name in _names.Keys)
                {
                    LoadFromFlatFile(FilePath, _file_name);
                }
            }
        }

        /// <summary>
        /// Loads label file to the dictionary.
        /// </summary>
        /// <param name="FilePath">File path.</param>
        /// <param name="FileName">File name.</param>
        public void Load(String FilePath, String FileName)
        {
            lock (_names.SyncRoot)
                _names.Add(FileName, FileName);

            lock (_items.SyncRoot)
                LoadFromFlatFile(FilePath, FileName);    
        }

        /// <summary>
        /// Loads label file from hard disk to the dictionary.
        /// </summary>
        /// <param name="FilePath">File path.</param>
        /// <param name="FileName">File name.</param>
        private void LoadFromFlatFile(String FilePath, String FileName)
        {
            string FullPath = Path.Combine(FilePath,FileName);
            
             if (!File.Exists(FullPath))
                return;

            System.Text.Encoding _encoding = System.Text.Encoding.GetEncoding(EncodingName);
            using (StreamReader sr = new StreamReader(FullPath, _encoding))
            {
                string _line = "";
                int _line_number = 0;

                while ((_line = sr.ReadLine()) != null)
                {
                    _line_number++;
                    if (_line != null && _line.Length > 0 && (_line[0] == '\''))
                        continue;

                    if (_line != null)
                    {
                        int _comma_index = _line.IndexOf(':');
                        if (_comma_index > 0)
                        {
                            if (_comma_index == _line.Length - 1)
                                continue;

                            string _name = _line.Substring(0, _comma_index);
                            string _value = _line.Substring(_comma_index + 1, _line.Length - _comma_index - 1);
                            this.Add(new DictionaryItem(_name, _value));
                        }
                    }
                }

                sr.Close();
            }
        }
    }
}
