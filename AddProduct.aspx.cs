using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class AddProduct : System.Web.UI.Page
{
    public static String CS = ConfigurationManager.ConnectionStrings["ClothingDB"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //when page first time run then this code will execute
            BindBrand();
            BindCategory();
            BindSubCategory();
            BindGender();
            ddlSubCategory.Enabled = false;
            ddlGender.Enabled = false;

            BindGridview1();

        }
    }

    

    private void BindGender()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from tblGender with(nolock)", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlGender.DataSource = dt;
                ddlGender.DataTextField = "GenderName";
                ddlGender.DataValueField = "GenderID";
                ddlGender.DataBind();
                ddlGender.Items.Insert(0, new ListItem("-Select-", "0"));

            }
        }
    }

    private void BindSubCategory()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from tblSubCategory", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlSubCategory.DataSource = dt;
                ddlSubCategory.DataTextField = "SubCatName";
                ddlSubCategory.DataValueField = "SubCatID";
                ddlSubCategory.DataValueField = "MainCatID";
                ddlSubCategory.DataBind();
                ddlSubCategory.Items.Insert(0, new ListItem("-Select-", "0"));

            }
        }
    }
    private void BindCategory()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from tblCategory", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlCategory.DataSource = dt;
                ddlCategory.DataTextField = "CatName";
                ddlCategory.DataValueField = "CatID";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));

            }
        }
    }

    

    private void BindBrand()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from tblBrands", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlBrand.DataSource = dt;
                ddlBrand.DataTextField = "Name";
                ddlBrand.DataValueField = "BrandID";
                ddlBrand.DataBind();
                ddlBrand.Items.Insert(0, new ListItem("-Select-", "0"));

            }
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("sp_InsertProduct", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PName", txtProductName.Text);
            cmd.Parameters.AddWithValue("@PPrice", txtPrice.Text);
            cmd.Parameters.AddWithValue("@PSellPrice", txtSellPrice.Text);
            cmd.Parameters.AddWithValue("@PBrandID", ddlBrand.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PCatID", ddlCategory.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PSubCatID", ddlSubCategory.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PGenderID", ddlGender.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@PDescription", txtDescription.Text);
            cmd.Parameters.AddWithValue("@PProductDetails", txtPDetail.Text);
            if (chFD.Checked == true)
            {
                cmd.Parameters.AddWithValue("@FreeDelivery", 1.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@FreeDelivery", 0.ToString());
            }

            if (ch7Ret.Checked == true)
            {
                cmd.Parameters.AddWithValue("@7DayRet", 1.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@7DayRet", 0.ToString());
            }
            if (cbCOD.Checked == true)
            {
                cmd.Parameters.AddWithValue("@COD", 1.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@COD", 0.ToString());
            }
            if (con.State == ConnectionState.Closed) { con.Open(); }
            Int64 PID = Convert.ToInt64(cmd.ExecuteScalar ());


            //Insert size quantity
            for (int i = 0; i < cblSize.Items.Count; i++)
            {
                if (cblSize.Items[i].Selected == true)
                {
                    
                    Int64 SizeID = Convert.ToInt64(cblSize.Items[i].Value);
                    int Quantity = Convert.ToInt32(txtQuantity.Text);

                    SqlCommand cmd2 = new SqlCommand("insert into tblProductSizeQuantity(PID,SizeID,Quantity) values('" + PID + "','" + SizeID + "','" + Quantity + "')", con);                
                    cmd2.ExecuteNonQuery(); 
                }
            }
            //Insert and upload images
            if (fuImg01.HasFile)
            {
                string SavePath = Server.MapPath("~/img/ProjectImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);

                }
                string Extension = Path.GetExtension(fuImg01.PostedFile.FileName);
                fuImg01.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "01" + Extension);

                SqlCommand cmd3 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "01" + "','" + Extension + "')", con);
                cmd3.ExecuteNonQuery();            
            }
            //2ND IMAGE UPLOAD
            if (fuImg02.HasFile)
            {
                string SavePath = Server.MapPath("~/img/ProjectImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);

                }
                string Extension = Path.GetExtension(fuImg02.PostedFile.FileName);
                fuImg02.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "02" + Extension);

                SqlCommand cmd4 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "02" + "','" + Extension + "')", con);
                cmd4.ExecuteNonQuery();
            }
            //3RD IMAGE UPLOAD
            if (fuImg03.HasFile)
            {
                string SavePath = Server.MapPath("~/img/ProjectImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);

                }
                string Extension = Path.GetExtension(fuImg03.PostedFile.FileName);
                fuImg03.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "03" + Extension);

                SqlCommand cmd5 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "03" + "','" + Extension + "')", con);
                cmd5.ExecuteNonQuery();
            }
            //4TH IMAGE UPLOAD
            if (fuImg04.HasFile)
            {
                string SavePath = Server.MapPath("~/img/ProjectImages/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);

                }
                string Extension = Path.GetExtension(fuImg04.PostedFile.FileName);
                fuImg04.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "04" + Extension);

                SqlCommand cmd6 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "04" + "','" + Extension + "')", con);
                cmd6.ExecuteNonQuery();

                Response.Write(" <script> alert('Product Added Successfully...'); </script>");
                
            }

        }

    }


    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSubCategory.Enabled = true;
        int MainCategoryID = Convert.ToInt32(ddlCategory.SelectedItem.Value);

        using (SqlConnection con = new SqlConnection(CS))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from tblSubCategory where MainCatID='" + ddlCategory.SelectedItem.Value + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                ddlSubCategory.DataSource = dt;
                ddlSubCategory.DataTextField = "SubCatName";
                ddlSubCategory.DataValueField = "SubCatID";
                ddlSubCategory.DataBind();
                ddlSubCategory.Items.Insert(0, new ListItem("-Select-", "0"));

            }
        }
    }

    protected void ddlGender_SelectedIndexChanged(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            if (con.State == ConnectionState.Closed) { con.Open(); }
            string qr = "Select * from tblSize where BrandID=@BrandID AND CatID=@CatID AND SubCatID=@SubCatID AND GenderID=@GenderID ";
            // qr = "Select * from tblSizes where BrandID='" + ddlBrand.SelectedValue + "' and CategoryID='" + ddlCategory.SelectedValue + "' and SubCatID='" + ddlSubCategory.SelectedValue + "' and GenderID='" + ddlGender.SelectedValue + "'";
            SqlCommand cmd = new SqlCommand(qr, con);
            cmd.Parameters.AddWithValue("@BrandID", ddlBrand.SelectedValue);
            cmd.Parameters.AddWithValue("@CatID", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@SubCatID", ddlSubCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@GenderID", ddlGender.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count != 0)
            {
                cblSize.DataSource = dt;
                cblSize.DataTextField = "SizeName";
                cblSize.DataValueField = "SizeID";
                cblSize.DataBind();

            }
        }
    }

    protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSubCategory.SelectedIndex != 0)
        {
            ddlGender.Enabled = true;
        }
        else
        {
            ddlGender.Enabled = false;
        }
    }

    private void BindGridview1()
    {
        SqlConnection con = new SqlConnection(CS);
        SqlCommand cmd = new SqlCommand("SELECT DISTINCT t1.PID, t1.PName,t1.PPrice, t1.PSellPrice, t2.Name AS" +  " Brand,t3.CatName, t4.SubCatName,  t5.GenderName AS Gender, t6.SizeName, t8.Quantity, ( SELECT TOP 1 " + "   Name + '.' + Extension  FROM  tblProductImages  WHERE   PID = t1.PID  ) AS ProductImage" + " FROM    tblProducts AS t1   INNER JOIN tblBrands AS t2 ON t2.BrandID = t1.PBrandID INNER JOIN " +  "tblCategory AS t3 ON t3.CatID = t1.PCatID  INNER JOIN tblSubCategory AS t4 ON " +  "t4.SubCatID = t1.PSubCatID" + "   INNER JOIN tblGender AS t5 ON t5.GenderID = t1.PGenderID   " + "INNER JOIN tblSize AS t6 ON " + "t6.SubCatID = t1.PSubCatID   INNER JOIN tblProductSizeQuantity AS" + " t8 ON t8.PID = t1.PID ORDER BY  " + " t1.PName;", con) ;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
            }
            else
            {
            GridView1.DataSource = null;
            GridView1.DataBind();
            }


    }

    private void clr()
    {
        txtProductName.Text = String.Empty;
        txtPrice.Text = String.Empty;
        txtSellPrice.Text = String.Empty;
        ddlBrand.SelectedItem.Value = String.Empty;
        ddlCategory.SelectedItem.Value = String.Empty;
        ddlSubCategory.SelectedItem.Value = String.Empty;
        ddlGender.SelectedItem.Value = String.Empty;
        txtDescription.Text = String.Empty;
        txtPDetail.Text = String.Empty;
        chFD.Text = String.Empty;
        ch7Ret.Text = String.Empty;
        cbCOD.Text = String.Empty;
    }
}





















