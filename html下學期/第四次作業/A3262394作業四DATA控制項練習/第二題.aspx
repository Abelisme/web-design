<%@ Page Language="C#" AutoEventWireup="true" CodeFile="第二題.aspx.cs" Inherits="第二題" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [書籍類別]"></asp:SqlDataSource>
        <br />
    <div>
    
        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="類別編號" DataSourceID="SqlDataSource3" OnRowCommand="GridView3_RowCommand">
            <Columns>
                <asp:BoundField DataField="類別編號" HeaderText="類別編號" ReadOnly="True" SortExpression="類別編號" />
                <asp:BoundField DataField="類別名稱" HeaderText="類別名稱" SortExpression="類別名稱" />
                <asp:ButtonField ButtonType="Button" CommandName="xxx" Text="書籍" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT [書籍編號], [書籍名稱], [單價], [庫存], [負責人], [類別編號] FROM [書籍] WHERE ([類別編號] = @類別編號)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView3" DefaultValue="0" Name="類別編號" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="書籍編號" DataSourceID="SqlDataSource4">
            <Columns>
                <asp:BoundField DataField="書籍編號" HeaderText="書籍編號" InsertVisible="False" ReadOnly="True" SortExpression="書籍編號" />
                <asp:BoundField DataField="書籍名稱" HeaderText="書籍名稱" SortExpression="書籍名稱" />
                <asp:BoundField DataField="單價" HeaderText="單價" SortExpression="單價" />
                <asp:BoundField DataField="庫存" HeaderText="庫存" SortExpression="庫存" />
                <asp:BoundField DataField="負責人" HeaderText="負責人" SortExpression="負責人" />
                <asp:BoundField DataField="類別編號" HeaderText="類別編號" SortExpression="類別編號" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
