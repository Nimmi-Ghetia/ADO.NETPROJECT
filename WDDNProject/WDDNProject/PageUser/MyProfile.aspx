<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MasterUser.master" AutoEventWireup="true" Inherits="PageUser_MyProfile" Codebehind="MyProfile.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentuser" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div align="right"><a href="../PageUser/DeleteAccount.aspx" runat="server">Delete account</a></div>
     <div id="content">
        <div class="search">
             <table cellpadding="5" cellspacing="2" style="width: 573px; text-align:center; margin-right: 0px;">
                <tr>
                    <th colspan="3">Fill Your Info</th>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                
                <tr>
                    <td>E-mail</td>
                    <td>
                        <asp:TextBox ID="txtmail" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" Height="94px" TextMode="MultiLine" Width="270px" CssClass="ddstyle"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="SUBMIT" OnClick="Button1_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="" ></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        
        </div>
           
     </div>
</asp:Content>

