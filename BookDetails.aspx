<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BookDetails.aspx.cs" Inherits="BookDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Details Page</title>
    <link rel="stylesheet" href="App_Themes/Library/bootstrap-3.3.0/dist/css/bootstrap.min.css"/>       <!-- Bootstrap Lib-->
    <script src="App_Themes/Library/jquery-3.1.0.min.js"></script>                                      <!-- jQuery Lib-->
    <script src="App_Themes/Library/bootstrap-3.3.0/dist/js/bootstrap.min.js"></script>    
    <link href="https://fonts.googleapis.com/css?family=Lobster|Raleway:600i" rel="stylesheet">         <!-- Google Fonts-->
    <link rel="stylesheet" href="App_Themes/Library/bootstrap-3.3.0/dist/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="App_Themes/Global.css">
</head>
<body style="background-color:#131516">
    <form id="form1" runat="server">
        <asp:DetailsView ID="bookDetailsGrid" runat="server" AutoGenerateRows="False" Width="70%" CssClass="RalewayFont paragraph">
            <Fields>
                <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="editNameTextBox" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="insertNameTextBox" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Author">
                    <EditItemTemplate>
                        <asp:TextBox ID="editAuthorTextBox" runat="server" Text='<%# Bind("Author") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="insertAuthorTextBox" runat="server" Text='<%# Bind("Author") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="authorLabel" runat="server" Text='<%# Bind("Author") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ISBN Number">
                    <EditItemTemplate>
                        <asp:TextBox ID="editISBNNumberTextBox" runat="server" Text='<%# Bind("ISBN_Number") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="insertISBNNumberTextBox" runat="server" Text='<%# Bind("ISBN_Number") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="isbnNumberLabel" runat="server" Text='<%# Bind("ISBN_Number") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Genre">
                    <EditItemTemplate>
                        <asp:TextBox ID="editGenreTextBox" runat="server" Text='<%# Bind("Genre") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="insertGenreTextBox" runat="server" Text='<%# Bind("Genre") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="genreNumberLabel" runat="server" Text='<%# Bind("Genre") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="No of pages">
                    <EditItemTemplate>
                        <asp:TextBox ID="editNoOfPagesTextBox" runat="server" Text='<%# Bind("No_Of_Pages") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="insertNoOfPagesTextBox" runat="server" Text='<%# Bind("No_Of_Pages") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="noOfPagesNumberLabel" runat="server" Text='<%# Bind("No_Of_Pages") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Fields>
            <HeaderTemplate>
                <%#Eval("Name")%>
            </HeaderTemplate>
        </asp:DetailsView>
    </form>
</body>
</html>
