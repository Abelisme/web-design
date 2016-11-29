<%@ Page Language="C#" AutoEventWireup="true" CodeFile="requestpost2.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .newStyle1 {
            font-size: xx-large;
            background-position: center;
        }
        .newStyle2 {
            text-align: center;
            font-size: 50px;
            color: #000080;
        }
        .newStyle2 {
            font-size: 47px;
            color: #000080;
            text-align: center;
            background-color: #CCCC00;
        }
        .newStyle2 {
            font-size: 47px;
            color: #FFFFFF;
            text-align: center;
            background-color: #CC00FF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label7" runat="server" CssClass="newStyle2" Height="51px" Text="問卷調查資料" Width="553px"></asp:Label>
        <br />
    
        姓名:<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        性別:<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    
    </div>
        學歷:<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        <br />
        職業:<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
        <br />
        興趣:<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
        <br />
        留言:<asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
