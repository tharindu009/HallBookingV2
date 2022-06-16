using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HallBookingV2.data
{

    public class search_data
    {
        private string category;
        private int guests;
        private int guests2;
        private string location;

        public string GetCategory()
        {
            return category;
        }
        public void SetCategory(string uId)
        {
            this.category = uId;
        }

        public int Getguests()
        {
            return guests;
        }
        public void Setguests(int uId)
        {
            this.guests = uId;
        }

        public int Getguests2()
        {
            return guests2;
        }
        public void Setguests2(int uId)
        {
            this.guests2 = uId;
        }

        public string Getlocation()
        {
            return location;
        }
        public void Setlocation(string uId)
        {
            this.location = uId;
        }


    }
}