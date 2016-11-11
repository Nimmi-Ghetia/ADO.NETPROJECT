<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MasterPage.master" AutoEventWireup="true" Inherits="PageUser_NewUser" Codebehind="NewUser.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css" >
        #myStyle
        {
            color:#F5F5F5; width:450px; 
            text-align:left; 
            background-color:#00C6C6; 
            border-radius:12px; 
            opacity:80; 
            padding:10px; 
            font-size: medium;
            font-weight: 500; 
            font-family: 'Palatino Linotype';
        }
        .conto input[type="text"],input[type="password"]
        {
            border-radius:7px;
            border-style:groove;
            padding-left:10px;
            height:18px;
            box-shadow: 0 0 5px #333;
            outline: none;
            border: 1px solid #ffa853;
            
        }
        .conto input[type="submit"]
        {
            border-radius:8px;
            border-style:groove;
            height:30px;
            width:100px;
            background-color:#2762f7;
           color:whitesmoke;
           font-size:medium;
        }
        
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content1" runat="Server">
    <div id="content">
        <div id="myStyle">
            
            <table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <th colspan="3">
            Registration
        </th>
    </tr>
    <tr>
        <td>
            User ID
        </td>
        <td>
            <asp:TextBox ID="txtUserid" runat="server" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtUserid"
                runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Password
        </td>
        <td>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
        </td>
        <td>
            <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPassword"
                runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Confirm Password
        </td>
        <td>
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" />
        </td>
        <td>
            <asp:CompareValidator ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="txtPassword"
                ControlToValidate="txtConfirmPassword" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Lib :<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Lib_Id"></asp:DropDownList>
        </td>
        <td>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Library]"></asp:SqlDataSource>
            
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
            <asp:Button Text="Submit" runat="server" OnClick="RegisterUser" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>

            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

        </div>
    </div>
</asp:Content>

