<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/MasterPage.master" CodeBehind="Search.aspx.cs" Inherits="WDDNProject.PageCommon.Search" %>

<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="style/style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content1" runat="Server">
    <div id="content" >
        
        <div class="search">
            <br />
            <div align="center"><p><b> Search Books </b> </p> </div>
            <table style="width: 100%">
            <tr>
                <td colspan="3">Search On The Basis Of<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Category_Id], [Name] FROM [Category]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>Book Name :
                    <asp:TextBox ID="txtBookname" runat="server" placeholder="Book Name"></asp:TextBox></td>
                <td>Author Name :
                    <asp:TextBox ID="txtAuthorname" runat="server" placeholder="Author Name"></asp:TextBox></td>
                <td>Category :
                    <asp:DropDownList ID="dlCategory" runat="server" CssClass="ddstyle" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Category_Id" >
                        
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="Label1" runat="server" ></asp:Label>
                    <center><asp:ImageButton ID="imgSearchbooks" runat="server" ImageUrl="~/Images/search.png" OnClick="imgSearchbooks_Click"></asp:ImageButton></center>
                </td>
            </tr>
           
        </table>
            
        </div>
         <asp:Panel ID="Panel1" runat="server" Visible="false">
                     <asp:Label ID="lblmsg" runat="server" Text="Please Enter BookName or AuthorName or Select the category"></asp:Label>
            </asp:Panel>

        
        <asp:Panel ID="gpanel" runat="server" Visible="false">
             <cc1:Grid ID="GridShow" runat="server" AllowPaging="true" AllowPageSizeSelection="true" Serialize="true" AutoGenerateColumns="false" AllowAddingRecords="false" >
           <Columns>
                <cc1:Column ID="Book_Id" HeaderText="Book Id" DataField="Book_Id" ReadOnly="true"></cc1:Column>
                <cc1:Column ID="Title" HeaderText="Title" DataField="Title" ReadOnly="true"></cc1:Column>
                <cc1:Column ID="Author" HeaderText="Author" DataField="Author" ReadOnly="true"></cc1:Column>
                <cc1:Column ID="Category" HeaderText="Category Id" DataField="category_id" ReadOnly="true"></cc1:Column>
                <cc1:Column ID="Publisher" HeaderText="Publisher" DataField="Publisher" ReadOnly="true"></cc1:Column>
            </Columns>
        </cc1:Grid>
        </asp:Panel>
        
    </div>
</asp:Content>

