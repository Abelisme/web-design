<%@ Page Language="C#" AutoEventWireup="true" CodeFile="第3.2題.aspx.cs" Inherits="第3_2題" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT [編號], [旅館名稱], [旅館住址], [電話], [接駁車], [地區], [網址] FROM [旅館]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="編號" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" style="margin-right: 3px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="編號" HeaderText="編號" ReadOnly="True" SortExpression="編號" />
                <asp:BoundField DataField="旅館名稱" HeaderText="旅館名稱" SortExpression="旅館名稱" />
                <asp:BoundField DataField="旅館住址" HeaderText="旅館住址" SortExpression="旅館住址" />
                <asp:BoundField DataField="電話" HeaderText="電話" SortExpression="電話" />
                <asp:CheckBoxField DataField="接駁車" HeaderText="接駁車" SortExpression="接駁車" />
                <asp:BoundField DataField="地區" HeaderText="地區" SortExpression="地區" />
                <asp:HyperLinkField DataNavigateUrlFields="網址" DataTextField="旅館名稱" DataTextFormatString="{0}的網址" HeaderText="旅館名稱" Target="_blank" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
    </form>
</body>
</html>
