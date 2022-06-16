using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.Mail;

namespace HallBookingV2.data
{
	public class DataAccessManager
	{
		protected SqlConnection Connection;
		protected string ConnectionString;
		protected SqlDataAdapter sqlDa;

		public DataAccessManager()
		{
			Connection = new SqlConnection();
			ConnectionString = ConfigurationManager.ConnectionStrings["venue_dbConnectionString"].ConnectionString;
			Connection.ConnectionString = ConnectionString;

			try
			{
				Connection.Open();
			}
			catch (Exception ex)
			{
				KeepLog("DataAccess | Constructor", ex.ToString());
				//MessageBox.Show(ex.ToString());
			}
		}

		public DataSet GetDatasetQuery(string Query)
		{
			if (Connection.State != ConnectionState.Open)
			{
				Connection.Open();
			}
			DataSet ds = new DataSet();
			sqlDa = new SqlDataAdapter(Query, Connection);
			sqlDa.Fill(ds);
			return ds;
		}


		public string CheckEmailAvailability(string email)
		{
			try
			{
				string available = "";
				string Query = "SELECT [email],[name] FROM [dbo].[tblUser] where [email] = '" + email + "'";

				DataSet ds = GetDatasetQuery(Query);
				int row = ds.Tables[0].Rows.Count;
				if (row != 0)
				{
					available = "available";
					return available;
				}
				else
				{
					return "";
				}
			}
			catch (Exception)
			{
				return "";
			}
		}


		public string CheckEmailACode(string ACode)
		{
			try
			{
				string available = "";
				string Query = "SELECT [email],[name] FROM [dbo].[tblUser] where [act_code] = '" + ACode + "'";

				DataSet ds = GetDatasetQuery(Query);
				int row = ds.Tables[0].Rows.Count;
				if (row != 0)
				{
					available = ds.Tables[0].Rows[0][0].ToString();
					return available;
				}
				else
				{
					return "";
				}
			}
			catch (Exception)
			{
				return "";
			}
		}


		public int SetAvticationCode(string actCode,string email)
		{
			try
			{
				int row = 0;
				string query = "UPDATE [dbo].[tblUser] SET [act_code] = '"+actCode+"' WHERE [email]='"+email+"'";
				SqlCommand cmd = new SqlCommand(query, Connection);

				row = cmd.ExecuteNonQuery();
				return row;
			}
			catch (Exception ex)
			{
				KeepLog("Data Access|SetAvticationCode", ex.Message);

				return 0;
			}
		}


		public int ResetPassword(string email, string password)
		{
			try
			{
				int row = 0;
				string query = "UPDATE [dbo].[tblUser] SET [act_code]='', [password] = '" + password + "' WHERE [email]='" + email + "'";
				SqlCommand cmd = new SqlCommand(query, Connection);

				row = cmd.ExecuteNonQuery();
				return row;
			}
			catch (Exception ex)
			{
				KeepLog("Data Access|ResetPassword", ex.Message);
				return 0;
			}
		}

		public string GetNextVenueID()
		{
			try
			{
				string VenueID = "";

				DataSet ds = GetDatasetQuery("SELECT [venue_id] FROM [dbo].[tblVenueDetail] order by [venue_id] DESC");
				if (ds.Tables[0].Rows.Count == 0)
				{
					VenueID = "V1231";
				}
				else
				{
					string CurrentID = ds.Tables[0].Rows[0][0].ToString();

					string CurrentNum = Regex.Match(CurrentID, @"\d+").Value;
					int num = Convert.ToInt32(CurrentNum);
					num = num + 1;
					VenueID = "V" + num.ToString();
				}
				return VenueID;
			}
			catch (Exception ex)
			{
				KeepLog("Data Access|GetNextVenueID", ex.Message);
				return null;
			}
		}

