using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 第二題 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
       
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "xxx")
        {
            SqlDataSource4.SelectParameters["書籍編號"].DefaultValue = GridView3.Rows[index].Cells[0].Text;
        }
    }
}

//SqlDataSource4.SelectParameters["書籍編號"].DefaultValue = GridView3.Rows[index].Cells[0].Text;