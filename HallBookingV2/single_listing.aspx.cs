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
    public partial class single_listing : System.Web.UI.Page
    {

        protected string UserName;

        protected string VenueName;
        protected string Location;
        protected string Price;
        protected string Image1;
        protected string Image2;
        protected string Image3;
        protected string Image4;
        protected string Image5;
        protected string Description;

        protected string ContactPerson;
        protected string ContactPhone;
        protected string contactEmail;
        protected string venueWebsite;
        protected string venueFacebook;
        protected string CompanyName;

        protected string Standing ="-";
        protected string Seated = "-";


        data.venue_detail vd = new data.venue_detail();
        data.DataAccessManager dam = new data.DataAccessManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox2.Text += "\nCould I have a proposal for the following\r\n";
                TextBox2.Text += System.Environment.NewLine + "Number of guests: ";
                TextBox2.Text += System.Environment.NewLine + "Time: ";
                TextBox2.Text += System.Environment.NewLine + "Budget: ";
                TextBox2.Text += System.Environment.NewLine + "Description: ";
                TextBox2.Text += System.Environment.NewLine;
                TextBox2.Text += System.Environment.NewLine + "Thanks! ";


                if (Session["CurrentUser"] != null)
                {
                    UserName = Session["CurrentUser"].ToString();
                    Session["CurrentUser"] = UserName;
                }

                if (!string.IsNullOrWhiteSpace(Request.QueryString["vid"]))
                {
                    string venueID = Request.QueryString["vid"].ToString();
                    GetVenueDetail(venueID);
                    GetImage(venueID);
                    LoadEventType(venueID);
                }
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox1.Text = Calendar1.SelectedDate.ToShortDateString();
        }

        private void GetImage(string venueID)
        {
            try
            {
                DataSet dt = dam.GetVenueImages(venueID);

                DataTable table = new DataTable();
                table.Columns.Add("ID", typeof(string));
                table.Columns.Add("Image", typeof(string));

                for (int i = 0; i < dt.Tables[0].Rows.Count; i++)
                {
                    // Re check 
                    string ID = dt.Tables[0].Rows[i][0].ToString();
                    string Image = dt.Tables[0].Rows[i][1].ToString();
                    string VenueImage = "";

                    if (Image.Equals("") || Image.Equals("Default Image"))
                    {
                        //set profile picture default image 
                    }
                    else
                    {
                        Image = Image.Replace(@"h:\root\home\kamal1975-001\www\venue", "..");
                        Image = Image.Replace(@"\", "/");
                        VenueImage = Image;
                    }

                    table.Rows.Add(ID,VenueImage);
                }

                Repeater2.DataSource = table;
                Repeater2.DataBind();
            }
            catch (Exception ex)
            {
                dam.KeepLog("SingleListing|GetImage", ex.Message);
            }

        }


        private void GetVenueDetail(string venueID)
        {
            try
            {
                vd = dam.GetVenueSingleDetail(venueID);

                VenueName = vd.GetVenueName();
                Location = vd.Getcity();

                if (!vd.GetpricePerson().Equals(""))
                {
                    Price = vd.GetpricePerson();
                }
                else if (!vd.GetpricePlate().Equals(""))
                {
                    Price = vd.GetpricePlate();
                }
                else if (!vd.GetrentHour().Equals(""))
                {
                    Price = vd.GetrentHour();
                }
                else if (!vd.GetrentDay().Equals(""))
                {
                    Price = vd.GetrentDay();
                }


                Description = vd.Getdescription();
                ContactPerson = vd.GetContactName();
                ContactPhone = vd.GetContactPhone();
                contactEmail = vd.GetContactEmail();
                venueWebsite = vd.GetVenueWebsite();


                lblSeminar.Text = vd.Getseminar();
                lblTheater.Text = vd.Gettheater();
                lblBanquet.Text = vd.Getbanquet();
                lblConference.Text = vd.Getconference();
                lblArea.Text = vd.GetfloorArea();


                if (!vd.Getstanding().Equals(""))
                    Standing = vd.Getstanding();

                if (!vd.Getseated().Equals(""))
                    Seated = vd.Getseated();

                if (!vd.GetpricePerson().Equals(""))
                    lblPricePer.Text = vd.GetpricePerson();

                if (!vd.GetpricePlate().Equals(""))
                    lblPricePla.Text = vd.GetpricePlate();

                if (!vd.GetrentHour().Equals(""))
                    lblRentHour.Text = vd.GetrentHour();

                if (!vd.GetrentDay().Equals(""))
                    lblRentDay.Text = vd.GetrentDay();

                lblAddinfo.Text = vd.GetcapacityDetail();

                CompanyName = vd.GetcompanyName();

                lblAddinfo.Text = vd.GetcostInfo();

                Label1.Text = vd.GetstreetAdd();
                Label2.Text = vd.Getcity();
                Label3.Text = vd.GetzipCode();
            }
            catch (Exception ex)
            {
                dam.KeepLog("Single Listing", ex.Message);
                
            }



        }



        private void LoadEventType(string VenueID)
        {
            DataTable dt = dam.GetEventType(VenueID);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
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