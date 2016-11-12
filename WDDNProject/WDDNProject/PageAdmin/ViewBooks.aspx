<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/AdminMaster.master" CodeBehind="ViewBooks.aspx.cs" Inherits="WDDNProject.PageAdmin.ViewBooks" %>
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
     <!--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Book] WHERE [Book_Id] = @Book_Id" InsertCommand="INSERT INTO [Book] ([Book_Id], [LIB_ID], [category_id], [Title], [Author], [Publisher], [Book_Type], [Link], [Status]) VALUES (@Book_Id, @LIB_ID, @category_id, @Title, @Author, @Publisher, @Book_Type, @Link, @Status)" SelectCommand="SELECT * FROM [Book]" UpdateCommand="UPDATE [Book] SET [LIB_ID] = @LIB_ID, [category_id] = @category_id, [Title] = @Title, [Author] = @Author, [Publisher] = @Publisher, [Book_Type] = @Book_Type, [Link] = @Link, [Status] = @Status WHERE [Book_Id] = @Book_Id">
         <DeleteParameters>
             <asp:Parameter Name="Book_Id" Type="String" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="Book_Id" Type="String" />
             <asp:Parameter Name="LIB_ID" Type="Int32" />
             <asp:Parameter Name="category_id" Type="Int32" />
             <asp:Parameter Name="Title" Type="String" />
             <asp:Parameter Name="Author" Type="String" />
             <asp:Parameter Name="Publisher" Type="String" />
             <asp:Parameter Name="Book_Type" Type="String" />
             <asp:Parameter Name="Link" Type="String" />
             <asp:Parameter Name="Status" Type="String" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="LIB_ID" Type="Int32" />
             <asp:Parameter Name="category_id" Type="Int32" />
             <asp:Parameter Name="Title" Type="String" />
             <asp:Parameter Name="Author" Type="String" />
             <asp:Parameter Name="Publisher" Type="String" />
             <asp:Parameter Name="Book_Type" Type="String" />
             <asp:Parameter Name="Link" Type="String" />
             <asp:Parameter Name="Status" Type="String" />
             <asp:Parameter Name="Book_Id" Type="String" />
         </UpdateParameters>
    </asp:SqlDataSource>
    
                <div class="popHead">
                Details
            </div>
        <div class="PopBody" style="padding-left: 5px; padding-top: 3px;">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Book_Id" DataSourceID="SqlDataSource1" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" CssClass="GridStyle">
                      <EmptyDataTemplate>
                        <asp:Label ID="lblEmpty" runat="server" Text="No Users Founds"></asp:Label>
                    </EmptyDataTemplate>
 
       <Columns>
            <asp:BoundField DataField="Book Id" HeaderText="Book_Id" ReadOnly="True" SortExpression="Book_Id" />
            <asp:BoundField DataField="LIB ID" HeaderText="LIB_ID" SortExpression="LIB_ID" />
            <asp:BoundField DataField="category_id" HeaderText="category_id" SortExpression="category_id" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
            <asp:BoundField DataField="Publisher" HeaderText="Publisher" SortExpression="Publisher" />
            <asp:BoundField DataField="Book_Type" HeaderText="Book_Type" SortExpression="Book_Type" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
        </Columns>

<HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>
    </asp:GridView>
           </div>
    
     <div id="DivUser" class="InfoStyle">   
     </div>-->
</asp:Content>