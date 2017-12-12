using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client;

public partial class BookDetails1 : System.Web.UI.Page
{
    private OracleConnection GetConnection()
    {
        var conString = System.Configuration.ConfigurationManager.ConnectionStrings["LibCollectionOracleCenCol"];
        string strConnString = conString.ConnectionString;
        return new OracleConnection(strConnString);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Diagnostics.Debug.WriteLine("*****INSIDE BOOKDETAILS:Page_Load*****");
        int bookId = Convert.ToInt32(Request.QueryString["Book_ID"]);
        OracleConnection oConn = GetConnection();
        OracleCommand oCmd = new OracleCommand("SELECT Name, Author, ISBN_Number, Genre, No_Of_Pages, " +
                                                "Lent_To_A_Friend, Name_Of_Friend,Comments " +
                                                "FROM Books " +
                                                "WHERE Book_ID = :Book_ID", oConn);
        oCmd.Parameters.Add(new OracleParameter("Book_ID", bookId));
        try
        {
            oConn.Open();
            //oCmd.ExecuteNonQuery();
            OracleDataReader reader = oCmd.ExecuteReader();
            //bookDetailsGrid.DataSource = reader;
            //bookDetailsGrid.DataKeyNames = new string[] { "Name" };
            //bookDetailsGrid.DataBind();
            reader.Close();
        }
        finally
        {
            oConn.Close();
        }
    }
}