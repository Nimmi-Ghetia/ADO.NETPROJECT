using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Net.Mail;
public partial class PageUser_UserReturnBook : System.Web.UI.Page
{
    string str = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnNotify_Click(object sender, EventArgs e)
    {
        try
        {
            string name = Session["uid"]+"" ;
            SqlConnection con = new SqlConnection(str);
            SqlDataAdapter adpSelect = new SqlDataAdapter("IF EXISTS (select Book_Id,User_Id,issue_date,return_date from Book_Issue where User_Id='" + name + "' and return_date is null) BEGIN  (select User_Id,Book_Id,issue_date,return_date from Book_Issue where User_Id='" + name + "' and return_date is null)END", con);
            DataSet dsSelect = new DataSet();
            adpSelect.Fill(dsSelect, "Book_Issue");
            gvRetBook.DataSource = dsSelect;
            gvRetBook.DataBind();
           
            
            lblMsg3.Text = "The issued book will be recieved by library within 3 working days";
            lblMsg3.Visible = true;
            string BookName = dsSelect.Tables[0].Rows[0]["Book_Id"].ToString();
            string Return_date = dsSelect.Tables[0].Rows[0]["return_date"].ToString();
            lbl.Text="Please, Return the book you have issued. You are required to pay the fine of RS. 20 per day from the return date.The details of book you have issued : ";
            lbl.Visible = true;
            lblBook.Text = BookName;
            lblBook.Visible = true;
            lblReturnDate.Text = Return_date;
            lblReturnDate.Visible = true;



        }
        catch
        {
            lblMsg1.Text = "You Have Not Issued Any Book";
            lblMsg1.Visible = true;
        }
    }
  

}