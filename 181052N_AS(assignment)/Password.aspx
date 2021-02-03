<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Password.aspx.cs" Inherits="_181052N_AS_assignment_.Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Password Changing Page</title>

    <!--Place the input validation here>-->

    <!--This validation is to check the length of the password>-->
    <script type="text/javascript">
        function validate() {
            var str = document.getElementById('<%=tbPassword.ClientID %>').value;


            if (str.length < 8) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password Length Must be at Least 8 Characters Long";
                document.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("too_short");
            }

            else if (str.search(/[0-9]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password requires at least 1 number";
                document.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("too_short");
            }

            else if (str.search(/[@#$%&]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password requires at least 1 special char";
                document.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("too_short");
            }

            else if (str.search(/[A-Z]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password requires at least 1 uppercase char";
                document.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("too_short");
            }

            else if (str.search(/[a-z]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password requires at least 1 lowercase char";
                document.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("too_short");
            }


            document.getElementById("lbl_pwdchecker").innerHTML = "Excellent!"
            document.getElementById("lbl-pwdchecker").style.color = "Blue";

           

            password.onchange = validatePassword;
            confirm_password.onkeyup = validatePassword;
        }
           
    </script>

    <style type="text/css">



        .bg {
            width: 70%;
            margin-left: auto;
            margin-right: auto;
            background-color:#A9DFBF; 
            padding: 2% 0 2% 2%;
            margin-top: 3%;
            border-radius: 1%;
            border: 1px solid #EDBB99;
        }

        .confirmbtn {
            border: none;
            background-color: #D0D3D4; 
            border: 1px solid #2E4053;
            font-size: 100%;
        }

            .auto-style1 {
            margin-left: 23px;
        }

            </style>
</head>
<body>
    <form id="form2" runat="server">
        <div>
        <div class="bg">
          
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <asp:Label ID="lblLogin" runat="server" Text="Password Change Page" Font-Bold="True" Font-Underline="True"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
             <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
             <br />
             <asp:Label ID="Label1" runat="server" Text="Username:"></asp:Label>
             <asp:TextBox ID="txtUsername" text =" " runat="server" ></asp:TextBox>

&nbsp;&nbsp;<asp:RequiredFieldValidator ID="pwrequired3" runat="server" ErrorMessage=" Empty Field!" ControlToValidate="tbPassword2" Style="font-size: 90%; color: red;"  ></asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp;

            <asp:Label ID="pwd1" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox ID="tbPassword" text =" " runat="server"  textmode ="password" CssClass="auto-style1" onkeyup =" javascript:validate()"></asp:TextBox>

            &nbsp;&nbsp; 
            <asp:RequiredFieldValidator ID="pwrequired1" runat="server" ErrorMessage=" Empty Field!" ControlToValidate="tbPassword" Style="font-size: 90%; color: red;" ></asp:RequiredFieldValidator>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbl_pwdchecker" runat="server" Text="pwdchecker"></asp:Label>
            <br />
            <br />
            <asp:Label ID="pwd2" runat="server" Text="Re-Confirm Password:"></asp:Label>
            <asp:TextBox ID="tbPassword2" text =" " runat="server" textmode ="password" CssClass="auto-style1"  onkeyup =" javascript:validate()"></asp:TextBox>
            &nbsp;
           <asp:RequiredFieldValidator ID="pwrequired2" runat="server" ErrorMessage=" Empty Field!" ControlToValidate="tbPassword2" Style="font-size: 90%; color: red;"  ></asp:RequiredFieldValidator>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="confirmbtn" runat="server" Height="42px" OnClick="Button1_Click" Text="Confirm Change" Width="189px" CssClass="submitbtn" Font-Bold="True" />
            <br />
        </div>
        </div>
    </form>
  
</body>
</html>
