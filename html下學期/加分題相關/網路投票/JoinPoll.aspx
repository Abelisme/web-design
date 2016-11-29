<%@ Page MasterPageFile="Polls.master" Debug="True"
         Title="參加Polls網路票選" Language="VB" %>
<%@ Import Namespace="System.Data" %>
<%@ Import NameSpace="System.Data.OleDb" %>
<script Runat="server">
Dim objCon As OleDbConnection
Dim objCmd As OleDbCommand
Dim objDataReader As OleDbDataReader
Dim pollno As String
' OLEDB提供者字串
Dim strDbCon As String = _
"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & _
              Server.Mappath("Polls.mdb")
Sub Page_Load(Sender As Object, E As EventArgs) 
   Dim names As ArrayList= New ArrayList()
   Dim choiceName As String
   Dim i As Integer
   pollno = Request.QueryString("PollID")
   If Not IsPostBack Then  ' 第一次載入網頁
      Dim strSQL As String
      ' 建立SQL字串
      strSQL="SELECT * FROM POLL WHERE PollID=" & pollno
      ' 建立Connection物件
      objCon = New OleDbConnection(strDbCon)
      objCon.Open() ' 開啟資料庫連結
      ' 建立Command物件的SQL指令
      objCmd = New OleDbCommand(strSQL, objCon)
      ' 取得DataReader物件
      objDataReader = objCmd.ExecuteReader()
      objDataReader.Read()    ' 處理資料表的記錄
      ' 取得票選問題
      question.Text = objDataReader.Item("PollQuestion")      
      For i = 1 To 5  ' 取得票選的選項
         If objDataReader.IsDBNull(objDataReader. _
                  GetOrdinal("Choice" & i)) = False Then
            choiceName = objDataReader.Item("Choice" & i)
            If choiceName <> "" Then
               names.Add(choiceName)
            End If
         End If   
      Next i
      choice.DataSource = names
      choice.DataBind()
      objCon.Close()
      MyTitle.Text = "參加Polls網路票選"
   End If
End Sub
' 參加票選, 處理使用者的選擇
Sub JoinVote(Sender As Object, E As EventArgs) 
   ' 儲存票選到資料表
   SavePollAnswer(pollno, choice.SelectedIndex+1)
   Response.Redirect("ViewPoll.aspx?PollID=" & pollno)
End Sub
' 將票選存入資料表PollResults
Sub SavePollAnswer(pollno As String, choice As Integer)
   Dim strSQL As String
   ' 建立SQL敘述新增一筆資料表記錄
   strSQL = "INSERT INTO POLLRESULTS (PollID,"
   strSQL &="IPAddress,PollAnswer) VALUES ('"    
   strSQL &= pollno & "','"
   strSQL &=Request.ServerVariables("REMOTE_ADDR")& "','"
   strSQL &=choice & "')" 
   ' 建立Connection物件
   objCon = New OleDbConnection(strDbCon) 
   objCon.Open()  ' 開啟資料庫連結
   ' 建立Command物件的SQL指令
   objCmd = New OleDbCommand(strSQL, objCon)
   objCmd.ExecuteNonQuery()   ' 執行SQL指令
   objCon.Close()  ' 關閉資料庫連結
End Sub
</script>
<asp:Content ContentPlaceHolderID="content" 
             Runat="server">
<asp:Label Id="MyTitle" Font-Size="14pt" Width="400px"
            BackColor="#B5C7DE" ForeColor="#507CD1"
            Font-Bold="True" Runat="server"/><hr/>
<table border="1" cellspacing="0" cellpadding="2" 
       width="400px" bgcolor="#EFF3FB">
<tr><td colspan="2" bgcolor="#507CD1" align="center">
  <font color="white">問題:<asp:Label Id="question" 
                       Runat="server"/></font></td></tr>
<tr><td>
  <asp:RadioButtonList Id="choice" Runat="server"/>
  <asp:RequiredFieldValidator Id="validChoice"
       Runat="server" ControlToValidate="choice"
       ErrorMessage="請選擇問題...."
       Display="Dynamic"/></td></tr>
</table><br>
<asp:Button Text="參加票選" OnClick="JoinVote"
                            Runat="server"/><p>
<asp:Label Id="msg" ForeColor="red" Runat="server"/>
</asp:Content>


