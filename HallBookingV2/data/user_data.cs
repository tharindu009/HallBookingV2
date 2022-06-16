using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HallBookingV2.data
{
    public class user_data
    {
        private string UserName;
        private string Email;
        private string Password;
        private string Usertype;
        private string newsletter;
        private string ProfilePicture;
        private string userID;

        //------------------
        private string userDesc;
        private string userAddress;
        private string userCompany;
        private string userPhone;
        private string facebook;
        private string twitter;


        public string GetUserName()
        {
            return UserName;
        }
        public void SetUserName(string uId)
        {
            this.UserName = uId;
        }

        public string GetUserID()
        {
            return userID;
        }
        public void SetUserID(string uId)
        {
            this.userID = uId;
        }

        public string GetEmail()
        {
            return Email;
        }
        public void SetEmail(string email)
        {
            this.Email = email;
        }

        public string GetPassword()
        {
            return Password;
        }
        public void SetPassword(string pwd)
        {
            this.Password = pwd;
        }

        public string GetUsertype()
        {
            return Usertype;
        }
        public void SetUsertype(string ut)
        {
            this.Usertype = ut;
        }

        public string Getnewsletter()
        {
            return newsletter;
        }
        public void Setnewsletter(string nl)
        {
            this.newsletter = nl;
        }

        public string GetProfilePicture()
        {
            return ProfilePicture;
        }
        public void SetProfilePicture(string pp)
        {
            this.ProfilePicture = pp;
        }

        public string GetuserDesc()
        {
            return userDesc;
        }
        public void SetuserDesc(string usrD)
        {
            this.userDesc = usrD;
        }

        public string GetuserAddress()
        {
            return userAddress;
        }
        public void SetuserAddress(string usrA)
        {
            this.userAddress = usrA;
        }

        public string GetuserCompany()
        {
            return userCompany;
        }
        public void SetuserCompany(string usrC)
        {
            this.userCompany = usrC;
        }

        public string GetuserPhone()
        {
            return userPhone;
        }
        public void SetuserPhone(string usrP)
        {
            this.userPhone = usrP;
        }

        public string Getfacebook()
        {
            return facebook;
        }
        public void Setfacebook(string usrP)
        {
            this.facebook = usrP;
        }

        public string Gettwitter()
        {
            return twitter;
        }
        public void Settwitter(string usrP)
        {
            this.twitter = usrP;
        }
    }
}