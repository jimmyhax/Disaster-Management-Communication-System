using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;
using System.Collections;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.IO;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Xml;
using System.Web.Services;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.Net;
using ExifLib;
using DMCS.App_Code;

namespace DMCS.Moduals.Evacuation.Obstructions
{
    public partial class Create_Obstruction : System.Web.UI.Page
    {
        public String imageUrl = "";
        public Double Lat = 0;
        public Double Lng = 0;
        public String Direction;
        public String filename;
        public String Server_File_Path = "C:\\Users\\jim\\Documents\\DMCS\\DMCSProd\\Images\\Obstruction_Submissions\\Full_Size\\";

        //disaster locations
        public Decimal nLat;
        public Decimal nLong;

        public Decimal sLat;
        public Decimal sLong;

        public Decimal eLat;
        public Decimal eLong;

        public Decimal wLat;
        public Decimal wLong;

        //on initial loading of the page-- load initialize() *This starts the Map from the beginning*
        protected void Page_Load(object sender, EventArgs e)
        {
            Date_Reported_TextBox.Text = Convert.ToString(DateTime.Now);

            if (!ClientScript.IsStartupScriptRegistered("initialize"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                    "initialize", "initialize();", true);
            }
            if (!Page.IsPostBack)
            {

            }
        }
        //display the disaster on screen 
        protected void ddlDisaster_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                disaster disaster = new disaster();
                GlobalVariables.DisasterID = Convert.ToInt32(ddlDisaster.SelectedItem.Value);
                disaster = disaster.Select(Convert.ToInt32(ddlDisaster.SelectedItem.Value));
                nLat = disaster.disaster_north_latitude;
                nLong = disaster.disaster_north_longitude;

                sLat = disaster.disaster_south_latitude;
                sLong = disaster.disaster_south_longitude;

                eLat = disaster.disaster_east_latitude;
                eLong = disaster.disaster_east_longitude;

                wLat = disaster.disaster_west_latitude;
                wLong = disaster.disaster_west_longitude;

