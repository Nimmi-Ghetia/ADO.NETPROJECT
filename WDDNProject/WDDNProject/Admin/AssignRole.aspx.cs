using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
namespace WDDNProject.Admin
{
    public partial class AssignRole : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();

        
         
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from UserType ", con);
            SqlDataReader rd = cmd.ExecuteReader();
            int id = 0;
            while (rd.Read())
            {
                id = Int32.Parse(rd["Role_Id"]+"");
            }

            SqlCommand cmd1 = new SqlCommand("insert into UserType values (@id,@role,@decr) ", con);
            cmd1.Parameters.AddWithValue("@id", id + 1);
            cmd1.Parameters.AddWithValue("@role", txtRole.Text);
            cmd.Parameters.AddWithValue("@decr",txtdsc.Text);
            int i=cmd1.ExecuteNonQuery();
            if(i>0)
            {
                Label1.Text = "role created successfully";
            }
            con.Close();

        }

        protected void gvRoles_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
        
        protected void ddlUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSuccess.Text = string.Empty;
            lblError.Text = string.Empty;
            string userName = ddlUsers.SelectedItem.Value;
            string[] userRoles=new string[10];
            con.ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Role join UserType on Role_Id on UserType.Role_Id=Role.Role_Id where User_Id= "+userName, con);
            SqlDataReader rd = cmd.ExecuteReader();
            int id = 0;
            while (rd.Read())
            {
                userRoles[id++] =(rd["Role"] + "");
            }

            
            string rolename = string.Empty;
            foreach (GridViewRow gvrow in GridView1.Rows)
            {
                CheckBox chk = (CheckBox)gvrow.FindControl("chkRole");
                Label lbl = (Label)gvrow.FindControl("lblRole");
                rolename = lbl.Text;
                int index = Array.IndexOf(userRoles, rolename);
                if (index > -1)
                {
                    chk.Checked = true;
                }
                else
                {
                    chk.Checked = false;
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            con.Open();
/*            SqlCommand cmd = new SqlCommand("select * from Role where User_Id=@unm " , con);
            cmd.Parameters.AddWithValue("@unm", ddlUsers.SelectedValue);
            SqlDataReader rd = cmd.ExecuteReader();
            int id = 0;
            while (rd.Read())
            {
                id = Int32.Parse(rd["Role_Id"] + "");
                if()
            }*/
            string userName = ddlUsers.SelectedItem.Text;
            string[] userRoles = new string[10];
            con.ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Role join UserType on Role_Id on UserType.Role_Id=Role.Role_Id where User_Id= " + userName, con);
            SqlDataReader rd = cmd.ExecuteReader();
            int id = 0;
            while (rd.Read())
            {
                userRoles[id++] = (rd["Role"] + "");
            }

            //string[] userRoles = Roles.GetRolesForUser(userName);
            string errorMessage = string.Empty;
            string successMessage = string.Empty;
            string roleName = string.Empty;
            int i = 0;
            int j = 0;

            foreach (GridViewRow gvrow in GridView1.Rows)
            {
                CheckBox chk = (CheckBox)gvrow.FindControl("chkRole");
                Label lbl = (Label)gvrow.FindControl("lblRole");
                roleName = lbl.Text;
                if (chk.Checked)
                {
                    int index = Array.IndexOf(userRoles, roleName);
                    if (index == -1)
                    {

                        SqlCommand cmd1 = new SqlCommand("insert into Role values(@uid ,1,@rid)", con);
                        int it = cmd.ExecuteNonQuery();
                        cmd1.Parameters.AddWithValue("@uid", userName);
                        SqlCommand cmd2 = new SqlCommand("select Role_Id from UserType where Role=@rid", con);
                        SqlDataReader rd2 = cmd2.ExecuteReader();
                        int r_id=0;
                        while (rd2.Read())
                        {
                            r_id = Int32.Parse(rd2[0]+"");
                        }

                        cmd2.Parameters.AddWithValue("@rid", roleName);
                        cmd1.Parameters.AddWithValue("@rid", r_id);
                        //Roles.AddUserToRole(userName, roleName);
                        if(it>=1)
                        {
                            successMessage += roleName + ", ";
                        }
                        
                        j++;
                    }
                }
                else
                {
                    int index = Array.IndexOf(userRoles, roleName);
                    if (index > -1)
                    {
                        // Remove the user from the role
                        string logName = Page.User.Identity.Name;
                        if (userName == logName)
                        {
                            lblError.Text = "Current user Can't be remove from role";
                            i++;
                        }
                        else
                        {
                            //Roles.RemoveUserFromRole(userName, roleName);
                            SqlCommand cmd1 = new SqlCommand("delete Role where User_Id=@uid and Role_Id=@rid)", con);
                            int it = cmd.ExecuteNonQuery();
                            cmd1.Parameters.AddWithValue("@uid", userName);
                            SqlCommand cmd2 = new SqlCommand("select Role_Id from UserType where Role=@rid", con);
                            SqlDataReader rd2 = cmd2.ExecuteReader();
                            int r_id = 0;
                            while (rd2.Read())
                            {
                                r_id = Int32.Parse(rd2[0] + "");
                            }

                            cmd2.Parameters.AddWithValue("@rid", roleName);
                            cmd1.Parameters.AddWithValue("@rid", r_id);
                            //Roles.AddUserToRole(userName, roleName);
                            if (it >= 1)
                            {
                                errorMessage += roleName + ", ";
                            }
                            
                            i++;
                        }
                    }
                }
            }
            if (errorMessage != string.Empty)
            {
                if (i > 1)
                {
                    lblError.Text = userName + " was removed from roles " + errorMessage.Substring(0, errorMessage.Length - 2);
                }
                else
                {
                    lblError.Text = userName + " was removed from role " + errorMessage.Substring(0, errorMessage.Length - 2);
                }
                lblError.ForeColor = Color.Red;
            }
            else
            {
                lblError.Text = string.Empty;
            }
            if (successMessage != string.Empty)
            {
                if (j > 1)
                {
                    lblSuccess.Text = successMessage.Substring(0, successMessage.Length - 2) + " roles assigned to " + userName;
                }
                else
                {
                    lblSuccess.Text = successMessage.Substring(0, successMessage.Length - 2) + " role assigned to " + userName;
                }
                lblSuccess.ForeColor = Color.Green;
            }
            else
            {
                lblSuccess.Text = string.Empty;
            }
            /*SqlCommand cmd1 = new SqlCommand("insert into UserType values (@id,@role,@decr) ", con);
            cmd1.Parameters.AddWithValue("@id", id + 1);
            cmd1.Parameters.AddWithValue("@role", txtRole.Text);
            cmd.Parameters.AddWithValue("@decr", txtdsc.Text);
            int i = cmd1.ExecuteNonQuery();
            if (i > 0)
            {
                Label1.Text = "role created successfully";
            }
            
            */
            con.Close();
        }
    }
}