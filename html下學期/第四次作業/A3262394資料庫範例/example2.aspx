<%@ Page Language="C#" AutoEventWireup="true" CodeFile="example2.aspx.cs" Inherits="example2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ctr1 %>" SelectCommand="SELECT [員工編號], [姓名], [主管員工編號] FROM [員工] WHERE ([主管員工編號] = @主管員工編號)">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="主管員工編號" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="姓名" DataValueField="員工編號">
        </asp:DropDownList>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ctr1 %>" SelectCommand="SELECT * FROM [書籍]"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="書籍編號" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="書籍編號" HeaderText="書籍編號" InsertVisible="False" ReadOnly="True" SortExpression="書籍編號" />
                <asp:BoundField DataField="書籍名稱" HeaderText="書籍名稱" SortExpression="書籍名稱" />
                <asp:BoundField DataField="單價" HeaderText="單價" SortExpression="單價" />
                <asp:BoundField DataField="庫存" HeaderText="庫存" SortExpression="庫存" />
                <asp:BoundField DataField="負責人" HeaderText="負責人" SortExpression="負責人" />
                <asp:BoundField DataField="封面照片" HeaderText="封面照片" SortExpression="封面照片" />
                <asp:BoundField DataField="類別編號" HeaderText="類別編號" SortExpression="類別編號" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <br />
    
    </div>
    </form>
</body>
</html>
