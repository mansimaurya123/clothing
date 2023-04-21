<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <title>Feedback</title>
</head>
<body>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>
        <img class ="img-circle" src="img/dark-logo.png" alt="CLOTHING" width ="300" height="100"/> <br />
        <asp:Label runat="server" Text="FEEDBACK & GRIEVANCE" ID="ctl03" Font-Bold="True"></asp:Label><br/><br/>
        <asp:Label runat="server" ID="ctl04" Font-Bold="True">"Here at CLOTHING, We appreciate your time, do let us know below how can we help you by making our services better!" </asp:Label><br/><br/>

        <asp:Label runat="server" Text="NAME" ID="Label1" Font-Bold="True"></asp:Label><br/>
        <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Enter Your Name" Font-Bold="True"></asp:TextBox><br/><br/>
        <asp:Label runat="server" Text="EMAIL" ID="ct105" Font-Bold="True"></asp:Label><br/>
        <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Enter Your Email"  Font-Bold="True"></asp:TextBox><br/>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter A Valid Email Address..." ControlToValidate="txtEmail" ValidationExpression='\w+([-+.&#039;]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*' ForeColor="Red"></asp:RegularExpressionValidator>

        <br />
        <br />
        <br />

        <asp:Label runat="server" Text="-> What do you want to do!" ID="ct106" Font-Bold="True"></asp:Label><br/><br />

        <asp:CheckBox ID="CheckBox1" runat="server" Text="COMPLIMENT" Font-Bold="True"/><br/>
        <asp:TextBox ID="TextBox5" runat="server" class="form-control" placeholder="Leave A Compliment!" Font-Bold="True"></asp:TextBox><br/><br/>

        <asp:CheckBox ID="CheckBox2" runat="server" Text="CRITICISM" Font-Bold="True"/><br />
        <asp:TextBox ID="TextBox4" runat="server" class="form-control" placeholder="Leave A Criticism!" Font-Bold="True"></asp:TextBox><br/><br/>

        <asp:CheckBox ID="CheckBox3" runat="server" Text="RETURN-A-PRODUCT" Font-Bold="True"/><br/>
        <asp:Label runat="server" Text="Describe Your Problem" ID="Label2" Font-Bold="True"></asp:Label><br/>
                <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="why do you want to return the product" Font-Bold="True"></asp:TextBox><br/>
                <asp:Label runat="server" Text="ADDRESS" ID="Label3" Font-Bold="True"></asp:Label><br/>
                <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="Enter Your Address"  Font-Bold="True"></asp:TextBox><br/><br/><br/>

                   
                  
             
            <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="SUBMIT" OnClick="Button1_Click"/>  
     </div>
    </form>
    <asp:Label runat="server" ID="ct107"></asp:Label>
 </body>   
</html>
    </asp:Content>