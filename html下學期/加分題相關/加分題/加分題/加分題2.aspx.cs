using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class 加分題2 : System.Web.UI.Page
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

        if (Application["rad"] == null)
           {       Application["rad"] = 0;
            
            if (RadioButtonList1.SelectedIndex == 0)
            {
                Application.Lock();
                Application["Yes"] = (int)Application["Yes"] + 1;
                Application.UnLock();
            }
            else
            {
                Application.Lock();
                Application["No"] = (int)Application["No"] + 1;
                Application.UnLock();
            }   
            Label2.Text = "目前票數： 贊成＝";
            Label3.Text = (string)Application["Yes"];
            Label5.Text = "反對＝";
            Label6.Text = (string)Application["No"];
            
        }
        else
        {
            Label4.Text = "你已投過票";
        }
    }
}