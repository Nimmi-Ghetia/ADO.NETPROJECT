<%@ Page Language="C#" MasterPageFile="~/Master/AdminMaster.master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="WDDNProject.PageAdmin.AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentuser" Runat="Server">
    <style type="text/css">
        .gvStyle
        {
            text-align:center;
            margin-left:10px;
        }
    </style>
    <div id="content">
        <p>
            <asp:Button ID="btnAddReq" runat="server" Text="Show add account request of the user" Height="30" ForeColor="Green" OnClick="btnaddReq_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnAdded" runat="server" Text="Show information of added user" Height="30" ForeColor="Green" OnClick="btnAdded_Click" />
        </p>
        <p>
            <asp:Label ID="addInfo" runat="server" Text="Add The Account Of Following Users " Font-Size="Medium" Font-Bold="true" Visible="false" ForeColor="Turquoise"></asp:Label>
        </p>

        <asp:GridView ID="gvAdd" runat="server" OnSelectedIndexChanged="gvAdd_SelectedIndexChanged" Width="465px" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White">
            <Columns>
                <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Add" />
            </Columns>
            <EmptyDataTemplate>
                <p style="color:#0099FF; padding-left:15px;"> Sorry ...!!! No user request found.</p>
            </EmptyDataTemplate>
        </asp:GridView>
        <p>
            <asp:Label ID="lbladd" runat="server" Visible="false"></asp:Label>
        </p>
        <p>
            <asp:Label ID="lblAddInfo" ForeColor="#0099FF" runat="server" Text="Information of added user : " Visible="false"></asp:Label>
        </p>
        <asp:GridView ID="gvaddeduser" AutoGenerateColumns="false" DataKeyNames="User_Id" runat="server" Visible="false" Width="729px" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" CssClass="gvStyle">
            <EmptyDataTemplate>
                <asp:Label ID="lblEmpty" style="color:#0099FF; padding-left:15px;" runat="server" Text="No User Has Been Deleted Yet."></asp:Label>
            </EmptyDataTemplate>
            <Columns>
                <asp:BoundField DataField="User_Id" HeaderText="User" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="email_id" HeaderText="Email" />
                <asp:BoundField DataField="address" HeaderText="Address" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

