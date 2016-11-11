<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" MasterPageFile="~/Master/MasterPage.master" Inherits="WDDNProject.PageUser.LoginPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css" >
        .myt
        {
            color:#F5F5F5; width:450px; 
            text-align:left; 
            background-color:#00C6C6; 
            border-radius:12px; 
            opacity:80; 
            padding:10px; 
            font-size: medium;
            font-weight: 500; 
            font-family: 'Palatino Linotype';
        }
        .conto input[type="text"],input[type="password"],input[type="label"]
        {
            border-radius:7px;
            border-style:groove;
            padding-left:15px;
            height:20px;
            box-shadow: 0 0 5px #333;
            outline: none;
            border: 1px solid #ffa853;
            margin-top:15px;
            
        }
        .conto input[type="button"]
        {
            border-radius:8px;
            border-style:groove;
            height:30px;
            width:100px;
            background-color:#2762f7;
           color:whitesmoke;
           font-size:medium;
           margin-top:15px;
        }
        .lab
        {
             margin-top:15px;
        }
        
        
         .conto {
             height: 26px;
         }
        
        
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div id="content">
        <div id="log" class="myt" style="width:410px;display:block;float:left; ">
          <div align="center" CssClass="conto">Log in</div>
            <br />Username :<asp:TextBox ID="unm" runat="server" CssClass="conto"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="unm"
            ErrorMessage="Username Required"></asp:RequiredFieldValidator>
            <br />Password :<asp:TextBox ID="pwd" runat="server" CssClass="conto" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="pwd"
            ErrorMessage="Password Required"></asp:RequiredFieldValidator>
            <br /><asp:Button runat="server" Text="Log in" CssClass="conto" VerticalAlign="Middle" OnClick="Button_Clicked"></asp:Button>
            <br /><br /><asp:Button runat="server" Text="Register" CssClass="conto" VerticalAlign="Middle" OnClick="Button1_Clicked"></asp:Button>
            <asp:Label ID="Label1" runat="server" Text="" VerticalAlign="Middle" CssClass="conto"></asp:Label>
        </div>
        
        
        
    </div>
</asp:Content>

