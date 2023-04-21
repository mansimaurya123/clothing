<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>About Us Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  .jumbotron {
    background-color: plum;
    color: black;
    padding: 30px 10px;
    font-family:'Freestyle Script';
  }
  .container-fluid {
    padding: 60px 50px;
  }
  .bg-grey {
    background-color: #f6f6f6;
  }
  .logo-small {
    color: plum;
    font-size: 50px;
  }
  
  .logo {
    color: plum;
    font-size: 200px;
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
  }
  </style>
    <script language="javascript" type="text/javascript">
// <![CDATA[

       

// ]]>
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<br />

<div class="jumbotron text-center">
    <img src="img/dark-logu-removebg-preview.png" />
  <h1>Clothing:Be Each Day Beautiful</h1> 
  <p></p> 
  <form class="form-inline">
    <div class="input-group">
      
    </div>
  </form>
</div>

<!-- Container (About Section) -->
    <div class="container-fluid bg-grey">

<div class="container-fluid">
  <div class="row">
    <div class="col-sm-8">
      <h2>About Company Page</h2>
<p>
    Get The Best Of Fashion From Your Favourite Brands here at CLOTHING. At Great Deals & Discounts. Shoppable Looks From India's Top Influencers. A Shopping Paradise From Casuals, Ethnic, Formals.Your Shop- Stop destination for fashion in Men, Women & Kids Clothes . We offer quality at the best price and in a sustainable way. 
</p>      

    </div>

    <div class="col-sm-4">
      <span class="glyphicon glyphicon-home logo"></span>
    </div>
  </div>
</div>
    </div>

<div class="container-fluid bg-grey">
  <div class="row">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-education logo"></span>
    </div>
    <div class="col-sm-8">
      <h2>Our Mission</h2>
      <p>Inclusivity For Everybody and Every Body<br />
Our community is welcoming to all — no matter their size, color, gender, disability, or sexual orientation. We’re committed to providing as many styles in all size range.At Clothing, you’re so much more than a customer... 
</p>      
    </div>
  </div>
</div>

    <div class="container-fluid bg-grey">
  <div class="row">
    
    <div class="col-sm-8">
      <h2>Get To Know Us</h2>
      <p>CLOTHING is a leading online retailer of unisex's fashion apparel  providing your family with modern, ethnic, wear to work solutions that are multi-functional at affordable prices.Our merchandise is sold exclusively through its E-commerce store at clothing.com.The Clothing Company exists to make you look great and feel good. We make our customers feel confident, put-together, attractive, and fashion-right. 
</p> 
         <%--<button  id="btn11" runat="server" onclick="btn11_onclick()">Get in Touch</button>--%>
        <asp:Button  class="btn btn-default btn-lg" ID="Button1" runat="server"
            Text="Get in Touch" onclick="Button1_Click" />
        </div>
        <div class="col-sm-4">
      <span class="glyphicon glyphicon-globe logo"></span>
            
       
      </div>
  </div>
</div>

<!-- Container (Services Section) -->
<div class="container-fluid text-center">
  <h2>SERVICES</h2>
  <h4>What we offer</h4>
  <br>
  <div class="row">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-signal logo-small"></span>
      <h4>Target</h4>
      <p>Our target is to provide you with the best quality products from all over the country with best deals.</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-search logo-small"></span>
      <h4>Discover</h4>
      <p>New brands and products are added to our platform daily,you can search and discover many new products according to your needs daily.</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-shopping-cart logo-small"></span>
      <h4>One Stop Shop</h4>
      <p>We're providing a platform that allows you to shop hundreds of products,from different stores with just one checkout. Shopping has never been easier!</p>
    </div>
  </div>
  <br><br>
  <div class="row">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-piggy-bank logo-small"></span>
      <h4>Transparent Pricing</h4>
      <p>We value transparency as much as you do. We will always provide a breakdown of costs so you can see exactly how your order is calculated. No hidden fees- that's our promise.</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-lock logo-small"></span>
      <h4>Privacy Policy</h4>
      <p>We value the trust you place in us and recognize the importance of secure transactions and information privacy.</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-comment logo-small"></span>
      <h4 style="color:#303030;">Personalized Service</h4>
      <p>We understand that every bpurchase is unique which is why your order will be handled personally by a member of our tean from start to finish. All enquiries will be answered within 24hours, 7days a week.</p>
    </div>
  </div>
</div>
<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <p> Made By <a href="https://www.youtube.com/coderbaba" title="Visit w3schools">MyShoppingWebsite</a></p>
</footer>

</asp:Content>


