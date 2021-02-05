<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="AppSecAss2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 12px;
        }
        .auto-style2 {
            margin-left: 98px;
        }
        .auto-style3 {
            margin-left: 72px;
        }
        .auto-style4 {
            margin-left: 30px;
        }
        .auto-style5 {
            margin-left: 41px;
        }
    </style>
    <script src="https://www.google.com/recaptcha/api.js?render=6Ld2WUoaAAAAAK-febwNc4ijeeE7sYVRMCKkzie-"></script>
    <script type="text/javascript">
        function validate() {
            var str = document.getElementById('<%=tbPassword.ClientID %>').value;

            if (str.length < 8) {
                document.getElementById("lblPasswordchecker2").innerHTML = "Password Length must be at least 8 characters";
                document.getElementById("lblPasswordchecker2").style.color = "Red";
                return ("too_short")
            }
            else if (str.search(/[1-9]/) == -1) {
                document.getElementById("lblPasswordchecker2").innerHTML = "Password has to have at least 1 number";
                document.getElementById("lblPasswordchecker2").style.color = "Red";
                return ("no_number");
            }
            else if (str.search(/[!@#$%^&*]/) == -1) {
                document.getElementById("lblPasswordchecker2").innerHTML = "Password has to have at least 1 special character";
                document.getElementById("lblPasswordchecker2").style.color = "Red";
                return ("no_specialcharacter");
            }
            else if (str.search(/[a-z]/) == -1) {
                document.getElementById("lblPasswordchecker2").innerHTML = "Password has to have at least 1 lowercase character";
                document.getElementById("lblPasswordchecker2").style.color = "Red";
                return ("no_lowercasecharacter");
            }
            else if (str.search(/[A-Z]/) == -1) {
                document.getElementById("lblPasswordchecker2").innerHTML = "Password has to have at least 1 uppercase character";
                document.getElementById("lblPasswordchecker2").style.color = "Red";
                return ("no_uppercasecharacter");
            }


            document.getElementById("lblPasswordchecker2").innerHTML = "Excellent!";
            document.getElementById("lblPasswordchecker2").style.color = "Blue"
        }
        function confirmpass() {
            var str = document.getElementById('<%=tbPasswordconfirm.ClientID %>').value;
            var str2 = document.getElementById('<%=tbPassword.ClientID %>').value;
            if (str != str2) {
                document.getElementById("lblPasswordconfirm").innerHTML = "Passwords do not match";
                document.getElementById("lblPasswordconfirm").style.color = "Red";
                return ("unmatching");
            }

            document.getElementById("lblPasswordconfirm").innerHTML = "Passwords match!";
            document.getElementById("lblPasswordconfirm").style.color = "Blue";
        }
        function valname() {
            var str = document.getElementById('<%=tbPassword.ClientID %>').value;

            if (str.length < 8) {
                document.getElementById("lblPasswordchecker2").innerHTML = "Password Length must be at least 8 characters";
                document.getElementById("lblPasswordchecker2").style.color = "Red";
                return ("too_short")
            }
            else if (str.search(/[1-9]/) == -1) {
                document.getElementById("lblPasswordchecker2").innerHTML = "Password has to have at least 1 number";
                document.getElementById("lblPasswordchecker2").style.color = "Red";
                return ("no_number");
            }
            else if (str.search(/[!@#$%^&*]/) == -1) {
                document.getElementById("lblPasswordchecker2").innerHTML = "Password has to have at least 1 special character";
                document.getElementById("lblPasswordchecker2").style.color = "Red";
                return ("no_specialcharacter");
            }
            else if (str.search(/[a-z]/) == -1) {
                document.getElementById("lblPasswordchecker2").innerHTML = "Password has to have at least 1 lowercase character";
                document.getElementById("lblPasswordchecker2").style.color = "Red";
                return ("no_lowercasecharacter");
            }
            else if (str.search(/[A-Z]/) == -1) {
                document.getElementById("lblPasswordchecker2").innerHTML = "Password has to have at least 1 uppercase character";
                document.getElementById("lblPasswordchecker2").style.color = "Red";
                return ("no_uppercasecharacter");
            }


            document.getElementById("lblPasswordchecker2").innerHTML = "Excellent!";
            document.getElementById("lblPasswordchecker2").style.color = "Blue"
        }
        function valEmail() {
            if (str.search (/[@]/) == -1) {
                document.getElementById("lblEmailchecker0").innerHTML = "Invalid email address";
                document.getElementById("lblEmailchecker0").style.color = "Red";
                return ("invalidEmai")
            }

            document.getElementById("lblEmailchecker0").innerHTML = "Excellent!"
            document.getElementById("lblEmailchecker0").style.color = "Blue"
        }

            
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Registration"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="First name: "></asp:Label>
            <asp:TextBox ID="tbFname" runat="server" CssClass="auto-style1"></asp:TextBox>
            <asp:Label ID="lblFnamechecker" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="Last name: "></asp:Label>
            <asp:TextBox ID="tbLname" runat="server" CssClass="auto-style1"></asp:TextBox>
            <asp:Label ID="lblLnamechecker" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Email Address:"></asp:Label>
            <asp:TextBox ID="tbEmail" runat="server" CssClass="auto-style3" onkeyup="javascript:valEmail()"></asp:TextBox>
            <asp:Label ID="lblEmailchecker" runat="server"></asp:Label>
            <asp:Label ID="lblEmailchecker0" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Date of Birth(d/m/y):"></asp:Label>
            <asp:TextBox ID="tbDob" runat="server" CssClass="auto-style4"></asp:TextBox>
            <asp:Label ID="lblDobchecker" runat="server"></asp:Label>
            &nbsp;
            <br />
            <asp:Label ID="Label6" runat="server" Text="Credit card information"></asp:Label>
            <asp:TextBox ID="tbCreditcard" runat="server" CssClass="auto-style1"></asp:TextBox>
            <asp:Label ID="lblCreditchecker" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label7" runat="server" Text="Password: "></asp:Label>
            <asp:TextBox ID="tbPassword" runat="server" CssClass="auto-style2" onkeyup="javascript:validate()" TextMode="Password"></asp:TextBox><!--onkeyup="javascript:validate()"-->
            <asp:Label ID="lblPasswordchecker" runat="server"></asp:Label>
            <asp:Label ID="lblPasswordchecker2" runat="server"></asp:Label>
            <asp:Label ID="lblPasswordchecker3" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btn_checkPassword" runat="server" Text="Check Password" Width="356px" OnClick="btn_checkPassword_Click" />
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" Text="Confirm password: "></asp:Label>
            <asp:TextBox ID="tbPasswordconfirm" runat="server" CssClass="auto-style5" onkeyup="javascript:confirmpass()" TextMode="Password"></asp:TextBox>
            <asp:Label ID="lblPasswordconfirm" runat="server" Text="please confirm your password!"></asp:Label>
            <asp:Label ID="lblPasswordconfirm2" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Register!" Width="356px" OnClick="btnSubmit_Click" />
            <br />
            <br />
            <input type="hidden" id="g-recaptcha-response" name="g-recaptcha-response"/>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
    <script>
        grecaptcha.ready(function () {
            grecaptcha.execute('6Ld2WUoaAAAAAK-febwNc4ijeeE7sYVRMCKkzie-', { action: 'Login' }).then(function (token) {
                document.getElementById("g-recaptcha-response").value = token;
            });
        });
    </script>
</body>
</html>
