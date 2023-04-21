using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class AddGender : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGenderRepeater();
    }

    private void BindGenderRepeater()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ClothingDB"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("select * from tblGender", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrGender.DataSource = dt;
                    rptrGender.DataBind();
                }

            }
        }
    }

    protected void btnAddGender_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ClothingDB"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into tblGender(GenderName) values('" + txtGender.Text + "')", con);
            cmd.ExecuteNonQuery();

            Response.Write(" <script> alert('Gender Added Successfully'); </script>");
            txtGender.Text = string.Empty;
            con.Close();
            txtGender.Focus();
        }
        BindGenderRepeater();
    }
}