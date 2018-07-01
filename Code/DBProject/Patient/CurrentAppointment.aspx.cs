using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBProject.DAL;
using System.Data;


namespace DBProject
{
    public partial class CurrentAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            appointmentToday(sender, e);
        }



        //-----------------------Function1--------------------------//

        protected void appointmentToday(object sender, EventArgs e)
        {
            myDAL objmyDAl = new myDAL();

            int pid = (int)Session["idoriginal"];

            string dName = "";
            string timings = "";

            int status = objmyDAl.appointmentTodayDisplayer(pid, ref dName, ref timings);

            if (status == -1)
            {
                Appointment.Text = "There was some error in retrieving the Patient's appointment.";
            }

            else if (status == 0)
            {
                Appointment.Text = "You have no appointment today with any doctor.";
            }

            else
            {
                if (status == 3)
                {
                    ADoctor.Text = "You had an outdated appointment with Doctor " + dName + " to which he didn't respond. So that appointment is discarded.";
                    ATimings.Text = "The Appointment Timings were : " + timings;
                    return;
                }

                else if (status == 2)
                {
                    ADoctor.Text = "You have sent an appointment request to Doctor " + dName + " which isn't approved by him yet.";
                }

                else
                {
                    ADoctor.Text = "Today you have an appointment with Doctor " + dName;
                }

                ATimings.Text = "The Appointment Timings are : " + timings;
            }

            return;
        }


        //-----------------------Add a new function here------------------//






    }
}