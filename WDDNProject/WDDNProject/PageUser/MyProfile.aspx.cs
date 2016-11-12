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
using System.Web.Security;
public partial class PageUser_MyProfile : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    string str = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    string email,uname;
    string chk;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            chkProfile();
        }
        
    }

    private void chkProfile()
    {
        uname =Session["uid"]+"";
        con = new SqlConnection(str);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from users where User_Id='" + uname + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            if(dr["name"]!=null)
            txtName.Text = dr["name"].ToString();
           if(dr["email_id"]!=null)
            txtmail.Text = dr["email_id"].ToString();
            if (dr["address"] != null)
            txtAddress.Text = dr["address"].ToString();

        }

        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        uname = Session["uid"] + "";
        //email= Membership.GetUser(uname).Email;

        con = new SqlConnection(str);
       SqlConnection conchk = new SqlConnection(str);
       conchk.Open();
       con.Open();
       try
       { 
           SqlCommand cmdChk=new SqlCommand("select * from users where User_Id='" + uname + "'", conchk);
           SqlDataReader drChk=cmdChk.ExecuteReader();
           if(!drChk.Read())
           {
           cmd = new SqlCommand("insert into users (name,email_id,address) values (@1,@2,@3)", con);
           cmd.Parameters.AddWithValue("@1", txtName.Text);
           cmd.Parameters.AddWithValue("@2", txtmail.Text);
           cmd.Parameters.AddWithValue("@3", txtAddress.Text);
           Label1.Text = "Record Inserted Successfully";
           }
           else
           {
               cmd = new SqlCommand("update users set name=@1,email_id=@2,address=@3 where User_Id=@4",con);
                cmd.Parameters.AddWithValue("@1", txtName.Text);
                cmd.Parameters.AddWithValue("@2", txtmail.Text);
                cmd.Parameters.AddWithValue("@3", txtAddress.Text);
                cmd.Parameters.AddWithValue("@4", uname);
               Label1.Text = "Profile Updated Successfully";
           }
           conchk.Close();
           cmd.ExecuteNonQuery();
       }
       catch (Exception exp)
       {
           Label1.Text = exp.Message;
       }
       con.Close();
    }
}