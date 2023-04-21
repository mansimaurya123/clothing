<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddBrand.aspx.cs" Inherits="AddBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class ="container">
                <div class ="form-horizontal">
                    <h2>Add Brand</h2>
                    <hr />
                    <div class ="form-group">
                        <asp:Label ID="Label1" cssclass ="col-md-2 control-label" runat="server" Text="BrandName"></asp:Label>
                        <div class ="col-md-3">
                            <asp:TextBox ID="txtBrand" cssclass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrandName" runat="server" cssclass ="text-danger" ErrorMessage="Enter Brandname" ControlToValidate="txtBrand" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    
                </div>
          
            
                <div class ="form-horizontal">
                    <div class ="form-group">
                        <div class ="col-md-2"> </div>
                        <div class ="col-md-6">
                            <asp:Button ID="btnAddBrand" cssclass ="btn btn-success" runat="server" Text="Add" OnClick="btnAddBrand_Click" />
                            &nbsp;&nbsp;
                        </div>
                    </div>
                 </div>

        <h1>Brands</h1>
        <hr />

        <div class="panel panel-default">
            <div class="panel-heading">All Brands</div>
            <asp:Repeater ID="rptrBrands" runat="server">
                <HeaderTemplate>
                    <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Brand</th>
                        <th>Edit</th><a href="EditBrand.aspx"></a>
                    </tr>
                </thead>

                <tbody>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <th><%# Eval("BrandID") %></th>
                        <td><%# Eval("Name") %></td>

                        <td>Edit</td><a href="EditBrand.aspx"></a>
                    
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                    </tbody>
            </table>
                </FooterTemplate>

            </asp:Repeater>

            
        </div>


        </div>
 
            
</asp:Content>

