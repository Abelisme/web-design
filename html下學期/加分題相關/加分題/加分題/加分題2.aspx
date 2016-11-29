<%@ Page Language="C#" AutoEventWireup="true" CodeFile="加分題2.aspx.cs" Inherits="加分題2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .新增樣式1 {
            background-image: url('computer_kuan_186595_10.jpg');
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
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
        <asp:Label ID="Label2" runat="server" Enabled="False" ForeColor="Black"></asp:Label>
        <asp:Label ID="Label3" runat="server" CssClass="新增樣式1" ForeColor="Lime"></asp:Label>
        <asp:Label ID="Label5" runat="server" CssClass="新增樣式1" ForeColor="Lime"></asp:Label>
        <asp:Label ID="Label6" runat="server"></asp:Label>
        <br />
        <br />
        <hr style="width: 1270px; height: 0px; margin-left: 0px" />

    
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="送出" onclick="Button1_Click" />
    
    &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
    
    </div>
    </form>
</body>
</html>
