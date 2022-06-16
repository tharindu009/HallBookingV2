using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HallBookingV2
{
    public partial class forgetpassword : System.Web.UI.Page
    {


        protected string UserName;
        data.DataAccessManager dam = new data.DataAccessManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] != null)
            {
                UserName = Session["CurrentUser"].ToString();
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {

                if(txtUserName.Text.Equals(""))
                {
                    return;
                }

                //Check wheather the email is registered or not
                string EmailfromDB = dam.CheckEmailAvailability(txtUserName.Text);
                if(EmailfromDB.Equals(""))
                {
                    //Error
                    ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "notreg();", true);
                }
                else
                {
                    //Generate random string to send as an activation code
                    string activationCode = Guid.NewGuid().ToString();
                    dam.SetAvticationCode(activationCode, txtUserName.Text);

                    string _body = "Hello,";
                    _body += "<br/><br/>Please click the following link to reset your password";
                    _body += "<br/><a href = '" + Request.Url.AbsoluteUri.Replace("forgetpassword.aspx", "reset_password.aspx?ACode=" + activationCode) + "'> Click here to reset your password.</a> ";
                    _body += "<br/><br/>Thank You<br/>PlaceFinder Team";
                    
                    
                    //SendEmail
                    dam.RegistrationEmail(txtUserName.Text, "PlaceFinder | Password Recovery", _body);

                    ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "added();", true);


                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "error();", true);
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