		public int SendEmail(string fromEmail, string Subject, string BodyMessage)
		{
			try
			{
				//if (fromEmail == "Email")
				//{
				//	fromEmail = "info@placefinder.lk";
				//}

                System.Net.Mail.MailMessage mm = new System.Net.Mail.MailMessage("postmaster@placefinder.lk", "info@placefinder.lk");
				mm.Subject = Subject;
				string _body = BodyMessage;
				mm.Body = _body;
				mm.IsBodyHtml = true;
				SmtpClient smtp = new SmtpClient();
				smtp.Host = "mail.placefinder.lk";
				smtp.EnableSsl = true;
				NetworkCredential NetworkCred = new NetworkCredential();
				NetworkCred.UserName = "postmaster@placefinder.lk";
				NetworkCred.Password = "Lanka@2018";
				smtp.EnableSsl = false;
				smtp.UseDefaultCredentials = true;
				smtp.Credentials = NetworkCred;
				smtp.Port = 25;
				smtp.Send(mm);

				return 1;
			}
			catch (Exception ex)
			{
				KeepLog("Venue.production.Contact | Send Email", ex.ToString());
				return 0;
			}
		}


		public int RegistrationEmail(string ToEmail, string Subject, string BodyMessage)
		{
			try
			{
				//if (fromEmail == "Email")
				//{
				//	fromEmail = "info@placefinder.lk";
				//}

                System.Net.Mail.MailMessage mm = new System.Net.Mail.MailMessage("info@placefinder.lk", ToEmail);
                mm.Subject = Subject;
                string _body = BodyMessage;
                mm.Body = _body;
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "mail.placefinder.lk";
                //smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential();
                NetworkCred.UserName = "postmaster@placefinder.lk";
                NetworkCred.Password = "Lanka@2018";
                smtp.EnableSsl = false;
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 25;
                smtp.Send(mm);


				return 1;
			}
			catch (Exception ex)
			{
				KeepLog("Venue.production.Contact | Send Email", ex.ToString());
				return 0;
			}
		}


		public int DeleteVenue(string venueID)
		{
			try
			{
				int a = 0;
				string DeleteQuery = "UPDATE [dbo].[tblVenueDetail] SET [Visibility] = 'false' WHERE [venue_id]= '" + venueID + "'";
				SqlCommand cmd = new SqlCommand(DeleteQuery, Connection);

				a = cmd.ExecuteNonQuery();
				return a;
			}
			catch (Exception)
			{
				return -99;
			}
		}


		public string ValidateUser(string UserID, string Password)
		{
			try
			{
				string Query = "SELECT [email],[name],[user_type] FROM [dbo].[tblUser] where[email] = '"+UserID+"' and[password] = '"+Password+"'";

				DataSet ds = GetDatasetQuery(Query);
				int row = ds.Tables[0].Rows.Count;
				if (row != 0)
				{
					string UserType = ds.Tables[0].Rows[0][2].ToString();
					string UserName = ds.Tables[0].Rows[0][1].ToString();
					
					return UserName;   
				}
				else
				{
					return "reject";
				}
			}
			catch (Exception)
			{
				return "reject";
			}
		}


		public string GetUserType(string UserID)
		{
			try
			{
				string Query = "SELECT [Usertype] FROM [dbo].[UsersList] where [UserId] = '" + UserID + "'";

				if (Connection.State != ConnectionState.Open)
				{
					Connection.Open();
				}

				DataSet ds = GetDatasetQuery(Query);
				int row = ds.Tables[0].Rows.Count;
				if (row != 0)
				{
					string UserType = ds.Tables[0].Rows[0][0].ToString();
					return UserType;
				}
				else
				{
					return "No";
				}
			}
			catch (Exception)
			{

				return "Error";
			}
		}

		public string GetUserID(string UserName)
		{
			try
			{
				string Query = "SELECT [user_id] FROM [dbo].[tblUser] where [name]='"+UserName+"'";

				if (Connection.State != ConnectionState.Open)
				{
					Connection.Open();
				}

				DataSet ds = GetDatasetQuery(Query);
				int row = ds.Tables[0].Rows.Count;
				if (row != 0)
				{
					string UserIDNo = ds.Tables[0].Rows[0][0].ToString();
					return UserIDNo;
				}
				else
				{
					return "No";
				}
			}
			catch (Exception ex)
			{
				KeepLog("Data Access|GetUserID", ex.Message);
				return "Error";
			}
		}


