<%@ Page MasterPageFile="Polls.master" Debug="True"
         Title="�����벼�t��" Language="VB" %>
<%@ Import Namespace="System.Data" %>
<%@ Import NameSpace="System.Data.OleDb" %>
<script Runat="server">
Sub Page_Load(Sender As Object, E As EventArgs)
   If Not isPostBack Then
      MyTitle.Text = "�п�ܶi�J������D�D"
   End If
End Sub
' �B�z����\��
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
' �p��ѻP���諸�H��
Function NumOfUsers(pollno As String) As Integer
   Dim objCon As OleDbConnection
   Dim objCmd As OleDbCommand
   Dim result, strDbCon, strSQL As String
   ' OLEDB���Ѫ̦r��
   strDbCon = "Provider=Microsoft.Jet.OLEDB.4.0;" & _
   "Data Source=" & Server.Mappath("Polls.mdb")
   strSQL = "SELECT Count(*) FROM POLLRESULTS " & _
             "WHERE PollID=" & pollno
   objCon = New OleDbConnection(strDbCon) 
   objCon.Open()  ' �}�Ҹ�Ʈw�s��
   ' �إ�Command����SQL���O
   objCmd = New OleDbCommand(strSQL, objCon)
   ' �ϥ�ExecuteScalar����SQL���O
   result = objCmd.ExecuteScalar()
   objCon.Close()  ' ������Ʈw�s��
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
    <asp:BoundField HeaderText="����W��" 
                    DataField="PollName"/>
    <asp:TemplateField HeaderText="�H��">
       <ItemTemplate>
          <%# NumOfUsers(Eval("PollID").ToString)%>
       </ItemTemplate>
    </asp:TemplateField>
    <asp:ButtonField HeaderText="��ܧ벼" 
         Text="�ѻP�벼" CommandName="joinVote"/>
    <asp:ButtonField HeaderText="�[�ݵ��G"  
         Text="���ﵲ�G" CommandName="viewVote"/>
 </Columns>
</asp:GridView>
</asp:Content>