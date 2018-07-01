using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBProject.DAL;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DBProject
{
	public partial class ManageClinic : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				LoadGrid("", "DOCTOR");
			}
		}




		/*THIS FUNTION WILL LOAD THE INFORMATION OF ALL DOCTORS AND BIND THEM TO THE GRID*/
		protected void LoadGrid(string SearchQuery , string Category)
		{
			myDAL objmyDaL = new myDAL();
			DataTable table = new DataTable();
		

			if (Category == "DOCTOR")
			{
				objmyDaL.LoadDoctor(ref table, SearchQuery);

				if (table != null && table.Rows.Count > 0)
				{
					
					Manage.DataSource = table;
					Manage.DataBind();
				}
				else
				{
					Msg.Text = "No Doctors to show";
				}
			}
			else if(Category == "PATIENT")
			{
				objmyDaL.LoadPatient(ref table, SearchQuery);

				if (table != null && table.Rows.Count > 0)
				{
					
					Manage.DataSource = table;
					Manage.DataBind();
				}
				else
				{
					Msg.Text = "No Pateints to show";
				}
			}
			else
			{



				objmyDaL.LoadOtherStaff(ref table, SearchQuery);


				if (table != null && table.Rows.Count > 0)
				{

					Manage.DataSource = table;
					Manage.Caption = "Other Staff Table:";
					Manage.DataBind();
				}
				else
				{
					Msg.Text = "No Staff Member to show";
				}
			}




		}




		/*EVENT HANDLER FOR DELETE BUTTON IN GRID*/
		protected void DeleteDoctor_Click(Object sender, GridViewDeleteEventArgs e)
		{
			GridViewRow row = Manage.Rows[e.RowIndex];
			string id = row.Cells[1].Text;
			myDAL objDAL = new myDAL();

			if (Doctor.Checked == true)
			{

				if (objDAL.DeleteDoctor(Convert.ToInt32(id)) == 1)
				{
					Msg.Text = " Doctor No: " + id + " Deleted";
					LoadGrid("", "DOCTOR");
				}
				else
				{
					Msg.Text = "there was some error";
				}

			}
			else if (Patient.Checked == true)
			{
				
				{
					Msg.Text = "You are not Authorized to Delete a Patient";
				}
			}
			else
			{
				if (objDAL.DeleteStaff(Convert.ToInt32(id)) == 1)
				{
					Msg.Text = "Staff No: " + id + " Deleted ";
					LoadGrid("", "OTHERSTAFF");
				}
				else
				{

					Msg.Text = "There was some Error";

				}
			}
		}


		

		/*THIS FUNCTION WILL SEARCH THE NAME AND GIVE RESULTS OR RETURN ALL TUPLES FROM DATABASE IN THE GRID VIE*/
		protected void Search_btn(object sender, EventArgs e)
		{


			if(Doctor.Checked == true)
			{

				LoadGrid(txtSearch.Text , "DOCTOR");

			}
			else if(Patient.Checked == true)
			{


				LoadGrid(txtSearch.Text , "PATIENT");

			}
			else
			{

				LoadGrid(txtSearch.Text , "OTHERSTAFF");

			}
		}


	
		/*EVENT HANDLER FOR ANY CHANGE IN THE RADIO BUTTON*/
		protected void RadioButton_CheckedChanged(object sender, System.EventArgs e)
		{
			if (Doctor.Checked == true)
			{

				LoadGrid("" , "DOCTOR");
			}
			else if(Patient.Checked == true)
			{
				LoadGrid("" , "PATIENT");
			}
			else
			{
				LoadGrid("" , "OTHERSTAFF");
			}
		}



		protected void SelectCommand(object sender, GridViewCommandEventArgs e)
		{


			if(Doctor.Checked == true)
			{
				LoadGrid("", "DOCTOR");
			}
			else if (Patient.Checked == true)
			{
				LoadGrid("", "PATIENT");
			}
			else
			{
				LoadGrid("", "STAFF");
			}

			int num = Convert.ToInt32(e.CommandArgument);
			int  id = Convert.ToInt32(Manage.Rows[num].Cells[1].Text);
			myDAL objDAL = new myDAL();

			string name = "";
			string phone = "";
			string gender = "";
			string address = "";
			string bDate = "";

			float charges_Per_Visit = 0;
			float ReputeIndex = 0;
			int PatientsTreated = 0;
			string qualification = "";
			string specialization = "";
			int workE = 0;
			int age = 0;

			if (Doctor.Checked == true)
			{
				if(objDAL.GET_DOCTOR_PROFILE(id, ref name, ref phone, ref gender, ref charges_Per_Visit, ref ReputeIndex, ref PatientsTreated, ref qualification, ref specialization, ref workE, ref age) == 1)
				{


					mydiv.InnerHtml = "<p><b>Name:</b></p>" + name +  
										" <p><b>phone:</b></p>" +phone+
										"<p><b>gender:</b></p>" +gender+
										"<p><b>Qualification:</b></p>" +qualification+
										"<p><b> Age:</b></p>" +age+
										"<p><b>Charges:</b></p> " +charges_Per_Visit+
										"<p><b>Repute index:</b></p>"+ReputeIndex;
					




				}
				else
				{
					Msg.Text = "there was some error";
				}
				
			}
			else if(Patient.Checked == true)
			{

				

				if (objDAL.GETPATIENT(id, ref name, ref  phone, ref  address, ref  bDate, ref age, ref  gender) == 0)
				{



					mydiv.InnerHtml = "<p><b>Name:</b></p>" + name +
										" <p><b>phone:</b></p>" + phone +
										"<p><b>gender:</b></p>" + gender +
										"<p><b>Address:</b></p>" + address +
										"<p><b> Age:</b></p>" + age ;
					

				}
				else
				{
					Msg.Text = "there was some error";
				}




			}
			else
			{
				string designation = "";
				int s = 0;
				
				if(objDAL.GETSATFF(id , ref name , ref phone , ref address , ref gender , ref designation , ref s ) == 1)
				{


					mydiv.InnerHtml = "<p><b>Name:</b></p>" + name +
										" <p><b>phone:</b></p>" + phone +
										"<p><b>gender:</b></p>" + gender +
										"<p><b>Address:</b></p>" + address +
										"<p><b> salary:</b></p>" + s;


				}
				else
				{
					Msg.Text = "there was some error";
				}



			}



			
			

		}


	}
}