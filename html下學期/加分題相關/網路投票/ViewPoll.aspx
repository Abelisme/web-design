<%@ Page MasterPageFile="Polls.master" Debug="True"
         Title="��ܲ��諸�벼���G" Language="VB" %>
<%@ Import Namespace="System.Data" %>
<%@ Import NameSpace="System.Data.OleDb" %>
<script Runat="server">
Dim objCon As OleDbConnection
Dim objCmd As OleDbCommand
Dim objDataReader As OleDbDataReader
' OLEDB���Ѫ̦r��
Dim strDbCon As String = _
"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & _
       Server.Mappath("Polls.mdb")
Sub Page_Load(sender As Object, e As EventArgs)
   Dim pollno As String = Request.QueryString("PollID")
   MyTitle.Text = "��ܲ��諸�벼���G"
   ShowVoteResult(pollno)   ' ��ܲ��諸���G
End Sub
' ��ܲ��諸���G
Sub ShowVoteResult(pollno As String)
   Dim strSQL, output, choiceName As String
   Dim i, total, result As Integer
   Dim ArrayChoices(6) As String
   Dim ArrayResults(6) As Integer
   ' �إ�SQL�r��
   strSQL = "SELECT * FROM POLL WHERE PollID=" & pollno
   ' �إ�Connection����
   objCon = New OleDbConnection(strDbCon)
   objCon.Open() ' �}�Ҹ�Ʈw�s��
   ' �إ�Command����SQL���O
   objCmd = New OleDbCommand(strSQL, objCon)
   ' ���oDataReader����
   objDataReader = objCmd.ExecuteReader()
   ' �B�z��ƪ��O��
   While objDataReader.Read()
      For i = 1 To 5    ' ���o���諸�ﶵ�M���G
         If objDataReader.IsDBNull(objDataReader. _
               GetOrdinal("Choice" & i)) = False Then
            choiceName = objDataReader.Item("Choice"& i)
         Else
            choiceName = ""
         End If
         ArrayChoices(i) = choiceName
         If choiceName <> "" Then  ' ���o���諸���G 
            ArrayResults(i) = NumOfChoice(pollno, i)
         Else
            ArrayResults(i) = 0
         End If
      Next i
      total = 0
      For i = 1 To 5   ' �p���`�@������H��
         total += ArrayResults(i)
      Next
      output &= "<font color='#507CD1'><b>���D: </b>" & _
           objDataReader.Item("PollQuestion") & "<br/>"
      output &= "<b>�벼�`�H��: " & total & " �H</b></font>"
      output &= "<hr/><table border='1' bgcolor='#EFF3FB' "
      output &= "width='400px'>"
      ' ��ܹϧΪ��έp���G
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
   objDataReader.Close() ' ����DataReader
   objCon.Close()        ' ������Ʈw�s��
   msg.Text = output
End Sub
' �p��ѻP���諸�H��
Function NumOfChoice(pollno As String, _
                     choiceNo As Integer) As Integer
   Dim objCon1 As OleDbConnection
   Dim objCmd1 As OleDbCommand
   Dim result, strSQL As String
   strSQL="SELECT COUNT(PollAnswer) FROM POLLRESULTS" & _ 
   " WHERE PollID="& pollno &" AND PollAnswer="& choiceNo
   objCon1 = New OleDbConnection(strDbCon) 
   objCon1.Open()  ' �}�Ҹ�Ʈw�s��
   ' �إ�Command����SQL���O
   objCmd1 = New OleDbCommand(strSQL, objCon1)
   ' �ϥ�ExecuteScalar����SQL���O
   result = objCmd1.ExecuteScalar()
   objCon1.Close()  ' ������Ʈw�s��
   Return CInt(result)
End Function
' �ഫ���ʤ���
Function ConvertToPercent(total As Integer, _
                          result As Integer) As String
    Dim temp As Double
    If result = 0 Then
       Return "0.0%"
    Else  ' �ഫ���ʤ���
       temp = result/total
       Return temp.ToString("P")
    End If
End Function
' �ഫ�����e�ת��I��
Function ConvertToPix(total As Integer, _
                      result As Integer) As Integer
    If result = 0 Then
       Return 0
    Else  ' �ഫ���I��
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
