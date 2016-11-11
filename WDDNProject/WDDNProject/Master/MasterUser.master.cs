using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master_MasterUser : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int type = Int32.Parse(Session["type"]+"");
        if (Session["uid"] == null || (type!=1&& type!=2))
        {
            Response.Redirect("~/PageCommon/LoginPage.aspx");

        }
        /*else
        {
            LoginView logInView = (LoginView)this.Master.FindControl("HeadLoginView");

            //HyperLink rdirect = (HyperLink)logInView.FindControl("HyperLink1");
            //rdirect.NavigateUrl = "~/PageUser/MyProfile.aspx";
            Response.Redirect("~/PageUser/MyProfile.aspx");
            //Label1.Text = Session["uid"] + "";
        }*/
    }
}
