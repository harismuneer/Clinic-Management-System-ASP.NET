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
    public partial class DoctorProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            doctorInfo(sender, e);
        }



        //-----------------------Function1--------------------------//

        protected void doctorInfo(object sender, EventArgs e)
        {
            myDAL objmyDAl = new myDAL();

            string dID1 = (string) Session["dID"];

            int dID = Convert.ToInt32(dID1);

            string name = "";
            string phone = "";
            string gender = "";

            float charges_Per_Visit = 0;
            float ReputeIndex = 0;
            int PatientsTreated = 0;
            string qualification = "";
            string specialization = "";
            int workE = 0;
            int age = 0;

            string deptName = (string)Session["deptOriginal"];

            int status = objmyDAl.doctorInfoDisplayer(dID, ref name, ref phone, ref gender, ref charges_Per_Visit, ref ReputeIndex, ref PatientsTreated, ref qualification, ref specialization, ref workE, ref age);

            if (status == -1)
            {
                Response.Write("<script>alert('There was some error in retrieving the Doctor's Info.');</script>");
            }

            else if (status == 0)
            {
                DName.Text = name;
                DPhone.Text = phone;
                DQualification.Text = qualification;
                DSpecialization.Text = specialization;
                DWork.Text = workE.ToString();
                DAge.Text = age.ToString();
                DGender.Text = gender;
                DDept.Text = deptName;
                DCharges.Text = charges_Per_Visit.ToString();
                DRI.Text = ReputeIndex.ToString(); 
                DPT.Text = PatientsTreated.ToString();
            }

            return;
        }


        //-----------------------Function2------------------//

        protected void RedirectToAppointmentTaker(object sender, EventArgs e)
        {
            Response.BufferOutput = true;
            Response.Redirect("AppointmentTaker.aspx");
        }
        



        //-----------------------Add a new function here------------------//


    }
}