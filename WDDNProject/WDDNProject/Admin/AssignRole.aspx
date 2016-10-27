﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/AdminMaster.master" CodeBehind="AssignRole.aspx.cs" Inherits="WDDNProject.Admin.AssignRole" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentuser" runat="Server">
    <style type="text/css">
        .fancy-green .ajax__tab_header {
            background: url('../Images/green_bg_Tab.gif') repeat-x;
            cursor: pointer;
        }

        .fancy-green .ajax__tab_hover .ajax__tab_outer, .fancy-green .ajax__tab_active .ajax__tab_outer {
            background: url('../Images/green_left_Tab.gif') no-repeat left top;
        }

        .fancy-green .ajax__tab_hover .ajax__tab_inner, .fancy-green .ajax__tab_active .ajax__tab_inner {
            background: url('../Images/green_right_Tab.gif') no-repeat right top;
        }

        .fancy .ajax__tab_header {
            font-size: 13px;
            font-weight: bold;
            color: #000;
            font-family: sans-serif;
        }

            .fancy .ajax__tab_active .ajax__tab_outer, .fancy .ajax__tab_header .ajax__tab_outer, .fancy .ajax__tab_hover .ajax__tab_outer {
                height: 46px;
            }

            .fancy .ajax__tab_active .ajax__tab_inner, .fancy .ajax__tab_header .ajax__tab_inner, .fancy .ajax__tab_hover .ajax__tab_inner {
                height: 46px;
                margin-left: 16px; /* offset the width of the left image */
            }

            .fancy .ajax__tab_active .ajax__tab_tab, .fancy .ajax__tab_hover .ajax__tab_tab, .fancy .ajax__tab_header .ajax__tab_tab {
                margin: 16px 16px 0px 0px;
            }

        .fancy .ajax__tab_hover .ajax__tab_tab, .fancy .ajax__tab_active .ajax__tab_tab {
            color: #fff;
        }

        .fancy .ajax__tab_body {
            font-family: Arial;
            font-size: 10pt;
            border-top: 0;
            border: 1px solid #999999;
            padding: 8px;
            background-color: #ffffff;
        }

        .but {
            border-radius: 8px;
            border-style: groove;
            height: 38px;
            width: 120px;
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
        <div style="width: 70%">
            <div align="center">   Create Role</div>                 

                        <table align="center">
                            <tr>
                                <td><b>Enter RoleName:</b> </td>
                                <td>
                                    <asp:TextBox ID="txtRole" runat="server" />
                                    <asp:RequiredFieldValidator ControlToValidate="txtRole" ForeColor="Red" ID="req" runat="server" ErrorMessage="*" ValidationGroup="myg"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td><b>Enter Role Desscription:</b> </td>
                                <td>
                                    <asp:TextBox ID="txtdsc" runat="server" />
                                    <asp:RequiredFieldValidator ControlToValidate="txtRole" ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ValidationGroup="myg"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="btnCreate" runat="server" Text="Create Role" OnClick="btnCreate_Click" ValidationGroup="myg" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblResult" runat="server" Font-Bold="true" /></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [UserType]"></asp:SqlDataSource>
                                    <asp:GridView ID="gvRoles" runat="server" CssClass="Gridview" Width="200px" AutoGenerateColumns="False" AutoGenerateDeleteButton="True"  
                                         OnSelectedIndexChanged="gvRoles_SelectedIndexChanged" DataKeyNames="Role_Id" DataSourceID="SqlDataSource1">
                                        <HeaderStyle BackColor="#df5015" />
                                        <Columns>
                                            <asp:BoundField DataField="Role_Id" HeaderText="Role_Id" ReadOnly="True" SortExpression="Role_Id" />
                                            <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    <div align="center">Asign Role<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [User_Id], [name] FROM [users]"></asp:SqlDataSource>
            </div>
                    


                        <table align="center">
                            <tr>
                                <td><b>Select User:</b> 
                                   
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlUsers" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlUsers_SelectedIndexChanged" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="User_Id" />
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Role] FROM [UserType]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="Gridview" AutoGenerateColumns="False" Width="150px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataSourceID="SqlDataSource3">
                                        <HeaderStyle BackColor="#df5015" />
                                        <Columns>
                                            <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                                            <asp:CheckBoxField Text="select" />
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="btnAssign" runat="server" Text="Assign or UnAssign" OnClick="btnAssign_Click" /></td>
                            </tr>
                        </table>
                        <div align="center">
                            <asp:Label ID="lblSuccess" runat="server" Font-Bold="true" />
                            <br />
                            <asp:Label ID="lblError" runat="server" Font-Bold="true" />
                        </div>


                 
      
        </div>
    </div>
</asp:Content>