		public user_data GetUser(string uid)
		{
			try
			{
				user_data usr = new user_data();

				//string query = "SELECT u.[user_id], u.email, u.name, u.profile_pic, ud.[Description], ud.PhoneNo, ud.facebook, ud.twitter, ud.[address],vd.company_name "+
				//              "FROM dbo.tblUser u INNER JOIN dbo.tblUserDetail ud ON u.[user_id] = ud.[UserID] INNER JOIN dbo.tblVenueDetail vd ON u.[user_id] = vd.[user_id] "+
				//            "WHERE u.[user_id]= '"+ uid + "'";


				string query = @"SELECT u.[user_id], u.email, u.name, u.profile_pic, ud.[Description], ud.PhoneNo, ud.facebook, ud.twitter, ud.[address]
								FROM dbo.tblUser u LEFT OUTER JOIN dbo.tblUserDetail ud ON u.[user_id] = ud.[UserID] 
								WHERE u.[user_id]= '"+uid+"'";


				SqlCommand cmd = new SqlCommand(query, Connection);
				SqlDataAdapter da = new SqlDataAdapter(query, Connection);
				DataTable dt = new DataTable();
				da.Fill(dt);

				usr.SetUserID(uid);
				usr.SetEmail(dt.Rows[0][1].ToString());
				usr.SetUserName(dt.Rows[0][2].ToString());
				usr.SetProfilePicture(dt.Rows[0][3].ToString());
				usr.SetuserDesc(dt.Rows[0][4].ToString());
				usr.SetuserPhone(dt.Rows[0][5].ToString());
				usr.Setfacebook(dt.Rows[0][6].ToString());
				usr.Settwitter(dt.Rows[0][7].ToString());
				usr.SetuserAddress(dt.Rows[0][8].ToString());
				//usr.SetuserCompany(dt.Rows[0][9].ToString());

				return usr;
			}
			catch (Exception ex)
			{
				KeepLog("DataAccess | GetUser", ex.ToString());
				return null;
			}
		}


		public int UpdateUserDetail(user_data ud)
		{
			try
			{
				int x = 0;


				//Check User Detail
				SqlCommand cmd = new SqlCommand("SELECT * FROM [dbo].[tblUserDetail] WHERE UserID='"+ud.GetUserID()+"'", Connection);
				SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [dbo].[tblUserDetail] WHERE UserID='" + ud.GetUserID() + "'", Connection);
				DataTable dt = new DataTable();
				da.Fill(dt);

				string query = "";

				if (dt.Rows.Count != 0)
				{
					query = @"UPDATE [dbo].[tblUserDetail] SET [Description] = '" + ud.GetuserDesc() + "',[PhoneNo] = '" + ud.GetuserPhone() + "',[facebook] = '" + ud.Getfacebook() + "',[twitter] = '" + ud.Gettwitter() + "',[address] = '" + ud.GetuserAddress() + "',[Company]='" + ud.GetuserCompany() + "' WHERE [UserID] = '" + ud.GetUserID() + "'";
				}
				else
				{
					query = @"UPDATE [dbo].[tblUserDetail] SET [Description] = '" + ud.GetuserDesc() + "',[PhoneNo] = '" + ud.GetuserPhone() + "',[facebook] = '" + ud.Getfacebook() + "',[twitter] = '" + ud.Gettwitter() + "',[address] = '" + ud.GetuserAddress() + "',[Company]='" + ud.GetuserCompany() + "' WHERE [UserID] = '" + ud.GetUserID() + "'";
				}

				SqlCommand cmd1 = new SqlCommand(query, Connection);

				x = cmd.ExecuteNonQuery();

				return x;
			}
			catch (Exception ex)
			{
				KeepLog("DataAccess | UpdateUserData", ex.ToString());
				return -99;
			}
		}


