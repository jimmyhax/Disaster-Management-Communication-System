using System;
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
using DMCS.App_Code;

/// <summary>
/// Author: James Miller
/// Date: 6/20/2013
/// </summary>

[Serializable]
internal class Manage
{
    private const string FILEUPLOAD = "FileUpload";
    public static string SessionFileZise
    {
        get
        {
            if (HttpContext.Current.Session[FILEUPLOAD] == null)
            {
                return string.Empty;
            }
            else
            {
                return HttpContext.Current.Session[FILEUPLOAD].ToString();
            }
        }
        set
        {
            HttpContext.Current.Session[FILEUPLOAD] = value;
        }
    }

}

public partial class UsersControl_UserAccountUC : System.Web.UI.UserControl
{
    public void DisplayInfo(object sender, EventArgs e)
    {
        this.Image1 = null;
        Page_Load(sender, e);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Image1 == null)
        {


        }

    }

    protected void ShowMessage(string message, int fileUploadPos)
    {
        if (fileUploadPos == 0)
        {
            Label1.Text = message;
        }
    }

    protected void btnClose_Click(object sender, ImageClickEventArgs e)
    {

        Page.GetType().InvokeMember("CloseModalUserAccountUC", System.Reflection.BindingFlags.InvokeMethod, null, Page, null);
        this.Dispose();
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        this.Image1 = null;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

        bool success = false;
        HttpFileCollection uploadFilCol = null;
        FileUpload img = null;
        FileUpload imgUpload = null;
        var originalSize = Tools.Tools.IifInt(Manage.SessionFileZise);
        try
        {
            HttpFileCollection uploadFil = Request.Files;
            uploadFilCol = uploadFil;
            imgUpload = (FileUpload)Session["UploadFile2"];
            img = (FileUpload)imgUpload;
            originalSize = Tools.Tools.IifInt(Manage.SessionFileZise);
        }
        catch (Exception)
        {
            return;
        }
        var targetDir = Server.MapPath("~/upload/");
        var sourceDirFile = Server.MapPath("~/Images/");
        string[] files = Directory.GetFiles(targetDir);
        if (this.Image1.ImageUrl == string.Empty)
        {
            // Save record with default image NoImage...
            SaveRecord(false, imgUpload, img, originalSize,
                 sourceDirFile, files);

        }
        else
        {
            SaveRecord(true, imgUpload, img, originalSize,
               sourceDirFile, files);

        }

        try
        {
            foreach (string file in files)
            {
                File.SetAttributes(file, FileAttributes.Normal);
                File.Delete(file);
            }
        }
        catch (FileNotFoundException)
        {

        }
        this.FileUpload1.Dispose();
        success = true;
        this.Label1.Text = "Record was successfuly save.";

        if (success)
        {
            Page.GetType().InvokeMember("CloseModalUserAccountUC", System.Reflection.BindingFlags.InvokeMethod, null, Page, null);
        }
    }


    private void SaveRecord(bool withImage, FileUpload imgUpload, FileUpload img,
        int originalSize, string sourceDirFile, string[] files)
    {

        Byte[] imgByte = null;
        try
        {
            if (img.HasFile && img.PostedFile != null)
            {
                //To create a PostedFile
                HttpPostedFile File = imgUpload.PostedFile;
                //Create byte Array with file len
                imgByte = new Byte[File.ContentLength];
                //force the control to load data in array
                File.InputStream.Read(imgByte, 0, File.ContentLength);
                originalSize = File.ContentLength;
            }
        }
        catch
        {

        }
        try
        {


            Size eimgFullSize = new Size();
            eimgFullSize.Height = 400;
            eimgFullSize.Width = 400;
            //---
            Size eimgThumbSize = new Size();
            eimgThumbSize.Height = 100;
            eimgThumbSize.Width = 100;
            //-- 
            Size eimgPosterSize = new Size();
            eimgPosterSize.Height = 250;
            eimgPosterSize.Width = 250;
            //---
            Byte[] eimgFull = null;
            Byte[] eimgThumb = null;
            Byte[] eimgPoster = null;
            //========
            if (withImage)
            {
                eimgFull = ResizeImageFile(imgByte, eimgFullSize);         //1
                eimgThumb = (Byte[])ResizeImageFile(imgByte, eimgThumbSize);  //2
                eimgPoster = (Byte[])ResizeImageFile(imgByte, eimgPosterSize);  //3

                GlobalVariables.Pet_Full_Image = eimgFull;
                GlobalVariables.Pet_Thumb_Image = eimgThumb;
                GlobalVariables.Pet_Poster_Image = eimgPoster;
            }
            else
            {
                // Read the default NoImage file
                System.Drawing.Image image1 = System.Drawing.Image.FromFile("~Images/petPlaceHolder.png");
                imgByte = ImageToByte2(image1);
                eimgFull = ResizeImageFile(imgByte, eimgFullSize);            //1
                eimgThumb = (Byte[])ResizeImageFile(imgByte, eimgThumbSize);  //2
                eimgPoster = (Byte[])ResizeImageFile(imgByte, eimgPosterSize);  //3

                GlobalVariables.Pet_Full_Image = eimgFull;
                GlobalVariables.Pet_Thumb_Image = eimgThumb;
                GlobalVariables.Pet_Poster_Image = eimgPoster;
            }


            Size targetSize = new Size();
            targetSize.Width = 100;
            targetSize.Height = 100;



        }
        catch
        {

        }
    }
    private string CleanText(string p)
    {
        string str = string.Empty;
        if (p != string.Empty)
        {
            str = p.Replace("&nbsp;", "");
        }
        return str;
    }


    public static byte[] ImageToByte2(System.Drawing.Image img)
    {
        byte[] byteArray = new byte[0];
        using (MemoryStream stream = new MemoryStream())
        {
            img.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
            stream.Close();
            byteArray = stream.ToArray();
        }
        return byteArray;
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

    protected void btnUpload_Click(object sender, EventArgs e)
    {

        bool hasFile = false;
        string fileName = string.Empty;
        HttpPostedFile file = null;
        HttpFileCollection uploadFilCol = Request.Files;

        hasFile = true;
        HttpPostedFile file2 = uploadFilCol[0];
        if (file2.ContentLength == 0)
        {
            return;
        }
        file = uploadFilCol[0];
        Session["UploadFile2"] = FileUpload1;
        Manage.SessionFileZise = file.ContentLength.ToString();
        string fileExt = Path.GetExtension(file.FileName).ToLower();
        fileName = Path.GetFileName(file.FileName);
        if (fileName != string.Empty)
        {
            try
            {
                if (fileExt == ".jpg" || fileExt == ".gif")
                {
                    GlobalVariables.pictureLocation = Server.MapPath("~/upload/") + fileName;
                    file.SaveAs(Server.MapPath("~/upload/") + fileName);
                    this.ShowMessage(" " + fileName + " Successfully Uploaded", 0);

                }
                else
                {
                    // We do allow image file only
                    this.Label1.Text = "Valid files to upload are .jpg and .gif only!";
                    Page.GetType().InvokeMember("IvokeAdd", System.Reflection.BindingFlags.InvokeMethod, null, Page, null);
                    return;
                }
                this.hfUrl.Value = fileName;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        string fileImgName = "~/upload/" + fileName;
        this.Image1.ImageUrl = fileImgName;
        upImg.Update();

        if (hasFile)
        {

            this.btnSave.Enabled = true;
            Page.GetType().InvokeMember("IvokeAdd", System.Reflection.BindingFlags.InvokeMethod, null, Page, null);
        }
        else
        {
            this.btnSave.Enabled = false;
        }



    }
}
