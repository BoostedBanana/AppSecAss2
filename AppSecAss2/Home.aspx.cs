using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppSecAss2
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedIn"] != null)
            {
                lblMessage.Text = "Congratulations!, you are logged in.";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                btnLogout.Visible = true;
            }
            else
            {
                Response.Redirect("Login.aspx", false);
            }
        }

        protected void btnRegistration_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
        protected void LogoutMe(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();
        }
    }
}