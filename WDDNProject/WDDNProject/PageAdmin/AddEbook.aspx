<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/AdminMaster.master" CodeBehind="AddEbook.aspx.cs" Inherits="WDDNProject.PageAdmin.AddEbook" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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

            .st input[type="submit"] {
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
    </style>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div id="content">
        <br />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>


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
        </div>
    </asp:Content>