		public int CheckUserAvailability(string email)
		{
			try
			{
				string Query = "SELECT [user_id] FROM [dbo].[tblUser] where [email]='" + email + "'";

				if (Connection.State != ConnectionState.Open)
				{
					Connection.Open();
				}

				DataSet ds = GetDatasetQuery(Query);
				int row = ds.Tables[0].Rows.Count;

				if (row != 0)
				{
					return 1;
				}
				else
				{
					return 0;
				}
			}
			catch (Exception)
			{
				return -99;
			}
		}

		public int UpdateProfilePicture(string propicpath, string uid)
		{
			try
			{
				int x = 0;

				string query = "UPDATE [dbo].[tblUser] SET [profile_pic] = '"+propicpath+"' WHERE [user_id] = '"+uid+"'";

				SqlCommand cmd = new SqlCommand(query, Connection);

				x = cmd.ExecuteNonQuery();

				return x;
			}
			catch (Exception ex)
			{
				KeepLog("DataAccess | UpdateProfilePicture", ex.ToString());
				return -99;
			}
		}


		public DataSet GetDataset(string strCmdText, string[] paraname, string[] paravalue)
		{
			if (!(Connection.State == ConnectionState.Open))
			{
				Connection.Open();
			}
			try
			{
				sqlDa = new SqlDataAdapter(strCmdText, Connection);
				sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
				int i = 0;
				string strparaname = null;
				string strparavalue = null;
				for (i = 0; i <= paraname.Length - 1; i++)
				{
					strparaname = paraname[i];
					strparavalue = paravalue[i];
					if ((strparaname != null))
					{
						sqlDa.SelectCommand.Parameters.AddWithValue(paraname[i], paravalue[i]);
					}
					else
					{
						break; // TODO: might not be correct. Was : Exit For
					}
				}
				DataSet dset = new DataSet();
				sqlDa.Fill(dset);
				return dset;
			}
			catch
			{
				throw;
			}
			finally
			{
				sqlDa.Dispose();
			}

		}


		

		public int RegisterUser(user_data user)
		{
			try
			{
				int x = 0;

				string Query = "INSERT INTO [dbo].[tblUser]([email],[name],[password],[user_type],[create_dt],[newsletter]) "+
					"VALUES('" + user.GetEmail() + "','" + user.GetUserName() + "','" + user.GetPassword() + "','" + user.GetUsertype() + "', getdate(),'" + user.Getnewsletter() + "')";
					
				if (Connection.State != ConnectionState.Open)
				{
					Connection.Open();
				}

				SqlCommand cmd = new SqlCommand(Query, Connection);

				x = cmd.ExecuteNonQuery();

				return x;
			}
			catch (Exception ex)
			{
				KeepLog("DataAccess | RegisterUser", ex.ToString());
				return -99;
			}
		}


		public int RegisterVenue(data.venue_detail vd)
		{
			try
			{
				if (Connection.State != ConnectionState.Open)
				{
					Connection.Open();
				}
				int x = 0;

				string Query = "INSERT INTO [dbo].[tblVenueDetail]([venue_id],[user_id],[venue_name],[street_name],[city],[zip_code],[description],[standing],[seated],[seminar]" +
							   ",[theater],[banquet],[conference],[floor_area],[capacity_detail],[price_per_person],[price_per_plate],[rent_per_hour],[rent_per_day]" +
							   ",[price_detail],[deposit],[cancelation_policy],[company_name],[create_dt]) VALUES('"+vd.GetvenueID()+"','"+vd.GetUserID()+"','"+vd.GetVenueName()+"'" +
							   ",'"+vd.GetstreetAdd()+"','"+vd.Getcity()+"','"+vd.GetzipCode()+"','"+vd.Getdescription()+"','"+vd.Getstanding()+"'" +
							   ",'"+vd.Getseated()+"','"+vd.Getseminar()+"','"+vd.Gettheater()+"','"+vd.Getbanquet()+"','"+vd.Getconference()+"'" +
							   ",'"+vd.GetfloorArea()+"','"+vd.GetcapacityDetail()+"','"+vd.GetpricePerson()+"','"+vd.GetpricePlate()+"'" +
							   ",'"+vd.GetrentHour()+"','"+vd.GetrentDay()+"','"+vd.GetcostInfo()+"','"+vd.Getdeposit()+"'" +
							   ",'"+vd.Getpolicy()+"','"+vd.GetcompanyName()+"',getdate())";


				SqlCommand cmd = new SqlCommand(Query, Connection);

				x = cmd.ExecuteNonQuery();

				return x;
			}
			catch (Exception ex)
			{
				KeepLog("DataAccess | AddMember", ex.ToString());
				return -99;
			}
		}


