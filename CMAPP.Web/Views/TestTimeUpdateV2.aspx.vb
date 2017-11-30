Imports System.Web.Script.Services
Imports System.Web.Services
Imports Newtonsoft.Json

Public Class TestTimeUpdateV2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    '<ScriptMethod(UseHttpGet:=False, ResponseFormat:=ResponseFormat.Json)>
    <WebMethod>
    Public Shared Function GetTestProgramIDList(q As String) As Object

        Dim obj As Object = JsonConvert.SerializeObject("[]")

        Return obj

    End Function

    <System.Web.Services.WebMethod()>
    Public Shared Function GetCurrentTime(ByVal name As String) As String
        Return "Hello " & name & Environment.NewLine & "The Current Time is: " &
                 DateTime.Now.ToString()
    End Function

End Class