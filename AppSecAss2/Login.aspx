<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AppSecAss2.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 29px;
        }
        .auto-style2 {
            margin-left: 27px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Login"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="tbEmail" runat="server" CssClass="auto-style1" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Password: "></asp:Label>
            <asp:TextBox ID="tbPassword" runat="server" CssClass="auto-style2" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
            <br />
            <br />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
