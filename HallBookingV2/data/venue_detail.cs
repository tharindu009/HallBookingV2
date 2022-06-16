using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HallBookingV2.data
{
    public class venue_detail
    {
        private string venueID;
        private string UserID;
        private string VenueName;
        private string companyName;
        private string streetAdd;
        private string city;
        private string zipCode;
        private string description;
        private string standing;
        private string seated;
        private string seminar;
        private string theater;
        private string banquet;
        private string conference;
        private string floorArea;
        private string capacityDetail;
        private string pricePerson;
        private string pricePlate;
        private string rentHour;
        private string rentDay;
        private string costInfo;
        private string deposit;
        private string policy;
        //---------

        private string eventType;

        //------------
        private string ContactName;
        private string ContactPhone;
        private string ContactEmail;
        private string VenueWebsite;
        private string ContactPhoto;



        public string GetUserID()
        {
            return UserID;
        }
        public void SetUserID(string ui)
        {
            this.UserID = ui;
        }

        public string GetvenueID()
        {
            return venueID;
        }
        public void SetvenueID(string vi)
        {
            this.venueID = vi;
        }


        public string GetVenueName()
        {
            return VenueName;
        }
        public void SetVenueName(string vn)
        {
            this.VenueName = vn;
        }

        public string GetcompanyName()
        {
            return companyName;
        }
        public void SetcompanyName(string cn)
        {
            this.companyName = cn;
        }

        public string GetstreetAdd()
        {
            return streetAdd;
        }
        public void SetstreetAdd(string sa)
        {
            this.streetAdd = sa;
        }

        public string Getcity()
        {
            return city;
        }
        public void Setcity(string city1)
        {
            this.city = city1;
        }

        public string GetzipCode()
        {
            return zipCode;
        }
        public void SetzipCode(string zc)
        {
            this.zipCode = zc;
        }

        public string Getdescription()
        {
            return description;
        }
        public void Setdescription(string des)
        {
            this.description = des;
        }

        public string Getstanding()
        {
            return standing;
        }
        public void Setstanding(string stnd)
        {
            this.standing = stnd;
        }

        public string Getseated()
        {
            return seated;
        }
        public void Setseated(string seat)
        {
            this.seated = seat;
        }

        public string Getseminar()
        {
            return seminar;
        }
        public void Setseminar(string sem)
        {
            this.seminar = sem;
        }

        public string Gettheater()
        {
            return theater;
        }
        public void Settheater(string thea)
        {
            this.theater = thea;
        }

        public string Getbanquet()
        {
            return banquet;
        }
        public void Setbanquet(string banq)
        {
            this.banquet = banq;
        }

        public string Getconference()
        {
            return conference;
        }
        public void Setconference(string conf)
        {
            this.conference = conf;
        }

        public string GetfloorArea()
        {
            return floorArea;
        }
        public void SetfloorArea(string fa)
        {
            this.floorArea = fa;
        }

        public string GetcapacityDetail()
        {
            return capacityDetail;
        }
        public void SetcapacityDetail(string cDetail)
        {
            this.capacityDetail = cDetail;
        }

        public string GetpricePerson()
        {
            return pricePerson;
        }
        public void SetpricePerson(string priceper)
        {
            this.pricePerson = priceper;
        }

        public string GetpricePlate()
        {
            return pricePlate;
        }
        public void SetpricePlate(string pricepla)
        {
            this.pricePlate = pricepla;
        }

        public string GetrentHour()
        {
            return rentHour;
        }
        public void SetrentHour(string rentH)
        {
            this.rentHour = rentH;
        }

        public string GetrentDay()
        {
            return rentDay;
        }
        public void SetrentDay(string rentD)
        {
            this.rentDay = rentD;
        }

        public string GetcostInfo()
        {
            return costInfo;
        }
        public void SetcostInfo(string ci)
        {
            this.costInfo = ci;
        }

        public string Getdeposit()
        {
            return deposit;
        }
        public void Setdeposit(string dep)
        {
            this.deposit = dep;
        }

        public string Getpolicy()
        {
            return policy;
        }
        public void Setpolicy(string poli)
        {
            this.policy = poli;
        }

        //---------------------

        public string GetEventType()
        {
            return eventType;
        }

        public void SetEventType(string et)
        {
            this.eventType = et;
        }


        //----------------

        public string GetContactName()
        {
            return ContactName;
        }
        public void SetContactName(string ui)
        {
            this.ContactName = ui;
        }


        public string GetContactPhone()
        {
            return ContactPhone;
        }
        public void SetContactPhone(string ui)
        {
            this.ContactPhone = ui;
        }

        public string GetContactEmail()
        {
            return ContactEmail;
        }
        public void SetContactEmaile(string ui)
        {
            this.ContactEmail = ui;
        }


        public string GetVenueWebsite()
        {
            return VenueWebsite;
        }
        public void SetVenueWebsite(string ui)
        {
            this.VenueWebsite = ui;
        }

        public string GetContactPhoto()
        {
            return ContactPhoto;
        }
        public void SetContactPhoto(string ui)
        {
            this.ContactPhoto = ui;
        }
    }
}