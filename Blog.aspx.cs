using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Blog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private bool isformvalid()
    {
        if (txtEmail.Text == "")
        {
            Response.Write("<script> alert('Email not valid'); </script>");
            txtEmail.Focus();
            return false;
        }
        else
        {
            return true;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write(" <script> alert('Your Newsletter Got Submitted Successfully'); </script>");
        txtEmail.Text = string.Empty;
        CheckBox1.Text = string.Empty;
        CheckBox2.Text = string.Empty;
        CheckBox3.Text = string.Empty;

 
     }
}