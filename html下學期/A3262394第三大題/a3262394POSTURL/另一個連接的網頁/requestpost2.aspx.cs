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
        TextBox tx1,tx2;
        tx1 = (TextBox)PreviousPage.FindControl("TextBox1");
        tx2 = (TextBox)PreviousPage.FindControl("TextBox2");

        DropDownList eduactional= (DropDownList)PreviousPage.FindControl("DropDownList1");
        RadioButtonList gender = (RadioButtonList)PreviousPage.FindControl("RadioButtonList1");
        CheckBoxList interest = (CheckBoxList)PreviousPage.FindControl("CheckBoxList1");
        DropDownList profession = (DropDownList)PreviousPage.FindControl("DropDownList2");

        Label1.Text = tx1.Text;
        Label2.Text = gender.SelectedItem.Text;
        Label3.Text = eduactional.SelectedItem.Text;
        Label4.Text = profession.SelectedItem.Text;
        foreach (ListItem i in interest.Items)
            if (i.Selected) Label5.Text += i.Text + " ";
        Label6.Text = tx2.Text;

    }
}