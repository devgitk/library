<%@ Page Title="" Language="C#" MasterPageFile="~/LibraryCollection.master" AutoEventWireup="true" CodeFile="BookDetails1.aspx.cs" Inherits="BookDetails1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <asp:DetailsView ID="bookDetailsGrid" runat="server" AutoGenerateRows="False" Width="100%" CssClass="RalewayFont paragraph">
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
</asp:Content>

