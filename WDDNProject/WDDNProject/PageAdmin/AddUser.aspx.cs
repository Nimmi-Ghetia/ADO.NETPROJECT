using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Data;

namespace WDDNProject.PageAdmin
{
    public partial class AddUser : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnaddReq_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(str);
            addInfo.Visible = true;
            gvAdd.Visible = true;
            gvaddeduser.Visible = false;
            lblAddInfo.Visible = false;
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from AddRequest", con);
                DataSet ds = new DataSet();
                da.Fill(ds, "AddRequest");
                gvAdd.DataSource = ds;
                gvAdd.DataBind();
            }
            catch
            {
                lbladd.Visible = true;
                lbladd.Text = "No request to add the account";
                lbladd.ForeColor = Color.Green;
            }
        }

        protected void btnAdded_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(str);
            lblAddInfo.Visible = true;
            gvaddeduser.Visible = true;
            gvAdd.Visible = false;
            addInfo.Visible = false;
            SqlDataAdapter adpDeleted = new SqlDataAdapter("select * from AddRequest", con);
            DataSet ds = new DataSet();
            adpDeleted.Fill(ds, "AddRequest");
            gvaddeduser.DataSource = ds;
            gvaddeduser.DataBind();
        }
        protected void gvDelete_SelectedIndexChanged(object sender, EventArgs e)
        {
            con = new SqlConnection(str);
            try
            {
                string usrname = gvAdd.SelectedRow.Cells[1].Text;
                string libid = gvAdd.SelectedRow.Cells[2].Text;
                con.Open();
                SqlCommand addMember = new SqlCommand("insert into Role values(@1,@2,2)", con);
                addMember.Parameters.AddWithValue("@1", usrname);
                addMember.Parameters.AddWithValue("@2", libid);
                //SqlCommand delUser = new SqlCommand("delete dbo.aspnet_Users where Username='"+usrname+"'",con);
                //SqlCommand dellibuser = new SqlCommand("delete users where User_Id='"+usrname+"'",con);
                SqlCommand addReq = new SqlCommand("delete AddRequest where User_Id='" + usrname + "'", con);
                int Menbr = addMember.ExecuteNonQuery();
                //int usr = delUser.ExecuteNonQuery();
                //int libuser = dellibuser.ExecuteNonQuery();
                int req = addReq.ExecuteNonQuery();
                if ((req >= 1) && (Menbr >= 1))
                {
                    lbladd.Text = "Account of " + usrname + " has been added successfully";
                    lbladd.Visible = true;
                    lbladd.ForeColor = Color.Green;
                }
                else
                {
                    lbladd.Text = "Account of " + usrname + " has not been added successfully. Please try again later.";
                    lbladd.Visible = true;
                    lbladd.ForeColor = Color.Red;
                }
                SqlCommand sellib = new SqlCommand("select count(*) from Role where User_Id=@1", con);
                sellib.Parameters.AddWithValue("@1", usrname);
                int rd = sellib.ExecuteNonQuery();
                if (rd == 0)
                {
                    SqlCommand addlibuser = new SqlCommand("insert into users values(@1,@2,@3)", con);
                    addlibuser.Parameters.AddWithValue("@1", usrname);
                    addlibuser.Parameters.AddWithValue("@2", libid);
                    addlibuser.Parameters.AddWithValue("@3", libid);
                    int libuser = addlibuser.ExecuteNonQuery();
                }
            }
            catch
            {
                lbladd.Text = "Account has not been added successfully. Please try again later.";
                lbladd.Visible = true;
                lbladd.ForeColor = Color.Red;
            }
        }
    }
}