		public int InsertEventTypes(data.venue_detail vd)
		{
			try
			{
				if (Connection.State != ConnectionState.Open)
				{
					Connection.Open();
				}
				int x = 0;

				string Query = "INSERT INTO [dbo].[tblEventType] ([venue_id],[event_type]) VALUES ('"+vd.GetvenueID()+"','"+vd.GetEventType()+"')";


				SqlCommand cmd = new SqlCommand(Query, Connection);

				x = cmd.ExecuteNonQuery();

				return x;
			}
			catch (Exception ex)
			{
				KeepLog("DataAccess/InsertEventTypes | ",ex.ToString());
				return -99;
			}
		}

		//Update profile picture path
		public int InsertVenuePicture(string venuePicPath, string vID)
		{
			try
			{
				int x = 0;

				string query = "INSERT INTO [dbo].[tblVenueImage] ([venue_id],[image_path]) VALUES ('"+ vID + "','"+ venuePicPath + "')";

				SqlCommand cmd = new SqlCommand(query, Connection);

				x = cmd.ExecuteNonQuery();

				return x;
			}
			catch (Exception ex)
			{
				KeepLog("DataAccess | UpdateVenuePicture", ex.ToString());
				return -99;
			}
		}


		public DataSet GetVenueImages(string venueID)
		{
			try
			{
				string Query = "SELECT [venue_image_id],[image_path] FROM [dbo].[tblVenueImage] WHERE [venue_id] = '" + venueID + "'";
				DataSet ds = GetDatasetQuery(Query);
				return ds;
			}
			catch (Exception ex)
			{
				KeepLog("DataAccess|GetVenueImages", ex.Message);
				return null;                
			}
		}


		public DataSet GetVenueDetail(string userID)
		{
			try
			{
				string query = "SELECT vd.venue_id, vd.venue_name, vd.city, vd.[description], vd.price_per_person, vd.price_per_plate, vd.rent_per_hour, vd.rent_per_day " +
							   "FROM dbo.tblVenueDetail vd where vd.Visibility = 'true' and vd.[user_id]='" + userID + "'";

				DataSet ds = GetDatasetQuery(query);
				return ds;
			}
			catch (Exception ex)
			{
				KeepLog("DataAccess | GetVenueDetail", ex.ToString());
				return null;
			}
		}


		public DataSet GetRandomResultVenue()
		{
			try
			{
				string query = @"SELECT DISTINCT top 3 vd.city,  vd.standing,  vd.seated, vd.venue_name,  vd.venue_id, vd.[description], 
								 vd.price_per_person,  vd.price_per_plate,  vd.rent_per_hour,  vd.rent_per_day,vc.contactName,vc.phoneNo,NEWID()
								 FROM   dbo.tblVenueDetail vd full outer JOIN dbo.tblVenueContact vc ON vd.venue_id = vc.venueID WHERE vd.Visibility='true' ORDER BY NEWID()";

				DataSet ds = GetDatasetQuery(query);
				return ds;
			}
			catch (Exception ex)
			{
				KeepLog("DataAccess | GetVenueDetail", ex.ToString());
				return null;
			}
		}


