<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>--%>

<!DOCTYPE html>
<script runat="server">

    Protected Sub Button1_Click(sender As Object, e As EventArgs)

    End Sub
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .newStyle1 {
            font-size: 47px;
            color: #FFFFFF;
            text-align: center;
            background-color: #CC00CC;
            text-indent: inherit;
            vertical-align: bottom;
            white-space: pre-wrap;
        }
        .newStyle2 {
            font-size: 47px;
            color: #000080;
            text-align: center;
            background-color: #CCCC00;
        }
        .newStyle2 {
            text-align: center;
            font-size: 50px;
            color: #000080;
        }
        .newStyle2 {
            font-size: 47px;
            text-align: center;
            background-color: #CCCC00;
            color: #000080;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label8" runat="server" CssClass="newStyle2" Font-Size="XX-Large" ForeColor="Black" Height="46px" Text="問卷調查表" Width="793px"></asp:Label>
        <br />
    
        <asp:Label ID="Label1" runat="server" Text="姓名:"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />

        <br />
    
    
        <asp:Label ID="Label2" runat="server" Text="學歷:"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>請選擇</asp:ListItem>
            <asp:ListItem>高中</asp:ListItem>
            <asp:ListItem>大學</asp:ListItem>
            <asp:ListItem>研究所</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="興趣:"></asp:Label>
&nbsp;<asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem>運動</asp:ListItem>
            <asp:ListItem>逛街</asp:ListItem>
            <asp:ListItem>閱讀</asp:ListItem>
            <asp:ListItem>影音</asp:ListItem>
            <asp:ListItem>旅遊</asp:ListItem>
            <asp:ListItem>其他</asp:ListItem>
        </asp:CheckBoxList>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="留言:"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Height="75px" style="margin-left: 29px" Width="218px"></asp:TextBox>
        <br />
        <asp:Label ID="Label5" runat="server" Text="性別:"></asp:Label>
&nbsp;
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem>男</asp:ListItem>
            <asp:ListItem>女</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Label ID="Label6" runat="server" Text="職業:"></asp:Label>
&nbsp;
        <br />
        <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem>請選擇</asp:ListItem>
            <asp:ListItem>工程師</asp:ListItem>
            <asp:ListItem>宅宅</asp:ListItem>
            <asp:ListItem>程式猿</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Button ID="Button1" runat="server" Text="輸入" PostBackUrl="~/另一個連接的網頁/requestpost2.aspx" />
</div>
        </form>
    </body>
</html>