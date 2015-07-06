using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;
using System.Reflection;
using System.Data.SqlClient;
using System.IO;
using System.Security.Cryptography;


namespace Web.Admin.Logic.Utilities
{
   /// <summary>
   /// represent different metheds to support admin application needs.  
   /// </summary>
   public class Tools{

        /// <summary>
        /// Creates hexdecimal string representation of MachineKey web.cinfig file setting.
        /// </summary>
        /// <param name="bytelength">Key length.</param>
        /// <returns>Hexdecimal string representation of MachineKey.</returns>
        public static string GenerateMachineKey(int bytelength)
        {
            byte[] buff = new byte[bytelength];
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            rng.GetBytes(buff);
            StringBuilder sb = new StringBuilder(bytelength * 2);
            for (int i = 0; i < buff.Length; i++)
                sb.Append(string.Format("{0:X2}", buff[i]));
            return sb.ToString();
        }  
  }

   // This site http://strongpasswordgenerator.com/ were used to 
   // generate this 16 characters keys

   /// <summary>
   /// Generate this 16 characters keys
   /// </summary>
   public static class Encryptor
   {
       private static byte[] _salt = Encoding.ASCII.GetBytes("n58cSt1[W,J0=T38");

       /// <summary>
       /// Encrypt the given string using AES.  The string can be decrypted using 
       /// DecryptStringAES().  The sharedSecret parameters must match.
       /// </summary>
       /// <param name="plainText">The text to encrypt.</param>
       /// <param name="sharedSecret">A password used to generate a key for encryption.</param>
       public static string EncryptStringAES(string plainText, string sharedSecret)
       {
           if (string.IsNullOrEmpty(plainText))
               throw new ArgumentNullException("plainText");
           if (string.IsNullOrEmpty(sharedSecret))
               throw new ArgumentNullException("sharedSecret");

           string outStr = null;            // Encrypted string to return
           RijndaelManaged aesAlg = null;   // RijndaelManaged object used to encrypt the data.

           try
           {
               // generate the key from the shared secret and the salt
               Rfc2898DeriveBytes key = new Rfc2898DeriveBytes(sharedSecret, _salt);

               // Create a RijndaelManaged object
               // with the specified key and IV.
               aesAlg = new RijndaelManaged();
               aesAlg.Key = key.GetBytes(aesAlg.KeySize / 8);
               aesAlg.IV = key.GetBytes(aesAlg.BlockSize / 8);

               // Create a decrytor to perform the stream transform.
               ICryptoTransform encryptor = aesAlg.CreateEncryptor(aesAlg.Key, aesAlg.IV);

               // Create the streams used for encryption.
               using (MemoryStream msEncrypt = new MemoryStream())
               {
                   using (CryptoStream csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write))
                   {
                       using (StreamWriter swEncrypt = new StreamWriter(csEncrypt))
                       {

                           //Write all data to the stream.
                           swEncrypt.Write(plainText);
                       }
                   }
                   outStr = Convert.ToBase64String(msEncrypt.ToArray());
               }
           }
           finally
           {
               // Clear the RijndaelManaged object.
               if (aesAlg != null)
                   aesAlg.Clear();
           }

           // Return the encrypted bytes from the memory stream.
           return outStr;
       }

