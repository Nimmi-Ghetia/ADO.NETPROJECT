<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/MasterPage.master" CodeBehind="AddAccount.aspx.cs" Inherits="WDDNProject.Admin.AddAccount" %>
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
            align-items:center ;
            text-align:center ;
            
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
           <div align="center"> Sign Up For New Account</div>
            <table>
                <tr>
                    <td>UserName :</td>
                    <td><asp:TextBox ID="unm" runat="server" CssClass="conto" VerticalAlign="Right"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="unm" runat="server" ErrorMessage="Username Required "></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>Name :</td>
                    <td>      <asp:TextBox ID="name" runat="server" CssClass="conto" VerticalAlign="Right"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="name" runat="server" ErrorMessage="Name Required"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td> Password :</td>
                    <td> <asp:TextBox ID="pwd" runat="server" CssClass="conto" VerticalAlign="Middle" TextMode="Password"></asp:TextBox></td>
                    <td>  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="pwd" runat="server" ErrorMessage="Password Required"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>Re-enter Password   :</td>
                    <td><asp:TextBox ID="rpwd" runat="server" CssClass="conto" VerticalAlign="Middle" TextMode="Password"></asp:TextBox></td>
                    <td>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="rpwd" runat="server" ErrorMessage="Re-enter Password Required"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" ControlToValidate="rpwd" ControlToCompare="pwd" runat="server" ErrorMessage="Re-enter Password "></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>Address :</td>
                    <td><asp:TextBox ID="addr" runat="server" CssClass="conto" VerticalAlign="Middle" TextMode="MultiLine"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="addr" runat="server" ErrorMessage="Address Required"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                   <td>Email-id :</td>
                    <td><asp:TextBox ID="email" runat="server" CssClass="conto" VerticalAlign="Middle" TextMode="Email"> </asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="email" runat="server" ErrorMessage="Email-id Required"></asp:RequiredFieldValidator></td>
                </tr>

            </table>
            
          <asp:Button ID="Button1" runat="server" Text="Submit Details" OnClick="Button1_Clicked" /><br />
            <asp:Label ID="Label1" runat="server" CssClass="conto" VerticalAlign="Middle" Text=""/>
        </div>
    </div>
</asp:Content>

