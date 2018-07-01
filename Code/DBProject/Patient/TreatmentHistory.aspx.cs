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
    public partial class TreatmentHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            treatmentHistory(sender, e);
        }


        //-----------------------Function1--------------------------//

        protected void treatmentHistory(object sender, EventArgs e)
        {
            myDAL objmyDAl = new myDAL();

            DataTable DT = new DataTable();


            int id = (int)Session["idoriginal"];


            int status = objmyDAl.getTreatmentHistory(id, ref DT);


            if (status == -1)
            {
                THistory.Text = "There was some error in retrieving the Patient's Treatment History.";
            }

            else if (status == 0)
            {
                THistory.Text = "There is currently no treatment history of yours.";
            }

            else
            {
                THistory.Text = "Treatment History of " + status + " Appointment(s) is found: ";
                THistoryGrid.DataSource = DT;
                THistoryGrid.DataBind();
            }

            return;
        }
        

        //-----------------------Add a new function here------------------//




    }
}