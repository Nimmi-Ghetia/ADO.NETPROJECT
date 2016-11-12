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
using System.Data;
using Obout.Grid;

namespace WDDNProject.PageAdmin
{
    public partial class StoreEbook : System.Web.UI.Page
    {
        string str1 = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            UpdatePanel1.Visible = false;
            UpdatePanel2.Visible = false;
            UpdatePanel3.Visible = false;
            TextBox1.Enabled = true;
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
                cmd.Parameters.AddWithValue("@6", "eb");
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

        protected void btnSubmit1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(str1);
                con.Open();
                SqlCommand cmd1 = new SqlCommand("select * from Book join Category where Book_Id=@1 and Book_Type='eb'", con);
                cmd1.Parameters.AddWithValue("@1", TextBox1.Text);
                SqlDataReader rd = cmd1.ExecuteReader();
                while (rd.Read())
                {
                 //   TextBox1.Enabled = false;
                      TextBox2.Text = rd["Title"]+"";
                      TextBox3.Text = rd["Author"] + "";
                      TextBox4.Text = rd["Publisher"] + "";
                      ddlCat.SelectedIndex = Int32.Parse(rd["category_id"]+"");
                      TextBox5.Text = rd["Link"] + "";

                }
                SqlCommand cmd = new SqlCommand("insert into Book (Title,Author,Publisher,category_id,Link) values (@2,@3,@4,@5,@6) ", con);
                cmd.Parameters.AddWithValue("@2", TextBox2.Text);
                cmd.Parameters.AddWithValue("@3", TextBox3.Text);
                cmd.Parameters.AddWithValue("@4", TextBox4.Text);
                cmd.Parameters.AddWithValue("@5", ddlCat.SelectedIndex);
                cmd.Parameters.AddWithValue("@6", TextBox5.Text);
                int i = cmd.ExecuteNonQuery();
                if(i>0)
                {
                    Label10.Text = "Values updated successfully";

                }
                else
                {
                    Label10.Text = "Updation failed";
                }
            }catch(Exception ex)
            {

            }
            }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(str1);
                con.Open();
                SqlCommand cmd1 = new SqlCommand("select * from Book join Category where Book_Id=@1 and Book_Type='eb'", con);
                cmd1.Parameters.AddWithValue("@1", TextBox1.Text);
                SqlDataReader rd = cmd1.ExecuteReader();
                TextBox1.Enabled = false;
                int c = 0;
                while (rd.Read())
                {
                    c++;             
                }
                if(c>0)
                {
                    dupisbn.Text = "";
                }
            }
            catch (Exception ex)
            {
                dupisbn.Text = ex.Message;
            }


        }

        protected void bview_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            UpdatePanel1.Visible = false;
            UpdatePanel2.Visible = false;
            UpdatePanel3.Visible = false;
            string str = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            try
            {
               SqlConnection con = new SqlConnection(str);
                con.Open();

                SqlDataAdapter adpAll = new SqlDataAdapter("select Book_Id,Title,Author,Publisher from Book where Book_Type='eb'", con);
                adpAll.Fill(ds, "Book");
                GridShow.DataSource = ds;
                GridShow.DataBind();
                gpanel.Visible = true;
                con.Close();
            }
            catch (Exception exp)
            {

            }

        }

        protected void badd_Click(object sender, EventArgs e)
        {
            UpdatePanel1.Visible = true;
            UpdatePanel2.Visible = false;
            UpdatePanel3.Visible = false;
            gpanel.Visible = false;
        }

        protected void bupd_Click(object sender, EventArgs e)
        {
            UpdatePanel1.Visible = false;
            UpdatePanel2.Visible = true;
            UpdatePanel3.Visible = false;
            gpanel.Visible = false;
        }

        protected void bdel_Click(object sender, EventArgs e)
        {
            UpdatePanel1.Visible = false;
            UpdatePanel2.Visible = false;
            UpdatePanel3.Visible = true;
            gpanel.Visible = false;
        }
    }
}