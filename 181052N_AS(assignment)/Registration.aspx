<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="_181052N_AS_assignment_.DOB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>

    <!--Place the input validation here>-->

    <!--This validation is to check the length of the password>-->
    <script type="text/javascript">
        function validate() {
            var str = document.getElementById('<%=tb_password.ClientID %>').value;


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
        }
    </script>

    <style type="text/css">
        .textbox-style {
            margin-left: 34px;
            border: none;
            border-radius: 3%;
            border: 1px solid #ECF0F1;
        }

        .bg {
            width: 70%;
            margin-left: auto;
            margin-right: auto;
            background-color: #F6DDCC;
            padding: 2% 0 2% 2%;
            margin-top: 3%;
            border-radius: 1%;
            border: 1px solid #EDBB99;
        }

        .submitbtn {
            border: none;
            background-color: #E59866;
            border: 1px solid #D35400;
            font-size: 100%;
        }

            .submitbtn:hover {
                cursor: pointer;
                background-color: #E59866;
            }
        .auto-style1 {
            margin-left: 8px;
            border: none;
            border-radius: 3%;
            border: 1px solid #ECF0F1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="bg">
          
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <asp:Label ID="lblRegister" runat="server" Text="Registration Page:" Font-Bold="True" Font-Underline="True"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="registrationlabel" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <br />
          
            &nbsp;<asp:Label ID="Label3" runat="server" Text="First Name:" Font-Bold="True"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"
                CssClass="textbox-style"></asp:TextBox>

            &nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Empty Field!" ControlToValidate="TextBox2" Style="font-size: 90%; color: red;"></asp:RequiredFieldValidator>
            <br />
            <br />
            &nbsp;<asp:Label ID="Label4" runat="server" Text="Last Name:" Font-Bold="True"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="textbox-style"></asp:TextBox>
            &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" Empty Field!" ControlToValidate="TextBox3" Style="font-size: 90%; color: red;"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            <br />
&nbsp;<asp:Label ID="Label8" runat="server" Text="UserName:" Font-Bold="True"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox7" runat="server" CssClass="auto-style1" AutoPostBack="True" OnTextChanged="TextBox7_TextChanged"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="username" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage=" Empty Field!" ControlToValidate="TextBox3" Style="font-size: 90%; color: red;"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <span style="font-weight: bold;">DOB:</span>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox-style"></asp:TextBox>
            &nbsp;
            <asp:ImageButton ID="ImageButton1" runat="server" Height="66px" ImageUrl="~/image/Calendar.jpg" OnClick="ImageButton1_Click" Width="122px" />
            &nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" Empty Field!" ControlToValidate="TextBox3" Style="font-size: 90%; color: red;"></asp:RequiredFieldValidator>
            <br />
            <br /><br />
            <asp:Label ID="Label6" runat="server" Text="Email Address:" Font-Bold="True"></asp:Label>
            <asp:TextBox ID="email" runat="server" CssClass="textbox-style" TextMode="Email" OnTextChanged="TextBox5_TextChanged" AutoPostBack="True"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
            &nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage=" Empty Field!" ControlToValidate="TextBox3" Style="font-size: 90%; color: red;"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="emailid" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;<br />
            <br />
            
            <asp:Label ID="Label5" runat="server" Text="Password:" Font-Bold="True"></asp:Label>
            <asp:TextBox ID="tb_password" runat="server" width="209px" CssClass="textbox-style" TextMode="Password" onkeyup =" javascript:validate()"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage=" Empty Field!" ControlToValidate="TextBox3" Style="font-size: 90%; color: red;"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lbl_pwdchecker" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="Label7" runat="server" Text="Credit Card:" Font-Bold="True"></asp:Label>
            <asp:TextBox ID="TextBox6" runat="server" CssClass="textbox-style"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage=" Empty Field!" ControlToValidate="TextBox3" Style="font-size: 90%; color: red;"></asp:RequiredFieldValidator>
            <br />
            &nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Year:"></asp:Label>
            &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            &nbsp;<asp:Label ID="Label2" runat="server" Text="Month:"></asp:Label>
            &nbsp;<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" OnSelectionChanged="Calendar1_SelectionChanged" ShowGridLines="True" Width="220px">
                <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                <OtherMonthDayStyle ForeColor="#CC9966" />
                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                <SelectorStyle BackColor="#FFCC66" />
                <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
            </asp:Calendar>
            <br />
            <asp:Button ID="Button1" runat="server" Height="42px" OnClick="Button1_Click" Text="Submit" Width="99px" CssClass="submitbtn" />
            <br />
        </div>
    </form>
</body>
</html>
    