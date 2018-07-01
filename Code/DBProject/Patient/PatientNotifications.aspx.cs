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
    public partial class PatientNotifications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Notifications(sender, e);
        }



        //-----------------------Function1--------------------------//
        
        protected void Notifications(object sender, EventArgs e)
        {
            myDAL objmyDAl = new myDAL();

            int pid = (int)Session["idoriginal"];

            string dName = "";
            string timings = "";

            int status = objmyDAl.getNotifications(pid, ref dName, ref timings);

            if (status == -1)
            {
                Notify.Text = "There was some error in retrieving the Patient's notifications.";
            }

            else if (status == 0)
            {
                Notify.Text = "There are no new notifications :)";
            }

            else
            {
                if (status == 1)
                {
                    NDoctor.Text = "Your requested appointment with Doctor " + dName + " has been accepted by him! :)";
                    NTimings.Text = "The Appointment Timings are : " + timings;
                    return;
                }

                else if (status == 2)
                {
                    NDoctor.Text = "Your requested appointment with Doctor " + dName + " has been rejected by him! :(";
                    NTimings.Text = "The Appointment Timings were : " + timings;
                    return;
                }

                else if (status == 3)
                {
                    NDoctor.Text = "Your appointment with Doctor " + dName + " has been completed now. We hope you are feeling better now!";
                    NTimings.Text = "The Appointment Timings were : " + timings;
                    return;
                }

                return;
            }
        }

    
        //-----------------------Add a new function here------------------//















    }
}