       /// <summary>
       /// Decrypt the given string.  Assumes the string was encrypted using 
       /// EncryptStringAES(), using an identical sharedSecret.
       /// </summary>
       /// <param name="cipherText">The text to decrypt.</param>
       /// <param name="sharedSecret">A password used to generate a key for encryption.</param>
       public static string DecryptStringAES(string cipherText, string sharedSecret)
       {
           if (string.IsNullOrEmpty(cipherText))
               throw new ArgumentNullException("cipherText");
           if (string.IsNullOrEmpty(sharedSecret))
               throw new ArgumentNullException("sharedSecret");

           // Declare the RijndaelManaged object
           // used to decrypt the data.
           RijndaelManaged aesAlg = null;

           // Declare the string used to hold
           // the decrypted text.
           string plaintext = null;

           try
           {
               // generate the key from the shared secret and the salt
               Rfc2898DeriveBytes key = new Rfc2898DeriveBytes(sharedSecret, _salt);

               // Create a RijndaelManaged object
               // with the specified key and IV.
               aesAlg = new RijndaelManaged();
               aesAlg.Key = key.GetBytes(aesAlg.KeySize / 8);
               aesAlg.IV = key.GetBytes(aesAlg.BlockSize / 8);

               // Create a decrytor to perform the stream transform.
               ICryptoTransform decryptor = aesAlg.CreateDecryptor(aesAlg.Key, aesAlg.IV);
               // Create the streams used for decryption.                
               byte[] bytes = Convert.FromBase64String(cipherText);
               using (MemoryStream msDecrypt = new MemoryStream(bytes))
               {
                   using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                   {
                       using (StreamReader srDecrypt = new StreamReader(csDecrypt))

                           // Read the decrypted bytes from the decrypting stream
                           // and place them in a string.
                           plaintext = srDecrypt.ReadToEnd();
                   }
               }
           }
           finally
           {
               // Clear the RijndaelManaged object.
               if (aesAlg != null)
                   aesAlg.Clear();
           }

           return plaintext;
       }

       /// <summary>
       /// The method create a Base64 encoded string from a normal string.
       /// </summary>
       /// <param name="toEncode">The String containing the characters to encode.</param>
       /// <returns>The Base64 encoded string.</returns>
       public static string EncodeTo64(string toEncode)
       {
           byte[] toEncodeAsBytes = System.Text.Encoding.Unicode.GetBytes(toEncode);
           string returnValue = System.Convert.ToBase64String(toEncodeAsBytes);
           return returnValue;
       }

       /// <summary>
       /// The method to Decode your Base64 strings.
       /// </summary>
       /// <param name="encodedData">The String containing the characters to decode.</param>
       /// <returns>A String containing the results of decoding the specified sequence of bytes.</returns>
       public static string DecodeFrom64(string encodedData)
       {
           byte[] encodedDataAsBytes = System.Convert.FromBase64String(encodedData);
           string returnValue = System.Text.Encoding.Unicode.GetString(encodedDataAsBytes);
           return returnValue;
       }
   }


    // Sample encrypt/decrypt functions 
    // Parameter checks and error handling
    // are ommited for better readability 
    // http://www.codeproject.com/Articles/5719/Simple-encrypting-and-decrypting-data-in-C
    // http://stackoverflow.com/questions/202011/encrypt-decrypt-string-in-net

    /// <summary>
    /// Simple encrypt/decrypt functions 
    /// </summary>
    public class EncryptDecrypt 
{
    /// <summary>
    /// Encrypt a byte array into a byte array using a key and an IV  
    /// </summary>
    /// <param name="clearData"></param>
    /// <param name="Key"></param>
    /// <param name="IV"></param>
    /// <returns></returns>
    public static byte[] Encrypt(byte[] clearData, byte[] Key, byte[] IV) 
    { 
        // Create a MemoryStream to accept the encrypted bytes 
        MemoryStream ms = new MemoryStream(); 

        // Create a symmetric algorithm. 
        // We are going to use Rijndael because it is strong and
        // available on all platforms. 
        // You can use other algorithms, to do so substitute the
        // next line with something like 
        //      TripleDES alg = TripleDES.Create(); 
        Rijndael alg = Rijndael.Create(); 

        // Now set the key and the IV. 
        // We need the IV (Initialization Vector) because
        // the algorithm is operating in its default 
        // mode called CBC (Cipher Block Chaining).
        // The IV is XORed with the first block (8 byte) 
        // of the data before it is encrypted, and then each
        // encrypted block is XORed with the 
        // following block of plaintext.
        // This is done to make encryption more secure. 

        // There is also a mode called ECB which does not need an IV,
        // but it is much less secure. 
        alg.Key = Key; 
        alg.IV = IV; 

        // Create a CryptoStream through which we are going to be
        // pumping our data. 
        // CryptoStreamMode.Write means that we are going to be
        // writing data to the stream and the output will be written
        // in the MemoryStream we have provided. 
        CryptoStream cs = new CryptoStream(ms, 
           alg.CreateEncryptor(), CryptoStreamMode.Write); 

        // Write the data and make it do the encryption 
        cs.Write(clearData, 0, clearData.Length); 

        // Close the crypto stream (or do FlushFinalBlock). 
        // This will tell it that we have done our encryption and
        // there is no more data coming in, 
        // and it is now a good time to apply the padding and
        // finalize the encryption process. 
        cs.Close(); 

        // Now get the encrypted data from the MemoryStream.
        // Some people make a mistake of using GetBuffer() here,
        // which is not the right way. 
        byte[] encryptedData = ms.ToArray();

        return encryptedData; 
    } 

