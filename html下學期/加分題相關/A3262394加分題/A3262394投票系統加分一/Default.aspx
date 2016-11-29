<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" ForeColor="Blue" Text="你是否贊成『廢除死刑』?"></asp:Label>
        <br />
        <br />
&nbsp;<asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem>贊成</asp:ListItem>
            <asp:ListItem>反對</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <br />
        <hr />
        <asp:Button ID="Button1" runat="server" Text="送出" OnClick="Button1_Click" />
    
    </div>
    </form>
</body>
</html>
