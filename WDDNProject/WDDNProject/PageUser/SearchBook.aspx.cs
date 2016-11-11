using Obout.Grid;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WDDNProject.PageUser
{
    public partial class SearchBook : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList4.Items.Add("Title");
            DropDownList4.Items.Add("Author");
            DropDownList4.Items.Add("Publisher");
            DropDownList4.Items.Add("Category");
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            con.Open();
            String city = DropDownList2.SelectedIndex.ToString();
            Label2.Text += city;
            SqlCommand cmd = new SqlCommand("Select Lib_Id,Name from Library where City='" + city + "'", con);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                Label2.Text += rd[1] + "";
                DropDownList3.Items.Add(rd[1] + "");
            }
            Label2.Text = "in drop2_sic method";
            con.Close();
        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label1.Text = DropDownList4.SelectedItem + "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
               //         SqlConnection con1 = new SqlConnection();
         SqlConnection   con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            con.Open();
            string city = (DropDownList2.SelectedValue+"");
            string lname = DropDownList2.SelectedValue + "";
           
            SqlCommand cmd = new SqlCommand("select Lib_Id from Library where Name=@name and City=@city", con);
            cmd.Parameters.AddWithValue("name", lname);
            cmd.Parameters.AddWithValue("city", city);
            SqlDataReader rd= cmd.ExecuteReader();
            int libid = -1;
            while (rd.Read())
            {
                libid = Int32.Parse(rd[0] + "");
            }
            DataSet ds = new DataSet();
            string key = DropDownList4.SelectedItem + "";
            Label1.Text = key;
            string value = TextBox1.Text;

            SqlDataAdapter sda = new SqlDataAdapter("select * from Book where Lib_Id="+libid+" and "+key+"='"+value+"'", con);
            sda.Fill(ds, "Book");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
}