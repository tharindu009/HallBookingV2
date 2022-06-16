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
    public partial class register : System.Web.UI.Page
    {

        data.DataAccessManager dam = new data.DataAccessManager();
        data.user_data ud = new data.user_data();

        protected string UserName;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                
                string Name = txtName.Text.ToString();
                string Email = txtEmail.Text.ToString();

                if(CheckUser(Email) == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "openModalAlready();", true);
                    //lblError.Text = "User Already Registered! ";
                    //HyperLink1.NavigateUrl = "~/signin.aspx?email=" + txtEmail.Text.Trim().ToString();
                    return;
                }
                

                string Password = String.Format("{0}", Request.Form["password"]);
                string cnfPassword = String.Format("{0}", Request.Form["repeat_password"]);
                string strnewsletter = "disable";

                if (newsletter.Checked == true)
                {
                    strnewsletter = "enable";
                }

                if (Name == "" || Email == "" || Password == "")
                {
                    return;
                }
                else
                {
                    ud.SetUserName(Name);
                    ud.SetEmail(Email);
                    ud.SetPassword(Password);
                    ud.Setnewsletter(strnewsletter);
                    ud.SetUsertype("user");

                    //Add details to the database
                    int row = dam.RegisterUser(ud);
                    if (row != 0)
                    {
                        //lblError.Text = "Successfully Registered";
                        Session["CurrentUser"] = Email;                
                        SendEmail(Email);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "openModal();", true);
                        //Response.Redirect("~/default.aspx",false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "openModalError();", true);
                        //lblError.Text = "User Registration Failed. Please try again later.";
                    }
                }

            }
            catch (Exception ex)
            {
                dam.KeepLog("Button1_Click-Register", ex.Message);
            }
        }


        private void SendEmail(string toEmail)
        {
            string Subject = "Place Finder Account Registration";
            string body = CreateEmailBody();
            
            dam.RegistrationEmail(toEmail, Subject, body);
        }

        private string CreateEmailBody()
        {
            string body = string.Empty;
            //using streamreader for reading my htmltemplate   

            using (StreamReader reader = new StreamReader(Server.MapPath("~/newsletter_template/newsletter.html")))
            //using (StreamReader reader = new StreamReader("http://venue.lk/newsletter_template/newsletter.html"))
            {

                body = reader.ReadToEnd();

            }

            //body = body.Replace("{UserName}", userName); //replacing the required things  

            //body = body.Replace("{Title}", title);

            //body = body.Replace("{message}", message);

            return body;
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }


        private int CheckUser(string email)
        {
            try
            {
                int a = 0;

                a = dam.CheckUserAvailability(email);

                return a;

            }
            catch (Exception)
            {
                return 0;
            }
        }
    }
}