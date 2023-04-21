<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class ="container">
                <div class ="form-horizontal">
                    <br />
                    <h2>Add Category</h2>
                    <hr />
                    <div class ="form-group">
                        <asp:Label ID="Label1" cssclass ="col-md-2 control-label" runat="server" Text="CategoryName"></asp:Label>
                        <div class ="col-md-3">
                            <asp:TextBox ID="txtCategory" cssclass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategoryName" runat="server" cssclass ="text-danger" ErrorMessage="Enter Category" ControlToValidate="txtCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    
                </div>
          
            
                <div class ="form-horizontal">
                    <div class ="form-group">
                        <div class ="col-md-2"> </div>
                        <div class ="col-md-6">
                            <asp:Button ID="btnAddCategory" cssclass ="btn btn-success" runat="server" Text="Add Category" OnClick="btnAddCategory_Click" />
                            &nbsp;&nbsp;
                        </div>
                    </div>
                 </div>

          <h1>Categories</h1>
        <hr />

        <div class="panel panel-default">
            <div class="panel-heading">All Categories</div>
            <asp:Repeater ID="rptrCategory" runat="server">
                <HeaderTemplate>
                    <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>All Categories</th>
                        <th>Edit</th>
                    </tr>
                </thead>

                <tbody>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <th><%# Eval("CatID") %></th>
                        <td><%# Eval("CatName") %></td>

                        <td>Edit</td>
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

