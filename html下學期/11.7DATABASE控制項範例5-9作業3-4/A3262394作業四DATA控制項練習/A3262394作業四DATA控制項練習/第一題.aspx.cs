using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DropDownList1.Items.Insert(0, new ListItem("All Categories", "0"));
            SqlDataSource2.SelectCommand = "Select * from Products";
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(DropDownList1.SelectedIndex==0)
        {
            SqlDataSource2.SelectCommand = "Select * from Products";
        }
    }

    protected void GridView1_PageIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 0)
        {
            SqlDataSource2.SelectCommand = "Select * from Products";
        }
    }
}