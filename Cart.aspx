<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<title>Cart</title>
    <link href="Styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>--%>
    <link href="css/Custom.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="padding-top:50px;">

    <div class="col-md-9">
        <h4 class="proNameViewCart" runat="server" id="h4Noitems"></h4>
                          
        <asp:Repeater ID="rptrCartProducts" runat="server">
    <ItemTemplate>

        <%--show cart details start---%>
        <div class="media" style="border:1px solid black;">
            <div class="media-left">
                <a href="ProductView.aspx?PID=<%# Eval ("PID") %>" target="_blank">
                    <img class="media-object" width="100px" src="img/ProjectImages/<%# Eval("PID") %>/<%# Eval ("Name") %><%# Eval("Extension") %>" alt="<%# Eval ("Name") %>" />

                </a>

            </div>
            
            <div class="media-body">
                <h4 class="media-heading proNameViewCart"><%# Eval ("PName") %></h4>
                 <p class="proPriceDiscountView"><%# Eval ("SizeNamee") %></p>
                <span class="proPriceView"><%# Eval ("PSellPrice","{0:c}") %></span>
                <span class="proOgPriceView"><%# Eval ("PPrice","{0:0,00}") %></span>
                <span class="proPriceDiscountView">₹.<%# string.Format("{0}",Convert.ToInt64(Eval("PPrice"))-Convert.ToInt64(Eval("PSellPrice"))) %>Off</span>
   
                <p>
                    <asp:Button ID="btnRemoveCart" CssClass="RemoveButton1" runat="server" Text="Remove" OnClick="btnRemoveCart_Click"  />
                    
                </p>

            </div>
        </div>   
                </ItemTemplate>
            </asp:Repeater>
        <%--show cart details end---%>

    </div>
    <div class="col-md-3">
        <%--------------%>
        <div>
            <h5>PRICE DETAILS</h5>

            <div>
                <label> Cart Total </label>
                <span class="pull-right priceGray" runat="server" id="spanCartTotal"></span>
            </div>

            <div>
                 <label> Cart Discount </label>
                <span class="pull-right priceGreen" id="spanDiscount" runat="server" ></span> 
            </div>
            <div >
            </div>
            <div >
            
            </div>
        </div>
        <%--------------%>

        <div>
            <div class="proPriceView">
                 <label> Total </label>
                <span class="pull-right" runat="server" id="spanTotal"></span>
            
            </div>

            <div>
                
                <asp:button ID="btnBuyNow" CssClass="buyNowbtn" runat="server" text="BUY NOW" onClick="btnBuyNow_Click" />
                
            </div>
        </div>

    </div>
</div>

    
</asp:Content>
