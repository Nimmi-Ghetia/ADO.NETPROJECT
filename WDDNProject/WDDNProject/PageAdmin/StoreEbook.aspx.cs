using iTextSharp.text;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
namespace WDDNProject.PageAdmin
{
    public partial class StoreEbook : System.Web.UI.Page
    {
        string str1 = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(str1);
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Book (Book_Id,Title,Author,Publisher,category_id,Book_Type,Link) values (@1,@2,@3,@4,@5,@6,@7) ", con);
                
                cmd.Parameters.AddWithValue("@1", txtIsbn.Text);
                cmd.Parameters.AddWithValue("@2", txtbk_name.Text);
                cmd.Parameters.AddWithValue("@3", txtAuth_name.Text);
                cmd.Parameters.AddWithValue("@4", txtPublisher.Text);
                cmd.Parameters.AddWithValue("@5", ddlCat.SelectedValue);
                cmd.Parameters.AddWithValue("@6", "rb");
                cmd.Parameters.AddWithValue("@7", txtLink.Text);

                int i = cmd.ExecuteNonQuery();
                if (i >= 1)
                {
                    txtLink.Text = "";
                    txtIsbn.Text = "";
                    txtbk_name.Text = "";
                    txtAuth_name.Text = "";
                    txtPublisher.Text = "";
                    ddlCat.SelectedIndex = 0;
                    storeMsg.Text = "Data Stored Successfully.";
                    storeMsg.ForeColor = System.Drawing.Color.Green;
                }
                con.Close();
            }
            catch (Exception exp)
            {
                storeMsg.Text = exp.Message;
            }

        }
    }
}