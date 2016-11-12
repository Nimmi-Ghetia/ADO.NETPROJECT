using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WDDNProject.PageAdmin
{
    public partial class UpdateEbook : System.Web.UI.Page
    {
        string str1 = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(str1);
                con.Open();
                SqlCommand cmd1 = new SqlCommand("select * from Book join Category on  Book.category_id=Category.Category_Id where Book.Title=@1 and Book.Book_Type='eb'", con);
                cmd1.Parameters.AddWithValue("@1", TextBox2.Text);
                SqlDataReader rd = cmd1.ExecuteReader();
                TextBox1.Enabled = false;
                int c = 0;
                Label10.Text = "Values updated successfully11";

                while (rd.Read())
                {
                    c++;
                    TextBox1.Text = rd["Book_Id"] + "";
                    TextBox1.Enabled = false;
                    TextBox3.Text = rd["Author"] + "";
                    TextBox4.Text = rd["Publisher"] + "";
                    DropDownList1.SelectedIndex = Int32.Parse(rd["category_id"] + "");
                    TextBox5.Text = rd["Link"] + "";
                    Label10.Text = "Values updated successfully22";

                }
                if (c <= 0)
                {
                    dupisbn.Text = "No such book to update.";
                    Label10.Text = "Values updated successfully33";

                }
            }
            catch (Exception ex)
            {
                dupisbn.Text = ex.Message;
            }

        }

        protected void btnSubmit1_Click(object sender, EventArgs e)
        {
            try {
                if (TextBox2.Text != null)
                {
                    SqlConnection con = new SqlConnection(str1);
                    con.Open();
                    SqlCommand cmd1 = new SqlCommand("select * from Book join Category on Book.category_id=Category.Category_Id where Title=@1 and Book_Type='eb'", con);
                    cmd1.Parameters.AddWithValue("@1", TextBox2.Text);
                    SqlDataReader rd = cmd1.ExecuteReader();
                    Label10.Text = "Values updated successfully55";
                    while (rd.Read())
                    {
                        //   TextBox1.Enabled = false;
                        TextBox1.Text = rd["Book_Id"] + "";
                        TextBox1.Enabled = false;
                        TextBox3.Text = rd["Author"] + "";
                        TextBox4.Text = rd["Publisher"] + "";
                        DropDownList1.SelectedIndex = Int32.Parse(rd["category_id"] + "");
                        TextBox5.Text = rd["Link"] + "";
                        Label10.Text = "Values updated successfully66<br/>";
                        Label10.Text += TextBox1.Text;

                    }
                    SqlCommand cmd = new SqlCommand("insert into Book (Author,Publisher,category_id,Link) values (@3,@4,@5,@6) ", con);
                    //cmd.Parameters.AddWithValue("@2", TextBox2.Text);
                    Label10.Text = "Values updated successfully";
                    cmd.Parameters.AddWithValue("@3", TextBox3.Text);
                    cmd.Parameters.AddWithValue("@4", TextBox4.Text);
                    cmd.Parameters.AddWithValue("@5", DropDownList1.SelectedIndex);
                    cmd.Parameters.AddWithValue("@6", TextBox5.Text);
                    int i = cmd.ExecuteNonQuery();
                    Label10.Text = "Values updated successfully77";

                    if (i > 0)
                    {
                        Label10.Text = "Values updated successfully";

                    }
                    else
                    {
                        Label10.Text = "Updation failed";
                    }
                }
            }catch (Exception ex)
            {

            }
        
    }
    }
}