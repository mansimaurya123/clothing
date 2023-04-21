<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width", initial-scale="1" />
    <meta http-equiv="X-UA-Compatible" content="IE-edge" />
    <link href="css/Custom.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
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
                            <li ><a href ="Default.aspx">Home</a> </li>
                            <li ><a href ="#">About</a> </li>
                            <li ><a href ="#">Contact Us</a> </li>
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
                            
                            <li><a href ="Login.aspx">Login</a></li>

                        </ul>
                    </div>
                </div>
           </div>

            
        </div>
        <div class="container">
            <div class="form-horizontal">
                <br />
                <br />
                <h2>Recover Password</h2>
                <hr />
                <h3>Please Enter Your Email Address, we will send you the recovery link for your password!</h3>
                <div class ="form-group">
                    <asp:Label ID="lblEmail" CssClass ="col-md-2 control-label" runat="server" Text="Enter Your Email Address"></asp:Label>
                    <div class ="col-md-3">
                        <asp:TextBox ID="txtEmailId" cssclass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" cssclass="text-danger" runat="server" ErrorMessage="Enter a valid Email Address" ControlToValidate="txtEmailId" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-3"></div>
                    <asp:Button ID="btnResetPass" cssclass="btn btn-default" runat="server" Text="Send" OnClick="btnResetPass_Click" />
                    <asp:Label ID="lblResetPassMsg" cssclass ="text-success" runat ="server" ></asp:Label>
                </div>
            </div>

            </div>
    </form>
    <!--- Footer Content Start--->
        <hr />
        <footer>
            <div class ="container">
                <p class="pull-right"><a href="#">Back to top</a></p>
                <p>&copy;All Rights Reserved <br />2023 clothing.com &middot;<a href ="Default.aspx">Home</a> &middot;<a href="About.aspx">About</a> &middot; <a href ="Blog.aspx">Blog</a> &middot; <a href ="Products.aspx">Products</a></p>
            </div>
        </footer>
        <!--- Footer Content End--->
</body>
</html>
