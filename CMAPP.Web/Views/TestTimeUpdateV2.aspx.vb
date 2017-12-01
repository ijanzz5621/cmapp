Imports System.Web.Script.Services
Imports System.Web.Services
Imports CMAPP.BLogic
Imports Newtonsoft.Json

Public Class TestTimeUpdateV2
    Inherits System.Web.UI.Page

    Private Shared cnnOraString As String = ConfigurationManager.ConnectionStrings("ORA_DefaultConnString").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then



        Else

            If txtProgramID.Text <> "" Then

                Dim fnData As blGeneral = New blGeneral()
                fnData.ConnectionString = cnnOraString
                Dim dsProgRev As DataTable = fnData.GetProgramRevList(txtProgramID.Text)
                ddlRevision.DataSource = dsProgRev
                ddlRevision.DataTextField = "TESTPROGIDREV"
                ddlRevision.DataValueField = "TESTPROGIDREV"
                ddlRevision.DataBind()

            End If

        End If

    End Sub

#Region "Web Methods"
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

    <WebMethod>
    Public Shared Function GetRevisionByProgID(testProgID As String) As Object

        Dim obj As Object = JsonConvert.SerializeObject("")

        Try

            Dim fnData As blGeneral = New blGeneral()
            fnData.ConnectionString = cnnOraString
            Dim dsResult As DataTable = fnData.GetProgramRevList(testProgID)

            obj = JsonConvert.SerializeObject(dsResult)

        Catch ex As Exception

        End Try

        Return obj

    End Function

    <WebMethod>
    Public Shared Function GetMaxRevisionByProgID(testProgID As String) As Object

        Dim obj As Object = JsonConvert.SerializeObject("")

        Try

            Dim fnData As blGeneral = New blGeneral()
            fnData.ConnectionString = cnnOraString
            Dim dsResult As DataTable = fnData.GetMaxRevByTestProgID(testProgID)

            obj = JsonConvert.SerializeObject(dsResult)

        Catch ex As Exception

        End Try

        Return obj

    End Function

    <WebMethod>
    Public Shared Function GetTestProgramNameList(q As String) As Object

        Dim obj As Object = JsonConvert.SerializeObject("")

        Try

            Dim fnData As blGeneral = New blGeneral()
            fnData.ConnectionString = cnnOraString
            Dim dsResult As DataTable = fnData.GetProgramNameListWithFilter(q)

            obj = JsonConvert.SerializeObject(dsResult)

        Catch ex As Exception

        End Try

        Return obj

    End Function

    <WebMethod>
    Public Shared Function GetTestProgramExecList(q As String) As Object

        Dim obj As Object = JsonConvert.SerializeObject("")

        Try

            Dim fnData As blGeneral = New blGeneral()
            fnData.ConnectionString = cnnOraString
            Dim dsResult As DataTable = fnData.GetProgramExecListWithFilter(q)

            obj = JsonConvert.SerializeObject(dsResult)

        Catch ex As Exception

        End Try

        Return obj

    End Function

#End Region

    Protected Sub chkMaxRev_CheckedChanged(sender As Object, e As EventArgs)

    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs)

    End Sub
End Class