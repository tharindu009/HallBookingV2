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
    public partial class signin : System.Web.UI.Page
    {
        protected string UserName;

        data.DataAccessManager dam = new data.DataAccessManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            //if(Request.QueryString["email"] != null)
            //{
            //    txtUserName.Text = Request.QueryString["email"].ToString();
            //}
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

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            try
            {
                string Email = txtUserName.Text.ToString();
                string Password = txtPassword.Text.ToString();

                string Responce = dam.ValidateUser(Email, Password);
                if(Responce.Trim() != "reject")// | Responce.Trim() != "error")
                {
                    FormsAuthenticationTicket tkt;
                    string cookiestr;
                    HttpCookie ck;
                    tkt = new FormsAuthenticationTicket(1, Responce, DateTime.Now, DateTime.Now.AddMinutes(30), CheckBox1.Checked, "your custom data");
                    cookiestr = FormsAuthentication.Encrypt(tkt);
                    ck = new HttpCookie(FormsAuthentication.FormsCookieName, cookiestr);
                    if (CheckBox1.Checked)
                        ck.Expires = tkt.Expiration;

                    ck.Path = FormsAuthentication.FormsCookiePath;
                    Response.Cookies.Add(ck);
                    Session["CurrentUser"] = Responce;
                    Session["email"] = Email;

                    if (!string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                    {
                        Response.Redirect(Request.QueryString["ReturnUrl"],false);
                    }
                    else
                    {
                        Response.Redirect("~/default.aspx",false);
                    }
                }
                else
                {
                    lblError.Text = "Login in failed. Please try again later";
                }

            }
            catch (Exception ex)
            {
                lblError.Text = "Login in failed. Please try again later";
                dam.KeepLog("btnSignIn_Click-signin", ex.Message);
            }


        }


       

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
    }
}