<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="_181052N_AS_assignment_.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


        .bg {
            width: 70%;
            margin-left: auto;
            margin-right: auto;
            background-color: #D6DBDF; 
            padding: 2% 0 2% 2%;
            margin-top: 3%;
            border-radius: 1%;
            border: 1px solid #EDBB99;
        }

        .textbox-style {
            margin-left: 34px;
            border: none;
            border-radius: 3%;
            border: 1px solid #ECF0F1;
        }

        .submitbtn {
            border: none;
            background-color: #839192; 
            border: 1px solid #2E4053;
            font-size: 100%;
        }

            </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <div class="bg">
          
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblLogin" runat="server" Text="Home Page" Font-Bold="True" Font-Underline="True"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            <asp:Label ID="Homelabel" runat="server"></asp:Label>
            <br />
&nbsp;<br />
            <br />
            <asp:Label ID="welcomealert" runat="server" Font-Bold="True"></asp:Label>
            <br />
            <p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "You are currently logged in"</p>
            <br />
            <asp:Button ID="btnLogout" runat="server" Height="42px" OnClick="Button1_Click" Text="Log Out" Width="99px" CssClass="submitbtn" Font-Bold="True" />
            <br />
        </div>
        </div>
    </form>
</body>
</html>
