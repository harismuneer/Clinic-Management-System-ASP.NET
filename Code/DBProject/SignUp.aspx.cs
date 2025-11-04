using System;
using System.Web.UI;
using DBProject.DAL;

namespace DBProject
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["idoriginal"] = "";
            }
        }

        //----------------------- Login Function --------------------------//
        protected void loginV(object sender, EventArgs e)
        {
            string email = loginEmail.Text.Trim();
            string password = loginPassword.Text.Trim();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                ShowAlert("Please enter both Email and Password.");
                return;
            }

            myDAL objmyDAL = new myDAL();
            int status = objmyDAL.validateLogin(email, password, ref int type, ref int id);

            if (status == 0)
            {
                Session["idoriginal"] = id;

                switch (type)
                {
                    case 1:
                        Response.Redirect("~/Patient/PatientHome.aspx", false);
                        break;
                    case 2:
                        Response.Redirect("~/Doctor/DoctorHome.aspx", false);
                        break;
                    case 3:
                        Response.Redirect("~/Admin/AdminHome.aspx", false);
                        break;
                    default:
                        ShowAlert("Invalid user type.");
                        break;
                }
            }
            else if (status == 1)
                ShowAlert("Email not found. Try again!");
            else if (status == 2)
                ShowAlert("Incorrect password. Try again!");
            else
                ShowAlert("Unexpected error occurred. Please try again.");
        }

        //----------------------- Signup Function --------------------------//
        protected void signupV(object sender, EventArgs e)
        {
            string name = sName.Text.Trim();
            string birthDate = sBirthDate.Text.Trim();
            string email = sEmail.Text.Trim();
            string password = sPassword.Text.Trim();
            string phone = Phone.Text.Trim();
            string addr = Address.Text.Trim();
            string gender = Request.Form["Gender"];

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                ShowAlert("Please fill in all required fields.");
                return;
            }

            myDAL objmyDAL = new myDAL();
            int id = 0;
            int status = objmyDAL.validateUser(name, birthDate, email, password, phone, gender, addr, ref id);

            if (status == 0)
                ShowAlert("Email already exists. Please choose a different one.");
            else if (status == 1)
            {
                Session["idoriginal"] = id;
                Response.Redirect("~/Patient/PatientHome.aspx", false);
            }
            else
                ShowAlert("Unexpected error occurred. Please try again.");
        }

        //----------------------- Utility Function --------------------------//
        private void ShowAlert(string message)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{message}');", true);
        }
    }
}
