<%@ Page Language="C#" AutoEventWireup="true" CodeFile="範例第七題.aspx.cs" Inherits="範例第七題" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [書籍]"></asp:SqlDataSource>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="書籍編號" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="書籍編號" HeaderText="書籍編號" InsertVisible="False" ReadOnly="True" SortExpression="書籍編號" />
                <asp:BoundField DataField="書籍名稱" HeaderText="書籍名稱" SortExpression="書籍名稱" />
                <asp:BoundField DataField="單價" HeaderText="單價" SortExpression="單價" />
                <asp:BoundField DataField="庫存" HeaderText="庫存" SortExpression="庫存" />
                <asp:BoundField DataField="負責人" HeaderText="負責人" SortExpression="負責人" />
                <asp:BoundField DataField="類別編號" HeaderText="類別編號" SortExpression="類別編號" />
                <asp:ImageField DataImageUrlField="封面照片" DataImageUrlFormatString="BookCover/{0}" HeaderText="封面照片">
                    <ControlStyle Width="70px" />
                </asp:ImageField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