                Page.ClientScript.RegisterStartupScript(this.GetType(), "plotPoly", "plotPoly()", true);

            }
            catch { }
        }




        protected void PreviewImage_Click(object sender, EventArgs e)
        {

            if (FileUpload1.HasFile)
            {

                //Get Data and save images
                GetData_SaveImages();

                //call javascript to display new image
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "createObstruction()", true);

                Preview_btn.Visible = false;
                Submit_Obstruction_btn.Visible = true;
            }
            else
            {
                ERROR.Text = "Please ipload a image first to preview";
                return;
            }
        }
        public void GetData_SaveImages()
        {
            try
            {
                filename = Path.GetFileName(FileUpload1.FileName);
                //--
                Size eimgFullSize = new Size();
                eimgFullSize.Height = 400;
                eimgFullSize.Width = 400;
                //---
                Size eimgThumbSize = new Size();
                eimgThumbSize.Height = 30;
                eimgThumbSize.Width = 30;
                //-- 
                Size eimgPosterSize = new Size();
                eimgPosterSize.Height = 250;
                eimgPosterSize.Width = 250;
                //---
                //======== Place in global variables at byte stage for better database storing
                GlobalVariables.Thumb_Image = (Byte[])ResizeImageFile(FileUpload1.FileBytes, eimgThumbSize);  //2
                GlobalVariables.Poster_Image = (Byte[])ResizeImageFile(FileUpload1.FileBytes, eimgPosterSize);  //3
                GlobalVariables.Full_Image = ResizeImageFile(FileUpload1.FileBytes, eimgFullSize);          //1
                //======== Convert each global variable to a image with approprate sizes
                System.Drawing.Image THUMB = byteArrayToImage(GlobalVariables.Thumb_Image);
                System.Drawing.Image POSTER = byteArrayToImage(GlobalVariables.Poster_Image);
                System.Drawing.Image FULL = byteArrayToImage(GlobalVariables.Full_Image);
                System.Drawing.Image ORG = byteArrayToImage(FileUpload1.FileBytes);
                //======== Pass URL Strings to Global variables for database storing
                GlobalVariables.Thumb_URL = (Server.MapPath(@"Images\Obstruction_Submissions\Thumb_Size\") + filename);
                GlobalVariables.Poster_URL = (Server.MapPath(@"Images\Obstruction_Submissions\Poster_Size\") + filename);
                GlobalVariables.Full_URL = (Server.MapPath(@"Images\Obstruction_Submissions\Full_Size\") + filename);
                //======== save them to the HD
                THUMB.Save(Server.MapPath(@"Images\Obstruction_Submissions\Thumb_Size\") + filename);
                POSTER.Save(Server.MapPath(@"Images\Obstruction_Submissions\Poster_Size\") + filename);
                FULL.Save(Server.MapPath(@"Images\Obstruction_Submissions\Full_Size\") + filename);
                ORG.Save(Server.MapPath(@"Images\Obstruction_Submissions\Original\") + filename);
                //======== ImageUrl is called every page load in the javascript int. function. This needs to be in JavaScript Dir format... thus: ../../ instead of ~\
                imageUrl = "Images/Obstruction_Submissions/Thumb_Size/" + filename;
                //======== displays a preview of the image
                Preview_ImageBox.ImageUrl = @"Images/Obstruction_Submissions/Poster_Size/" + filename;
                //======== display status
                ERROR.Text = "Upload status: File uploaded!";

            }
            catch (Exception ex)
            {
                // Read the default NoImage file
                Byte[] imgByte = null;
                //--
                Size eimgFullSize = new Size();
                eimgFullSize.Height = 400;
                eimgFullSize.Width = 400;
                //---
                Size eimgThumbSize = new Size();
                eimgThumbSize.Height = 30;
                eimgThumbSize.Width = 30;
                //-- 
                Size eimgPosterSize = new Size();
                eimgPosterSize.Height = 250;
                eimgPosterSize.Width = 250;
                //--
                imgByte = ImageToByteArrayFromFilePath(@"Images\Default_Person.jpg");
                //========
                GlobalVariables.Full_Image = ResizeImageFile(imgByte, eimgFullSize);            //1
                GlobalVariables.Thumb_Image = (Byte[])ResizeImageFile(imgByte, eimgThumbSize);  //2
                GlobalVariables.Poster_Image = (Byte[])ResizeImageFile(imgByte, eimgPosterSize);  //3
                //======== ImageUrl is called every page load in the javascript int. function. This needs to be in JavaScript Dir format... thus: ../../ instead of ~\
                imageUrl = "Images/Default_Person.jpg";
                //======== displays a preview of the image
                Preview_ImageBox.ImageUrl = @"Images\Default_Person.jpg";
                //======== display error
                ERROR.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                //======== break function
                return;
            }

            using (ExifReader reader = new ExifReader(Server.MapPath(@"Images\Obstruction_Submissions\Original\") + filename))
            {
                // Extract Lat and Long
                //////////////////////////////////////////////////////////////
                double[] latitudeDMS;
                reader.GetTagValue(ExifTags.GPSLatitude, out latitudeDMS);
                double[] longitudeDMS;
                reader.GetTagValue(ExifTags.GPSLongitude, out longitudeDMS);
                //////////////////////////////////////////////////////////////
                string latitudeRef;
                reader.GetTagValue(ExifTags.GPSLatitudeRef, out latitudeRef);
                string longitudeRef;
                reader.GetTagValue(ExifTags.GPSLongitudeRef, out longitudeRef);
                //////////////////////////////////////////////////////////////
                if (latitudeRef != null || longitudeRef != null)
                {
                    //////////////////////////////////////////////////////////////
                    // Extract Lat-Lng Cords
                    Lat = (latitudeRef == "N" ? 1 : -1) * (latitudeDMS[0] + latitudeDMS[1] / 60 + latitudeDMS[2] / 3600);
                    Lng = (longitudeRef == "E" ? 1 : -1) * (longitudeDMS[0] + longitudeDMS[1] / 60 + longitudeDMS[2] / 3600);
                    //////////////////////////////////////////////////////////////
                    // Extract Compass Data
                    string imgDirectionRef;
                    reader.GetTagValue(ExifTags.GPSImgDirectionRef, out imgDirectionRef);
                    double imgDirection;
                    reader.GetTagValue(ExifTags.GPSImgDirection, out imgDirection);
                    Direction = imgDirection.ToString();
                    //////////////////////////////////////////////////////////////
                    // Extract Datetime taken
                    DateTime datePictureTaken;
                    if (reader.GetTagValue<DateTime>(ExifTags.DateTimeDigitized, out datePictureTaken))
                    {
                        Date_Reported_TextBox.Text = Convert.ToString(datePictureTaken);
                    }
                    //////////////////////////////////////////////////////////////
                    //////////////////////////////////////////////////////////////
                    //////////////////////////////////////////////////////////////
                    //Ready_For_Insert 
                    //////////////////////////////////////////////////////////////
                    //////////////////////////////////////////////////////////////
                    //////////////////////////////////////////////////////////////
                }
                else
                {
                    Response.Write(@"<script language='javascript'>alert('Your image did not have any location information.\n Please click the location where this image was taken.');</script>");
                    // TO DO: SELECT LOCATION AND COMPASS DIRECTION FROM MAP MANUALLY

                }
            }

        }

        protected void Submit_Obstruction(object sender, EventArgs e)
        {
            ERROR.Text = "Your Obstruction report has been submitted for review by our admins";
        }




        public static byte[] ImageToByteArrayFromFilePath(string imagefilePath)
        {
            byte[] imageArray = File.ReadAllBytes(imagefilePath);
            return imageArray;
        }
        public System.Drawing.Image byteArrayToImage(byte[] byteArrayIn)
        {
            MemoryStream ms = new MemoryStream(byteArrayIn);
            System.Drawing.Image returnImage = System.Drawing.Image.FromStream(ms);
            return returnImage;
        }
        private byte[] ResizeImageFile(byte[] imageFile, Size targetSize)
        {
            using (System.Drawing.Image oldImage = System.Drawing.Image.FromStream(new MemoryStream(imageFile)))
            {
                Size newSize = CalculateDimensions(oldImage.Size, targetSize.Height, targetSize.Width);
                using (Bitmap newImage = new Bitmap(newSize.Width, newSize.Height, PixelFormat.Format24bppRgb))
                {
                    using (Graphics canvas = Graphics.FromImage(newImage))
                    {
                        canvas.SmoothingMode = SmoothingMode.AntiAlias;
                        canvas.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        canvas.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        canvas.DrawImage(oldImage, new Rectangle(new Point(0, 0), newSize));
                        MemoryStream m = new MemoryStream();
                        newImage.Save(m, ImageFormat.Jpeg);
                        return m.GetBuffer();
                    }
                }
            }
        }
        private Size CalculateDimensions(Size oldSize, int targetH, int targetW)
        {
            Size newSize = new Size();
            if (oldSize.Height > oldSize.Width)
            {
                newSize.Width = targetW;
                newSize.Height = targetH;
            }
            else
            {
                //Make the image as uniform with fix size.
                newSize.Width = targetW;
                newSize.Height = targetH;
            }
            return newSize;
        }
    }
}