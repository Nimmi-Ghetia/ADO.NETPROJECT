using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WDDNProject.PageUser
{
    public partial class DeleteAccount : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        
        }

        

        protected void clk_Click(object sender, EventArgs e)
        {
            con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            cmd = new SqlCommand("insert into DeleteAccount values(@1,@2)", con);
            int libid =Int32.Parse( ddl.SelectedValue+"");
            cmd.Parameters.AddWithValue("@1", Session["uid"] + "");
            cmd.Parameters.AddWithValue("@2", libid);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            if(i>0)
            Label1.Text = "Request is sent successfully";
            else
            Label1.Text = "Request is not sent.Try again ";

        }
    }
}