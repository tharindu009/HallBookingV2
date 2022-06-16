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
    public partial class contact : System.Web.UI.Page
    {


        protected string UserName;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] != null)
                {
                    UserName = Session["CurrentUser"].ToString();
                    Session["CurrentUser"] = UserName;
                }
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            data.DataAccessManager dam = new data.DataAccessManager();

            string Name = txtName.Text.ToString();
            string Subject = txtSubject.Text.ToString() + "| From Web";
            string Email = txtEmail.Text.Trim().ToString();
            string Message = txtMessage.Text.ToString();//Request.QueryString["cusMessage"];

            Message = "Email from : " + Name +" Email:"+Email;
            Message += "<br /><br />" + Message;
            
            int result = dam.SendEmail(Email, Subject, Message);

            if (result == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "send();", true);
                //Label1.Text = "Your request has successfully sent! ";
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "error();", true);
                //Label1.Text = "Something went wrong";
            }
        }
    }
}