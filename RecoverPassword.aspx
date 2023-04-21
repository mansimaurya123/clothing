<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecoverPassword.aspx.cs" Inherits="RecoverPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Password Recovery</title>
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
                <h2>Reset Password</h2>
                <hr />
                <div class ="form-group">
                    <asp:Label ID="lblmsg" CssClass ="col-md-2 control-label" runat="server" Visible="False" Font-Bold="True" Font-Size="Large"></asp:Label>

                </div>
 
                <div class ="form-group">
                    <asp:Label ID="lblNewPass" CssClass ="col-md-2 control-label" runat="server" Text="New Password" Visible="False"></asp:Label>
                    <div class ="col-md-3">
                        <asp:TextBox ID="txtNewPass" cssclass="form-control"  runat="server" TextMode="Password" Visible="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNewPass" cssclass="text-danger" runat="server" ErrorMessage="Enter Your New Password" ControlToValidate="txtNewPass" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class ="form-group">
                    <asp:Label ID="lblConfirmPass" CssClass ="col-md-2 control-label" runat="server" Text="Confirm New Password" Visible="False"></asp:Label>
                    <div class ="col-md-3">
                        <asp:TextBox ID="txtConfirmPass" cssclass="form-control"  runat="server" TextMode="Password" Visible="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPass" cssclass="text-danger" runat="server" ErrorMessage="Confirm New Password" ControlToValidate="txtConfirmPass" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidatorPass" runat="server" ErrorMessage="New Password and Confirm Password Doesn't Match...Try Again" ControlToCompare="txtNewPass" ControlToValidate="txtConfirmPass" ForeColor="Red"></asp:CompareValidator>
                    </div>
                </div>


                <div class="form-group">
                    <div class="col-md-3"></div>
                    <asp:Button ID="btnResetPass" cssclass="btn btn-default" runat="server" Text="Reset" Visible="False" OnClick="btnResetPass_Click"  />
                    
                </div>
            </div>

            </div>
        </div>
    </form>
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
