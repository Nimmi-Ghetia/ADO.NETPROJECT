﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Security;
using System.Drawing;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
public partial class PageAdmin_ViewInformation : System.Web.UI.Page
{
    string str = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    string strQuery,Pquery,Equery;
    int pn, un;
    protected void Page_Load(object sender, EventArgs e)
    {
                lblError.Text = "";
        PnlBook.Visible = false;
        pnlPop.Visible = false;
    }
    
    void getData(string query, int i)
    {
        SqlConnection con = new SqlConnection(str);
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ds.Clear();
        da.Fill(ds);
        if (i == 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            GridBook.DataSource = ds;
            GridBook.DataBind();
        }
        con.Close();
    }
    protected void btnUsrInfo_Click(object sender, EventArgs e)
    {
        PanelUser.Visible = true;
        PanelBook.Visible = false;
        strQuery = "select * from users";
        getData(strQuery, 0);
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selname = GridView1.SelectedRow.Cells[0].Text;
       
       
        SqlConnection con = new SqlConnection(str);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from users where User_Id='" + selname + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            lblName.Text = dr.GetString(1);
            //lblAge.Text = dr.GetInt32(2).ToString();
            //lblDesign.Text = dr.GetString(3);
            lblEmail.Text = dr.GetValue(4).ToString();
            lblAdd.Text = dr.GetValue(2).ToString();
        
        }
        pnlPop.Visible = true;
      
      //  ModalPopupExtender1.Show();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        
        string selName = GridView1.DataKeys[e.RowIndex].Value.ToString();
        SqlConnection con = new SqlConnection(str);
        con.Open();
        SqlCommand chkCmd = new SqlCommand("select * from Book_Issue where User_Id='" + selName + "'",con);
        SqlDataReader dr = chkCmd.ExecuteReader();
        if(dr.Read())
        {
            lblError.Text = "Sorry , You Can't Delete This User";
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Visible = true;
        }
        else
        {
        //    Membership.DeleteUser(selName);
            strQuery = "delete DeleteRequest where User_Id='" + selName + "'";
            change(strQuery);
            strQuery = "delete from users where User_Id='" + selName + "'";
            change(strQuery);
            getData("select * from users ", 0);
        }
    }

    void change(string query)
    {
        SqlConnection con = new SqlConnection(str);
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        con.Close();       
    }



    // working gridview for bookInfo
    protected void btnBookInfo_Click(object sender, EventArgs e)
    {
        PanelUser.Visible = false;
        PanelBook.Visible = true;
        strQuery = "select * from Book";
        getData(strQuery, 1);
    }

    protected void lnkFake_Click(object sender, EventArgs e)
    {

    }

    protected void GridBook_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["MyID"] = GridBook.SelectedValue.ToString();
        //ModalPopupExtender2.Show();
        PnlBook.Visible = true;
        txtBkIsbn.Text = GridBook.SelectedRow.Cells[1].Text;
        txtBkName.Text = GridBook.SelectedRow.Cells[2].Text;
        txtBkAuthor.Text = GridBook.SelectedRow.Cells[3].Text;
        txtBkPublisher.Text = GridBook.SelectedRow.Cells[4].Text;
        ddBkCat.Text = GridBook.SelectedRow.Cells[5].Text;
        radBkAvail.Text = GridBook.SelectedRow.Cells[6].Text;
        
       
    }
    
    protected void GridBook_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
   
    


    protected void btnBkEdit_Click(object sender, EventArgs e)
    {
        string  stQuery;
        string uname=Page.User.Identity.Name;
        int selBId = Convert.ToInt32(ViewState["MyID"].ToString());
        string newBkName, newBkIsbn, newBkAuth, newBkPub, newBkCat, newBkYear;
        string newBkAvail, newBkReq;
        int newBkCopy;
        newBkName = txtBkName.Text;
        newBkIsbn = txtBkIsbn.Text;
        newBkAuth = txtBkAuthor.Text;
        newBkPub = txtBkPublisher.Text;
        newBkCat = ddBkCat.SelectedItem.ToString();
        newBkAvail = radBkAvail.SelectedItem.ToString();
        stQuery = "update Book set Book_Id='" + newBkIsbn + "',Title='" + newBkName + "',Author='" + newBkAuth + "',Publisher='" + newBkPub + "',category_id='" + newBkCat  + "',Status='" + newBkAvail +  " where Book_Id=" + selBId + "";
        change(stQuery);
        stQuery = "update IssueRecords set BookName='" + newBkName + "',Category='" + newBkCat + "' where BID=" + selBId + "";
        change(stQuery);
        getData("select * from InfoBook", 1);
      
    }
   





   

   
}