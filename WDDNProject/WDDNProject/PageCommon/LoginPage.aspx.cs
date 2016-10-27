using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
namespace WDDNProject.PageUser
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Clicked(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();

            con.ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            con.Open();

            SqlCommand cmd = new SqlCommand("Select users.User_Id,Password,Role_Id from users join Role on users.User_Id = Role.User_Id", con);
            SqlDataReader rd = cmd.ExecuteReader();
            string username = unm.Text;
            string password = pwd.Text;
            while (rd.Read())
            {
                string unm = rd["User_Id"].ToString().Trim();
                string pass = rd["Password"].ToString().Trim();

                Label1.Text += (username.Equals(unm)) + "   " + password + pass + ("nimmi".Equals("nimmi")) + "   " + password.Equals(pass);
                if (username.Equals(unm) && password.Equals(pass))
                {
                    //rd.Close();
                    Label1.Text += unm + "=" + username + "and and" + pass + "=" + password;
                    string s = "select Role from UserType where User_Id=" + unm +"and Role_Id="+rd["Role_Id"]  ;
                    //SqlCommand   cmd1 = new SqlCommand(s,con);
                    //     SqlDataReader rd1 = cmd1.ExecuteReader();
                    //   while(rd1.Read())
                    // {
                    Session["type"] = rd["Role_Id"];
                    //}


                    Response.Redirect("~/PageUser/Home.aspx");
                }
            }
            Label1.Text += "Wrong username or password";
               Response.Redirect("LoginPage.aspx");
            //}catch(Exception ex)
            //{
            //    Label1.Text = ex.StackTrace.ToString() ;
            //}
        }

        protected void Button1_Clicked(object sender, EventArgs e)
        {
            Response.Redirect("~/PageCommon/index.aspx");
        }
    }
}