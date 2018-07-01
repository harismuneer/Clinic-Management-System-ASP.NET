using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBProject.DAL;

namespace DB_Project
{
	public partial class DoctorRegistrationForm : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}




		protected void ValidateDoctorEmail(object sender, ServerValidateEventArgs args)
		{
			myDAL objmyDAL = new myDAL();


			if (objmyDAL.DoctorEmailAlreadyExist(Email.Text) == 1)
			{
				args.IsValid = false;
				Msg.Visible = false;
				Msg.Text = "";
				DoctorValidate.ErrorMessage = "This Email Already exist , kindly choose a different one !";
			}
			else
			{
				args.IsValid = true;
			}

		}


		protected void DoctorRegister(object sender, EventArgs e)
		{

			if (Page.IsValid)
			{
				myDAL objmyDAL = new myDAL();

				int exp = Convert.ToInt32(Exp.Text);
				int salary = Convert.ToInt32(Salary.Text);
				int chargesPerVisit = Convert.ToInt32(Charges_per_visit.Text);
				int dept = Convert.ToInt32(Department.SelectedValue);
				string gender = Request.Form["Gender"].ToString();

				objmyDAL.AddDoctor(Name.Text, Email.Text, Password.Text, BirthDate.Text, dept, Phone.Text, gender[0], Address.Text, exp, salary, chargesPerVisit, spec.Text, Qualification.Text);
				Response.BufferOutput = true;
				Msg.Visible = true;
				Msg.Text = "doctor Added Succesfully";
				flushInformation();


			}
		}

		protected void flushInformation()
		{
			Name.Text = "";
			Email.Text = "";
			Password.Text = "";
			BirthDate.Text = "";
			Department.Text = "Select Depatment";
			Phone.Text = "";
			Address.Text = "";
			Exp.Text = "";
			Salary.Text = "";
			Charges_per_visit.Text = "";
			spec.Text = "";
			Qualification.Text = "";
		}


		protected void DepartmentValidate(object sender, ServerValidateEventArgs args)
		{
			int dept = Convert.ToInt32(Department.SelectedValue);
			if (dept == 0)
			{
				DV.ErrorMessage = "Please Select Department";
				args.IsValid = false;
			}
		}
	}
}