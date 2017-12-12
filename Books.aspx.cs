using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client;
using System.Configuration;
public partial class Books : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }
    private OracleConnection GetConnection()
    {
        var conString = System.Configuration.ConfigurationManager.ConnectionStrings["LibCollectionOracleCenCol"];
        string strConnString = conString.ConnectionString;
        return new OracleConnection(strConnString);
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        System.Diagnostics.Debug.WriteLine("Inside Page_PreInit: "+ Session["ThemeSessionValue"].ToString());

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

    private void BindGrid()
    {
        OracleConnection oConn = GetConnection();        
        OracleCommand oCmd = new OracleCommand("SELECT Book_ID, Name, Author, ISBN_Number FROM Books", oConn);        
        try
        {            
            oConn.Open();
            OracleDataReader reader = oCmd.ExecuteReader();
            grid.DataSource = reader;
            grid.DataBind();
            reader.Close();
        }
        finally
        {
            oConn.Close();
        }
    }
}