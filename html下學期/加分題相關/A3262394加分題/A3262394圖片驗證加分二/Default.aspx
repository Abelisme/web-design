<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Font-Names="標楷體" Font-Size="16pt" ForeColor="#0000C0" Text="你是否贊成「廢除死刑」"></asp:Label>
        <br />
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem>贊成</asp:ListItem>
            <asp:ListItem>反對</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Enabled="False" ForeColor="Black"></asp:Label>
        <asp:Label ID="Label3" runat="server" CssClass="新增樣式1" ForeColor="Lime" BackColor="Black"></asp:Label>
        <asp:Label ID="Label5" runat="server"></asp:Label>
        <asp:Label ID="Label6" runat="server" ForeColor="Lime" BackColor="Black"></asp:Label>
        <br />
        <br />
        <hr style="width: 1270px; height: 0px; margin-left: 0px" />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="送出" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
    
    </div>
    </form>
</body>
</html>
