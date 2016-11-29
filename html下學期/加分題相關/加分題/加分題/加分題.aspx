<%@ Page Language="C#" AutoEventWireup="true" CodeFile="加分題.aspx.cs" Inherits="加分題" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 221px">
    
        <asp:Label ID="Label1" runat="server" Font-Names="標楷體" Font-Size="16pt" ForeColor="#0000C0"
            Text="你是否贊成「廢除死刑」"></asp:Label>
        <br />
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
            RepeatLayout="Flow">
            <asp:ListItem>贊成</asp:ListItem>
            <asp:ListItem>反對</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server"></asp:Label>
        <br />
        <br />
        <hr style="width: 1270px; height: 0px; margin-left: 0px" />

    
        <br />
        <asp:Button ID="Button1" runat="server" Text="送出" onclick="Button1_Click" />

    
    </div>
    </form>
</body>
</html>
