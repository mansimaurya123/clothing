<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!DOCTYPE html>

    <html>
        <title>Blog</title>
    </html>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img class ="img-circle" src="img/dark-logo.png" alt="CLOTHING" width ="300" height="100"/> <br />
    <asp:Label runat="server" Text="NEWSLETTER" ID="ctl03" Font-Bold="True"></asp:Label><br/>
    <asp:Label runat="server" ID="ctl04" Font-Bold="True">Select your interests and receive the latest news and trends each week. </asp:Label><br/><br/>

    <asp:Label runat="server" Text="EMAIL" ID="ct105" Font-Bold="True"></asp:Label><br/>
    <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Enter Your Email" Font-Bold="True"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter A Valid Email Address..." ControlToValidate="txtEmail" ValidationExpression='\w+([-+.&#039;]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*' ForeColor="Red"></asp:RegularExpressionValidator>

    <br/>
    <br />

    <asp:Label runat="server" Text="Sections" ID="ct106" Font-Bold="True"></asp:Label><br/>
    <asp:CheckBox ID="CheckBox1" runat="server" Text="MEN" Font-Bold="True"/><br/>
    <asp:CheckBox ID="CheckBox2" runat="server" Text="WOMEN" Font-Bold="True"/><br/>
    <asp:CheckBox ID="CheckBox3" runat="server" Text="KIDS" Font-Bold="True"/><br/><br/>
                  
    <asp:Button ID="Button1" runat="server" cssclass ="btn btn-success" Text="SUBMIT" OnClick="Button1_Click"  />  
    <asp:Label runat="server" ID="ct107"></asp:Label><br/>
</asp:Content>
