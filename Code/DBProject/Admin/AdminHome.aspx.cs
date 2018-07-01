using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DBProject.DAL;

namespace DBProject
{
	public partial class AdminHome : System.Web.UI.Page
	{

		protected void Page_Load(object sender, EventArgs e)
		{
			GetAdminHomeInformation();
		}



		public void GetAdminHomeInformation()
		{
			myDAL objmyDAL = new myDAL();

			DataTable[] arrTable = new DataTable[5];
			for (int i = 0; i < 5; i++)
			{
				arrTable[i] = new DataTable();
			}


			objmyDAL.GetAdminHomeInformation(ref arrTable);

			Total_Doctors.Visible = TotalIncome.Visible = TotalPatients.Visible = true;

			Total_Doctors.Text = arrTable[0].Rows[0][0].ToString();
			TotalPatients.Text = arrTable[1].Rows[0][0].ToString();
			TotalIncome.Text = arrTable[2].Rows[0][0].ToString();



			department_View.DataSource = arrTable[3];
			department_View.DataBind();


			Appointment_view.DataSource = arrTable[4];
			Appointment_view.DataBind();
			







		}

	}

}