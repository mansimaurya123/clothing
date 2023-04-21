using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void txtsignup_Click(object sender, EventArgs e)
    {

        if(isformvalid())
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager .ConnectionStrings["ClothingDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into tblUsers(Name,Username,Email,Password,Usertype) values('" + txtName.Text + "' , '" + txtUname.Text + "' , '" + txtEmail.Text + "' , '" + txtPass.Text + "' ,'User')", con);
                cmd.ExecuteNonQuery();
                Response.Write(" <script> alert('Registration Successfully done'); </script>");
                clr();
                con.Close();
                lblMsg.Text = "Registration Successfully done";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }
        else
        {
            Response.Write("<script> alert('Registration Failed'); </script>");
            lblMsg.Text = "All fields are mandatory";
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
        Response.Redirect("~/Login.aspx");
    }

    private bool isformvalid()
    {
        if(txtUname.Text =="")
        {
            Response.Write("<script> alert('Username not valid'); </script>");
            txtUname.Focus();
            return false;
        }

        else if (txtPass.Text == "")
        {
            Response.Write("<script> alert('Password not valid'); </script>");
            txtPass.Focus();
            return false;
        }
        else if (txtPass.Text != txtCPass.Text)
        {
            Response.Write("<script> alert('Confirm Password not valid'); </script>");
            txtCPass.Focus();
            return false;
        }
        if (txtEmail.Text == "")
        {
            Response.Write("<script> alert('Email not valid'); </script>");
            txtEmail.Focus();
            return false;
        }
        if (txtName.Text == "")
        {
            Response.Write("<script> alert('Name not valid'); </script>");
            txtName.Focus();
            return false;
        }

        return true;
    }

    private void clr()
    {
        txtName.Text = String.Empty;
        txtPass.Text = String.Empty;
        txtUname.Text = String.Empty;
        txtEmail.Text = String.Empty;
        txtCPass.Text = String.Empty;
    }
}