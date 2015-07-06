using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using System.Linq;
using System.Net;
using System.DirectoryServices;
using Web.Admin.Logic.Objects;
using Web.Admin.Logic.Collections;
using System.Data;
using System.Web.Security;
using System.Runtime.Serialization;

namespace Web.Admin.Logic
{

    /// <summary>
    /// Represents class for using custom string utility methods.
    /// </summary>
    public static class StringTool
    {
        /// <summary>
        /// Deletes some lines from the source string.
        /// </summary>
        /// <param name="s">Source string</param>
        /// <param name="linesToRemove">Number lines to remove.</param>
        /// <returns>String with removed N lines</returns>
        public static string DeleteLines(string s, int linesToRemove)
        {
            return s.Split(Environment.NewLine.ToCharArray(),
                           linesToRemove + 1,
                           StringSplitOptions.RemoveEmptyEntries
                ).Skip(linesToRemove)
                .FirstOrDefault();
        }
        
        /// <summary>
        /// Get a substring of the first N characters.
        /// </summary>
        public static string Truncate(string source, int length)
        {
            if (source.Length > length)
            {
                source = source.Substring(0, length);
            }
            return source;
        }

        /// <summary>
        /// Encrypt string by machine key.
        /// </summary>
        /// <param name="plaintextValue">The string for encryption.</param>
        /// <returns>Encrypted string.</returns>
        public static string Encrypt(string plaintextValue)
        {
            byte[] plaintextBytes = Encoding.UTF8.GetBytes(plaintextValue);
            return Convert.ToBase64String(MachineKey.Protect(plaintextBytes, "MachineKeyProtection.All"));
        }

        /// <summary>
        /// Decrypt string by machine key.
        /// </summary>
        /// <param name="encryptedValue">The string for decryption.</param>
        /// <returns>Decrypted string.</returns>
        public static string Decrypt(string encryptedValue)
        {
            try
            {
                byte[] decryptedBytes = MachineKey.Unprotect(Convert.FromBase64String(encryptedValue), "MachineKeyProtection.All");
                return Encoding.UTF8.GetString(decryptedBytes);
            }
            catch
            {
                return null;
            }
        }

        /// <summary>
        /// Get a substring of the first N characters. [Slow]
        /// </summary>
        public static string Truncate2(string source, int length)
        {
            return source.Substring(0, Math.Min(length, source.Length));
        }

        /// <summary>
        /// Return random string by specific length.
        /// </summary>
        /// <param name="length">String length.</param>
        /// <param name="NumbersOnly">Numbers only flag.</param>
        /// <returns>String with specified length.</returns>
        public static string RandomString(int length, bool NumbersOnly = false)
        {
            string allowedChars;
            
            if(NumbersOnly)
                allowedChars = "0123456789";
            else
                allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

            if (length < 0) throw new ArgumentOutOfRangeException("length", "length cannot be less than zero.");
            if (string.IsNullOrEmpty(allowedChars)) throw new ArgumentException("allowedChars may not be empty.");

            const int byteSize = 0x100;
            var allowedCharSet = allowedChars.ToCharArray();
            if (byteSize < allowedCharSet.Length) throw new ArgumentException(String.Format("allowedChars may contain no more than {0} characters.", byteSize));

            // Guid.NewGuid and System.Random are not particularly random. By using a
            // cryptographically-secure random number generator, the caller is always
            // protected, regardless of use.
            using (var rng = new System.Security.Cryptography.RNGCryptoServiceProvider())
            {
                var result = new StringBuilder();
                var buf = new byte[128];
                while (result.Length < length)
                {
                    rng.GetBytes(buf);
                    for (var i = 0; i < buf.Length && result.Length < length; ++i)
                    {
                        // Divide the byte into allowedCharSet-sized groups. If the
                        // random value falls into the last group and the last group is
                        // too small to choose from the entire allowedCharSet, ignore
                        // the value in order to avoid biasing the result.
                        var outOfRangeStart = byteSize - (byteSize % allowedCharSet.Length);
                        if (outOfRangeStart <= buf[i]) continue;
                        result.Append(allowedCharSet[buf[i] % allowedCharSet.Length]);
                    }
                }
                return result.ToString();
            }
        }

    }

