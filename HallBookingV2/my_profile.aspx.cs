using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HallBookingV2
{
    public partial class my_profile : System.Web.UI.Page
    {

        protected string UserName;

        data.DataAccessManager dam = new data.DataAccessManager();
        data.user_data objUser;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] != null)
                {
                    UserName = Session["CurrentUser"].ToString();
                    Session["CurrentUser"] = UserName;

                    GetuserDetail(UserName);
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                objUser = new data.user_data();

                objUser.SetUserName(txtName.Text);
                objUser.SetuserCompany(txtCompany.Text);
                objUser.SetuserAddress(txtAddress.Text);
                objUser.SetuserDesc(txtAbout.Text);
                objUser.SetuserPhone(txtPhone.Text);
                objUser.Setfacebook(txtFacebook.Text);
                objUser.Settwitter(txtTwitter.Text);
                string userID = dam.GetUserID(txtName.Text);
                objUser.SetUserID(userID);
                dam.UpdateUserDetail(objUser);

                UpdateProfilePic(objUser.GetUserID());

            }
            catch (Exception ex)
            {
                dam.KeepLog("my profile | btnUpdate Click", ex.ToString());
            }

        }

        private void UpdateProfilePic(string userID)
        {
            try
            {
                string ProfilePicFilePath;
                
                //Check if the file is grabbed
                if (FileUpload1.HasFile)
                {
                    //define valid image formats to upload
                    if (FileUpload1.PostedFile.ContentType == "image/jpeg" || FileUpload1.PostedFile.ContentType == "image/bmp" || FileUpload1.PostedFile.ContentType == "image/gif" || FileUpload1.PostedFile.ContentType == "image/png" || FileUpload1.PostedFile.ContentType == "image/jpg")
                    {
                        //Label2.Visible = false;
                        //define maximum file size to upload
                        if (FileUpload1.PostedFile.ContentLength < 4194304)
                        {
                            //grab the image file extension
                            string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);

                            //Generate a new file name
                            string newfilename = Guid.NewGuid().ToString();

                            //Generate the folder path for a user
                            string folderpath = Server.MapPath("~/") + "Member\\" + userID;


                            if (!Directory.Exists(folderpath))
                            {
                                //If Directory (Folder) does not exists. Create it.
                                Directory.CreateDirectory(folderpath);
                            }

                            //Also create a folder for images
                            if (!Directory.Exists(folderpath + "\\Images"))
                            {
                                //If Directory (Folder) does not exists. Create it.
                                Directory.CreateDirectory(folderpath + "\\Images");
                            }

                            //Create a folder for profile pictures
                            if (!Directory.Exists(folderpath + "\\Images\\ProfileImages"))
                            {
                                //If Directory (Folder) does not exists. Create it.
                                Directory.CreateDirectory(folderpath + "\\Images\\ProfileImages");
                            }

                            //Set the file path globally                            
                            ProfilePicFilePath = Server.MapPath("~/") + "Member\\" + userID + "\\Images\\ProfileImages\\" + newfilename + extension;

                            //Check wheather the file name is already exsist                            
                            while (true)
                            {
                                if (System.IO.File.Exists(ProfilePicFilePath))
                                {
                                    newfilename = Guid.NewGuid().ToString();
                                }
                                else
                                {
                                    break;
                                }
                            }

                            //Save the selected file into specific location inthe server
                            FileUpload1.SaveAs(ProfilePicFilePath);
                            //Label2.Visible = true;
                            //lblError.Text = "Your file is uploading. Please wait!";
                            while (true)
                            {
                                //check weather the file is properly saved                                
                                if (System.IO.File.Exists(ProfilePicFilePath))
                                {
                                    imgProfile.ImageUrl = "~/Member\\" + userID + "\\Images\\ProfileImages\\" + newfilename + extension;
                                    dam.UpdateProfilePicture(ProfilePicFilePath, userID);
                                    break;
                                }
                            }
                            FileUpload1.Dispose();
                        }
                        else
                        {
                            lblError.Text = "Your uploaded image exceeded the maximum file size.";
                            //Label2.Visible = true;
                        }
                    }
                    else
                    {
                        lblError.Text = "Selected file is not in valid image format.";
                        //Label2.Visible = true;
                    }
                }
                else
                {
                    //ProfilePicFilePath = "Default Image";
                    //da.UpdateProfilePicture(ProfilePicFilePath, LoggedInUser);
                }
            }
            catch (Exception)
            {

            }
        }

        private void GetuserDetail(string userName)
        {
            try
            {
                string userID = dam.GetUserID(userName);
                objUser = dam.GetUser(userID);

                txtName.Text = objUser.GetUserName();
                txtCompany.Text = objUser.GetuserCompany();
                txtAddress.Text = objUser.GetuserAddress();
                txtAbout.Text = objUser.GetuserDesc();
                txtPhone.Text = objUser.GetuserPhone();
                txtEmail.Text = objUser.GetEmail();
                txtFacebook.Text = objUser.Getfacebook();
                txtTwitter.Text = objUser.Gettwitter();

                string propicdbpath = objUser.GetProfilePicture();

                if (propicdbpath.Equals("") || propicdbpath.Equals("Default Image"))
                {
                    //set profile picture default image 
                }
                else
                {
                    propicdbpath = propicdbpath.Replace(@"h:\root\home\kamal1975-001\www\venue", "..");
                    propicdbpath = propicdbpath.Replace(@"\", "/");
                    imgProfile.ImageUrl = propicdbpath;
                }
            }
            catch (Exception ex)
            {
                dam.KeepLog("my profile | GetuserDetail", ex.ToString());
            }

        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();

            // clear authentication cookie
            HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            cookie1.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie1);

            // clear session cookie (not necessary for your current problem but i would recommend you do it anyway)
            SessionStateSection sessionStateSection = (SessionStateSection)WebConfigurationManager.GetSection("system.web/sessionState");
            HttpCookie cookie2 = new HttpCookie(sessionStateSection.CookieName, "");
            cookie2.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie2);

            FormsAuthentication.RedirectToLoginPage();
        }
    }
}