<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AutoGenerate page20.aspx.cs" Inherits="AutoGenerate_page20" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ctr1 %>" SelectCommand="SELECT * FROM [NewsData]"></asp:SqlDataSource>
    
        <br />
        <asp:Button ID="Button1" runat="server" Text="員工" OnClick="Button1_Click" />
&nbsp;
        <asp:Button ID="Button2" runat="server" Text="書籍" />
    
    </div>
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="news_id" HeaderText="news_id" InsertVisible="False" ReadOnly="True" SortExpression="news_id" />
                <asp:BoundField DataField="news_time" HeaderText="news_time" SortExpression="news_time" />
                <asp:BoundField DataField="news_type" HeaderText="news_type" SortExpression="news_type" />
                <asp:BoundField DataField="news_title" HeaderText="news_title" SortExpression="news_title" />
                <asp:BoundField DataField="news_editor" HeaderText="news_editor" SortExpression="news_editor" />
                <asp:BoundField DataField="news_content" HeaderText="news_content" SortExpression="news_content" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
    </form>
</body>
</html>
