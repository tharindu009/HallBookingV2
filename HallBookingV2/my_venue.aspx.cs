using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HallBookingV2
{
    public partial class my_venue : System.Web.UI.Page
    {
        protected string UserName;
        protected string vID;

        data.DataAccessManager dam = new data.DataAccessManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["CurrentUser"] != null)
                {
                    UserName = Session["CurrentUser"].ToString();
                    Session["CurrentUser"] = UserName;

                    string uid = dam.GetUserID(UserName);
                    GetVenueDetail(uid);
                    
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }



        protected void LinkEmail_Click(object sender, EventArgs e)
        {
            string VenueID = (sender as LinkButton).CommandArgument;
            Session["VID"] = VenueID;
            //ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "text", "myModal()", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "openModal();", true);
            //int a = dam.DeleteVenue(VenueID);
        }


        private void GetVenueDetail(string userID)
        {
            try
            {
                DataSet VenueDS = dam.GetVenueDetail(userID);

                DataTable table = new DataTable();
                table.Columns.Add("venue_name", typeof(string));
                table.Columns.Add("image", typeof(string));
                table.Columns.Add("city", typeof(string));
                table.Columns.Add("price", typeof(string));
                table.Columns.Add("description", typeof(string));
                table.Columns.Add("VenueID", typeof(string));

                // Here we add five DataRows.

                if (VenueDS.Tables[0].Rows.Count != 0)
                {
                    for (int i = 0; i < VenueDS.Tables[0].Rows.Count; i++)
                    {

                        string VenueID = VenueDS.Tables[0].Rows[i][0].ToString();

                        string Image = dam.GetVenueSingleImage(VenueID);

                        string venueName = VenueDS.Tables[0].Rows[i][1].ToString();

                        string City = VenueDS.Tables[0].Rows[i][2].ToString();
                        string Price = "";

                        if (!VenueDS.Tables[0].Rows[i][4].ToString().Equals(""))
                        {
                            Price = VenueDS.Tables[0].Rows[i][4].ToString();
                        }
                        else if (!VenueDS.Tables[0].Rows[i][5].ToString().Equals(""))
                        {
                            Price = VenueDS.Tables[0].Rows[i][5].ToString();
                        }
                        else if (!VenueDS.Tables[0].Rows[i][6].ToString().Equals(""))
                        {
                            Price = VenueDS.Tables[0].Rows[i][6].ToString();
                        }
                        else if (!VenueDS.Tables[0].Rows[i][7].ToString().Equals(""))
                        {
                            Price = VenueDS.Tables[0].Rows[i][7].ToString();
                        }

                        string Description = VenueDS.Tables[0].Rows[i][3].ToString();


                        table.Rows.Add(venueName, Image, City, Price, Description, VenueID);
                    }
                }

                rptMyVenue.DataSource = table;
                rptMyVenue.DataBind();
            }
            catch (Exception ex)
            {
                dam.KeepLog("GetVenueDetail | my venue", ex.Message);
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

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            string VenueID = Session["VID"].ToString();
            int a = dam.DeleteVenue(VenueID);
            if (a != 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "deleted();", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "error();", true);
            }
        }
    }
}