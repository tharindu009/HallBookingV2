using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HallBookingV2
{
    public partial class listing_grid : System.Web.UI.Page
    {

        protected string UserName;
        protected DataTable datatable;

        data.DataAccessManager dam = new data.DataAccessManager();
        data.search_data sd;

        readonly PagedDataSource _pgsource = new PagedDataSource();
        int _firstIndex, _lastIndex;
        private int _pageSize = 9;

        private int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] == null)
                {
                    return 0;
                }
                return ((int)ViewState["CurrentPage"]);
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["CurrentUser"] != null)
            {
                UserName = Session["CurrentUser"].ToString();
                Session["CurrentUser"] = UserName;
            }

            if(!IsPostBack)
            {
                if (!string.IsNullOrWhiteSpace(Request.QueryString["sid"]))
                {
                    string category = "";
                    string location = "";
                    sd = new data.search_data();

                    if (!string.IsNullOrWhiteSpace(Request.QueryString["cat"]))
                    {
                        category = Request.QueryString["cat"].ToString();
                    }
                    int guests = Convert.ToInt32(Request.QueryString["gue"].ToString());
                    int guests2 = Convert.ToInt32(Request.QueryString["gue2"].ToString());
                    if (!string.IsNullOrWhiteSpace(Request.QueryString["loc"]))
                    {
                        location = Request.QueryString["loc"].ToString();
                    }

                    sd.SetCategory(category);
                    sd.Setguests(guests);
                    sd.Setguests2(guests2);
                    sd.Setlocation(location);

                    BindDataIntoRepeater(sd.GetCategory(), sd.Getguests(), sd.Getguests2(), sd.Getlocation());

                }
                else
                {
                    SetSearchValues();
                }

            }

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string category = "";
            if(drpCategory.SelectedItem.Value !="0")
            {
                category = drpCategory.SelectedItem.Text.ToString();
            }
            string location = "";
            if(txtLocation.Text != "")
            location = txtLocation.Text.ToString();
            
            sd = new data.search_data();

            sd.SetCategory(category);
            sd.Setlocation(location);

            switch (drpGuests.SelectedItem.Value)
            {
                case "0":
                    sd.Setguests(0);
                    sd.Setguests2(0);
                    break;

                case "1":
                    sd.Setguests(1);
                    sd.Setguests2(10);
                    break;

                case "2":
                    sd.Setguests(10);
                    sd.Setguests2(30);
                    break;

                case "3":
                    sd.Setguests(50);
                    sd.Setguests2(100);
                    break;

                case "4":
                    sd.Setguests(100);
                    sd.Setguests2(150);
                    break;

                case "5":
                    sd.Setguests(150);
                    sd.Setguests2(200);
                    break;

                case "6":
                    sd.Setguests(200);
                    sd.Setguests2(250);
                    break;

                case "7":
                    sd.Setguests(250);
                    sd.Setguests2(500);
                    break;

                case "8":
                    sd.Setguests(500);
                    sd.Setguests2(1000);
                    break;

                case "9":
                    sd.Setguests(1000);
                    sd.Setguests2(99999);
                    break;
            }

            BindDataIntoRepeater(sd.GetCategory(), sd.Getguests(), sd.Getguests2(), sd.Getlocation());
        }


        private void SetSearchValues()
        {
            string category = "";
            if (drpCategory.SelectedItem.Value != "0")
            {
                category = drpCategory.SelectedItem.Text.ToString();
            }
            string location = "";
            if (txtLocation.Text != "")
                location = txtLocation.Text.ToString();

            sd = new data.search_data();

            sd.SetCategory(category);
            sd.Setlocation(location);

            switch (drpGuests.SelectedItem.Value)
            {
                case "0":
                    sd.Setguests(0);
                    sd.Setguests2(0);
                    break;

                case "1":
                    sd.Setguests(1);
                    sd.Setguests2(10);
                    break;

                case "2":
                    sd.Setguests(10);
                    sd.Setguests2(30);
                    break;

                case "3":
                    sd.Setguests(50);
                    sd.Setguests2(100);
                    break;

                case "4":
                    sd.Setguests(100);
                    sd.Setguests2(150);
                    break;

                case "5":
                    sd.Setguests(150);
                    sd.Setguests2(200);
                    break;

                case "6":
                    sd.Setguests(200);
                    sd.Setguests2(250);
                    break;

                case "7":
                    sd.Setguests(250);
                    sd.Setguests2(500);
                    break;

                case "8":
                    sd.Setguests(500);
                    sd.Setguests2(1000);
                    break;

                case "9":
                    sd.Setguests(1000);
                    sd.Setguests2(99999);
                    break;
            }

            BindDataIntoRepeater(sd.GetCategory(), sd.Getguests(), sd.Getguests2(), sd.Getlocation());
            UpdatePanel1.Update();
            //UpdatePanel2.Update();
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

        protected void rptPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (!e.CommandName.Equals("newPage")) return;
            CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());
            SetSearchValues();
            //sd = new data.search_data();
            //BindDataIntoRepeater(sd.GetCategory(), sd.Getguests(), sd.Getguests2(), sd.Getlocation());
        }

        protected void rptPaging_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            var lnkPage = (LinkButton)e.Item.FindControl("lbPaging");
            if (lnkPage.CommandArgument != CurrentPage.ToString()) return;
            lnkPage.Enabled = false;
            //lnkPage.BackColor = Color.FromName("#00FF00");
            lnkPage.BackColor = Color.FromName("#ff0000");
            lnkPage.ForeColor = Color.FromName("#ffffff");
        }

        private void BindDataIntoRepeater(string category,int guests,int guests2,string location)
        {
            DataTable dt = GetVenueSearchResult(category,guests,guests2,location);

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
                string phone = dt.Rows[i][11].ToString();


                table.Rows.Add(venueName, Image, City, Price, Description, VenueID, person, phone);
            }



            _pgsource.DataSource = table.DefaultView;
            _pgsource.AllowPaging = true;
            // Number of items to be displayed in the Repeater
            _pgsource.PageSize = _pageSize;
            _pgsource.CurrentPageIndex = CurrentPage;
            // Keep the Total pages in View State
            ViewState["TotalPages"] = _pgsource.PageCount;
            // Example: "Page 1 of 10"
            //lblpage.Text = "Page " + (CurrentPage + 1) + " of " + _pgsource.PageCount;
            // Enable First, Last, Previous, Next buttons
            //lbPrevious.Enabled = !_pgsource.IsFirstPage;
            //lbNext.Enabled = !_pgsource.IsLastPage;
            //lbFirst.Enabled = !_pgsource.IsFirstPage;
            //lbLast.Enabled = !_pgsource.IsLastPage;

            // Bind data into repeater
            rptResult.DataSource = _pgsource;
            rptResult.DataBind();

            // Call the function to do paging
            HandlePaging();
            
        }


        private DataTable GetVenueSearchResult(string category, int guests,int guests2, string location)
        {
            try
            {
                DataTable dt;

                dt = dam.GetSearchResultVenue(category, guests, guests2, location);
            
                return dt;
            }
            catch (Exception ex)
            {
                dam.KeepLog("Get Venue Search Result", ex.Message);
                return null;
            }
        }

                
        protected void lbPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            SetSearchValues();
            //BindDataIntoRepeater(sd.GetCategory(),sd.Getguests(),sd.Getguests2(),sd.Getlocation());
        }

        protected void lbNext_Click(object sender, EventArgs e)
        {
            try
            {
                CurrentPage += 1;
                //sd = new data.search_data();
                //BindDataIntoRepeater(sd.GetCategory(), sd.Getguests(), sd.Getguests2(), sd.Getlocation());
                SetSearchValues();


            }
            catch (Exception ex)
            {
                dam.KeepLog("lbNext_Click-listing_grid", ex.Message);
            }
        }


        private void HandlePaging()
        {
            var dt = new DataTable();
            dt.Columns.Add("PageIndex"); //Start from 0
            dt.Columns.Add("PageText"); //Start from 1

            _firstIndex = CurrentPage - 5;
            if (CurrentPage > 5)
                _lastIndex = CurrentPage + 5;
            else
                _lastIndex = 10;

            // Check last page is greater than total page then reduced it to total no. of page is last index
            if (_lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
            {
                _lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
                _firstIndex = _lastIndex - 10;
            }

            if (_firstIndex < 0)
                _firstIndex = 0;

            // Now creating page number based on above first and last page index
            for (var i = _firstIndex; i < _lastIndex; i++)
            {
                var dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }

            rptPaging.DataSource = dt;
            rptPaging.DataBind();
        }
    }
}