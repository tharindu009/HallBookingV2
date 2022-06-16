using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.Configuration;
using System.Data;

namespace HallBookingV2
{
    public partial class _default : System.Web.UI.Page
    {

        protected string UserName;

        protected DataTable datatable;

        data.DataAccessManager dam = new data.DataAccessManager();
        //data.search_data sd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] != null)
                {
                    UserName = Session["CurrentUser"].ToString();
                }
            }
            LoadFeaturedRpt();
            LoadResentdRpt();
            Session["CurrentUser"] = UserName;
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

        private void LoadFeaturedRpt()
        {
            try
            {
                DataTable dt = GetVenueRandomResult();

                DataTable table = new DataTable();
                table.Columns.Add("VenueName", typeof(string));
                table.Columns.Add("VenueImage", typeof(string));
                table.Columns.Add("City", typeof(string));
                table.Columns.Add("Price", typeof(string));
                table.Columns.Add("Description", typeof(string));
                table.Columns.Add("VenueID", typeof(string));
                table.Columns.Add("Person", typeof(string));
                table.Columns.Add("Phone", typeof(string));
                table.Columns.Add("Company", typeof(string));

                // Here we add five DataRows.

                if (dt != null)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        // Re check 
                        string VenueID = dt.Rows[i][4].ToString();

                        string Image = dam.GetVenueSingleImage(VenueID);

                        string venueName = dt.Rows[i][3].ToString();

                        string City = dt.Rows[i][0].ToString();

                        string Price = "";

                        if (!dt.Rows[i][6].ToString().Equals(""))
                        {
                            Price = dt.Rows[i][6].ToString();
                        }
                        else if (!dt.Rows[i][7].ToString().Equals(""))
                        {
                            Price = dt.Rows[i][7].ToString();
                        }
                        else if (!dt.Rows[i][8].ToString().Equals(""))
                        {
                            Price = dt.Rows[i][8].ToString();
                        }
                        else if (!dt.Rows[i][9].ToString().Equals(""))
                        {
                            Price = dt.Rows[i][9].ToString();
                        }

                        string Description = dt.Rows[i][5].ToString();
                        string person = dt.Rows[i][10].ToString();
                        string Phone = dt.Rows[i][11].ToString();

                        table.Rows.Add(venueName, Image, City, Price, Description, VenueID,person,Phone);
                    }
                }

                // Bind data into repeater
                rptFeature.DataSource = table;
                rptFeature.DataBind();
            }
            catch (Exception ex)
            {

            }

        }


        private void LoadResentdRpt()
        {
            DataTable dt = GetVenueResentResult();

            DataTable table = new DataTable();
            table.Columns.Add("VenueName", typeof(string));
            table.Columns.Add("VenueImage", typeof(string));
            table.Columns.Add("City", typeof(string));
            table.Columns.Add("Price", typeof(string));
            table.Columns.Add("Description", typeof(string));
            table.Columns.Add("VenueID", typeof(string));
            table.Columns.Add("Person", typeof(string));
            table.Columns.Add("Phone", typeof(string));
            table.Columns.Add("Company", typeof(string));

            if (dt != null)
            {
                // Here we add five DataRows.
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    // Re check 
                    string VenueID = dt.Rows[i][4].ToString();

                    string Image = dam.GetVenueSingleImage(VenueID);

                    string venueName = dt.Rows[i][3].ToString();

                    string City = dt.Rows[i][0].ToString();

                    string Price = "";

                    if (!dt.Rows[i][6].ToString().Equals(""))
                    {
                        Price = dt.Rows[i][6].ToString();
                    }
                    else if (!dt.Rows[i][7].ToString().Equals(""))
                    {
                        Price = dt.Rows[i][7].ToString();
                    }
                    else if (!dt.Rows[i][8].ToString().Equals(""))
                    {
                        Price = dt.Rows[i][8].ToString();
                    }
                    else if (!dt.Rows[i][9].ToString().Equals(""))
                    {
                        Price = dt.Rows[i][9].ToString();
                    }

                    string Description = dt.Rows[i][5].ToString();
                    string person = dt.Rows[i][10].ToString();
                    string Phone = dt.Rows[i][11].ToString();

                    table.Rows.Add(venueName, Image, City, Price, Description, VenueID, person, Phone);
                }
            }
            // Bind data into repeater
            rptResent.DataSource = table;
            rptResent.DataBind();

        }


        private DataTable GetVenueRandomResult()
        {
            try
            {
                DataTable dt;
                DataSet ds = dam.GetRandomResultVenue();

                dt = ds.Tables[0];
                return dt;
            }
            catch (Exception ex)
            {
                dam.KeepLog("Get Venue Search Result", ex.Message);
                return null;
            }
        }


        private DataTable GetVenueResentResult()
        {
            try
            {
                DataTable dt;
                DataSet ds = dam.GetResentResultVenue();

                dt = ds.Tables[0];
                return dt;
            }
            catch (Exception ex)
            {
                dam.KeepLog("Get Venue Search Result", ex.Message);
                return null;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string category = "";
            if (drpCategory.SelectedItem.Value != "0")
            {
                category = drpCategory.SelectedItem.Text.ToString();
            }
            string location = "";
            if (txtLocation.Text != "")
                location = txtLocation.Text.ToString();

            //sd = new data.search_data();

            //sd.SetCategory(category);
            //sd.Setlocation(location);

            int gue = 0;
            int gue2 = 0;

            switch (drpGuests.SelectedItem.Value)
            {
                case "0":
                    gue = 0;
                    gue2 = 0;
                    break;

                case "1":
                    gue = 1;
                    gue2 = 10;
                    break;

                case "2":
                    gue = 10;
                    gue2 = 50;
                    break;

                case "3":
                    gue = 50;
                    gue2 = 100;
                    break;

                case "4":
                    gue = 100;
                    gue2 = 150;
                    break;

                case "5":
                    gue = 150;
                    gue2 = 200;
                    break;

                case "6":
                    gue = 200;
                    gue2 = 250;
                    break;

                case "7":
                    gue = 250;
                    gue2 = 500;
                    break;

                case "8":
                    gue = 500;
                    gue2 = 1000;
                    break;

                case "9":
                    gue = 1000;
                    gue2 =99999;
                    break;
            }
            Response.Redirect("~/listing_grid.aspx?sid=search&cat="+category+"&gue="+gue+"&gue2="+gue2+"&loc="+location);
        }

        protected void btnBrowse_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/listing_grid.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("/add_venue");
        }
    }
}