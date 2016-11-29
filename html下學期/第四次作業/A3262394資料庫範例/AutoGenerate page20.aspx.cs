using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AutoGenerate_page20 : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.DataSourceID = "SqlDataSource1";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "Select *From 員工";
    }
}