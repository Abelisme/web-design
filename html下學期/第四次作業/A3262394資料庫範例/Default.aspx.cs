using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string price;
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (RadioButtonList1.SelectedIndex != -1)
        {
            price = dv.Table.Rows[RadioButtonList1.SelectedIndex][1].ToString();
            TextBox1.Text = string.Format("{0:F}", Convert.ToDouble(price));
        }
    }
}