		public DataSet GetResentResultVenue()
		{
			try
			{
				string query = @"SELECT DISTINCT top 4 vd.city,  vd.standing,  vd.seated, vd.venue_name,  vd.venue_id, vd.[description], 
								 vd.price_per_person,  vd.price_per_plate,  vd.rent_per_hour,  vd.rent_per_day,vc.contactName,vc.phoneNo
								 FROM   dbo.tblVenueDetail vd full outer JOIN dbo.tblVenueContact vc ON vd.venue_id = vc.venueID WHERE vd.Visibility='true' ORDER BY vd.venue_id DESC";

				DataSet ds = GetDatasetQuery(query);
				return ds;
			}
			catch (Exception ex)
			{
				KeepLog("DataAccess | GetVenueDetail", ex.ToString());
				return null;
			}
		}


		public string GetVenueSingleImage(string venueID)
		{
			try
			{
				string query = "SELECT [image_path] FROM [dbo].[tblVenueImage] where [venue_id]='"+venueID+"'";

				DataSet ds = GetDatasetQuery(query);
				string ImagePath = ds.Tables[0].Rows[0][0].ToString();
				if (ImagePath.Equals("") || ImagePath.Equals("Default Image"))
				{
					//set profile picture default image 
				}
				else
				{
					ImagePath = ImagePath.Replace(@"h:\root\home\kamal1975-001\www\venue", "..");
					ImagePath = ImagePath.Replace(@"\", "/");
				}

				return ImagePath;
			}
			catch (Exception ex)
			{
				KeepLog("DataAccess | GetVenueDetail", ex.ToString());
				return "assets/img/image-01.jpg";
			}
		}

		public void KeepLog(string MethodName, string Exception)
		{
			try
			{
				int x = 0;

				string query = "insert into IssueLog values(getdate(), '" + MethodName + "', '" + Exception + "')";

				SqlCommand cmd = new SqlCommand(query, Connection);

				x = cmd.ExecuteNonQuery();
			}
			catch (Exception)
			{
				//MessageBox.Show(ex.ToString());                
			}
		}

		public DataTable GetSearchResultVenue(string category, int guests, int guests2, string location)
		{
			try
			{
				string[] paraname = new string[5];

				paraname[0] = "@Guests";
				paraname[1] = "@Guests2";
				paraname[2] = "@Category";
				paraname[3] = "@Location";

				string[] paravalue = new string[5];

				paravalue[0] = guests.ToString();
				paravalue[1] = guests2.ToString();
				paravalue[2] = category;
				paravalue[3] = location;

				DataTable dt;

				DataSet ds = GetDataset("sp_GetSearchResult", paraname, paravalue);
				dt = ds.Tables[0];
				return dt;
			}
			catch (Exception ex)
			{
				KeepLog("GetSearchResultVenue-dam", ex.Message);

				return null;
			}
		}


		public int InsertVenueContact(data.venue_detail vd)
		{
			try
			{
				if (Connection.State != ConnectionState.Open)
				{
					Connection.Open();
				}
				int x = 0;

				string Query = @"INSERT INTO [dbo].[tblVenueContact] ([venueID],[contactName],[phoneNo],[email],[webSite],[contactImage])
								VALUES ('" + vd.GetvenueID() + "','" + vd.GetContactName() + "','" + vd.GetContactPhone() + "','" + vd.GetContactEmail() + "','" + vd.GetVenueWebsite() + "','" + vd.GetContactPhoto() + "')";

				SqlCommand cmd = new SqlCommand(Query, Connection);

				x = cmd.ExecuteNonQuery();

				return x;
			}
			catch (Exception ex)
			{
				KeepLog("DataAccess/InsertEventTypes | ", ex.ToString());
				return -99;
			}
		}


		public venue_detail GetVenueSingleDetail(string venueID)
		{
			try
			{
				venue_detail usr = new venue_detail();

				string VenueDetail = @"SELECT DISTINCT dbo.tblVenueDetail.venue_id, dbo.tblVenueDetail.venue_name, dbo.tblVenueDetail.city, dbo.tblVenueDetail.description, dbo.tblVenueDetail.standing, dbo.tblVenueDetail.seated, dbo.tblVenueDetail.seminar, 
						 dbo.tblVenueDetail.theater, dbo.tblVenueDetail.banquet, dbo.tblVenueDetail.conference, dbo.tblVenueDetail.floor_area, dbo.tblVenueDetail.price_per_person, dbo.tblVenueDetail.price_per_plate, 
						 dbo.tblVenueDetail.rent_per_hour, dbo.tblVenueDetail.rent_per_day, dbo.tblVenueDetail.price_detail, dbo.tblVenueDetail.deposit, dbo.tblVenueDetail.cancelation_policy, dbo.tblVenueDetail.company_name, 
						 dbo.tblVenueContact.contactName, dbo.tblVenueContact.phoneNo, dbo.tblVenueContact.webSite, dbo.tblVenueContact.email, dbo.tblVenueDetail.venue_name, dbo.tblVenueDetail.street_name,dbo.tblVenueDetail.zip_code
						 FROM dbo.tblVenueContact RIGHT OUTER JOIN dbo.tblVenueDetail ON dbo.tblVenueContact.venueID = dbo.tblVenueDetail.venue_id
						 WHERE (dbo.tblVenueDetail.venue_id = N'" + venueID + "' and dbo.tblVenueDetail.Visibility = 'true')";

				SqlCommand cmd = new SqlCommand(VenueDetail, Connection);
				SqlDataAdapter da = new SqlDataAdapter(VenueDetail, Connection);
				DataTable dt = new DataTable();
				da.Fill(dt);
				
				usr.SetvenueID(venueID);
				usr.SetVenueName(dt.Rows[0][1].ToString());
				usr.Setcity(dt.Rows[0][2].ToString());
				usr.Setdescription(dt.Rows[0][3].ToString());
				usr.Setstanding(dt.Rows[0][4].ToString());
				usr.Setseated(dt.Rows[0][5].ToString());
				usr.Setseminar(dt.Rows[0][6].ToString());
				usr.Settheater(dt.Rows[0][7].ToString());
				usr.Setbanquet(dt.Rows[0][8].ToString());
				usr.Setconference(dt.Rows[0][9].ToString());
				usr.SetfloorArea(dt.Rows[0][10].ToString());

				usr.SetpricePerson(dt.Rows[0][11].ToString());
				usr.SetpricePlate(dt.Rows[0][12].ToString());
				usr.SetrentHour(dt.Rows[0][13].ToString());
				usr.SetrentDay(dt.Rows[0][14].ToString());
				usr.SetcostInfo(dt.Rows[0][15].ToString());
				usr.Setdeposit(dt.Rows[0][16].ToString());
				usr.Setpolicy(dt.Rows[0][17].ToString());

				usr.SetcompanyName(dt.Rows[0][18].ToString());
				usr.SetContactName(dt.Rows[0][19].ToString());
				usr.SetContactPhone(dt.Rows[0][20].ToString());
				usr.SetVenueWebsite(dt.Rows[0][21].ToString());
				usr.SetContactEmaile(dt.Rows[0][22].ToString());

                usr.SetstreetAdd(dt.Rows[0][24].ToString());
                usr.SetzipCode(dt.Rows[0][25].ToString());


				return usr;
			}
			catch (Exception ex)
			{
				KeepLog("GetVenueSingleDetail-dam", ex.Message);

				return null;                
			}
		}

        public DataTable GetEventType(string VenueID)
        {
            try
            {
                string EventType = @"SELECT [event_type_id],[venue_id],[event_type] FROM [DB_A3E382_venuedb].[dbo].[tblEventType]
                            where venue_id = '" + VenueID + "'";

                SqlCommand cmd = new SqlCommand(EventType, Connection);
                SqlDataAdapter da = new SqlDataAdapter(EventType, Connection);
                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            catch (Exception ex)
            {
                KeepLog("GetVenueEventType-dam", ex.Message);

				return null;      
            }
        }
	}
}