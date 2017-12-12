<%@ Page Title="" Language="C#" MasterPageFile="~/LibraryCollection.master" AutoEventWireup="true" CodeFile="Books.aspx.cs" Inherits="Books"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type='text/css'>
        body { background-image: url("App_Themes/DarkTheme/Images/bookshelves-932780_1920.jpg"); }
    </style>
    <div>
    <h1 class="RalewayFont paragraph">Books</h1>
        <asp:GridView ID="grid" runat="server" AllowSorting="true" AutoGenerateColumns="False" Width="100%" CssClass="RalewayFont paragraph">
            <Columns>
                <asp:HyperLinkField DataTextField="Name" HeaderText="Name" DataNavigateUrlFields="Book_ID" DataNavigateUrlFormatString="~/BookDetails.aspx?Book_ID={0}" DataTextFormatString="{0}" Text="Name" />
                <%--<asp:BoundField DataField="Name" HeaderText="Name"/>--%>
                <asp:BoundField DataField="Author" HeaderText="Author" />
                <asp:BoundField DataField="ISBN_Number" HeaderText="ISBN Number" />
                <%--<asp:ButtonField CommandName="Select" Text="Select" />--%>
            </Columns>
        </asp:GridView>
        <br />
    </div>
</asp:Content>

