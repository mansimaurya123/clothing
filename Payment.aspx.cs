using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Activities.Expressions;
using System.Drawing;


public partial class Payment : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["ClothingDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        BindPriceData();
    }


    public void BindPriceData()
    {
        if (Request.Cookies["CartPID"] != null)
        {
            string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
            string[] CookieDataArray = CookieData.Split(',');
            if (CookieDataArray.Length > 0)
            {
                DataTable dt = new DataTable();
                Int64 CartTotal = 0;
                Int64 Total = 0;
                 for (int i = 0; i < CookieDataArray.Length; i++)
                 {
                      string PID = CookieDataArray[i].ToString().Split('-')[0];
                      string SizeID = CookieDataArray[i].ToString().Split('-')[0];
                      using (SqlConnection con = new SqlConnection(CS))
                       {
                          using (SqlCommand cmd = new SqlCommand("select A.*,dbo.getSizeName(" + SizeID + ") AS SizeNamee,"
                                + SizeID + " AS SizeIDD, SizeData.Name, SizeData.Extension from tblProducts A cross apply(select " +
                                "top 1 B.Name,B.Extension from tblProductImages B where B.PID=A.PID) SizeData where A.PID='" + PID + "'", con))
                            {
                                cmd.CommandType = CommandType.Text;
                                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                                {
                                    sda.Fill(dt);
                                }

                            }
                        }
                        CartTotal += Convert.ToInt64(dt.Rows[i]["PPrice"]);
                    Total += Convert.ToInt64(dt.Rows[i]["PSellPrice"]);
                }
                divPriceDetails.Visible = true;

                spanCartTotal.InnerText = CartTotal.ToString();
                spanTotal.InnerText = "₹. " + Total.ToString();
                spanDiscount.InnerText = " " + (CartTotal - Total).ToString();

                hdCartAmount.Value = CartTotal.ToString();
                hdCartDiscount.Value = (CartTotal - Total).ToString();
                hdTotalPayed.Value = Total.ToString();
            }
            else
            {
                //TODO Show Empty Cart
                Response.Redirect("~/Products.aspx");
            }
        }
        else
        {
            //TODO Show Empty Cart
            Response.Redirect("~/Products.aspx");
        }
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Success.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Success.aspx");
    }
}