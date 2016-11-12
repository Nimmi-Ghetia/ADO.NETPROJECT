using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlTypes;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Net.Mail;
public partial class PageUser_Issue : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    string str = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    string bk_ID, bk_NAME, name;
    DateTime fdate;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void imgSearchbooks_Click(object sender, ImageClickEventArgs e)
    {
        lblReq.Text = "";
        lblmsg.Text = "";
        lblDateChk.Text = "";
        txtDate.Text = "";
        DataSet ds = new DataSet();
        lblBookStatus.Visible = false;
        grdBookList.Visible = true;
        if (txtBookname.Text == string.Empty && txtAuthorname.Text == string.Empty && dlCategory.SelectedValue == "-Select-")
        {
            //Panel1.Visible = true;
            //lblmsg.ForeColor = Color.Green;
        }
        else
        {
            try
            {
                con = new SqlConnection(str);
                con.Open();
                SqlDataAdapter adpAll = new SqlDataAdapter("select Book_Id,Title,Author,Publisher from Book where Status='Available' and Title like '%" + txtBookname.Text + "%' and Author like '%" + txtAuthorname.Text + "%' and category_id='" + dlCategory.SelectedValue + "'", con);
                SqlDataAdapter adpBook = new SqlDataAdapter("select Book_Id,Title,Author,Publisher from Book where Status='Available' and Title like '%" + txtBookname.Text + "%' ", con);
                SqlDataAdapter adpAuthor = new SqlDataAdapter("select Book_Id,Title,Author,Publisher from Book where Status='Available' and Author like '%" + txtAuthorname.Text + "%'", con);
                SqlDataAdapter adpCat = new SqlDataAdapter("select  Book_Id,Title,Author,Publisher from Book where Status='Available' and category_Id='" + dlCategory.SelectedValue + "'", con);
                SqlDataAdapter adpBook_Author = new SqlDataAdapter("select Book_Id,Title,Author,Publisher from Book where Status='Available' and Title like '%" + txtBookname.Text + "%' and Author like '%" + txtAuthorname.Text + "%'", con);
                SqlDataAdapter adpBook_Cat = new SqlDataAdapter("select Book_Id,Title,Author,Publisher from Book where Status='Available' and Title like '%" + txtBookname.Text + "%' and category_id = '" + dlCategory.SelectedValue + "'", con);
                SqlDataAdapter adpAuthor_cat = new SqlDataAdapter("select Book_Id,Title,Author,Publisher from Book where Status='Available' and Author like '%" + txtAuthorname.Text + "%' and category_id='" + dlCategory.SelectedValue + "'", con);
              if (txtBookname.Text == string.Empty && txtAuthorname.Text == string.Empty && dlCategory.SelectedValue != "-Select-")
                {
                    adpCat.Fill(ds, "Book");
                    grdBookList.DataSource = ds;
                    grdBookList.DataBind();
                }
                else if (txtBookname.Text == string.Empty && dlCategory.SelectedValue == "-Select-")
                {
                    adpAuthor.Fill(ds, "Book");
                    grdBookList.DataSource = ds;
                    grdBookList.DataBind();
                }
                else if (txtAuthorname.Text == string.Empty && dlCategory.SelectedValue == "-Select-")
                {
                    adpBook.Fill(ds, "Book");
                    grdBookList.DataSource = ds;
                    grdBookList.DataBind();
                }
                else if (txtBookname.Text != string.Empty && txtAuthorname.Text != string.Empty && dlCategory.SelectedValue != "-Select-")
                {
                    adpAll.Fill(ds, "Book");
                    grdBookList.DataSource = ds;
                    grdBookList.DataBind();
                }
                else if (txtBookname.Text != string.Empty && txtAuthorname.Text != string.Empty && dlCategory.SelectedValue == "-Select-")
                {
                    adpBook_Author.Fill(ds, "Book");
                    grdBookList.DataSource = ds;
                    grdBookList.DataBind();
                }
                else if (txtBookname.Text != string.Empty && txtAuthorname.Text == string.Empty && dlCategory.SelectedValue != "-Select-")
                {
                    adpBook_Cat.Fill(ds, "Book");
                    grdBookList.DataSource = ds;
                    grdBookList.DataBind();
                }
                else if (txtBookname.Text == string.Empty && txtAuthorname.Text != string.Empty && dlCategory.SelectedValue != "-Select-")
                {
                    adpAuthor_cat.Fill(ds, "Book");
                    grdBookList.DataSource = ds;
                    grdBookList.DataBind();
                }
                else
                {
                    con.Close();
                }
            }
            catch (Exception exp)
            {
                
            }
        }
    }

    protected void grdBookList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdBookList.PageIndex = e.NewPageIndex;
        grdBookList.DataBind();
    }

    public bool chkAvial(string query)
    {
         con = new SqlConnection(str);
        con.Open();
        SqlCommand cmdChk = new SqlCommand(query, con);
        SqlDataReader dr = cmdChk.ExecuteReader();
        if(dr.Read())
        {
            con.Close();
            return true;
        }
        else
        {
            con.Close();
            return false;
        }
    }


    protected void grdBookList_SelectedIndexChanged(object sender, EventArgs e)
    {
        name = Session["uid"]+"";
        string selectedbook = grdBookList.SelectedRow.Cells[1].Text;
        // ------------ checking complete profile
        if(!chkAvial("select User_Id from users where User_Id='" + name + "'"))
        {
            lblReq.Visible = true;
            lblReq.Text = "Please Complete Your Profile First";
        }
       
        else if(txtDate.Text == string.Empty)
        {
            lblDateChk.Text = "Please select the return Date of this book";
            lblDateChk.Visible = true;
            lblDateChk.ForeColor = Color.Red;
            lblReq.Visible = false;
        }
       
        else
        {
            lblReq.Visible = true;
            lblReq.Text = "You Have Already Requested For This Book.";


            lblDateChk.Visible = false;
            
            con = new SqlConnection(str);
            con.Open();
            SqlDataAdapter adpSelect = new SqlDataAdapter("select Book_Id,Title,Status from Book where Book_Id='" + selectedbook + "' and Status='Available'", con);
            DataSet dsSelect = new DataSet();
            adpSelect.Fill(dsSelect, "Book");
            bk_ID = dsSelect.Tables[0].Rows[0]["Book_Id"].ToString();
            bk_NAME = dsSelect.Tables[0].Rows[0]["Title"].ToString();
            con.Close();
            if (chkAvial("select Book_Id,User_Id from Book_Request where Book_Id='" + bk_ID + "' and User_Id='" + name + "' "))
            {
                lblReq.Visible = true;
                lblReq.Text = "You Have Already Requested For This Book.";
            }
            else
            {
                DateTime d= DateTime.Now.Date;
                
                int lib_id = 1;
                grdBookList.SelectedRow.Visible = false;
                con = new SqlConnection(str);
                con.Open();

                string temp = " insert into Book_Request (Book_Id,User_Id,Lib_Id,request_date,return_date)"
              + "values(@bk,@2,@3,@4,@5)";
                SqlCommand cmd = new SqlCommand(temp, con);
                cmd.Parameters.AddWithValue("@bk", bk_ID);
                cmd.Parameters.AddWithValue("@2", name);
                cmd.Parameters.AddWithValue("@3", lib_id);
                cmd.Parameters.AddWithValue("@4", d);
                cmd.Parameters.AddWithValue("@5", fdate);
                string upd = "update Book set Status='Requested' where Book_Id='" + bk_ID + "'";
               
                int t = cmd.ExecuteNonQuery();
                con.Close();
                if (t > 0)
                {
                    
                    lblReq.Visible = true;
                    if(change(upd)>0)
                    lblReq.Text = "Request has been forwarded to administrator";
                    lblmsg.Visible = true;
                    lblmsg.Text = "You can issue only two books at a time. Only last two selection will be consider";
                }
                else
                {
                    lblReq.Text = "Items is not available.";
                }
            }

          
        }


    }

    public int change(string chngQuery)
    {
        con = new SqlConnection(str);
        con.Open();
        SqlCommand insCmd = new SqlCommand(chngQuery, con);
       int i= insCmd.ExecuteNonQuery();
        con.Close();
        return i;
    }


    protected void txtDate_TextChanged(object sender, EventArgs e)
    {
         if (txtDate.Text != string.Empty)
        {
            string f = txtDate.Text;
            fdate = Convert.ToDateTime(f);
           // fdate = DateTime.Parse(f);
            DateTime tdate = DateTime.Now;
            DateTime cdate = tdate.AddDays(20);
            if (fdate > cdate)
            {
                txtDate.Text = "";
                lblDateChk.Text = "Date Can not be more than 20 days";
                lblDateChk.Visible = true;
                ClientScriptManager cs = Page.ClientScript;
                cs.RegisterStartupScript(this.GetType(), "startupScript", "moredate();", true);
            }
        }
    }
}