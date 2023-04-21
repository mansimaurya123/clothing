using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cart : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["ClothingDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindProductCart();
        }
    }

    private void BindProductCart()
    {
        if (Request.Cookies["CartPID"] != null)
        {

            DataTable dt = new DataTable();
            string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
            string[] CookieDataArray = CookieData.Split(',');

            Int64 CartTotal = 0;
            Int64 Total = 0;

            if (CookieDataArray.Length > 0)
            {
                h4Noitems.InnerText = "My Cart (" + CookieDataArray.Length + "  items)";

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


            }

            rptrCartProducts.DataSource = dt;
            rptrCartProducts.DataBind();

            spanCartTotal.InnerText = CartTotal.ToString();
            spanTotal.InnerText = "₹. " + Total.ToString();
            //spanDiscount = (CartTotal - Total);
            //decimal cartTotal = decimal.Parse(spanCartTotal.InnerText);
            //decimal total = decimal.Parse(spanTotal.InnerText);
            //decimal discount = cartTotal - total;
            spanDiscount.InnerText = " - " + (CartTotal - Total).ToString();


        }
        else
        {
            h4Noitems.InnerText = "Your Shopping Cart is Empty";
        }
    }




    protected void btnRemoveCart_Click(object sender, EventArgs e)
    {
        string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];

        Button btn = (Button)(sender);
        string PIDSIZE = btn.CommandArgument;
        List<String> CookiePIDList = CookiePID.Split(',').Select(i => i.Trim()).Where(i => i != string.Empty).ToList();
        CookiePIDList.Remove(PIDSIZE);
        string CookiePIDUpdated = String.Join(",", CookiePIDList.ToArray());
        if (CookiePIDUpdated == "")
        {
            HttpCookie CartProducts = Request.Cookies["CartPID"];
            CartProducts.Values["CartPID"] = null;
            CartProducts.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(CartProducts);

        }
        else
        {
            HttpCookie CartProducts = Request.Cookies["CartPID"];
            CartProducts.Values["CartPID"] = CookiePIDUpdated;
            CartProducts.Expires = DateTime.Now.AddDays(30);
            Response.Cookies.Add(CartProducts);

        }
        Response.Redirect("~/Cart.aspx");
    }


    protected void btnBuyNow_Click(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            Response.Redirect("Payment.aspx");

        }
        else
        {
            Response.Redirect("~/Login.aspx?rurl=cart");
        }
    }
}






