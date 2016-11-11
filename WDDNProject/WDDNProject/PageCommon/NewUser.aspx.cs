using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PageUser_NewUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void RegisterUser(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();

        con.ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        con.Open();

        SqlCommand cmd = new SqlCommand("insert into users(User_Id,Password) values(@1,@2) ", con);
        cmd.Parameters.AddWithValue("@1", txtUserid.Text);
        cmd.Parameters.AddWithValue("@2", txtPassword.Text);
        //cmd.Parameters.AddWithValue("@3",DropDownList1.SelectedValue);
        
        SqlCommand sellib = new SqlCommand("select count(*) from users where User_Id=@1", con);
        sellib.Parameters.AddWithValue("@1", txtUserid.Text);
        int rd = Convert.ToInt32(sellib.ExecuteScalar());

        SqlCommand addMember = new SqlCommand("insert into Role values(@1,@2,2)", con);
        addMember.Parameters.AddWithValue("@1", txtUserid.Text);
        addMember.Parameters.AddWithValue("@2", DropDownList1.SelectedValue);
        
        if(rd == 0)
        {
            int i = cmd.ExecuteNonQuery();
            int add = addMember.ExecuteNonQuery();
            if (i >= 1 && add >= 1)
            {
                Label1.Text = "Registration is done successfully";
            }
            else
            {
                Label1.Text = "Registration was unsuccessful.Try Again";
            }
        }
        else
        {
            Label1.Text = "Try another username. This name already exist.";
        }
        
    }
}