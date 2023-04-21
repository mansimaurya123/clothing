<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width", initial-scale="1" />
    <meta http-equiv="X-UA-Compatible" content="IE-edge" />
    <link href="css/Custom.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style type="text/css">
        .auto-style1 {
            width: 127px;
            height: 68px;
        }
        .auto-style2 {
            width: 104px;
            height: 66px;
        }
    </style>

</head>


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
                            <span><img src="img/l5.png" alt="Clothing" class="auto-style2" /><img src="img/dark-logo.png" class="auto-style1"/></span></a>
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
                            <li><a href ="SignUp.aspx">SignUp</a></li>
                            <li class ="active"><a href ="Login.aspx">Login</a></li>

                        </ul>
                    </div>
                </div>


           </div>
      
            <!---login form start--->
    <body>
        <div class="bg">
        <img src="img/header.png" width:"895.200px"; height:"1075px"; alt="" />

    <section class="loginbox">
                        <img class="img-circle" src="img/dark-logu.png"  atl="..." />

    <form id="form1" runat="server">
                <div class ="center-page">

        <div>
        
            <div class ="container" >
                <div class ="form-horizontal">
                    <br />
                    <br />
                    
                    <h2>Login Here</h2>
                    <div class ="form-group">
                        <asp:Label ID="Label1" cssclass ="col-md-2 control-label" runat="server" Text="UserName"></asp:Label>
                        <div class ="col-md-3">
                            <asp:TextBox ID="txtUsername" cssclass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" cssclass ="text-danger" ErrorMessage="Enter a valid username" ControlToValidate="txtUsername" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    
                </div>
           
                <div class ="form-horizontal">
                    <div class ="form-group">
                        <asp:Label ID="Label2" cssclass ="col-md-2 control-label" runat="server" Text="Password"></asp:Label>
                        <div class ="col-md-3">
                            <asp:TextBox ID="txtPass" cssclass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" cssclass = "text-danger" ErrorMessage="Please enter a valid password" ControlToValidate="txtPass" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    
                </div>
                <div class ="form-horizontal">
                    <div class ="form-group">
                        <div class ="col-md-2"> </div>
                        <div class ="col-md-6">
                            <asp:CheckBox ID="CheckBox1" runat="server" />
                            <asp:Label ID="Label3" cssclass ="control-label" runat="server" Text="Remember Me"></asp:Label>
                        </div>
                    </div>
                    
                </div>
                <div class ="form-horizontal">
                    <div class ="form-group">
                        <div class ="col-md-2"> </div>
                        <div class ="col-md-6">
                            <asp:Button ID="btnLogin" cssclass ="btn btn-success" runat="server" Text="Login" OnClick="btnLogin_Click" />
                            &nbsp;&nbsp;
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SignUp.aspx">SignUp</asp:HyperLink>
                        </div>
                    </div>
                    </div>

        </div>
            </div>
                    
                    <%---forgot password start ---%>
                    <div class ="form-group">
                        <div class ="col-md-2"> </div> 
                        <div class ="col-md-6">
                            <asp:HyperLink ID="HyForgotPass" runat="server" NavigateUrl="~/ForgotPassword.aspx">Forgot Password?</asp:HyperLink> 
                        </div>
                    </div>
                    <%---forgot password end---%>
                    <div class ="form-group">
                        <div class ="col-md-2"> </div> 
                        <div class ="col-md-6">
                        <asp:Label ID="lblError" CssClass="text-danger" runat="server" ></asp:Label> 
                        </div>
                    </div>

       </div>
            <!---login form end--->
        </form>
        </section>
            </div>

            <!--- Footer Content Start--->
        <hr />
        <footer>
            <div class ="container">
                <p class="pull-right"><a href="#">Back to top</a></p>
                <p>&copy;All Rights Reserved <br />2023 clothing.com &middot;<a href ="Default.aspx">Home</a> &middot;<a href="About.aspx">About</a> &middot; <a href ="Blog.aspx">Blog</a> &middot; <a href ="Products.aspx">Products</a> &middot;<a href="Feedback.aspx">Feedback</a></p>
            </div>
        </footer>
        <!--- Footer Content End--->
</body>
</html>
