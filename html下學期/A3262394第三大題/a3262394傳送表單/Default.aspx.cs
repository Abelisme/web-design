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
        string str_name, str_topic, str_textaera,str;

        str_name = Request.Form["name"];
        str_topic = Request.Form["topic"];
        str_textaera = Request.Form["textaera"];
        Label1.Text = "留言者： " + str_name + "<br/>" + "課程主題： " + str_topic + "<br/>" +
            "意見：" + str_textaera+ DateTime.Now;


        
    }
}