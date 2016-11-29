<%@ Page MasterPageFile="Polls.master" Debug="True"
         Title="網路投票系統" Language="VB" %>
<%@ Import Namespace="System.Data" %>
<%@ Import NameSpace="System.Data.OleDb" %>
<script Runat="server">
Sub Page_Load(Sender As Object, E As EventArgs)
   If Not isPostBack Then
      MyTitle.Text = "請選擇進入的票選主題"
   End If
End Sub
' 處理票選功能
Sub ProcessPoll(Sender As Object, _
                E As GridViewCommandEventArgs)
   Dim index As Integer = CInt(E.CommandArgument)
   Dim pollno As String
   If E.CommandName = "joinVote" Then
      pollno = gridView.DataKeys(index).Value.ToString()
      Response.Redirect("JoinPoll.aspx?PollID=" & pollno)
   End If
   If E.CommandName = "viewVote" Then
      pollno = gridView.DataKeys(index).Value.ToString() 
      Response.Redirect("ViewPoll.aspx?PollID=" & pollno)
   End If
End Sub
' 計算參與票選的人數
Function NumOfUsers(pollno As String) As Integer
   Dim objCon As OleDbConnection
   Dim objCmd As OleDbCommand
   Dim result, strDbCon, strSQL As String
   ' OLEDB提供者字串
   strDbCon = "Provider=Microsoft.Jet.OLEDB.4.0;" & _
   "Data Source=" & Server.Mappath("Polls.mdb")
   strSQL = "SELECT Count(*) FROM POLLRESULTS " & _
             "WHERE PollID=" & pollno
   objCon = New OleDbConnection(strDbCon) 
   objCon.Open()  ' 開啟資料庫連結
   ' 建立Command物件的SQL指令
   objCmd = New OleDbCommand(strSQL, objCon)
   ' 使用ExecuteScalar執行SQL指令
   result = objCmd.ExecuteScalar()
   objCon.Close()  ' 關閉資料庫連結
   Return CInt(result)
End Function
</script>
<asp:Content ContentPlaceHolderID="content" 
             Runat="server">
<asp:Label Id="MyTitle" Font-Size="14pt" Width="450px"
            BackColor="#B5C7DE" ForeColor="#507CD1"
            Font-Bold="True" Runat="server"/><hr/>
<asp:AccessDataSource Id="PollSource" 
   Runat="Server" DataFile="~/Polls.mdb"
   SelectCommand="SELECT * FROM Poll"/>
<asp:GridView Id="gridView" Runat="server"
     DataSourceID="PollSource" OnRowCommand="ProcessPoll"
     AutoGenerateColumns="False"
     DataKeyNames="pollId" CellPadding="5" Width="450px"
     AllowPaging="True" PageSize="4"     
     HeaderStyle-BackColor="#507CD1"
     HeaderStyle-ForeColor="White"
     BorderColor="#CCCC99" BorderStyle="Solid" 
     AlternatingRowStyle-BackColor="#EFF3FB">
 <Columns>
    <asp:BoundField HeaderText="票選名稱" 
                    DataField="PollName"/>
    <asp:TemplateField HeaderText="人數">
       <ItemTemplate>
          <%# NumOfUsers(Eval("PollID").ToString)%>
       </ItemTemplate>
    </asp:TemplateField>
    <asp:ButtonField HeaderText="選擇投票" 
         Text="參與投票" CommandName="joinVote"/>
    <asp:ButtonField HeaderText="觀看結果"  
         Text="票選結果" CommandName="viewVote"/>
 </Columns>
</asp:GridView>
</asp:Content>