using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Net;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnResetPass_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ClothingDB"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblUsers where Email=@email", con);
            cmd.Parameters.AddWithValue("@email", txtEmailId.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {

                String myGUID = Guid.NewGuid().ToString();
                int Uid = Convert.ToInt32(dt.Rows[0][0]);
                SqlCommand cmd1 = new SqlCommand("Insert into tblForgotPass (Id,Uid,RequestDateTime) values ('" + myGUID + "','" + Uid + "',GETDATE())", con);
                cmd1.ExecuteNonQuery();

                //send reset link via mail
                String ToEmailAddress = dt.Rows[0][3].ToString();
                String Username = dt.Rows[0][1].ToString();
                String EmailBody ="Hi, "+Username + ",<br/><br/>Click the link below to reset your password<br/> <br/> http://localhost:50591/RecoverPassword.aspx?Uid=" +myGUID ;

                MailMessage PassRecMail = new MailMessage("mansimaurya2003@gmail.com",ToEmailAddress); 
                PassRecMail.Body = EmailBody;
                PassRecMail.IsBodyHtml = true;
                PassRecMail.Subject = "Reset Password";

                using (SmtpClient client = new SmtpClient())
                {
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new NetworkCredential("mansimaurya2003@gmail.com", "etcqtvkjgxhyckbt");
                    client.Host = "smtp.gmail.com";
                    client.Port = 587;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.Send(PassRecMail);

                }
                


                lblResetPassMsg.Text = "Reset Link Sent ! Check Your Email For Reset Password";
                lblResetPassMsg.ForeColor = System.Drawing.Color.Green;
                txtEmailId.Text = string.Empty;
            }
            else
            {
                lblResetPassMsg.Text = "Oops! This Email Does Not Exist...Try Again " ;
                lblResetPassMsg.ForeColor = System.Drawing.Color.Red;
                txtEmailId.Text = string.Empty;
                txtEmailId.Focus();
            }


        }
    }
}
