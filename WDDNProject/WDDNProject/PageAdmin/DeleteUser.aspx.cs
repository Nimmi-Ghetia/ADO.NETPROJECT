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
public partial class PageAdmin_DeleteUser : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    string str = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnDelReq_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(str);
        delInfo.Visible =true;
        gvDelete.Visible = true;
        gvdeleteduser.Visible = false;
        lblDelInfo.Visible = false;
        try
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from DeleteAccount",con);
            DataSet ds = new DataSet();
            da.Fill(ds,"DeleteAccount");
            gvDelete.DataSource = ds;
            gvDelete.DataBind();
        }
        catch
        {
            lbldelete.Visible = true;
            lbldelete.Text = "No request to delete the account";
            lbldelete.ForeColor = Color.Green;
        }
    }
    protected void btnDeleted_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(str);
        lblDelInfo.Visible = true;
        gvdeleteduser.Visible = true;
        gvDelete.Visible = false;
        delInfo.Visible = false;
        SqlDataAdapter adpDeleted = new SqlDataAdapter("select * from DeleteAccount",con);
        DataSet ds = new DataSet();
        adpDeleted.Fill(ds,"DeleteAccount");
        gvdeleteduser.DataSource = ds;
        gvdeleteduser.DataBind();
    }
    protected void gvDelete_SelectedIndexChanged(object sender, EventArgs e)
    {
        con = new SqlConnection(str);
        try
        {
            string usrname = gvDelete.SelectedRow.Cells[1].Text;
            string libid= gvDelete.SelectedRow.Cells[2].Text;
            con.Open();
            SqlCommand delMember = new SqlCommand("delete Role where User_Id=@1 and Lib_Id=@2 and Role_Id=2",con);
            delMember.Parameters.AddWithValue("@1",usrname);
            delMember.Parameters.AddWithValue("@2", libid);
            //SqlCommand delUser = new SqlCommand("delete dbo.aspnet_Users where Username='"+usrname+"'",con);
            //SqlCommand dellibuser = new SqlCommand("delete users where User_Id='"+usrname+"'",con);
            SqlCommand delReq = new SqlCommand("delete DeleteAccount where User_Id='"+usrname+"'",con);
            int Menbr = delMember.ExecuteNonQuery();
            //int usr = delUser.ExecuteNonQuery();
            //int libuser = dellibuser.ExecuteNonQuery();
            int req = delReq.ExecuteNonQuery();
            if( (req >= 1)&&(Menbr>=1))
            {
                lbldelete.Text="Account of "+usrname+" has been deleted successfully";
                lbldelete.Visible = true;
                lbldelete.ForeColor = Color.Green;
            }
            else
            {
                lbldelete.Text = "Account of " + usrname + " has not been deleted successfully. Please try again later.";
                lbldelete.Visible = true;
                lbldelete.ForeColor = Color.Red;
            }
            SqlCommand sellib = new SqlCommand("select count(*) from Role where User_Id=@1", con);
            sellib.Parameters.AddWithValue("@1", usrname);
            int rd = sellib.ExecuteNonQuery();
            if(rd==0)
            {
                SqlCommand dellibuser = new SqlCommand("delete users where User_Id='" + usrname + "'", con);
                int libuser = dellibuser.ExecuteNonQuery();
            }
        }
        catch
        {
            lbldelete.Text = "Account has not been deleted successfully. Please try again later.";
            lbldelete.Visible = true;
            lbldelete.ForeColor = Color.Red;
        }
    }
}