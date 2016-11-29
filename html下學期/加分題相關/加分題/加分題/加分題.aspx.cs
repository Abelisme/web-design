using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 加分題 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Application["Yes"] == null && Application["No"] == null)
        {
            Label2.Text = "尚未有人投票！";
            Application["Yes"] = 0;
            Application["No"] = 0;
            RadioButtonList1.SelectedIndex = 0;
        }
        if (!IsPostBack == true)
        { Application["rad"] = null; }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
     
        {
      

            if (RadioButtonList1.SelectedIndex == 0)
            {
           
                Application["Yes"] = (int)Application["Yes"] + 1;
         
            }
            else
            {
             
                Application["No"] = (int)Application["No"] + 1;
          
            }
            Label2.Text = "目前票數： 贊成＝"
           + Application["Yes"] +
            "反對＝" + Application["No"];
        }
    }
}