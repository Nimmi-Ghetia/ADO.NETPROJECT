using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master_AdminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int type = 0;
        if(Session["type"]!=null)
        type = Int32.Parse(Session["type"] + "");
        if (Session["uid"] == null || type==0)
        {
            Response.Redirect("~/PageCommon/LoginPage.aspx");

        }
        else if(type==2)
        {
            Response.Redirect("~/PageUser/Home.aspx");
        }
        
    }
}
