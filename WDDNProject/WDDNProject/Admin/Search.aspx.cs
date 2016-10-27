using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace WDDNProject.Admin
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();

            con.ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            con.Open();
            SqlCommand cmd = new SqlCommand("Select Lib_id from Library", con);
            SqlDataReader rd = cmd.ExecuteReader();
            while(rd.Read())
            {
                DropDownList1.Items.Add(rd["Lib_id"]+"");
            }
            
        }
    }
}