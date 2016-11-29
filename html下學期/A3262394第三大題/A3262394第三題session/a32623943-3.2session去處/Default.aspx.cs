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
        if ( Session["gg"] == null)
        {
            Response.Redirect("~/a32623943-3session應用/Default2.aspx");
        }
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        Session.Abandon();
        Response.Redirect("~/a32623943-3session應用/Default2.aspx");
    }
}