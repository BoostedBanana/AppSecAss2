<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="AppSecAss2.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server">Home</asp:Label>
            <br />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnRegistration" runat="server" Text="Registration" OnClick="btnRegistration_Click" />
            <br />
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" />
            <br />
            <br />
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="LogoutMe" Visible="false" />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
