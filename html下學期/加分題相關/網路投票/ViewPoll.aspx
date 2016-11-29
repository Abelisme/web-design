<%@ Page MasterPageFile="Polls.master" Debug="True"
         Title="顯示票選的投票結果" Language="VB" %>
<%@ Import Namespace="System.Data" %>
<%@ Import NameSpace="System.Data.OleDb" %>
<script Runat="server">
Dim objCon As OleDbConnection
Dim objCmd As OleDbCommand
Dim objDataReader As OleDbDataReader
' OLEDB提供者字串
Dim strDbCon As String = _
"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & _
       Server.Mappath("Polls.mdb")
Sub Page_Load(sender As Object, e As EventArgs)
   Dim pollno As String = Request.QueryString("PollID")
   MyTitle.Text = "顯示票選的投票結果"
   ShowVoteResult(pollno)   ' 顯示票選的結果
End Sub
' 顯示票選的結果
Sub ShowVoteResult(pollno As String)
   Dim strSQL, output, choiceName As String
   Dim i, total, result As Integer
   Dim ArrayChoices(6) As String
   Dim ArrayResults(6) As Integer
   ' 建立SQL字串
   strSQL = "SELECT * FROM POLL WHERE PollID=" & pollno
   ' 建立Connection物件
   objCon = New OleDbConnection(strDbCon)
   objCon.Open() ' 開啟資料庫連結
   ' 建立Command物件的SQL指令
   objCmd = New OleDbCommand(strSQL, objCon)
   ' 取得DataReader物件
   objDataReader = objCmd.ExecuteReader()
   ' 處理資料表的記錄
   While objDataReader.Read()
      For i = 1 To 5    ' 取得票選的選項和結果
         If objDataReader.IsDBNull(objDataReader. _
               GetOrdinal("Choice" & i)) = False Then
            choiceName = objDataReader.Item("Choice"& i)
         Else
            choiceName = ""
         End If
         ArrayChoices(i) = choiceName
         If choiceName <> "" Then  ' 取得票選的結果 
            ArrayResults(i) = NumOfChoice(pollno, i)
         Else
            ArrayResults(i) = 0
         End If
      Next i
      total = 0
      For i = 1 To 5   ' 計算總共的票選人數
         total += ArrayResults(i)
      Next
      output &= "<font color='#507CD1'><b>問題: </b>" & _
           objDataReader.Item("PollQuestion") & "<br/>"
      output &= "<b>投票總人數: " & total & " 人</b></font>"
      output &= "<hr/><table border='1' bgcolor='#EFF3FB' "
      output &= "width='400px'>"
      ' 顯示圖形的統計結果
      For i = 1 To 5
         choiceName = ArrayChoices(i)
         result = ArrayResults(i)
         If choiceName <> "" Then
          output &="<tr><td colspan='1' width='80px'><b>"
          output &="<font color='#507CD1' size='-1'>" & choiceName 
          output &= "<br/>" & ConvertToPercent(total, result)
          output &= "(" & result & ")</font></b></td><td></td>"
          output &="<td colspan='2' width='320px'>"
          output &="<table border='1' cellspacing='0'>"
          output &="<tr><td bgcolor='#507CD1' "
          output &="align='center' width='" 
          output &=ConvertToPix(total, result) & "'>"
          output &="&nbsp;</td></tr></table></td></tr>"
         End If
      Next i
      output = output & "</table>"
   End While
   objDataReader.Close() ' 關閉DataReader
   objCon.Close()        ' 關閉資料庫連結
   msg.Text = output
End Sub
' 計算參與票選的人數
Function NumOfChoice(pollno As String, _
                     choiceNo As Integer) As Integer
   Dim objCon1 As OleDbConnection
   Dim objCmd1 As OleDbCommand
   Dim result, strSQL As String
   strSQL="SELECT COUNT(PollAnswer) FROM POLLRESULTS" & _ 
   " WHERE PollID="& pollno &" AND PollAnswer="& choiceNo
   objCon1 = New OleDbConnection(strDbCon) 
   objCon1.Open()  ' 開啟資料庫連結
   ' 建立Command物件的SQL指令
   objCmd1 = New OleDbCommand(strSQL, objCon1)
   ' 使用ExecuteScalar執行SQL指令
   result = objCmd1.ExecuteScalar()
   objCon1.Close()  ' 關閉資料庫連結
   Return CInt(result)
End Function
' 轉換成百分比
Function ConvertToPercent(total As Integer, _
                          result As Integer) As String
    Dim temp As Double
    If result = 0 Then
       Return "0.0%"
    Else  ' 轉換成百分比
       temp = result/total
       Return temp.ToString("P")
    End If
End Function
' 轉換成表格寬度的點數
Function ConvertToPix(total As Integer, _
                      result As Integer) As Integer
    If result = 0 Then
       Return 0
    Else  ' 轉換成點數
       Return CInt(320/total * result)
    End If
End Function
</script>
<asp:Content ContentPlaceHolderID="content" 
             Runat="server">
<asp:Label Id="MyTitle" Font-Size="14pt" Width="400px"
            BackColor="#B5C7DE" ForeColor="#507CD1"
            Font-Bold="True" Runat="server"/><hr/>
<asp:Label Id="msg" Runat="server"/><hr>
</asp:Content>
