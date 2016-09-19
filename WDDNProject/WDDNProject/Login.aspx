<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WDDNProject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    Username:<asp:TextBox ID="unm" runat="server"></asp:TextBox>
    <br />
    Password:<asp:TextBox id="pwd" runat="server" TextMode="Password"/>
        </br>
       <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Clicked" />
    </div>
    </form>
</body>
</html>