    /// <summary>
    /// Encrypts a string into a string using a password.
    /// </summary>
    /// <param name="clearText"></param>
    /// <param name="Password"></param>
    /// <returns></returns>
    public static string Encrypt(string clearText, string Password) 
    { 
        // First we need to turn the input string into a byte array. 
        byte[] clearBytes = 
          System.Text.Encoding.Unicode.GetBytes(clearText); 

        // Then, we need to turn the password into Key and IV 
        // We are using salt to make it harder to guess our key
        // using a dictionary attack - 
        // trying to guess a password by enumerating all possible words. 
        PasswordDeriveBytes pdb = new PasswordDeriveBytes(Password, 
            new byte[] {0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 
            0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76}); 

        // Now get the key/IV and do the encryption using the
        // function that accepts byte arrays. 
        // Using PasswordDeriveBytes object we are first getting
        // 32 bytes for the Key 
        // (the default Rijndael key length is 256bit = 32bytes)
        // and then 16 bytes for the IV. 
        // IV should always be the block size, which is by default
        // 16 bytes (128 bit) for Rijndael. 
        // If you are using DES/TripleDES/RC2 the block size is
        // 8 bytes and so should be the IV size. 
        // You can also read KeySize/BlockSize properties off
        // the algorithm to find out the sizes. 
        byte[] encryptedData = Encrypt(clearBytes, 
                 pdb.GetBytes(32), pdb.GetBytes(16)); 

        // Now we need to turn the resulting byte array into a string. 
        // A common mistake would be to use an Encoding class for that.
        //It does not work because not all byte values can be
        // represented by characters. 
        // We are going to be using Base64 encoding that is designed
        //exactly for what we are trying to do. 
        return Convert.ToBase64String(encryptedData); 

    }
    
    /// <summary>
    /// Encrypts bytes into bytes using a password.
    /// </summary>
    /// <param name="clearData"></param>
    /// <param name="Password"></param>
    /// <returns></returns>
    public static byte[] Encrypt(byte[] clearData, string Password) 
    { 
        // We need to turn the password into Key and IV. 
        // We are using salt to make it harder to guess our key
        // using a dictionary attack - 
        // trying to guess a password by enumerating all possible words. 
        PasswordDeriveBytes pdb = new PasswordDeriveBytes(Password, 
            new byte[] {0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 
            0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76}); 

        // Now get the key/IV and do the encryption using the function
        // that accepts byte arrays. 
        // Using PasswordDeriveBytes object we are first getting
        // 32 bytes for the Key 
        // (the default Rijndael key length is 256bit = 32bytes)
        // and then 16 bytes for the IV. 
        // IV should always be the block size, which is by default
        // 16 bytes (128 bit) for Rijndael. 
        // If you are using DES/TripleDES/RC2 the block size is 8
        // bytes and so should be the IV size. 
        // You can also read KeySize/BlockSize properties off the
        // algorithm to find out the sizes. 
        return Encrypt(clearData, pdb.GetBytes(32), pdb.GetBytes(16)); 

    }

