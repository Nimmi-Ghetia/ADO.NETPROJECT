<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/MasterUser.master" CodeBehind="DeleteAccount.aspx.cs" Inherits="WDDNProject.PageUser.DeleteAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentuser" runat="Server">
   <br /><div align="center"> <asp:dropdownlist ID="ddl" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Lib_Id"></asp:dropdownlist></div>
<br /><br /><div align="center"><asp:button runat="server" ID="clk" text="Button" OnClick="clk_Click" /></div>
    <br /><br /><div align="center"><asp:Label ID="Label1" runat="server" Text=""></asp:Label></div>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Library]"></asp:SqlDataSource>
    </asp:Content>