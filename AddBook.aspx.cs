using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client;
public partial class AddBook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    private OracleConnection GetConnection()
    {
        var conString = System.Configuration.ConfigurationManager.ConnectionStrings["LibCollectionOracleCenCol"];
        string strConnString = conString.ConnectionString;
        return new OracleConnection(strConnString);
    }


    protected void saveBtnId_Click(object sender, EventArgs e)
    {
        System.Diagnostics.Debug.WriteLine("saveBtnId_Click"+ lentDdId.SelectedIndex +" - - - "+ lentToId.Text);
        
        System.Diagnostics.Debug.WriteLine("IS THE PAGE VALID:::: " + Page.IsValid);

        if (Page.IsValid)
        {
            System.Diagnostics.Debug.WriteLine("VALID PAGE");

            //To insert into the Application Object
            /*
            ((List<BookDetails>)Application["bookDetailsRep"]).Add(new BookDetails
            {
                Name = bookNameWuc.Text,
                Author = bookAuthorWuc.Text,
                ISBNNumber = (bookISBNWuc.Text == null) ? "" : bookISBNWuc.Text,
                Genre = genreId.Text,
                NoOfPages = Convert.ToInt32(pagesId.Text),
                LentStatus = lentDdId.SelectedValue,
                LentTo = lentToId.Text,
                Comments = commentsId.Text
            });
            */           
            OracleConnection oConn = GetConnection();
            OracleCommand oCmd = new OracleCommand("INSERT INTO Books (Name, Author, " +
                                                  "ISBN_Number, Genre, No_Of_Pages, Lent_To_A_Friend, " +
                                                  "Name_Of_Friend, Comments) " +
                                                  "VALUES (:Name, :Author, :ISBN_Number, " +
                                                  ":Genre, :No_Of_Pages, :Lent_To_A_Friend, " +
                                                  ":Name_Of_Friend, :Comments)", oConn);

            oCmd.Parameters.Add(new OracleParameter("Name", bookNameWuc.Text));
            oCmd.Parameters.Add(new OracleParameter("Author", bookAuthorWuc.Text));
            oCmd.Parameters.Add(new OracleParameter("ISBN_Number", (bookISBNWuc.Text == null) ? "" : bookISBNWuc.Text));
            oCmd.Parameters.Add(new OracleParameter("Genre", genreId.Text));
            oCmd.Parameters.Add(new OracleParameter("No_Of_Pages", Convert.ToInt32(pagesId.Text)));
            oCmd.Parameters.Add(new OracleParameter("Lent_To_A_Friend", lentDdId.SelectedItem.Value));
            oCmd.Parameters.Add(new OracleParameter("Name_Of_Friend", lentToId.Text));
            oCmd.Parameters.Add(new OracleParameter("Comments", commentsId.Text));
            /*
            oCmd.Parameters.Add("@Author", System.Data.SqlDbType.NVarChar);
            oCmd.Parameters["@Author"].Value = bookAuthorWuc.Text;

            oCmd.Parameters.Add("@ISBN_Number", System.Data.SqlDbType.NVarChar);
            oCmd.Parameters["@ISBN_Number"].Value = (bookISBNWuc.Text == null) ? "" : bookISBNWuc.Text;

            oCmd.Parameters.Add("@Genre", System.Data.SqlDbType.NVarChar);
            oCmd.Parameters["@Genre"].Value = genreId.Text;

            oCmd.Parameters.Add("@No_Of_Pages", System.Data.SqlDbType.Int);
            oCmd.Parameters["@No_Of_Pages"].Value = Convert.ToInt32(pagesId.Text);

            oCmd.Parameters.Add("@Lent_To_A_Friend", System.Data.SqlDbType.NVarChar);
            oCmd.Parameters["@Lent_To_A_Friend"].Value = lentDdId.SelectedItem.Value;

            oCmd.Parameters.Add("@Name_Of_Friend", System.Data.SqlDbType.NVarChar);
            oCmd.Parameters["@Name_Of_Friend"].Value = lentToId.Text;

            oCmd.Parameters.Add("@Comments", System.Data.SqlDbType.NVarChar);
            oCmd.Parameters["@Comments"].Value = commentsId.Text;
            */
            try
            {
                oConn.Open();
                oCmd.ExecuteNonQuery();
                Response.Redirect("Books.aspx");
            }
            catch(Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("*****Exception***** "+ex.Message);
                dbErrorMessage.Text =
                "Error while adding the book!" +
                "Please try again later, and/or change the entered data!";
            }
            finally
            {
                oConn.Close();
            }

        }
        else
        {
            System.Diagnostics.Debug.WriteLine("INVALID PAGE");
        }
    }

    protected void cancelBtnId_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddBook.aspx");
    }
        
    protected void Page_PreInit(object sender, EventArgs e)
    {
        System.Diagnostics.Debug.WriteLine("Inside Page_PreInit: " + Session["ThemeSessionValue"].ToString());

        if (Session["ThemeSessionValue"] != null)
        {
            Page.Theme = (String)Session["ThemeSessionValue"];
        }
        else
        {
            Session["ThemeSessionValue"] = "DarkTheme";
            Page.Theme = (string)Session["ThemeSessionValue"];
        }        
    }
    protected void ServerValidation(object source, ServerValidateEventArgs args)
    {
        if (lentDdId.SelectedIndex == 1 & lentToId.Text == "")
        {
            System.Diagnostics.Debug.WriteLine("Inside IF LOOP");
            args.IsValid = false;
        }
        System.Diagnostics.Debug.WriteLine("ServerValidation:::::" + args.IsValid);
    }
}