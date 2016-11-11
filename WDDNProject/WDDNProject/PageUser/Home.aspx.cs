using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WDDNProject.PageUser
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string t = Session["type"]+"";
            /*if (!Session["type"].Equals("admin"))
                Response.Redirect("~/PageCommon/LoginPage.aspx");*/
            Label1.Text = Session["uid"].ToString()+t;
        }
    }
}