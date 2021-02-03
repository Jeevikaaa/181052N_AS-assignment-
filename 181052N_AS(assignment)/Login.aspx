<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="_181052N_AS_assignment_.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Form</title> 
            <script src="https://www.google.com/recaptcha/api.js?render=6LdOn0IaAAAAALDtVJQ9Ne3YD3m8WOAYYgPgNq0O"></script>

    <style type="text/css">
        .auto-style1 {
            margin-left: 32px;
        }
        .auto-style2 {
            margin-left: 637px;
        }
        .auto-style3 {
            margin-left: 29px;
        }
    </style>
    <script>
        function fnShowMessage() {
            alert(" Invoke Javascript function from Server Side Code Behind ");
        }
    </script>
</head>
<body>
    <fieldset>
    <form id="form1" runat="server">

          <input type ="hidden" id="g-recaptcha-response" name="g-recaptcha-response" />
        
        
        <div>
            <asp:Label ID="alertLabel" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Username:"></asp:Label>
            <asp:TextBox ID="tb_userid" runat="server" CssClass="auto-style3" Height="25px" Width="137px"></asp:TextBox>
            <br />
        </div>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox ID="tb_pwd" runat="server" CssClass="auto-style1" Height="24px" Width="142px" TextMode="Password"></asp:TextBox>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="btnSubmit" runat="server" Text="Login" Height="27px" Width="133px" OnClick="btnSubmit_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <%--  <asp:Button ID="btnlogout" runat="server" Text="Log Out" Height="27px" Width="133px" OnClick="btnSubmit_Click" />--%>
        </p>
&nbsp;<div class="g-recaptcha" data-sitekey="6Lfx8jwaAAAAAGcsACKT103eMev3_FDgFr3XtvAy"></div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="pwdchange" runat="server" Text="CLICK ME TO CHANGE PASSWORD" CssClass="auto-style2" OnClick="pwdchange_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    </form>


    </fieldset>

    <script>
        grecaptcha.ready(function () {
            grecaptcha.execute('6Lfx8jwaAAAAAGcsACKT103eMev3_FDgFr3XtvAy', { action: 'Login' }).then(function (token) {
                document.getElementById("g-recaptcha-response").value = token;
            });
        });
       
    </script>

</body>

</html>
