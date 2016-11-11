using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WDDNProject.PageAdmin
{
    public partial class ManageUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUsrInfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PageAdmin/AddUser.aspx");
        }

        protected void btnBookInfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PageAdmin/DeleteUser.aspx");

        }
    }
}