<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/AdminMaster.master" CodeBehind="UpdateEbook.aspx.cs" Inherits="WDDNProject.PageAdmin.UpdateEbook" %>

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

                                <asp:Label ID="Label5" runat="server" Text="BookName"></asp:Label>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="store">*</asp:RequiredFieldValidator>
 
                                <asp:Label ID="dupisbn" runat="server" Text="Label"></asp:Label>
                                <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />
 
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
                                <asp:DropDownList ID="DropDownList1" CssClass="ddstyle" runat="server" Height="23px" Width="128px" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Category_Id">
                                 
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
                                &nbsp;</td>
                        </tr>
 
                        

                    </table>
                </asp:Panel>
                <asp:RoundedCornersExtender ID="RoundedCornersExtender2" runat="server" TargetControlID="Panel1" Radius="12"></asp:RoundedCornersExtender>
            </ContentTemplate>
        </asp:UpdatePanel>
        
        </div>
   
 </asp:Content>