    /// <summary>
    /// Encrypts a file into another file using a password.  
    /// </summary>
    /// <param name="fileIn"></param>
    /// <param name="fileOut"></param>
    /// <param name="Password"></param>
    public static void Encrypt(string fileIn, 
                string fileOut, string Password) 
    { 

        // First we are going to open the file streams 
        FileStream fsIn = new FileStream(fileIn, 
            FileMode.Open, FileAccess.Read); 
        FileStream fsOut = new FileStream(fileOut, 
            FileMode.OpenOrCreate, FileAccess.Write); 

        // Then we are going to derive a Key and an IV from the
        // Password and create an algorithm 
        PasswordDeriveBytes pdb = new PasswordDeriveBytes(Password, 
            new byte[] {0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 
            0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76}); 

        Rijndael alg = Rijndael.Create(); 
        alg.Key = pdb.GetBytes(32); 
        alg.IV = pdb.GetBytes(16); 

        // Now create a crypto stream through which we are going
        // to be pumping data. 
        // Our fileOut is going to be receiving the encrypted bytes. 
        CryptoStream cs = new CryptoStream(fsOut, 
            alg.CreateEncryptor(), CryptoStreamMode.Write); 

        // Now will will initialize a buffer and will be processing
        // the input file in chunks. 
        // This is done to avoid reading the whole file (which can
        // be huge) into memory. 
        int bufferLen = 4096; 
        byte[] buffer = new byte[bufferLen]; 
        int bytesRead; 

        do { 
            // read a chunk of data from the input file 
            bytesRead = fsIn.Read(buffer, 0, bufferLen); 

            // encrypt it 
            cs.Write(buffer, 0, bytesRead); 
        } while(bytesRead != 0); 

        // close everything 

        // this will also close the unrelying fsOut stream
        cs.Close(); 
        fsIn.Close();     
    } 

    /// <summary>
    /// Decrypts a byte array into a byte array using a key and an IV.
    /// </summary>
    /// <param name="cipherData"></param>
    /// <param name="Key"></param>
    /// <param name="IV"></param>
    /// <returns></returns>
    public static byte[] Decrypt(byte[] cipherData, 
                                byte[] Key, byte[] IV) 
    { 
        // Create a MemoryStream that is going to accept the
        // decrypted bytes 
        MemoryStream ms = new MemoryStream(); 

        // Create a symmetric algorithm. 
        // We are going to use Rijndael because it is strong and
        // available on all platforms. 
        // You can use other algorithms, to do so substitute the next
        // line with something like 
        //     TripleDES alg = TripleDES.Create(); 
        Rijndael alg = Rijndael.Create(); 

        // Now set the key and the IV. 
        // We need the IV (Initialization Vector) because the algorithm
        // is operating in its default 
        // mode called CBC (Cipher Block Chaining). The IV is XORed with
        // the first block (8 byte) 
        // of the data after it is decrypted, and then each decrypted
        // block is XORed with the previous 
        // cipher block. This is done to make encryption more secure. 
        // There is also a mode called ECB which does not need an IV,
        // but it is much less secure. 
        alg.Key = Key; 
        alg.IV = IV; 

        // Create a CryptoStream through which we are going to be
        // pumping our data. 
        // CryptoStreamMode.Write means that we are going to be
        // writing data to the stream 
        // and the output will be written in the MemoryStream
        // we have provided. 
        CryptoStream cs = new CryptoStream(ms, 
            alg.CreateDecryptor(), CryptoStreamMode.Write); 

        // Write the data and make it do the decryption 
        cs.Write(cipherData, 0, cipherData.Length); 

        // Close the crypto stream (or do FlushFinalBlock). 
        // This will tell it that we have done our decryption
        // and there is no more data coming in, 
        // and it is now a good time to remove the padding
        // and finalize the decryption process. 
        cs.Close(); 

        // Now get the decrypted data from the MemoryStream. 
        // Some people make a mistake of using GetBuffer() here,
        // which is not the right way. 
        byte[] decryptedData = ms.ToArray(); 

        return decryptedData; 
    }

