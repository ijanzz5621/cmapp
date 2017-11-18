
Imports oOra = CMAPP.Data.Oracle
Imports Oracle.ManagedDataAccess.Client

Imports CMAPP.Web.GlobalVar
Imports AjaxControlToolkit

Public Class TestTimeUpdate
    Inherits System.Web.UI.Page

    'Oracle
    Private oOra As New oOra
    Private cnnOra As OracleConnection = Nothing
    Private cnnOraString As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            'GetListing("", "", "", "", "", "", "", "")

        End If

    End Sub

    Private Sub GetListing(p_strTestProgID As String, p_strTestProgIDRev As String, p_strTestProgIDVers As String, p_strTestStepTemp As String,
                           p_strDevice As String, p_strTesterType As String, p_strProgMainSource As String, p_strProgExec As String)

        Dim strQuery As String

        Try

            GetAppConfig()
            OpenConnection()

            strQuery = "Select TestProgID,TestProgIDRev,TestProgIDVers,TesterType,TestProgMainSource,TestProgExecutable,Device,TestStepTemp,to_char(TestTimeEffDate,'mm/dd/yyyy') As TestTimeEffDate,OverHead,' ' as UserId "
            For i = 1 To gc_intMaxSiteCount
                strQuery = strQuery & ",Max(Decode(SiteCount, " & i & ", TestTime, null)) x" & i
            Next
            strQuery = strQuery & " From  cmtesttime "
            strQuery = strQuery & " Where Not UserId Is Null "
            'strQuery = strQuery & " And ROWNUM <= 20 "

            If Len(Trim(p_strTestProgID)) > 1 Then
                strQuery = strQuery & " And TestProgId like '" & p_strTestProgID & "'"
            End If
            If Len(Trim(p_strTestProgIDRev)) > 1 Then
                strQuery = strQuery & " And testprogidrev like '" & p_strTestProgIDRev & "'"
            Else

            End If
            If Len(Trim(p_strTestProgIDVers)) > 1 Then
                strQuery = strQuery & " And testprogidvers like '" & p_strTestProgIDVers & "'"
            End If
            If Len(Trim(p_strTestStepTemp)) > 1 Then
                strQuery = strQuery & " And teststeptemp like '" & p_strTestStepTemp & "'"
            End If
            If Len(Trim(p_strDevice)) > 1 Then
                strQuery = strQuery & " And device like '" & p_strDevice & "'"
            End If
            If Len(Trim(p_strTesterType)) > 1 Then
                strQuery = strQuery & " And Testertype like '" & p_strTesterType & "'"
            End If
            If Len(Trim(p_strProgMainSource)) > 1 Then
                strQuery = strQuery & " And TestProgMainSource  like '" & p_strProgMainSource & "'"
            End If
            If Len(Trim(p_strProgExec)) > 1 Then
                strQuery = strQuery & " And Testprogexecutable like '" & p_strProgExec & "'"
            End If

            strQuery = strQuery & " Group By  TestProgId , TestProgIdRev, TestProgIdVers, TestStepTemp, device,Testertype, TestProgMainSource,TestProgExecutable,TestTimeEffDate,OverHead"

            Dim dsResult As DataSet = oOra.OraExecuteQuery(strQuery, cnnOra)

            gvListing.DataSource = dsResult
            gvListing.DataBind()

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            CloseConnection()

        End Try



    End Sub

#Region "get App.Config"
    Private Sub GetAppConfig()
        cnnOraString = ConfigurationManager.ConnectionStrings("ORA_DefaultConnString").ConnectionString
    End Sub
#End Region

#Region "Open Connection"
    Private Sub OpenConnection()
        oOra.OpenOraConnection(cnnOra, cnnOraString)
        'oMSSQL.OpenConnection(cnnBOP, cnnBOPString)
        'oMSSQL.OpenConnection(cnnZStart, cnnZStartString)
    End Sub

    Private Sub CloseConnection()
        oOra.CloseOraConnection(cnnOra)
        'oMSSQL.CloseConnection(cnnBOP)
        'oMSSQL.CloseConnection(cnnZStart)
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click

        If txtProgramID.Text = "" Or txtRevision.Text = "" Then

            'Call popup here...
            Dim modal As ModalCaller = New ModalCaller()
            modal.ShowPopupMessage(wucPopupInfo, "Please enter Program ID and Revision")

            Return

        End If

        GetListing(txtProgramID.Text, txtRevision.Text, "", "", "", "", "", "")

    End Sub

    Protected Sub btnNewProject_Click(sender As Object, e As EventArgs)

        Dim mpe As ModalPopupExtender = wucTestTime.FindControl("mpePopupTestTime")
        If mpe IsNot Nothing Then
            mpe.Show()
        End If

    End Sub

#End Region

End Class