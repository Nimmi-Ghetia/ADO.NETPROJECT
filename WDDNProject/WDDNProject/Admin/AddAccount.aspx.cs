using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
namespace WDDNProject.Admin
{
    public partial class AddAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void Button1_Clicked(object sender, EventArgs e)
        {

            string query="insert into users values(@unm,@name,@addr,@password,@email)" ;

            string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@unm", unm.Text);
                    cmd.Parameters.AddWithValue("@name", name.Text);
                    cmd.Parameters.AddWithValue("@addr", addr.Text);
                    cmd.Parameters.AddWithValue("@password", pwd.Text);
                    cmd.Parameters.AddWithValue("@email", email.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Label1.Text = "Successfully registered.";
                }
            }
        }
    }
}