    /// <summary>
    /// Decrypts a string into a string using a password  
    /// </summary>
    /// <param name="cipherText"></param>
    /// <param name="Password"></param>
    /// <returns></returns>
    public static string Decrypt(string cipherText, string Password) 
    { 
        // First we need to turn the input string into a byte array. 
        // We presume that Base64 encoding was used 
        byte[] cipherBytes = Convert.FromBase64String(cipherText); 

        // Then, we need to turn the password into Key and IV 
        // We are using salt to make it harder to guess our key
        // using a dictionary attack - 
        // trying to guess a password by enumerating all possible words. 
        PasswordDeriveBytes pdb = new PasswordDeriveBytes(Password, 
            new byte[] {0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 
            0x64, 0x76, 0x65, 0x64, 0x65, 0x76}); 

        // Now get the key/IV and do the decryption using
        // the function that accepts byte arrays. 
        // Using PasswordDeriveBytes object we are first
        // getting 32 bytes for the Key 
        // (the default Rijndael key length is 256bit = 32bytes)
        // and then 16 bytes for the IV. 
        // IV should always be the block size, which is by
        // default 16 bytes (128 bit) for Rijndael. 
        // If you are using DES/TripleDES/RC2 the block size is
        // 8 bytes and so should be the IV size. 
        // You can also read KeySize/BlockSize properties off
        // the algorithm to find out the sizes. 
        byte[] decryptedData = Decrypt(cipherBytes, 
            pdb.GetBytes(32), pdb.GetBytes(16)); 

        // Now we need to turn the resulting byte array into a string. 
        // A common mistake would be to use an Encoding class for that.
        // It does not work 
        // because not all byte values can be represented by characters. 
        // We are going to be using Base64 encoding that is 
        // designed exactly for what we are trying to do. 
        return System.Text.Encoding.Unicode.GetString(decryptedData); 
    }

    /// <summary>
    /// Decrypts bytes into bytes using a password.
    /// </summary>
    /// <param name="cipherData"></param>
    /// <param name="Password"></param>
    /// <returns></returns>
    public static byte[] Decrypt(byte[] cipherData, string Password) 
    { 
        // We need to turn the password into Key and IV. 
        // We are using salt to make it harder to guess our key
        // using a dictionary attack - 
        // trying to guess a password by enumerating all possible words. 
        PasswordDeriveBytes pdb = new PasswordDeriveBytes(Password, 
            new byte[] {0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 
            0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76}); 

        // Now get the key/IV and do the Decryption using the 
        //function that accepts byte arrays. 
        // Using PasswordDeriveBytes object we are first getting
        // 32 bytes for the Key 
        // (the default Rijndael key length is 256bit = 32bytes)
        // and then 16 bytes for the IV. 
        // IV should always be the block size, which is by default
        // 16 bytes (128 bit) for Rijndael. 
        // If you are using DES/TripleDES/RC2 the block size is
        // 8 bytes and so should be the IV size. 

        // You can also read KeySize/BlockSize properties off the
        // algorithm to find out the sizes. 
        return Decrypt(cipherData, pdb.GetBytes(32), pdb.GetBytes(16)); 
    }

    /// <summary>
    /// Decrypts a file into another file using a password. 
    /// </summary>
    /// <param name="fileIn"></param>
    /// <param name="fileOut"></param>
    /// <param name="Password"></param>
    public static void Decrypt(string fileIn, 
                string fileOut, string Password) 
    { 
    
        // First we are going to open the file streams 
        FileStream fsIn = new FileStream(fileIn,
                    FileMode.Open, FileAccess.Read); 
        FileStream fsOut = new FileStream(fileOut,
                    FileMode.OpenOrCreate, FileAccess.Write); 
  
        // Then we are going to derive a Key and an IV from
        // the Password and create an algorithm 
        PasswordDeriveBytes pdb = new PasswordDeriveBytes(Password, 
            new byte[] {0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 
            0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76}); 
        Rijndael alg = Rijndael.Create(); 

        alg.Key = pdb.GetBytes(32); 
        alg.IV = pdb.GetBytes(16); 

        // Now create a crypto stream through which we are going
        // to be pumping data. 
        // Our fileOut is going to be receiving the Decrypted bytes. 
        CryptoStream cs = new CryptoStream(fsOut, 
            alg.CreateDecryptor(), CryptoStreamMode.Write); 
  
        // Now will will initialize a buffer and will be 
        // processing the input file in chunks. 
        // This is done to avoid reading the whole file (which can be
        // huge) into memory. 
        int bufferLen = 4096; 
        byte[] buffer = new byte[bufferLen]; 
        int bytesRead; 

        do { 
            // read a chunk of data from the input file 
            bytesRead = fsIn.Read(buffer, 0, bufferLen); 

            // Decrypt it 
            cs.Write(buffer, 0, bytesRead); 

        } while(bytesRead != 0); 

        // close everything 
        cs.Close(); // this will also close the unrelying fsOut stream 
        fsIn.Close();     
    }
 }

}