    /// <summary>
    /// LDAP Directory member info.
    /// </summary>
    public class LDAPMemberInfo
    {
        /// <summary>
        /// Member display name.
        /// </summary>
        public string DisplayName { get; set; }
        /// <summary>
        /// Member email.
        /// </summary>
        public string Email { get; set; }
    }

    // http://www.codeproject.com/Articles/18102/Howto-Almost-Everything-In-Active-Directory-via-C#35
    /// <summary>
    /// Provides different methods to manipulate LDAP directory objects.
    /// </summary>
    public class LDAPTools
    {
        /// <summary>
        /// LDAP user name.
        /// </summary>
        public string UserName{get;set;}
        /// <summary>
        /// LDAP user password.
        /// </summary>
        public string Password{get;set;}
        /// <summary>
        /// LDAP DIrectory path.
        /// </summary>
        public string DirectoryPath{get;set;}
        /// <summary>
        /// LDAP directory member info.
        /// </summary>
        public LDAPMemberInfo MemberInfo { get; set; }

        /// <summary>
        /// Default constructor.
        /// </summary>
        public LDAPTools()
        {
            MemberInfo = new LDAPMemberInfo();
        }

        /// <summary>
        /// Authenticates a member in LDAP directory.
        /// </summary>
        /// <returns>True if Aathentication was fine.</returns>
        public bool Authenticate()
        {
            bool authentic = false;
            
            try
            {
                DirectoryEntry entry = new DirectoryEntry(DirectoryPath, UserName, Password);
                object nativeObject = entry.NativeObject;

                string[] nameParts = UserName.Split(new string[] { "@" }, StringSplitOptions.RemoveEmptyEntries);

                DirectorySearcher search = new DirectorySearcher(entry);
                search.Filter = "(SAMAccountName=" + nameParts[0] + ")";
                search.PropertiesToLoad.Add("cn");
                search.PropertiesToLoad.Add("mail");
                SearchResult result = search.FindOne();
                
                if (null != result)
                {                    
                    MemberInfo.DisplayName = (String)result.Properties["cn"][0];
                    MemberInfo.Email = (String)result.Properties["mail"][0];
                }

                authentic = true;
            }
            catch (DirectoryServicesCOMException ex) {
                String Message = String.Format("Member: {0}  Message:{1}", UserName, ex.Message);
                AuditEvent.AppEventError(AppSession.Parameters.GeneralAdminEmail.Value, "LDAP authentication failed. " + Message, AuditEvent.GetSessionDetails(Message), true);
            }
            
            return authentic;
        }

        /// <summary>
        /// Returns LDAP member info which are stored in the directory.
        /// </summary>
        /// <returns></returns>
        public LDAPMemberInfo GetMemberInfo()
        {
            DirectoryEntry DirEntry = new DirectoryEntry();
            {
                DirEntry.Path = DirectoryPath;
                DirEntry.Username = UserName;
                DirEntry.Password = Password;
                DirEntry.AuthenticationType = AuthenticationTypes.Secure;
            }

            LDAPMemberInfo memberInfo = new LDAPMemberInfo(); 
            string[] nameParts = UserName.Split(new string[] { "@" }, StringSplitOptions.RemoveEmptyEntries);

            DirectorySearcher search = new DirectorySearcher(DirEntry);
            search.Filter = "(SAMAccountName=" + nameParts[0] + ")";
            search.PropertiesToLoad.Add("cn");
            search.PropertiesToLoad.Add("mail");
            try{
                SearchResult result = search.FindOne();
                if (null != result)
                {
                    memberInfo.DisplayName = (String)result.Properties["cn"][0];
                    memberInfo.Email = (String)result.Properties["mail"][0];
                }
            }
            catch(Exception ex)
            {
                String Message = String.Format("Member:{0}, Message:{1}", UserName, ex.Message);
                AuditEvent.AppEventError(AppSession.Parameters.GeneralAdminEmail.Value, "LDAP obtaining member name failed. " + Message, AuditEvent.GetSessionDetails(Message), true);
            }

            return memberInfo;
        }

