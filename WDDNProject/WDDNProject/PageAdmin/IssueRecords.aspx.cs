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
public partial class PageAdmin_IssueRecords : System.Web.UI.Page
{
    SqlConnection con;
    DataSet ds = new DataSet();
    string str = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    string usr_name, Bk_name, selectedBook;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            GetData();
        }
        
    }
    public void GetData()
    {
        con = new SqlConnection(str);
        con.Open();
        SqlDataAdapter daIssue = new SqlDataAdapter("select * from Book_Request", con);
        ds.Clear();
        daIssue.Fill(ds);
        gdIssue.DataSource = ds;
        gdIssue.DataBind();
        con.Close();
    }
    protected void gdIssue_SelectedIndexChanged(object sender, EventArgs e)
    {
        con = new SqlConnection(str);
        con.Open();
        DateTime today = DateTime.Now;
        string mailDate = today.AddDays(20).ToShortDateString();
        selectedBook = gdIssue.SelectedRow.Cells[1].Text;
        usr_name = gdIssue.SelectedRow.Cells[2].Text;
        string req_rtrn_date = gdIssue.SelectedRow.Cells[5].Text;
        string idate=DateTime.Now.ToShortDateString();
        SqlDataAdapter daBkIssue = new SqlDataAdapter("select * from Book where Book_Id='"+selectedBook+"'",con);
        DataSet dsselect = new DataSet();
        daBkIssue.Fill(dsselect, "Book");
        string bk_ID =selectedBook;
        Bk_name = dsselect.Tables[0].Rows[0]["Title"].ToString();
        string bk_cat = dsselect.Tables[0].Rows[0]["category_id"].ToString();
        gdIssue.SelectedRow.Visible = false;
        /////// issueing book to user 

        
        SqlCommand insrtInssue = new SqlCommand("insert into Book_Issue(Lib_Id,User_Id,Book_Id,issue_date,return_date,due_date) values (@1,@2,@3,@4,@5,@6)", con);
        insrtInssue.Parameters.AddWithValue("@1", 1);
        insrtInssue.Parameters.AddWithValue("@2",usr_name);
        insrtInssue.Parameters.AddWithValue("@3",bk_ID);
        //insrtInssue.Parameters.AddWithValue("@4",Bk_name);
        //insrtInssue.Parameters.AddWithValue("@5",bk_cat);
        insrtInssue.Parameters.AddWithValue("@4",idate);
        insrtInssue.Parameters.AddWithValue("@5",req_rtrn_date);
        insrtInssue.Parameters.AddWithValue("@6",mailDate);
        int sucees=insrtInssue.ExecuteNonQuery();
        
        if (sucees >= 1)
        {
            lblMsg.Text = "Book has been issued to the user.";
            lblMsg.Visible = true;
            lblMsg.ForeColor = Color.Green;

        }
        else
        {
            lblMsg.Text = "Book has not been issued to the user.";
            lblMsg.Visible = true;
            lblMsg.ForeColor = Color.Red;
        }

        ///// updating info of issued book
        SqlCommand cmdInfoUpdate = new SqlCommand("update Book set Status='Issued' where Book_Id='"+bk_ID+"'", con);
        cmdInfoUpdate.ExecuteNonQuery();

        /////// deleting request of issued book
        SqlCommand cmdDelreq = new SqlCommand("delete Book_Request where Book_Id='"+bk_ID+"'", con);
        cmdDelreq.ExecuteNonQuery();
        con.Close();
    }


    protected void gdIssue_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdIssue.PageIndex = e.NewPageIndex;
        gdIssue.DataBind();
    }
}