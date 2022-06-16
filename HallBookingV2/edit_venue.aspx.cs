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
    public partial class edit_venue : System.Web.UI.Page
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

        protected string Standing = "-";
        protected string Seated = "-";


        data.venue_detail vd = new data.venue_detail();
        data.DataAccessManager dam = new data.DataAccessManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (Session["CurrentUser"] != null)
                {
                    UserName = Session["CurrentUser"].ToString();
                    Session["CurrentUser"] = UserName;
                }

                //if (!string.IsNullOrWhiteSpace(RouteData.Values["VID"] as string))
                //{
                //    string venueID = RouteData.Values["VID"] as string;
                //    GetVenueDetail(venueID);
                //}

                if (!string.IsNullOrWhiteSpace(Request.QueryString["vid"]))
                {
                    string venueID = Request.QueryString["vid"].ToString();
                    GetVenueDetail(venueID);
                }
            }
        }

        private void GetVenueDetail(string venueID)
        {
            try
            {
                vd = dam.GetVenueSingleDetail(venueID);

                txtVenueName.Text = vd.GetVenueName();
                txtCity.Text = vd.Getcity();


                txtDesc.Text = vd.Getdescription();
                txtContactName.Text = vd.GetContactName();
                txtContactPhone.Text = vd.GetContactPhone();
                txtContactEmail.Text = vd.GetContactEmail();
                txtVenueWeb.Text = vd.GetVenueWebsite();


                txtSeminar.Text = vd.Getseminar();
                txtTheater.Text = vd.Gettheater();
                txtBanquet.Text = vd.Getbanquet();
                txtConference.Text = vd.Getconference();
                txtFloor.Text = vd.GetfloorArea();


                if (!vd.Getstanding().Equals(""))
                    txtStanding.Text = vd.Getstanding();

                if (!vd.Getseated().Equals(""))
                    txtSeated.Text = vd.Getseated();

                if (!vd.GetpricePerson().Equals(""))
                    txtPerson.Text = vd.GetpricePerson();

                if (!vd.GetpricePlate().Equals(""))
                    txtPlate.Text = vd.GetpricePlate();

                if (!vd.GetrentHour().Equals(""))
                    txtRentHour.Text = vd.GetrentHour();

                if (!vd.GetrentDay().Equals(""))
                    txtRentDay.Text = vd.GetrentDay();

                txtAdditional.Text = vd.GetcapacityDetail();

                txtCompany.Text = vd.GetcompanyName();
            }
            catch (Exception ex)
            {
                dam.KeepLog("Edit Venue |GetVenueDetail", ex.Message);

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

        protected void btnSaveVenue_Click(object sender, EventArgs e)
        {

        }
    }
}