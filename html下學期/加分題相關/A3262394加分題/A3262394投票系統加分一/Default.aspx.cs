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
        if(Application["yes"]==null&Application["no"]==null)
        {
            Label2.Text = "目前尚未有投票";
            Application["yes"] = 0;
            Application["no"] = 0;
            RadioButtonList1.SelectedIndex = 0;
            
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        if (RadioButtonList1.SelectedIndex == 0)
        {
            Application.Lock();
            Application["yes"] = (int)Application["yes"] + 1;
            Application.UnLock();
        }
        else
        {
            Application.Lock();
            Application["no"] = (int)Application["no"] + 1;
            Application.UnLock();
        }
            Label2.Text = "目前票數" + "贊成=" + Application["yes"] + "反對=" + Application["no"];
        
    }
}