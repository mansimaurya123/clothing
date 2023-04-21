<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUp</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width", initial-scale="1" />
    <meta http-equiv="X-UA-Compatible" content="IE-edge" />
    <link href="css/Custom.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
</head>
        <div>
         <div class ="navbar navbar-default navbar-fixed-top" role ="navigation">
                <div class ="container">
                    <div class ="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle Navigation</span>
                            <span class ="icon-bar"></span>
                            <span class ="icon-bar"></span>
                            <span class ="icon-bar"></span>
                        </button>
                        <a class ="navbar-brand" href ="Default.aspx">
                    </div>
                    <div class ="navbar-collapse collapse">
                        <ul class ="nav navbar-nav navbar-right">
                            <li><a href ="Default.aspx">Home</a> </li>
                            <li ><a href ="#">About</a> </li>
                            <li ><a href ="Blog.aspx">Blog</a></li>
                            <li class ="dropdown">
                                <a href ="#" class ="dropdown-toggle" data-toggle="dropdown">Products<b class ="caret"></b></a>
                                <ul class ="dropdown-menu">
                                    <li ><a href="Products.aspx">All Products</a> </li>
                                    <li role="separator" class="divider"></li>
                                    <li class ="dropdown-header"><a href="MenProducts.aspx">Men</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li ><a href ="MenCasuals.aspx">Casuals</a> </li>
                                    <li ><a href ="MenFormals.aspx">Formals</a> </li>
                                    <li ><a href ="MenEthnicWear.aspx">Ethnic</a> </li>
                                    <li role="separator" class="divider"></li>
                                    <li class ="dropdown-header"><a href="WomenProducts.aspx">Women</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li ><a href ="WomenCasuals.aspx">Casuals</a> </li>
                                    <li ><a href ="WomenFormals.aspx">Formals</a> </li>
                                    <li ><a href ="WomenEthnicWear.aspx">Ethnic</a> </li>
                                    <li role="separator" class="divider"></li>
                                    <li class ="dropdown-header"><a href ="KidsProducts.aspx">Kids</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li ><a href ="KidsCasuals.aspx">Casuals</a> </li>
                                    <li ><a href ="KidsEthnicWear.aspx">Ethnic</a> </li>
                                    
                                </ul>
                            </li>
                            <li class ="active"><a href ="SignUp.aspx">SignUp</a></li>
                            <li><a href ="Login.aspx">Login</a></li>
                            

                        </ul>
                    </div>
                </div>


            </div>
        </div>

        <!---signup page--->
        <body>
        <div class="bg">
        <img src="img/header.png" width: "895.200px"; height: "1075px" alt="" />

    <section class="loginbox">
                        <img src="img/dark-logu.png" class="download" atl="..." />

            <form id="form1" runat="server">

        <div class ="center-page">
            <label class="col-xs-11">Your FullName:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtName" runat="server"  class="form-control" placeholder="Enter Your Name"></asp:TextBox>
             </div>
            <label class="col-xs-11"></label>
            <label class="col-xs-11">UserName:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtUname" runat="server"  class="form-control" placeholder="Enter Your UserName"></asp:TextBox>
             </div>

            <label class="col-xs-11"></label>
            <label class="col-xs-11">Email:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtEmail" runat="server"  class="form-control" placeholder="Enter Your Email"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter A Valid Email Address..." ControlToValidate="txtEmail" ValidationExpression='\w+([-+.&#039;]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*' ForeColor="Red"></asp:RegularExpressionValidator>

             </div>

            <label class="col-xs-11">
            Password:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtPass" runat="server"  class="form-control" placeholder="Enter Your Password" TextMode="Password"></asp:TextBox>
             </div>

            <label class="col-xs-11"></label>
            <label class="col-xs-11">Confirm Password:</label>
            <div class="col-xs-11">
            <asp:TextBox ID="txtCPass" runat="server"  class="form-control" placeholder="Enter Your Confirm Password" TextMode="Password"></asp:TextBox>
             </div>


            <label class="col-xs-11"></label>
            <div class="col-xs-11">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="txtsignup" class="btn btn-success" runat="server" Text="SignUp" OnClick="txtsignup_Click" PostBackUrl="~/Login.aspx" />
            
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
            
             </div>
        </div>
        <!---signup page end--->
        </form>
       </section>
            </div>
        <!--- Footer Content Start--->
        <hr />
        <footer class="footer-pos">
            <div class ="container">
                <p class="pull-right"><a href="#">Back to top</a></p>
                <p>&copy;All Rights Reserved <br />2023 clothing.com &middot;<a href ="Default.aspx">Home</a> &middot;<a href="About.aspx">About</a> &middot; <a href ="Blog.aspx">Blog</a> &middot; <a href ="Products.aspx">Products</a> &middot;<a href="Feedback.aspx">Feedback</a></p>
            </div>
        </footer>
        <!--- Footer Content End--->
</body>
</html>
