using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.IO;

namespace Web.App
{
    public partial class ShowImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Table_Name"] != null && Request.QueryString["Image_Name"] != null && Request.QueryString["ID"] != null)
            {
                String Where_Clause = Request.QueryString["Image_Name"] + " From " + Request.QueryString["Table_Name"] + " Where " + Request.QueryString["ID"];
                Show_Image Show_Image = new Show_Image();

                DataTable dt = Show_Image.Display(Where_Clause);
                if (dt != null)
                {
                    Byte[] bytes = (Byte[])dt.Rows[0][Request.QueryString["Image_Name"]];
                    //convert to image; resize; then convert back to byte array to display in redirect
                    System.Drawing.Image image = byteArrayToImage(bytes);
                    Size size = new Size(100, 100);
                    resizeImage(image, size);
                    bytes = imageToByteArray(image);
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.ContentType = Request.QueryString["Image_Name"];
                    Response.AddHeader("content-disposition", "attachment;filename="
                    + Request.QueryString["Image_Name"]);
                    Response.BinaryWrite(bytes);
                    Response.Flush();
                    Response.End();
                }
            }
        }
        //resize image
        public static System.Drawing.Image resizeImage(System.Drawing.Image imgToResize, Size size)
        {
            return (System.Drawing.Image)(new Bitmap(imgToResize, size));
        }
        // convert image to byte array
        public byte[] imageToByteArray(System.Drawing.Image imageIn)
        {
            MemoryStream ms = new MemoryStream();
            imageIn.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            return ms.ToArray();
        }
        //Byte array to photo
        public System.Drawing.Image byteArrayToImage(byte[] byteArrayIn)
        {
            MemoryStream ms = new MemoryStream(byteArrayIn);
            System.Drawing.Image returnImage = System.Drawing.Image.FromStream(ms);
            return returnImage;
        }
    }
}