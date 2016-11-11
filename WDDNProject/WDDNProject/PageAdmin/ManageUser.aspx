<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/AdminMaster.master" CodeBehind="ManageUser.aspx.cs" Inherits="WDDNProject.PageAdmin.ManageUser" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
    <div id="content">
        <p>
            <asp:LinkButton ID="btnUsrInfo" runat="server" CssClass="button" Text="Add Users" OnClick="btnUsrInfo_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="btnBookInfo" runat="server" CssClass="button" Text="Delete Users"  OnClick="btnBookInfo_Click" />
        </p>
    </div>
    </asp:Content>