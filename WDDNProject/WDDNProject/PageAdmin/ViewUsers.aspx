<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/AdminMaster.master" CodeBehind="ViewUsers.aspx.cs" Inherits="WDDNProject.PageAdmin.ViewUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentuser" runat="Server">
    <style>
        .ModPop {
            background-color: #FFFFFF;
            width: 350px;
            border: 3px solid #0DA9D0;
        }

            .ModPop .popHead {
                background-color: #2FBDF1;
                height: 30px;
                color: white;
                line-height: 30px;
                text-align: center;
                font-weight: bold;
            }

            .ModPop .popBody {
                min-height: 70px;
                text-align: center;
                padding: 5px;
                line-height: 30px;
            }

            .ModPop .popFoot {
                padding: 3px;
            }

            .button
             {
                height: 23px;
                color: White;
               
                text-align: center;
                font-weight: bold;
                cursor: pointer;
                background-color: #0099FF;
                border: 1px solid #5C5C5C;
                margin-top:2px;
                margin-bottom:3px;
                border-radius:6px;
                border-style:groove;
                box-shadow:white 2px 2px;
             }

            .ModPop td 
            {
                text-align: left;
            }

        .GridStyle {
            text-align: center;
        }
    </style>




    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div id="DivUser" class="InfoStyle">   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [users] WHERE [User_Id] = @User_Id" InsertCommand="INSERT INTO [users] ([User_Id], [name], [address], [password], [email_id]) VALUES (@User_Id, @name, @address, @password, @email_id)" SelectCommand="SELECT * FROM [users]" UpdateCommand="UPDATE [users] SET [name] = @name, [address] = @address, [password] = @password, [email_id] = @email_id WHERE [User_Id] = @User_Id">
        <DeleteParameters>
            <asp:Parameter Name="User_Id" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="User_Id" Type="String" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email_id" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email_id" Type="String" />
            <asp:Parameter Name="User_Id" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" AutoGenerateColumns="False" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" CssClass="GridStyle" runat="server"  DataKeyNames="User_Id" DataSourceID="SqlDataSource1">
                      <EmptyDataTemplate>
                        <asp:Label ID="lblEmpty" runat="server" Text="No Users Founds"></asp:Label>
                    </EmptyDataTemplate>
      
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="User_Id" HeaderText="User Id" ReadOnly="True" SortExpression="User_Id" />
            <asp:BoundField DataField="Name" HeaderText="name" SortExpression="name" />
            <asp:BoundField DataField="Address" HeaderText="address" SortExpression="address" />
            
            <asp:BoundField DataField="Email_id" HeaderText="email_id" SortExpression="email_id" />
        </Columns>
                      <HeaderStyle BackColor="#3AC0F2" ForeColor="White" />
 
    </asp:GridView>
         </div>
</asp:Content>