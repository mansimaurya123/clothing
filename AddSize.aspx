<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddSize.aspx.cs" Inherits="AddSize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class ="container">
                <div class ="form-horizontal">
                    <br />
                    <br />
                    <h2>Add Size</h2>
                    <hr />

                    <div class ="form-group">
                        <asp:Label ID="Label1" cssclass ="col-md-2 control-label" runat="server" Text="SizeName"></asp:Label>
                        <div class ="col-md-3">
                            <asp:TextBox ID="txtSize" cssclass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSize" runat="server" cssclass ="text-danger" ErrorMessage="Enter Size" ControlToValidate="txtSize" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class ="form-group">
                        <asp:Label ID="Label2" cssclass ="col-md-2 control-label" runat="server" Text="Brand"></asp:Label>
                        <div class ="col-md-3">
                            <asp:DropDownList ID="ddlBrand" Cssclass="form-control" runat="server" ></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlBrand" runat="server" cssclass ="text-danger" ErrorMessage="Enter Brand Name" ControlToValidate="ddlBrand" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class ="form-group">
                        <asp:Label ID="Label3" cssclass ="col-md-2 control-label" runat="server" Text="Category"></asp:Label>
                        <div class ="col-md-3">
                            <asp:DropDownList ID="ddlCategory" Cssclass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" ></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlCategory" runat="server" cssclass ="text-danger" ErrorMessage="Enter Category" ControlToValidate="ddlCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class ="form-group">
                        <asp:Label ID="Label4" cssclass ="col-md-2 control-label" runat="server" Text="SubCategory"></asp:Label>
                        <div class ="col-md-3">
                            <asp:DropDownList ID="ddlSubCategory" Cssclass="form-control" runat="server" ></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSubCategory" runat="server" cssclass ="text-danger" ErrorMessage="Enter Sub-Category" ControlToValidate="ddlSubCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                  
                    <div class ="form-group">
                        <asp:Label ID="Label5" cssclass ="col-md-2 control-label" runat="server" Text="Gender"></asp:Label>
                        <div class ="col-md-3">
                            <asp:DropDownList ID="ddlGender" Cssclass="form-control" runat="server" ></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorGender" runat="server" cssclass ="text-danger" ErrorMessage="Enter Gender" ControlToValidate="ddlGender" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                </div>
          
            
                <div class ="form-horizontal">
                    <div class ="form-group">
                        <div class ="col-md-2"> </div>
                        <div class ="col-md-6">
                            <asp:Button ID="btnAddSize" cssclass ="btn btn-success" runat="server" Text="Add Size" OnClick="btnAddSize_Click" />
                            &nbsp;&nbsp;
                        </div>
                    </div>
                 </div>
        <h1>Size</h1>
        <hr />

        <div class="panel panel-default">
            <div class="panel-heading">All Sizess</div>
            <asp:Repeater ID="rptrSize" runat="server">
                <HeaderTemplate>
                    <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Size</th>
                        <th>Brand</th>
                        <th>Category</th>
                        <th>Sub Category</th>
                        <th>Gender</th>
                        <th>Edit</th>
                    </tr>
                </thead>

                <tbody>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <th><%# Eval("SizeID ") %></th>
                        <th><%# Eval("SizeName") %></th>
                        <td><%# Eval("Name") %></td>
                        <td><%# Eval("CatName") %></td>
                        <td><%# Eval("SubCatName") %></td>
                        <td><%# Eval("GenderName") %></td>
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

