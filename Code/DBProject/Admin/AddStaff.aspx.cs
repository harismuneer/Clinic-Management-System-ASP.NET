using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBProject.DAL;

namespace DBProject
{
	public partial class AddStaff : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void StaffRegister(object sender, EventArgs e)
		{
			if (Page.IsValid)
			{
				myDAL objmyDAL = new myDAL();

				int salary = Convert.ToInt32(Salary.Text);
				string gender = Request.Form["Gender"].ToString();

				if (objmyDAL.AddStaff(Name.Text, BirthDate.Text, Phone.Text, gender[0], Address.Text, salary, Qual.Text, Designation.Text) == 1) ;
				{
					Response.BufferOutput = true;
					Msg.Visible = true;
					Msg.Text = Designation.Text + " Added Succesfully";
					flushInformation();
				}

			}
		}
		protected void flushInformation()
		{
			Name.Text = "";
			BirthDate.Text = "";
			Phone.Text = "";
			Address.Text = "";
			Salary.Text = "";
			Qual.Text = "";
			Designation.Text = "";
		}

		
	}
}