        /// <summary>
        /// Returns LDAP directory member groups divided by | symbol.
        /// </summary>
        /// <returns>Member groups string divided by | symbol.</returns>
        public string GetGroups()
        {
            DirectoryEntry DirEntry = new DirectoryEntry();
            {
                DirEntry.Path = DirectoryPath;
                DirEntry.Username = UserName;
                DirEntry.Password = Password;
                DirEntry.AuthenticationType = AuthenticationTypes.Secure;
            }

            string[] nameParts = UserName.Split(new string[] { "@" }, StringSplitOptions.RemoveEmptyEntries);

            DirectorySearcher search = new DirectorySearcher(DirEntry);
            search.Filter = "(SAMAccountName=" + nameParts[0] + ")";
            search.PropertiesToLoad.Add("memberOf");
            StringBuilder groupNames = new StringBuilder();
            try
            {
                SearchResult result = search.FindOne();
                int propertyCount = result.Properties["memberOf"].Count;
                String dn;
                int equalsIndex, commaIndex;

                for (int propertyCounter = 0; propertyCounter < propertyCount;
                     propertyCounter++)
                {
                    dn = (String)result.Properties["memberOf"][propertyCounter];

                    equalsIndex = dn.IndexOf("=", 1);
                    commaIndex = dn.IndexOf(",", 1);
                    
                    if (-1 == equalsIndex)
                    {
                        return null;
                    }
                    
                    groupNames.Append(dn.Substring((equalsIndex + 1),(commaIndex - equalsIndex) - 1));
                    groupNames.Append("|");
                }

            }
            catch (Exception ex)
            {
                AuditEvent.AppEventError(AppSession.Parameters.GeneralAdminEmail.Value, "LDAP obtaining group names failed.", String.Format("Member:{0}, Message:{1}", UserName, ex.Message), true);
            }
            return groupNames.ToString();
        }
    
    }

    /// <summary>
    ///  Provides security token information.
    /// </summary>
    public class AuthMemberToken
    {
        /// <summary>
        /// Member unique item identifier.
        /// </summary>
        public long MemberID { get; set; }
        /// <summary>
        /// Member name.
        /// </summary>
        public string MemberName { get; set; }
        /// <summary>
        /// Member e-mail
        /// </summary>
        public string MemberEmail { get; set; }
        /// <summary>
        /// Session unique item identifier.
        /// </summary>
        public string Token { get; set; }
        /// <summary>
        /// Application domain.
        /// </summary>
        public string Domain { get; set; }
    }
    
    /// <summary>
    /// Validation result class.
    /// </summary>
    public class ActionValidationResult : IApplicationObject {
        
        /// <summary>
        /// Validation result flag.
        /// </summary>
        [DataMember]
        public bool IsValid { get; set; }

        /// <summary>
        /// Expiration Date. 
        /// </summary>
        [DataMember(EmitDefaultValue = false)]
        public DateTime Expiration { get; set; }

        /// <summary>
        /// Creates ValidationResult object which is base on result set field values.
        /// </summary>
        /// <param name="dr">DataReader object which represents current row in the resultset.</param>
        public virtual bool Load(IDataReader dr)
        {
            return true;
        }

    }

    /// <summary>
    /// Social ValidationResult structure for API using. We need this for correct json object for API.
    /// </summary>
    public class ActionValidationResults : ApplicationCollection<ActionValidationResult, DbRoleAdmin, SpRoleAdmin>
    {

    }

}
