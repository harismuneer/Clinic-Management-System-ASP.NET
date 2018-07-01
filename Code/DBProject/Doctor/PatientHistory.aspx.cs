using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBProject.DAL;
using System.Data;


namespace doctor
{
    public partial class patienthistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                myDAL objmydal = new myDAL();
                DataTable dt = new DataTable();
                int found = 0;

                int did = (int)Session["idoriginal"];

                found = objmydal.search_patient_DAL(did, ref dt);
                if (found != 1)
                { Response.Write("<script>alert('There was some error');</script>"); }
                else
                {
                    patientsgrid.DataSource = dt;
                    patientsgrid.DataBind();
                }
        }

        
        protected void patientsgrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {

                Int16 num = Convert.ToInt16(e.CommandArgument);

                string aId = patientsgrid.Rows[num].Cells[1].Text;

                //retrieve appointmentid  from that row (key-non editable)
                int appointmentid = Convert.ToInt32(aId);

                Session["appointid"] = appointmentid;
                Response.Redirect("Historyupdate.aspx");
            }
        }
    }

}