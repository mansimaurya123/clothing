using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class MenEthnicWear : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["ClothingDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] != null)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["BuyNow"] == "YES")
                {

                }
                BindProductRepeater();
                BindCartNumber();

            }
        }
        else
        {

            if (Request.QueryString["BuyNow"] == "YES")
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }


    private void BindProductRepeater()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("[procBindMenEthnicWear]", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrProducts.DataSource = dt;
                    rptrProducts.DataBind();
                    if (dt.Rows.Count <= 0)
                    {
                        // Label1.Text = "Sorry! Currently no products in this category.";
                    }
                    else
                    {
                        //Label1.Text = "Showing All Products";
                    }
                }
            }
        }
    }

    protected override void InitializeCulture()
    {
        CultureInfo ci = new CultureInfo("en-IN");
        ci.NumberFormat.CurrencySymbol = "₹";
        Thread.CurrentThread.CurrentCulture = ci;

        base.InitializeCulture();
    }
    public void BindCartNumber()
    {
        if (Session["USERID"] != null)
        {
            string UserIDD = Session["USERID"].ToString();
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SP_BindCartNumberz", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@UserID", UserIDD);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        string CartQuantity = dt.Compute("Sum(Qty)", "").ToString();
                        //CartBadge.InnerText = CartQuantity;
                    }
                    else
                    {
                        // _ = CartBadge.InnerText == 0.ToString();
                        //CartBadge.InnerText = "0";
                    }
                }
            }
        }
    }

    private void SearchProductByTextbox()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("procBindAllProductsMasShirtFilter", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TXT", txtFilterGrid1Record.Text);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrProducts.DataSource = dt;
                    rptrProducts.DataBind();
                    if (dt.Rows.Count <= 0)
                    {
                        // Label1.Text = "Sorry! Currently no products in this category.";
                    }
                    else
                    {
                        //Label1.Text = "Showing All Products";
                    }
                }
            }
        }
    }
    protected void txtFilterGrid1Record_TextChanged(object sender, EventArgs e)
    {
        if (txtFilterGrid1Record.Text != string.Empty)
        {
            // SearchProductByTextbox();
        }

        SqlConnection con = new SqlConnection(CS);
        con.Open();
        string qr = "SELECT A.*,B.*,C.Name, A.PPrice - A.PSellPrice AS DiscAmount,B.Name AS ImageName,  C.Name AS BrandName FROM tblProducts A INNER JOIN tblBrands C ON C.BrandID = A.PBrandID INNER JOIN tblCategory AS t2 ON t2.CatID = A.PCatID INNER JOIN tblSubCategory AS t3 ON t3.SubCatID = A.PSubCatID CROSS APPLY (SELECT TOP 1 *  FROM tblProductImages B WHERE B.PID = A.PID   ORDER BY B.PID DESC) B WHERE t2.CatName = 'Men' AND t3.SubCatName = 'Ethnic Wear' AND A.PName like '" + txtFilterGrid1Record.Text + "%' order by A.PID desc ";
        SqlDataAdapter da = new SqlDataAdapter(qr, con);
        string text = ((TextBox)sender).Text;
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            rptrProducts.DataSource = ds.Tables[0];
            rptrProducts.DataBind();
        }
        else
        {

        }








    }
}