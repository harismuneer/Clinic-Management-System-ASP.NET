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
    public partial class doctorhome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            myDAL objmyDAL = new myDAL();
            DataTable dt = new DataTable();
            int found;
            int did = (int)Session["idoriginal"];
         
            found = objmyDAL.docinfo_DAL(did, ref dt);


			if (found!=1)
            {
                { Response.Write("<script>alert('There was some error');</script>"); }
            }
            else
            {
                Label1.Text = dt.Rows[0][1].ToString();
                Label2.Text = dt.Rows[0][2].ToString();
                Label3.Text = dt.Rows[0][3].ToString();
                Label4.Text = dt.Rows[0][4].ToString();
                Label5.Text = dt.Rows[0][5].ToString();
                Label6.Text = dt.Rows[0][6].ToString();
                Label7.Text = dt.Rows[0][7].ToString();
                Label8.Text = dt.Rows[0][8].ToString();
                Label9.Text = dt.Rows[0][9].ToString();
                Label10.Text = dt.Rows[0][10].ToString();
                Label11.Text = dt.Rows[0][11].ToString();
                Label12.Text = dt.Rows[0][12].ToString();
                Label13.Text = dt.Rows[0][13].ToString();
                Label14.Text = dt.Rows[0][14].ToString();

            }
        }
    }
}