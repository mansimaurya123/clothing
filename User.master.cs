using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCartNumber();
        if (Session["Username"] != null)
        {

            // lblSuccess.Text = "Login Successful,Welcome" + Session["Username"].ToString();
            btnLogout.Visible = true;
            btnLogin.Visible = false;
        }
        else
        {
            btnLogout.Visible = false;
            btnLogin.Visible = true;
            Response.Redirect("~/Default.aspx");
        }
    }

    

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
        Session["Username"] = null;
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
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
