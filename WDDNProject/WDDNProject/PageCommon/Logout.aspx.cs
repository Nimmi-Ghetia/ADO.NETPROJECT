using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WDDNProject.PageCommon
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Remove("uid");
            Session.Remove("type");
            Response.Redirect("~/PageCommon/index.aspx");
        }
    }
}