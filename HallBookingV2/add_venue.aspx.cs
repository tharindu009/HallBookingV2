using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HallBookingV2
{
    public partial class add_venue : System.Web.UI.Page
    {

        protected string UserName;
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
            }
            else
            {
                
            }
        }

        protected void btnSaveVenue_Click(object sender, EventArgs e)
        {
            try
            {
                string venueName = txtVenueName.Text.ToString();
                string companyName = txtCompany.Text.ToString();
                string streetAdd = txtStreet.Text.ToString();
                string city = txtCity.Text.ToString();
                string zipCode = txtZipCode.Text.ToString();
                string description = txtDesc.Text.ToString();
                //--------
                string standing = txtStanding.Text.ToString();
                string seated = txtSeated.Text.ToString();
                //--------
                string seminar = txtSeminar.Text.ToString();
                string theater = txtTheater.Text.ToString();
                string banquet = txtBanquet.Text.ToString();
                string conference = txtConference.Text.ToString();
                string floorArea = txtFloor.Text.ToString();
                string capacityDetail = txtAdditional.Text.ToString();
                //--------
                string pricePerson = txtPerson.Text.ToString();
                string pricePlate = txtPlate.Text.ToString();
                string rentHour = txtRentHour.Text.ToString();
                string rentDay = txtRentDay.Text.ToString();
                string costInfo = txtPriceDetail.Text.ToString();
                //--------
                string deposit = txtDeposit.Text.ToString();
                string policy = txtPolicy.Text.ToString();


                //Set venue detail
                vd.SetVenueName(venueName);
                vd.SetcompanyName(companyName);
                vd.SetstreetAdd(streetAdd);
                vd.Setcity(city);
                vd.SetzipCode(zipCode);
                vd.Setdescription(description);
                vd.Setstanding(standing);
                vd.Setseated(seated);
                vd.Setseminar(seminar);
                vd.Settheater(theater);
                vd.Setbanquet(banquet);
                vd.Setconference(conference);
                vd.SetfloorArea(floorArea);
                vd.SetcapacityDetail(capacityDetail);
                vd.SetpricePerson(pricePerson);
                vd.SetpricePlate(pricePlate);
                vd.SetrentHour(rentHour);
                vd.SetrentDay(rentDay);
                vd.SetcostInfo(costInfo);
                vd.Setdeposit(deposit);
                vd.Setpolicy(policy);


                string userId = dam.GetUserID(Session["CurrentUser"].ToString());
                vd.SetUserID(userId);

                string venueID = dam.GetNextVenueID();
                vd.SetvenueID(venueID);

                int row = dam.RegisterVenue(vd);

                if(row != 0)
                {
                    saveEventTypes(venueID);
                    saveImages(venueID);
                    saveVenueContact(venueID);
                    //lblError.Text = "Your venue added successfuly.";
                    
                    //Response.Redirect("~/my_venue.aspx?vid="+venueID,false);               
                    SendEmail();
                    UpdatePanel1.Update();
                    UpdatePanel2.Update();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "myModal();", true);
                }
                else
                {
                    //lblError.Text = "Venue registration failed. Please try again later.";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "myModalFail();", true);
                    UpdatePanel1.Update();
                    UpdatePanel2.Update();
                }

                


            }
            catch (Exception ex)
            {
                dam.KeepLog("Save Venue Detail", ex.Message);
                ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "openModalFail();", true);
            }

            

        }


        private void SendEmail()
        {
            string Subject = "Place Finder | Place ";
            string body = CreateEmailBody();

            dam.RegistrationEmail(Session["email"].ToString(), Subject, body);
        }

        private string CreateEmailBody()
        {
            string body = string.Empty;
            //using streamreader for reading my htmltemplate   

            using (StreamReader reader = new StreamReader(Server.MapPath("~/newsletter_template/placepublish.html")))
            //using (StreamReader reader = new StreamReader("http://placefinder.lk/newsletter_template/placepublish.html"))
            {

                body = reader.ReadToEnd();

            }

            //body = body.Replace("{UserName}", userName); //replacing the required things  

            //body = body.Replace("{Title}", title);

            //body = body.Replace("{message}", message);

            return body;
        }


        #region save Venue Images

        public void saveImages(string venueID)
        {
            try
            {
                string venueImagePath;

                foreach (HttpPostedFile postedFile in UploadImages.PostedFiles)
                {
                    string fileName = Path.GetFileName(postedFile.FileName);

                    //grab the image file extension
                    string extension = Path.GetExtension(UploadImages.PostedFile.FileName);

                    //Generate a new file name
                    string newfilename = Guid.NewGuid().ToString();

                    //Generate the folder path for a user
                    string folderpath = Server.MapPath("~/") + "Venue\\" + venueID;

                    if (!Directory.Exists(folderpath))
                    {
                        //If Directory (Folder) does not exists. Create it.
                        Directory.CreateDirectory(folderpath);
                    }
                    //Also create a folder for images
                    if (!Directory.Exists(folderpath + "\\Images"))
                    {
                        //If Directory (Folder) does not exists. Create it.
                        Directory.CreateDirectory(folderpath + "\\Images");
                    }
                    //Create a folder for profile pictures
                    if (!Directory.Exists(folderpath + "\\Images\\VenueImages"))
                    {
                        //If Directory (Folder) does not exists. Create it.
                        Directory.CreateDirectory(folderpath + "\\Images\\VenueImages");
                    }

                    venueImagePath = Server.MapPath("~/") + "Venue\\" + venueID + "\\Images\\VenueImages\\" + newfilename + extension;

                    //Check wheather the file name is already exsist                            
                    while (true)
                    {
                        if (System.IO.File.Exists(venueImagePath))
                        {
                            newfilename = Guid.NewGuid().ToString();
                        }
                        else
                        {
                            break;
                        }
                    }

                    postedFile.SaveAs(venueImagePath);



                    while (true)
                    {
                        //check weather the file is properly saved                                
                        if (System.IO.File.Exists(venueImagePath))
                        {
                            dam.InsertVenuePicture(venueImagePath, venueID);
                            break;
                        }
                    }
                }




                UploadImages.Dispose();
                UpdatePanel2.Update();
            }
            catch (Exception ex)
            {
                dam.KeepLog("Upload Venue Images", ex.Message);
            }
        }

        #endregion


        #region Save Envet Types

        public void saveEventTypes(string venueID)
        {
            try
            {
                List<string> values1 = new List<string>();
                foreach (ListItem item in CheckBoxList1.Items)
                {
                    if (item.Selected)
                        values1.Add(item.Value);
                }
                List<string> values2 = new List<string>();
                foreach (ListItem item in CheckBoxList2.Items)
                {
                    if (item.Selected)
                        values2.Add(item.Value);
                }
                List<string> values3 = new List<string>();
                foreach (ListItem item in CheckBoxList3.Items)
                {
                    if (item.Selected)
                        values3.Add(item.Value);
                }
                List<string> values4 = new List<string>();
                foreach (ListItem item in CheckBoxList4.Items)
                {
                    if (item.Selected)
                        values4.Add(item.Value);
                }


                foreach (string itemValue in values1)
                {
                    vd.SetEventType(itemValue.ToString());
                    vd.SetvenueID(venueID);
                    dam.InsertEventTypes(vd);
                }

                foreach (string itemValue in values2)
                {
                    vd.SetEventType(itemValue.ToString());
                    vd.SetvenueID(venueID);
                    dam.InsertEventTypes(vd);
                }

                foreach (string itemValue in values3)
                {
                    vd.SetEventType(itemValue.ToString());
                    vd.SetvenueID(venueID);
                    dam.InsertEventTypes(vd);
                }

                foreach (string itemValue in values4)
                {
                    vd.SetEventType(itemValue.ToString());
                    vd.SetvenueID(venueID);
                    dam.InsertEventTypes(vd);
                }


            }
            catch (Exception ex)
            {
                dam.KeepLog("Insert Event Type", ex.Message);
            }

        }

        #endregion


        #region Save Venue Contact Info

        private void saveVenueContact(string venueID)
        {
            try
            {
                vd.SetvenueID(venueID);
                vd.SetContactName(txtContactName.Text.Trim().ToString());
                vd.SetContactPhone(txtContactPhone.Text.Trim().ToString());
                vd.SetContactEmaile(txtContactEmail.Text.Trim().ToString());
                vd.SetVenueWebsite(txtVenueWeb.Text.Trim().ToString());

                dam.InsertVenueContact(vd);

            }
            catch (Exception ex)
            {
                dam.KeepLog("saveVenueContact", ex.Message);
            }
        }

        #endregion

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

        protected void btnAddroom_Click(object sender, EventArgs e)
        {
            string roomType = txtRoomType.Text;
            string PriceNight = txtPriceRoom.Text;



            DataTable dt = new DataTable();
            dt.Columns.Add("Room Type");
            dt.Columns.Add("Price Per Night");
            DataRow dr = dt.NewRow();
            dr["Room Type"] = roomType;
            dr["Price Per Night"] = PriceNight;
            dt.Rows.Add(dr);


            GridView2.DataSource = dt;
            GridView2.DataBind();
        }
    }
}