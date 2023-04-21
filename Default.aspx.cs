using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCartNumber();
        if (Session["Username"] != null)
        {

            // lblSuccess.Text = "Login Successful,Welcome" + Session["Username"].ToString();
            btnSignUp.Visible = false;
            btnLogIn.Visible = false;
            btnLogout.Visible = true;
        }
        else
        {
            btnSignUp.Visible = true;
            btnLogIn.Visible = true;
            btnLogout.Visible = false;
           // Response.Redirect("~/Default.aspx");
        }
    }


    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["Username"] = null;
        Response.Redirect("~/Default.aspx");
    }

    public void BindCartNumber()
    {
        if (Request.Cookies["CartPID"] != null)
        {
            string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
            string[] ProductArray = CookiePID.Split(',');
            int ProductCount = ProductArray.Length;
            pCount.InnerText = ProductCount.ToString();
        }
        else
        {
            pCount.InnerText = 0.ToString();
        }
    }

}