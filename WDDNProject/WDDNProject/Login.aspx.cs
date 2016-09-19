using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
namespace WDDNProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Clicked(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;" + "Initial Catalog=master;" + "Integrated Security=SSPI";
            //WebConfigurationManager.ConnectionStrings.connec(""); WebConfigurationManager.connectionStrings.connectionString("DefaultConnection");
            //Label1.Text = str;
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from Login",con);
            SqlDataReader rd = cmd.ExecuteReader();
            String username = unm.Text;
            String password = pwd.Text;
            while (rd.Read())
            {
                String unm = rd["Username"]+"";
                String pass = rd["Password"] + "";
                if(username.Equals(unm)&&password.Equals(pass))
                {
                    Session["unm"] = unm;
                    Response.Redirect("msg.aspx");
                }
            }
            Response.Redirect("Login.aspx");
        }
    }
}