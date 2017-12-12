<%@ Page Title="" Language="C#" MasterPageFile="~/LibraryCollection.master" AutoEventWireup="true" CodeFile="AddBook.aspx.cs" Inherits="AddBook" %>
<%@ Register TagPrefix="wuc" TagName="BookDetails" Src="~/BookDetailsControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type='text/css'>

        body { background-image: url("App_Themes/DarkTheme/Images/bookcase-1867460_1920.jpg"); }
    </style>
    <div>
        <h1 class="text">Add a Book to the Collection.</h1><br/>
        <div class="form-group form-inline">
        <wuc:BookDetails ID="bookNameWuc" runat="server" LabelText="Name:"/>
        <wuc:BookDetails ID="bookAuthorWuc" runat="server" LabelText="Author(s):"/>
        <wuc:BookDetails ID="bookISBNWuc" runat="server" LabelText="ISBN Number:" ValidationGroup="group1"/>
        <p>
            <asp:Label runat="server" Text="Genre:" Width="450" CssClass="paragraph " /> <asp:TextBox ID="genreId" runat="server" Text="" Width="250" MaxLength="30" CssClass="RalewayFont form-control" placeholder="Genre"/><br/>
        </p>
        <p>
            <asp:Label runat="server" Text="No. of pages:" Width="450" CssClass="paragraph" /> <asp:TextBox ID="pagesId" runat="server" Text="" Width="250" MaxLength="30" CssClass="RalewayFont form-control" placeholder="Pages"/>
            <asp:RequiredFieldValidator ID="reqFV1" 
                runat="server" 
                ControlToValidate="pagesId" 
                ErrorMessage="*" 
                Font-Size="20px" 
                ForeColor="Red" /><br/>
            <asp:RangeValidator ID="checkForIntId" 
                runat="server" 
                MinimumValue="0" 
                MaximumValue="2147483647" 
                Font-Size="10pt" 
                Type="Integer" 
                ControlToValidate="pagesId" 
                ForeColor="Red" 
                Text="You must enter a positive integer" 
                CssClass="RalewayFont" 
                SetFocusOnError="true" 
                Display="Dynamic" />
        </p>
        <p>
            <asp:Label runat="server" Text="Lent to a friend:" Width="450" CssClass="paragraph" /> 
            <asp:DropDownList ID="lentDdId" runat="server" Width="250" CssClass="RalewayFont form-control">
                <asp:ListItem Text="No" Value="No" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
            </asp:DropDownList><br/>
        </p>
        <p>
            <asp:Label runat="server" Text="Name of the friend that the book is lent to:" Width="450" CssClass="paragraph" /> <asp:TextBox ID="lentToId" runat="server" Text="" Width="250" MaxLength="30" CssClass="RalewayFont form-control" placeholder="Name of your friend"/>
            <asp:CustomValidator id="CustomValidator1" 
               ErrorMessage="</br> You must enter your friend's name" 
               CssClass="RalewayFont" 
               SetFocusOnError="true" 
               Display="Dynamic"
               Font-Size="10pt"
               OnServerValidate="ServerValidation"
               ValidateEmptyText="true"
               ForeColor="Red"
               runat="server"/>
        </p>  
        <p>
            <asp:Label runat="server" Text="Comments:" Width="450" CssClass="paragraph" /> <asp:TextBox ID="commentsId" runat="server" TextMode="MultiLine" placeholder="(Maximum characters: 100)" Width="250" MaxLength="200"  CssClass="RalewayFont form-control"/>
        </p>
        <p>
            <asp:Label runat="server" ID="dbErrorMessage" Text="" />
        </p>
        <p>
            <asp:Button runat="server" ID="saveBtnId" Text="Save" CssClass="RalewayFont form-control" OnClick="saveBtnId_Click"/> <asp:Button runat="server" ID="cancelBtnId" Text="Cancel" CssClass="RalewayFont form-control" OnClick="cancelBtnId_Click" CausesValidation="false"/>
        </p>
            </div>
     </div>
</asp:Content>

