<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/AdminMaster.master" CodeBehind="StoreEbook.aspx.cs" Inherits="WDDNProject.PageAdmin.StoreEbook" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentuser" runat="Server">
    <style>
        .st {
            color: #F5F5F5;
            text-align: left;
            background-color: #00C6C6;
            border-radius: 12px;
            opacity: 80;
            padding: 10px;
            font-size: medium;
            font-weight: 500;
            font-family: 'Palatino Linotype';
        }

            .st input[type="text"], input[type="password"], input[type="label"] {
                border-radius: 7px;
                border-style: groove;
                padding-left: 15px;
                height: 20px;
                box-shadow: 0 0 5px #333;
                outline: none;
                border: 1px solid #ffa853;
                margin-top: 15px;
            }

            .st input[type="submit"],input[type="button"] {
                border-radius: 8px;
                border-style: groove;
                height: 40px;
                width: 100px;
                background-color: #2762f7;
                color: whitesmoke;
                font-size: medium;
                margin-top: 15px;
                vertical-align: central;
                text-align: center;
            }
        .auto-style1 {
            height: 38px;
        }
        .auto-style2 {
            width: 43px;
            height: 38px;
        }
    </style>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div id="content">
        <br />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
     
    <div id="content">
        <p>
            <asp:Button ID="bview" runat="server" CssClass="button" Text="View Books" OnClick="bview_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="badd" runat="server" CssClass="button" Text="Add Books"  OnClick="badd_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="bupd" runat="server" CssClass="button" Text="Update Books"  OnClick="bupd_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="bdel" runat="server" CssClass="button" Text="Delete Books"  OnClick="bdel_Click" />
        </p>
        <br />
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
        
               <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Panel ID="formatTable" class="st" runat="server" Width="565px">
                    <table style="width: 573px; margin-right: 0px;" cellpadding="5" cellspacing="2" id="formtable">
                        <tr>
                            <td colspan="3" style="text-align: center">
                                <asp:Label ID="Label1" Font-Size="Large" runat="server" Text="Enter details of new books"></asp:Label>
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                       
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Label ID="lblISBN" runat="server" Text="ISBN"></asp:Label>
                            </td>
                            <td style="width: 43px">&nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtIsbn" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rq5" runat="server" ControlToValidate="txtIsbn" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="store">*</asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td style="height: 34px"></td>
                            <td style="height: 34px">
                                <asp:Label ID="lblBookName" runat="server" Text="BookName"></asp:Label>
                            </td>
                            <td style="height: 34px; width: 43px;"></td>
                            <td style="height: 34px">
                                <asp:TextBox ID="txtbk_name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rq6" runat="server" ControlToValidate="txtbk_name" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="store">*</asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Label ID="lblAuthor" runat="server" Text="Author"></asp:Label>
                            </td>
                            <td style="width: 43px">&nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtAuth_name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rq3" runat="server" ControlToValidate="txtAuth_name" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="store">*</asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td class="auto-style1"></td>
                            <td class="auto-style1">
                                <asp:Label ID="lblPublisher" runat="server" Text="Publisher"></asp:Label>
                            </td>
                            <td class="auto-style2"></td>
                            <td class="auto-style1">
                                <asp:TextBox ID="txtPublisher" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rq4" runat="server" ControlToValidate="txtPublisher" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="store">*</asp:RequiredFieldValidator>
                                
                            </td>

                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label>
                            </td>
                            <td style="width: 43px">&nbsp;</td>
                            <td>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                                <asp:DropDownList ID="ddlCat" CssClass="ddstyle" runat="server" Height="23px" Width="128px" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Category_Id">
                                 
                                </asp:DropDownList>
                            </td>

                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Label ID="txt" runat="server" Text="Link"></asp:Label>
                            </td>
                            <td style="width: 43px">&nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtLink" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLink" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="store">*</asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td colspan="2" style="text-align: center; align-items: center">
                                <br />
                                <asp:Button ID="btnSubmit" CssClass="st" runat="server" Text="SUBMIT" ValidationGroup="store" OnClick="btnSubmit_Click" />
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>

                            <td colspan="2">
                                <asp:Label ID="storeMsg" runat="server" Font-Size="Medium" Text=""></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
 
                        

                    </table>
                </asp:Panel>
                <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="formatTable" Radius="12"></asp:RoundedCornersExtender>
            </ContentTemplate>
        </asp:UpdatePanel>
        
        
        
        
        
        
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Panel ID="Panel1" class="st" runat="server" Width="565px">
                    <table style="width: 573px; margin-right: 0px;" cellpadding="5" cellspacing="2" id="t1">
                        <tr>
                            <td colspan="3" style="text-align: center">
                                <asp:Label ID="Label3" Font-Size="Large" runat="server" Text="Enter details to update books"></asp:Label>
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                       
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="ISBN"></asp:Label>
                            </td>
                            <td style="width: 43px">&nbsp;</td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="store">*</asp:RequiredFieldValidator>
                                <asp:Label ID="dupisbn" runat="server" Text="Label"></asp:Label>
                            </td>

                        </tr>
                        <tr>
                            <td></td>
                            <td><asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" /></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="height: 34px"></td>
                            <td style="height: 34px">
                                
                                <asp:Label ID="Label5" runat="server" Text="BookName"></asp:Label>
                            </td>
                            <td style="height: 34px; width: 43px;"></td>
                            <td style="height: 34px">
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="store">*</asp:RequiredFieldValidator>
                                
                            </td>

                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Author"></asp:Label>
                            </td>
                            <td style="width: 43px">&nbsp;</td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="store">*</asp:RequiredFieldValidator>
                                
                            </td>

                        </tr>
                        <tr>
                            <td class="auto-style1"></td>
                            <td class="auto-style1">
                                <asp:Label ID="Label7" runat="server" Text="Publisher"></asp:Label>
                            </td>
                            <td class="auto-style2"></td>
                            <td class="auto-style1">
                                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="store">*</asp:RequiredFieldValidator>
                                
                            </td>

                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text="Category"></asp:Label>
                            </td>
                            <td style="width: 43px">&nbsp;</td>
                            <td>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                                <asp:DropDownList ID="DropDownList1" CssClass="ddstyle" runat="server" Height="23px" Width="128px" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Category_Id">
                                 
                                </asp:DropDownList>
                            </td>

                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Label ID="Label9" runat="server" Text="Link"></asp:Label>
                            </td>
                            <td style="width: 43px">&nbsp;</td>
                            <td>
                                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="store">*</asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td colspan="2" style="text-align: center; align-items: center">
                                <br />
                                <asp:Button ID="Button1" CssClass="st" runat="server" Text="SUBMIT" ValidationGroup="store" OnClick="btnSubmit1_Click" />
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>

                            <td colspan="2">
                                <asp:Label ID="Label10" runat="server" Font-Size="Medium" Text=""></asp:Label>
                            </td>
                            <td>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
                            </td>
                        </tr>
 
                        

                    </table>
                </asp:Panel>
                <asp:RoundedCornersExtender ID="RoundedCornersExtender2" runat="server" TargetControlID="Panel1" Radius="12"></asp:RoundedCornersExtender>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <asp:Panel ID="Panel2" class="st" runat="server" Width="565px">

                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Book.Book_Id, Book.Title, Book.Author, Book.Publisher, Category.Name, Library.Name AS Lib
 FROM Book INNER JOIN Category ON Book.category_id = Category.Category_Id INNER JOIN Library ON Book.LIB_ID = Library.Lib_Id" DeleteCommand="delete from Book "></asp:SqlDataSource>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Book_Id" DataSourceID="SqlDataSource1">
                    <EmptyDataTemplate>
                        <asp:Label ID="lblEmpty" runat="server" Text="No e-books Founds"></asp:Label>
                    </EmptyDataTemplate>
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="Book_Id" HeaderText="Book Id" ReadOnly="True" SortExpression="Book_Id" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                <asp:BoundField DataField="Publisher" HeaderText="Publisher" SortExpression="Publisher" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                
            </Columns>
        </asp:GridView>

    </div>
                                    </asp:Panel>
               
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
    </div>
</asp:Content>

