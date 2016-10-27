using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;


namespace WDDNProject.PageCommon
{
    public partial class Search : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void imgSearchbooks_Click(object sender, ImageClickEventArgs e)
        {
            DataSet ds = new DataSet();
            if (txtBookname.Text == string.Empty && txtAuthorname.Text == string.Empty && dlCategory.SelectedValue == "-Select-")
            {
                Panel1.Visible = true;
                lblmsg.ForeColor = Color.Green;
                gpanel.Visible = false;
            }
            else
            {
                Panel1.Visible = false;
                gpanel.Visible = true;
                try
                {
                    con = new SqlConnection(str);
                    con.Open();

                    SqlDataAdapter adpAll = new SqlDataAdapter("select Book_Id,Title,Author,Publisher from Book where Title='" + txtBookname.Text + "' and Author='" + txtAuthorname.Text + "' and category_id='" + dlCategory.SelectedValue + "'", con);
                    SqlDataAdapter adpBook = new SqlDataAdapter("select Book_Id,Title,Author,Publisher from Book where Title='" + txtBookname.Text + "' ", con);
                    SqlDataAdapter adpAuthor = new SqlDataAdapter("select Book_Id,Title,Author,Publisher from Book where Author='" + txtAuthorname.Text + "'", con);
                    SqlDataAdapter adpCat = new SqlDataAdapter("select  Book_Id,Title,Author,Publisher from Book where category_Id='" + dlCategory.SelectedValue + "'", con);
                    SqlDataAdapter adpBook_Author = new SqlDataAdapter("select Book_Id,Title,Author,Publisher from Book where Title='" + txtBookname.Text + "' and Author='" + txtAuthorname.Text + "'", con);
                    SqlDataAdapter adpBook_Cat = new SqlDataAdapter("select Book_Id,Title,Author,Publisher from Book where Title='" + txtBookname.Text + "' and category_id='" + dlCategory.SelectedValue + "'", con);
                    SqlDataAdapter adpAuthor_cat = new SqlDataAdapter("select Book_Id,Title,Author,Publisher from Book where Author='" + txtAuthorname.Text + "' and category_id='" + dlCategory.SelectedValue + "'", con);


                    if (txtBookname.Text == string.Empty && txtAuthorname.Text == string.Empty && dlCategory.SelectedValue != "-Select-")
                    {
                        adpCat.Fill(ds, "Book");
                        GridShow.DataSource = ds;
                        GridShow.DataBind();
                    }
                    else if (txtBookname.Text == string.Empty && dlCategory.SelectedValue == "-Select-")
                    {
                        adpAuthor.Fill(ds, "Book");
                        GridShow.DataSource = ds;
                        GridShow.DataBind();
                    }
                    else if (txtAuthorname.Text == string.Empty && dlCategory.SelectedValue == "-Select-")
                    {
                        adpBook.Fill(ds, "Book");
                        GridShow.DataSource = ds;
                        GridShow.DataBind();
                    }
                    else if (txtBookname.Text != string.Empty && txtAuthorname.Text != string.Empty && dlCategory.SelectedValue != "-Select-")
                    {
                        adpAll.Fill(ds, "Book");
                        GridShow.DataSource = ds;
                        GridShow.DataBind();
                    }
                    else if (txtBookname.Text != string.Empty && txtAuthorname.Text != string.Empty && dlCategory.SelectedValue == "-Select-")
                    {
                        adpBook_Author.Fill(ds, "Book");
                        GridShow.DataSource = ds;
                        GridShow.DataBind();
                    }
                    else if (txtBookname.Text != string.Empty && txtAuthorname.Text == string.Empty && dlCategory.SelectedValue != "-Select-")
                    {
                        adpBook_Cat.Fill(ds, "Book");
                        GridShow.DataSource = ds;
                        GridShow.DataBind();
                    }
                    else if (txtBookname.Text == string.Empty && txtAuthorname.Text != string.Empty && dlCategory.SelectedValue != "-Select-")
                    {
                        adpAuthor_cat.Fill(ds, "Book");
                        GridShow.DataSource = ds;
                        GridShow.DataBind();
                    }



                    con.Close();
                }
                catch (Exception exp)
                {

                }
            }
        }
    }
}