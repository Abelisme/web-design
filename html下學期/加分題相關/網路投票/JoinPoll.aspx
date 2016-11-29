<%@ Page MasterPageFile="Polls.master" Debug="True"
         Title="�ѥ[Polls��������" Language="VB" %>
<%@ Import Namespace="System.Data" %>
<%@ Import NameSpace="System.Data.OleDb" %>
<script Runat="server">
Dim objCon As OleDbConnection
Dim objCmd As OleDbCommand
Dim objDataReader As OleDbDataReader
Dim pollno As String
' OLEDB���Ѫ̦r��
Dim strDbCon As String = _
"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & _
              Server.Mappath("Polls.mdb")
Sub Page_Load(Sender As Object, E As EventArgs) 
   Dim names As ArrayList= New ArrayList()
   Dim choiceName As String
   Dim i As Integer
   pollno = Request.QueryString("PollID")
   If Not IsPostBack Then  ' �Ĥ@�����J����
      Dim strSQL As String
      ' �إ�SQL�r��
      strSQL="SELECT * FROM POLL WHERE PollID=" & pollno
      ' �إ�Connection����
      objCon = New OleDbConnection(strDbCon)
      objCon.Open() ' �}�Ҹ�Ʈw�s��
      ' �إ�Command����SQL���O
      objCmd = New OleDbCommand(strSQL, objCon)
      ' ���oDataReader����
      objDataReader = objCmd.ExecuteReader()
      objDataReader.Read()    ' �B�z��ƪ��O��
      ' ���o������D
      question.Text = objDataReader.Item("PollQuestion")      
      For i = 1 To 5  ' ���o���諸�ﶵ
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
      MyTitle.Text = "�ѥ[Polls��������"
   End If
End Sub
' �ѥ[����, �B�z�ϥΪ̪����
Sub JoinVote(Sender As Object, E As EventArgs) 
   ' �x�s������ƪ�
   SavePollAnswer(pollno, choice.SelectedIndex+1)
   Response.Redirect("ViewPoll.aspx?PollID=" & pollno)
End Sub
' �N����s�J��ƪ�PollResults
Sub SavePollAnswer(pollno As String, choice As Integer)
   Dim strSQL As String
   ' �إ�SQL�ԭz�s�W�@����ƪ�O��
   strSQL = "INSERT INTO POLLRESULTS (PollID,"
   strSQL &="IPAddress,PollAnswer) VALUES ('"    
   strSQL &= pollno & "','"
   strSQL &=Request.ServerVariables("REMOTE_ADDR")& "','"
   strSQL &=choice & "')" 
   ' �إ�Connection����
   objCon = New OleDbConnection(strDbCon) 
   objCon.Open()  ' �}�Ҹ�Ʈw�s��
   ' �إ�Command����SQL���O
   objCmd = New OleDbCommand(strSQL, objCon)
   objCmd.ExecuteNonQuery()   ' ����SQL���O
   objCon.Close()  ' ������Ʈw�s��
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
  <font color="white">���D:<asp:Label Id="question" 
                       Runat="server"/></font></td></tr>
<tr><td>
  <asp:RadioButtonList Id="choice" Runat="server"/>
  <asp:RequiredFieldValidator Id="validChoice"
       Runat="server" ControlToValidate="choice"
       ErrorMessage="�п�ܰ��D...."
       Display="Dynamic"/></td></tr>
</table><br>
<asp:Button Text="�ѥ[����" OnClick="JoinVote"
                            Runat="server"/><p>
<asp:Label Id="msg" ForeColor="red" Runat="server"/>
</asp:Content>


