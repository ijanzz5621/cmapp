Imports System.Web.Script.Services
Imports System.Web.Services
Imports CMAPP.BLogic
Imports Newtonsoft.Json

Public Class TestTimeUpdateV2
    Inherits System.Web.UI.Page

    Private Shared cnnOraString As String = ConfigurationManager.ConnectionStrings("ORA_DefaultConnString").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    '<ScriptMethod(UseHttpGet:=False, ResponseFormat:=ResponseFormat.Json)>
    <WebMethod>
    Public Shared Function GetTestProgramIDList(q As String) As Object

        Dim obj As Object = JsonConvert.SerializeObject("")

        Try

            Dim fnData As blGeneral = New blGeneral()
            fnData.ConnectionString = cnnOraString
            Dim dsResult As DataTable = fnData.GetProgramIDListWithFilter(q)

            obj = JsonConvert.SerializeObject(dsResult)

        Catch ex As Exception

        End Try

        Return obj

    End Function

    <System.Web.Services.WebMethod()>
    Public Shared Function GetCurrentTime(ByVal name As String) As String
        Return "Hello " & name & Environment.NewLine & "The Current Time is: " &
                 DateTime.Now.ToString()
    End Function

End Class