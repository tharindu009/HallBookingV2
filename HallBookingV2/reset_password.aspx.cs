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
    public partial class reset_password : System.Web.UI.Page
    {

        protected string UserName;
        data.DataAccessManager dam = new data.DataAccessManager();
        data.user_data ud = new data.user_data();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] != null)
            {
                UserName = Session["CurrentUser"].ToString();
            }

            if(!IsPostBack)
            {
                if(!string.IsNullOrWhiteSpace(Request.QueryString["ACode"]))
                {
                    string actCode = Request.QueryString["ACode"].ToString();
                    string email = dam.CheckEmailACode(actCode);
                    //ud = new data.user_data();
                    //ud.SetEmail(email);
                    Label1.Text = email;
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

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                //ud = new data.user_data();
                string Password = String.Format("{0}", Request.Form["password"]);
                string cnfPassword = String.Format("{0}", Request.Form["repeat_password"]);
                string email = Label1.Text.ToString();

                if(Password.Equals(""))
                {
                    return;
                }
                if(cnfPassword.Equals(""))
                {
                    return;
                }

                int i = dam.ResetPassword(email, Password);

                if(i !=0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "changed();", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "error();", true);
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "error();", true);
            }
        }
    }



}