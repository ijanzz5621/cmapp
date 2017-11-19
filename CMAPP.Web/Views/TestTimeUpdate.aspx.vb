
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

    Private dtSiteCount As DataTable
    Private dtSiteCount1 As DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            'GetListing("", "", "", "", "", "", "", "")

        End If

    End Sub

    Private Sub GetBUList(_progID As String)
        Dim strQuery As String

        Try

            GetAppConfig()
            OpenConnection()

            strQuery = "select distinct TESTPROGIDREV from cmtesttime where TESTPROGID = '" & _progID & "';"
            Dim dsResult As DataSet = oOra.OraExecuteQuery(strQuery, cnnOra)



        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            CloseConnection()

        End Try
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

#End Region

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click

        If txtProgramID.Text = "" Then

            'Call popup here...
            Dim modal As ModalCaller = New ModalCaller()
            modal.ShowPopupMessage(wucPopupInfo, "Please enter Program ID to search")

            Return

        End If

        GetListing(txtProgramID.Text, txtRevision.Text, "", "", "", "", "", "")

    End Sub

    Protected Sub btnNewProject_Click(sender As Object, e As EventArgs)

        mpePopupTestTime.Show()

    End Sub

    Protected Sub gvListing_SelectedIndexChanged(sender As Object, e As EventArgs)

        Dim row As GridViewRow = gvListing.SelectedRow

        'Dim modal As ModalCaller = New ModalCaller()
        'modal.ShowPopupMessage(wucPopupInfo, row.Cells(2).Text.ToString())

        'Dim mpe As ModalPopupExtender = wucTestTime.FindControl("mpePopupTestTime")
        'If mpe IsNot Nothing Then
        '    mpe.Show()
        'End If

    End Sub

    Protected Sub btnEditTestTime_Click(sender As Object, e As EventArgs)

        Dim modal As ModalCaller = New ModalCaller()

        If gvListing.Rows.Count > 0 Then

            Dim selRowCount = gvListing.SelectedRow
            If selRowCount Is Nothing Then

                modal.ShowPopupMessage(wucPopupInfo, "Please select before edit the test time")
                Return
            End If

            ' Call the popup and populate the values
            popupTestTime_txtProgID.Text = selRowCount.Cells(1).Text
            popupTestTime_txtRev.Text = selRowCount.Cells(2).Text
            popupTestTime_txtVer.Text = selRowCount.Cells(3).Text
            popupTestTime_txtTesterType.Text = selRowCount.Cells(4).Text
            popupTestTime_txtProgName.Text = selRowCount.Cells(5).Text
            popupTestTime_txtProgExec.Text = selRowCount.Cells(6).Text
            popupTestTime_txtDevice.Text = selRowCount.Cells(7).Text
            popupTestTime_txtTemp.Text = selRowCount.Cells(8).Text
            popupTestTime_txtEffDate.Text = selRowCount.Cells(9).Text

            ' Get Test Time for Site Count 1 from database
            dtSiteCount1 = GetSiteCount1Info(popupTestTime_txtProgID.Text, popupTestTime_txtRev.Text, popupTestTime_txtTesterType.Text, popupTestTime_txtProgName.Text, popupTestTime_txtProgExec.Text, popupTestTime_txtDevice.Text, popupTestTime_txtTemp.Text, popupTestTime_txtEffDate.Text)
            If dtSiteCount1.Rows.Count > 0 Then
                popupTestTime_txtSiteCount1TestTime.Text = dtSiteCount1.Rows(0)("TESTTIME").ToString
            End If

            EnableDisableTestTimeForm("Disable")

            'gvSiteCountList.DataSource = dtSiteCount
            'gvSiteCountList.DataBind()

            mpePopupTestTime.Show()
        Else

            modal.ShowPopupMessage(wucPopupInfo, "No data to select. Please search for the data before proceed with the test time edit")

        End If



    End Sub

    Protected Sub popupTestTime_btnInsertUpdate_Click(sender As Object, e As EventArgs)
        Dim modal As ModalCaller = New ModalCaller()
        Dim testProgramID = popupTestTime_txtProgID.Text

        'If gvSiteCountList.Rows.Count > 0 Then

        '    Dim row As GridViewRow = gvSiteCountList.Rows(0)

        '    For col As Integer = 1 To gvSiteCountList.Columns.Count

        '        ' Loop and update database here
        '        Dim colVal As String = row.Cells(col).Text

        '        UpdateTestTime(popupTestTime_txtProgID.Text)

        '    Next
        'Else

        '    modal.ShowPopupMessage(wucPopupInfo, "Please calculate the Site Count before proceed with save or update")
        '    mpePopupTestTime.Show()

        'End If

        For Each item In rptSiteCountList.Items

            Dim input As TextBox = item.FindControl("txtTestTime")
            If input IsNot Nothing Then

                ' Call a function to save or update the test time 1 by 1
                ' TODO
                UpdateTestTime(popupTestTime_txtProgID.Text)

            End If

        Next

    End Sub

    Private Sub UpdateTestTime(testProgID As String)



    End Sub

    Private Sub EnableDisableTestTimeForm(type As String)

        If type = "Enable" Then

            popupTestTime_txtProgID.Enabled = True
            popupTestTime_txtRev.Enabled = True
            popupTestTime_txtVer.Enabled = True
            popupTestTime_txtTesterType.Enabled = True
            popupTestTime_txtProgName.Enabled = True
            popupTestTime_txtProgExec.Enabled = True
            popupTestTime_txtDevice.Enabled = True
            popupTestTime_txtTemp.Enabled = True
            popupTestTime_txtEffDate.Enabled = True

        Else

            popupTestTime_txtProgID.Enabled = False
            popupTestTime_txtRev.Enabled = False
            popupTestTime_txtVer.Enabled = False
            popupTestTime_txtTesterType.Enabled = False
            popupTestTime_txtProgName.Enabled = False
            popupTestTime_txtProgExec.Enabled = False
            popupTestTime_txtDevice.Enabled = False
            popupTestTime_txtTemp.Enabled = False
            popupTestTime_txtEffDate.Enabled = False

        End If

    End Sub

    Protected Sub popupTestTime_btnCalc_Click(sender As Object, e As EventArgs)

        Dim modal As ModalCaller = New ModalCaller()

        If popupTestTime_txtSiteCount.Text.Trim = "" Then

            modal.ShowPopupMessage(wucPopupInfo, "Please enter number of site count to generate")
            mpePopupTestTime.Show()
            Return

        End If

        dtSiteCount = New DataTable()
        dtSiteCount1 = New DataTable()


        'For item As Integer = 1 To Integer.Parse(popupTestTime_txtSiteCount.Text)
        '    dtSiteCount.Columns.Add("x" & item & " (s)", GetType(String))
        'Next

        'Dim values(Integer.Parse(popupTestTime_txtSiteCount.Text) - 1) As String
        'For item As Integer = 0 To Integer.Parse(popupTestTime_txtSiteCount.Text) - 1

        '    Dim siteCountTestTime As Double = Double.Parse(popupTestTime_txtSiteCount1TestTime.Text) + ((Double.Parse(popupTestTime_txtOverhead.Text) / 100) * item * Double.Parse(popupTestTime_txtSiteCount1TestTime.Text))
        '    values(item) = siteCountTestTime.ToString("F2")
        'Next

        'dtSiteCount.Rows.Add(values)

        dtSiteCount.Columns.Add("Label", GetType(String))
        dtSiteCount.Columns.Add("TestTime", GetType(String))
        For item As Integer = 0 To Integer.Parse(popupTestTime_txtSiteCount.Text) - 1
            Dim dr = dtSiteCount.NewRow
            dr("Label") = (item + 1).ToString + "x (s)"

            If popupTestTime_txtOverhead.Text.Trim <> "" And popupTestTime_txtSiteCount1TestTime.Text.Trim <> "" Then
                Dim siteCountTestTime As Double = Double.Parse(popupTestTime_txtSiteCount1TestTime.Text) + ((Double.Parse(popupTestTime_txtOverhead.Text) / 100) * item * Double.Parse(popupTestTime_txtSiteCount1TestTime.Text))
                dr("TestTime") = siteCountTestTime.ToString("F2")

            ElseIf popupTestTime_txtOverhead.Text <> "" And popupTestTime_txtSiteCount1TestTime.Text.Trim = "" Then

                modal.ShowPopupMessage(wucPopupInfo, "Please enter Site Count 1 Test Time to use the formula")
                mpePopupTestTime.Show()
                Return
            Else

                dr("TestTime") = "0.00"

            End If


            dtSiteCount.Rows.Add(dr)
        Next

        'gvSiteCountList.DataSource = dtSiteCount
        'gvSiteCountList.DataBind()
        rptSiteCountList.DataSource = dtSiteCount
        rptSiteCountList.DataBind()

        mpePopupTestTime.Show()

    End Sub

    Private Function GetSiteCount1Info(testProgID As String, rev As String, testerType As String, programName As String, programExec As String, device As String, temp As String, effDate As String) As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            GetAppConfig()
            OpenConnection()

            strQuery = "Select * from cmtesttime "
            strQuery = strQuery & "where "
            strQuery = strQuery & "SITECOUNT = 1 "
            strQuery = strQuery & "and TESTPROGID = '" & testProgID & "' "
            strQuery = strQuery & "and TESTPROGIDREV = '" & rev & "' "
            strQuery = strQuery & "and TESTERTYPE = '" & testerType & "' "
            strQuery = strQuery & "and TESTPROGMAINSOURCE = '" & programName & "' "
            strQuery = strQuery & "and TESTPROGEXECUTABLE = '" & programExec & "' "
            strQuery = strQuery & "and DEVICE = '" & device & "' "
            strQuery = strQuery & "and TESTSTEPTEMP = '" & temp & "' "
            strQuery = strQuery & "and to_char(TESTTIMEEFFDATE,'mm/dd/yyyy') = '" & effDate & "' "
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            CloseConnection()

        End Try

        Return dsResult.Tables(0)

    End Function

    Public Function NextRev(ByVal p_strCurrentRev As String) As String

        Dim modal As ModalCaller = New ModalCaller()

        On Error GoTo ErrorHandler
        Dim strDigit1 As String
        Dim strDigit2 As String

        Select Case Len(p_strCurrentRev)
            Case 1
                If Asc(p_strCurrentRev) = 90 Then
                    NextRev = "AA"
                Else
                    NextRev = Chr(Asc(p_strCurrentRev) + 1)
                End If
            Case 2
                If Asc(Mid(p_strCurrentRev, 2, 1)) = 90 Then
                    strDigit2 = "A"
                    strDigit1 = Chr(Asc(Mid(p_strCurrentRev, 1, 1)) + 1)
                Else
                    strDigit1 = Mid(p_strCurrentRev, 1, 1)
                    strDigit2 = Chr(Asc(Mid(p_strCurrentRev, 2, 1)) + 1)
                End If
                NextRev = Trim(strDigit1) & Trim(strDigit2)
        End Select
        GoTo ExitFunction
ErrorHandler:
        modal.ShowPopupMessage(wucPopupInfo, "Error getting next revision")
ExitFunction:

    End Function

End Class