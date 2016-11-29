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
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "flash" || TextBox2.Text != "Trumpifxxku")
        {
           Session["gg"] = false;
           Label1.Text = "帳號或密碼輸入錯誤";
        }
        else
        {
            Session["gg"] = true;
            Response.Redirect("~/a32623943-3.2session去處/Default.aspx");
        }
    }
}
