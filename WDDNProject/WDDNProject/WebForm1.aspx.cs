using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace WDDNProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
               string query ="create table DeleteAccount(User_Id NVARCHAR(10) primary key, name NVARCHAR(50), address NVARCHAR(50), password NVARCHAR(50), email_id NVARCHAR(50))";
                // "create table Role(User_Id NVARCHAR(10) REFERENCES users, Lib_Id int REFERENCES Library,Role_Id int REFERENCES UserType)";
                   // "create table Book_Request(Book_id NVARCHAR(10) REFERENCES Book, User_Id NVARCHAR(10) REFERENCES users, Lib_Id int REFERENCES Library, request_date date)";
                   //"create table Book_Issue(Book_id NVARCHAR(10) REFERENCES Book, User_Id NVARCHAR(10) REFERENCES users, Lib_Id int REFERENCES Library, issue_date date, due_date date, return_date date)";
                   // "create table Book(Book_Id NVARCHAR(10) primary key,LIB_ID int references library,category_id int references category, Title NVARCHAR(50), Author NVARCHAR(50), Publisher NVARCHAR(50), Book_Type NVARCHAR(10), Link NVARCHAR(50),Status NVARCHAR(10) default 'Available' check (Status in( 'Available','Requested','Issued')) )";
                   //"create table Category(Category_Id int primary key,Name nvarchar(50) )"; 
                   //"create table Library(Lib_Id int primary key,Name nvarchar(50),City nvarchar(50) )";
               //"create table UserType(Role_Id int primary key,Role nvarchar(50),Description nvarchar(50)) ";
               //"create table users(User_Id NVARCHAR(10) primary key, name NVARCHAR(50), address NVARCHAR(50), password NVARCHAR(50), email_id NVARCHAR(50))";
               string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
               using (SqlConnection con = new SqlConnection(constr))
               {
                   using (SqlCommand cmd = new SqlCommand(query))
                   {
                       cmd.Connection = con;
                       con.Open();
                       cmd.ExecuteNonQuery();
                       con.Close();
                   }
               }
        }
    }
}