using System;
using System.Data;
using System.Web.UI;
using DBProject.DAL;

namespace doctor
{
    public partial class bill : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    int did = (int)Session["idoriginal"];
                    myDAL objmyDAL = new myDAL();
                    DataTable dt = new DataTable();
                    int found = objmyDAL.generate_bill_DAL(did, ref dt);

                    if (found != 1 || dt.Rows.Count == 0)
                    {
                        Label1.Text = "Error generating bill";
                        Response.Write("<script>alert('There was some error generating the bill.');</script>");
                    }
                    else
                    {
                        Label1.Text = dt.Rows[0][0].ToString();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                }
            }
        }

        public void bill_paid(object sender, EventArgs e)
        {
            try
            {
                int did = (int)Session["idoriginal"];
                int appoint = (int)Session["appointid"];

                myDAL objmyDAL = new myDAL();
                objmyDAL.paid_bill_DAL(did, appoint);

                Response.BufferOutput = false;
                Response.Redirect("patienthistory.aspx");
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        public void bill_Unpaid(object sender, EventArgs e)
        {
            try
            {
                int did = (int)Session["idoriginal"];
                int appoint = (int)Session["appointid"];

                myDAL objmyDAL = new myDAL();
                objmyDAL.Unpaid_bill_DAL(did, appoint);

                Response.BufferOutput = false;
                Response.Redirect("patienthistory.aspx");
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }
    }
}
