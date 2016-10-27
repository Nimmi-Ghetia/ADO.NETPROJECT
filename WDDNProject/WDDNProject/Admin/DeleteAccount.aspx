<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/AdminMaster.master" CodeBehind="DeleteAccount.aspx.cs" Inherits="WDDNProject.Admin.DeleteAccount" %>

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
            <asp:Button ID="btnDelReq" runat="server" Text="Show delete list of the user" Height="30" ForeColor="Green" OnClick="btnDelReq_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
        </p>
        <p>
            <asp:Label ID="delInfo" runat="server" Text="Delete The Account Of Following Users " Font-Size="Medium" Font-Bold="true" Visible="false" ForeColor="Turquoise"></asp:Label>
        </p>

        <asp:GridView ID="gvDelete" runat="server" OnSelectedIndexChanged="gvDelete_SelectedIndexChanged" Width="465px" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White">
            <Columns>
                <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Delete" />
            </Columns>
            <EmptyDataTemplate>
                <p style="color:#0099FF; padding-left:15px;"> Sorry ...!!! No user found.</p>
            </EmptyDataTemplate>
        </asp:GridView>
        <p>
            <asp:Label ID="lbldelete" runat="server" Visible="false"></asp:Label>
        </p>
        
        <asp:GridView ID="gvdeleteduser" AutoGenerateColumns="false" DataKeyNames="DelID" runat="server" Visible="false" Width="729px" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" CssClass="gvStyle">
            <EmptyDataTemplate>
                <asp:Label ID="lblEmpty" style="color:#0099FF; padding-left:15px;" runat="server" Text="No User Has Been Deleted Yet."></asp:Label>
            </EmptyDataTemplate>
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="User" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="EmailID" HeaderText="Email" />
                <asp:BoundField DataField="Address" HeaderText="Address" />
                
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
