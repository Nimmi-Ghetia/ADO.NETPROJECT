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
public partial class PageAdmin_StoreInfo : System.Web.UI.Page
{
   
    string str1 = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
       //     addYear();

        }
    }

    
   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
       try
       {
           SqlConnection con = new SqlConnection(str1);
           con.Open();
           SqlCommand cmd = new SqlCommand("insert into Book (Lib_Id,Book_Id,Title,Author,Publisher,category_id,Book_Type) values (@1,@2,@3,@4,@5,@6,@7) ", con);
            cmd.Parameters.AddWithValue("@1", ddlLib.SelectedValue);
            cmd.Parameters.AddWithValue("@2", txtIsbn.Text);
           cmd.Parameters.AddWithValue("@3", txtbk_name.Text);
           cmd.Parameters.AddWithValue("@4", txtAuth_name.Text);
           cmd.Parameters.AddWithValue("@5", txtPublisher.Text);
           cmd.Parameters.AddWithValue("@6", ddlCat.SelectedValue);
            cmd.Parameters.AddWithValue("@7","rb");

           int i = cmd.ExecuteNonQuery();
           if (i >= 1)
           {
                ddlLib.SelectedIndex =0;
               txtIsbn.Text = "";
               txtbk_name.Text = "";
               txtAuth_name.Text = "";
               txtPublisher.Text = "";
               ddlCat.SelectedIndex = 0;
               storeMsg.Text = "Data Stored Successfully.";
               storeMsg.ForeColor = Color.Green;
           }
           con.Close();
       }
        catch(Exception exp)
       {
           storeMsg.Text = exp.Message;
       }
    }
}