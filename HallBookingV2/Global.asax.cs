using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;
using System.Data;

namespace HallBookingV2
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }

        static void RegisterRoutes(RouteCollection routes)
        {
            //routes.MapPageRoute("Uniquename", "Name to shown on Adddress bar", "Physical Path to the page");
            routes.MapPageRoute("Home", "Home", "~/default.aspx");
            //routes.MapPageRoute("Places", "Search/{sid}/{category}/{location}/{guest1}/{guest2}", "~/listing_grid.aspx");
            routes.MapPageRoute("Contact", "contact", "~/contact.aspx");
            routes.MapPageRoute("SignIn", "signin", "~/signin.aspx");
            routes.MapPageRoute("Register", "register", "~/register.aspx");
            routes.MapPageRoute("AddVenue", "add_venue", "~/add_venue1.aspx");
            routes.MapPageRoute("RegVenue", "register_venue", "~/add_venue.aspx");
            routes.MapPageRoute("Edit", "edit/{VID}", "~/edit_venue.aspx");
            routes.MapPageRoute("Browse", "browse", "~/listing_grid.aspx");

        }


        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            if (Request.AppRelativeCurrentExecutionFilePath == "~/")
                HttpContext.Current.RewritePath("~/default.aspx");
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}