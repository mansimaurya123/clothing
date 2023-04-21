<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="SubCategory.aspx.cs" Inherits="SubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class ="container">
                <div class ="form-horizontal">
                    <br />
                    <br />
                    <h2>Add Sub-Category</h2>
                    <hr />

                    <div class ="form-group">
                        <asp:Label ID="Label2" cssclass ="col-md-2 control-label" runat="server" Text="Main CategoryID"></asp:Label>
                        <div class ="col-md-3">
                            <asp:DropDownList ID="ddlMainCatID" Cssclass="form-control" runat="server" ></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorMainCatID" runat="server" cssclass ="text-danger" ErrorMessage="Enter Main Category ID" ControlToValidate="ddlMainCatID" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class ="form-group">
                        <asp:Label ID="Label1" cssclass ="col-md-2 control-label" runat="server" Text="SubCategoryName"></asp:Label>
                        <div class ="col-md-3">
                            <asp:TextBox ID="txtSubCategory" cssclass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSubCategoryName" runat="server" cssclass ="text-danger" ErrorMessage="Enter Sub-Category" ControlToValidate="txtSubCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    
                </div>
          
            
                <div class ="form-horizontal">
                    <div class ="form-group">
                        <div class ="col-md-2"> </div>
                        <div class ="col-md-6">
                            <asp:Button ID="btnAddSubCategory" cssclass ="btn btn-success" runat="server" Text="Add Sub-Category" OnClick="btnAddSubCategory_Click" />
                            &nbsp;&nbsp;
                        </div>
                    </div>
                 </div>

         <h1>Sub Categories</h1>
        <hr />

        <div class="panel panel-default">
            <div class="panel-heading">All Sub Categories</div>
            <asp:Repeater ID="rptrSubCat" runat="server">
                <HeaderTemplate>
                    <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Sub-Category</th>
                        <th>Main Category</th>
                        <th>Edit</th>
                    </tr>
                </thead>

                <tbody>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <th><%# Eval("SubCatID") %></th>
                        <td><%# Eval("SubCatName") %></td>
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

