<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
    <br />
    <h3>Welcome to view all product</h3>

    <div class="row" Style="padding-top:10px" width:"400px" height:"500px">
        <asp:Repeater ID="rptrProducts" runat="server">
            <ItemTemplate>
                <div class="grid-container">
        <div class="col-xs-6 col-md-4">
                        <a href="ProductView.aspx?PID=<%# Eval("PID") %>" style="text-decoration:none;">

            <div class="card">
                  <div class="card-body" Style="padding-left:12.5" "padding-right:12.5" "height:415px" >
                      <div class="card-img-actions">
                           <img src="img/ProjectImages/<%# Eval("PID") %>/<%# Eval ("ImageName") %><%# Eval("Extension") %>" class="card-img img-fluid" width="90" height="350" alt="<%# Eval ("ImageName") %>">           
                                              
               
                <div class="caption">
                    <div class="probrand"><%# Eval ("BrandName") %></div>
                    <div class="proName"><%# Eval ("PName") %></div> 
                    <div class="proPrice">
                        <span class="proOgPrice">₹<%# Eval ("PPrice","{0:0,00}") %></span>  <%# Eval ("PSellPrice","{0:c}") %>  <span class="proPriceDiscount"> (<%# Eval ("DiscAmount","{0:0,00}") %> Off) </span></div>
                </div>
                </a>
                </div>
            </div>
        </div>
                
                          </div>
                    </div>
                </ItemTemplate>
      </asp:Repeater>
   
            </div>
                

</asp:Content>

