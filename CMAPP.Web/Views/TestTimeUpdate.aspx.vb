
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
    Private gSelRev As String = ""

    Private dtSiteCount As DataTable
    Private dtSiteCount1 As DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            btnEditTestTime.Visible = False
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
            btnEditTestTime.Visible = False

            GetAppConfig()
            OpenConnection()

            'strQuery = "Select TestProgID,TestProgIDRev,TestProgIDVers,TesterType,TestProgMainSource,TestProgExecutable,Device,TestStepTemp,to_char(TestTimeEffDate,'mm/dd/yyyy') As TestTimeEffDate,OverHead,' ' as UserId "
            'strQuery = "Select TestProgID,TestProgIDRev,TesterType,TestProgMainSource,TestProgExecutable,Device,TestStepTemp,to_char(TestTimeEffDate,'mm/dd/yyyy') As TestTimeEffDate,OverHead, USERID "
            strQuery = "Select TestProgID as ""Program ID"",TestProgIDRev as ""Revision"",TesterType as ""Tester Type"",TestProgMainSource as ""Program Source"",TestProgExecutable as ""Program Exec"",Device as ""Device"",TestStepTemp as ""Temp"",to_char(TestTimeEffDate,'mm/dd/yyyy') As ""Eff Date"",OverHead AS ""Overhead"", USERID as ""UserId"" "

            'Dim tempNum = 1
            For i = 1 To gc_intMaxSiteCount
                'tempNum = i ^ 2
                'If tempNum <= gc_intMaxSiteCount Then
                strQuery = strQuery & ",Max(Decode(SiteCount, " & i & ", TestTime, null)) x" & i
                'End If
            Next
            strQuery = strQuery & " From  cmtesttime "
            strQuery = strQuery & " Where Not UserId Is Null "
            'strQuery = strQuery & " And ROWNUM <= 20 "

            If Len(Trim(p_strTestProgID)) > 1 Then
                'strQuery = strQuery & " And TestProgId like '" & p_strTestProgID & "'"
                strQuery = strQuery & " And TestProgId = '" & p_strTestProgID & "'"
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

            strQuery = strQuery & " Group By  TestProgId , TestProgIdRev, TestProgIdVers, TestStepTemp, device,Testertype, TestProgMainSource,TestProgExecutable,TestTimeEffDate,OverHead, UserID "

            Dim dsResult As DataSet = oOra.OraExecuteQuery(strQuery, cnnOra)

            If dsResult.Tables.Count > 0 And dsResult.Tables(0).Rows.Count = 0 Then
                btnEditTestTime.Visible = False
            End If

            gvListing.DataSource = dsResult
            gvListing.DataBind()
            gvListing.SelectedIndex = -1

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

        GetListing(txtProgramID.Text, txtRevision.Text, txtVersion.Text, txtTemp.Text, txtDevice.Text, "", txtProgramName.Text, txtProgramExec.Text)

    End Sub

    Protected Sub btnNewProject_Click(sender As Object, e As EventArgs)

        mpePopupTestTime.Show()

    End Sub

    Protected Sub gvListing_SelectedIndexChanged(sender As Object, e As EventArgs)

        Dim row As GridViewRow = gvListing.SelectedRow

        If row IsNot Nothing Then

            btnEditTestTime.Visible = True

        Else

            btnEditTestTime.Visible = False

        End If

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

            btnNextRev.Visible = True

            ' Call the popup and populate the values
            popupTestTime_txtProgID.Text = selRowCount.Cells(1).Text
            popupTestTime_txtRev.Text = selRowCount.Cells(2).Text
            Session("gSelRev") = popupTestTime_txtRev.Text
            'popupTestTime_txtVer.Text = selRowCount.Cells(3).Text
            popupTestTime_txtTesterType.Text = selRowCount.Cells(3).Text
            popupTestTime_txtProgName.Text = selRowCount.Cells(4).Text
            popupTestTime_txtProgExec.Text = selRowCount.Cells(5).Text
            popupTestTime_txtDevice.Text = selRowCount.Cells(6).Text
            popupTestTime_txtTemp.Text = selRowCount.Cells(7).Text
            popupTestTime_txtEffDate.Text = selRowCount.Cells(8).Text

            popupTestTime_btnInsertUpdate.Text = "Update"
            popupTestTime_btnUpdateAll.Visible = True

            ' Get Test Time for Site Count 1 from database
            dtSiteCount1 = GetSiteCount1Info(popupTestTime_txtProgID.Text, popupTestTime_txtRev.Text, popupTestTime_txtTesterType.Text, popupTestTime_txtProgName.Text, popupTestTime_txtProgExec.Text, popupTestTime_txtDevice.Text, popupTestTime_txtTemp.Text, popupTestTime_txtEffDate.Text)
            If dtSiteCount1 IsNot Nothing And dtSiteCount1.Rows.Count > 0 Then
                popupTestTime_txtSiteCount1TestTime.Text = dtSiteCount1.Rows(0)("TESTTIME").ToString
            End If

            EnableDisableTestTimeForm("Disable")

            'gvSiteCountList.DataSource = dtSiteCount
            'gvSiteCountList.DataBind()

            ' Clear values
            'popupTestTime_txtSiteCount.Text = ""
            popupTestTime_ddlSiteCount.SelectedValue = "1"
            popupTestTime_txtOverhead.Text = ""
            rptSiteCountList.DataSource = New DataTable
            rptSiteCountList.DataBind()

            mpePopupTestTime.Show()
        Else

            modal.ShowPopupMessage(wucPopupInfo, "No data to select. Please search for the data before proceed with the test time edit")

        End If



    End Sub

    Protected Sub popupTestTime_btnInsertUpdate_Click(sender As Object, e As EventArgs)
        Dim modal As ModalCaller = New ModalCaller()
        Dim testProgramID = popupTestTime_txtProgID.Text

        Dim count As Integer
        count = 1
        For Each item In rptSiteCountList.Items

            Dim input As TextBox = item.FindControl("txtTestTime")
            If input IsNot Nothing Then

                ' Call a function to save or update the test time 1 by 1
                ' TODO
                UpdateTestTime(popupTestTime_txtProgID.Text, popupTestTime_txtRev.Text, 0, popupTestTime_txtDevice.Text,
                               popupTestTime_txtTemp.Text, popupTestTime_txtEffDate.Text, count, input.Text, popupTestTime_txtOverhead.Text, popupTestTime_txtTesterType.Text,
                               popupTestTime_txtProgName.Text, popupTestTime_txtProgExec.Text, Session("USER_NAME").ToString())

                count = count + 1

            End If

        Next

    End Sub

    Private Sub UpdateTestTime(testProgID As String, rev As String, version As String, device As String, temp As String, effDate As String,
                               siteCount As Integer, testTime As String, overhead As String, testerType As String, progName As String, progExec As String, userID As String)

        Dim modal As ModalCaller = New ModalCaller
        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            GetAppConfig()
            OpenConnection()

            strQuery = "Select 1 From CmTestTime "
            strQuery = strQuery & "Where TestProgID='" & testProgID & "' "
            strQuery = strQuery & "And TestProgIDRev='" & rev & "' "
            'strQuery = strQuery & "And TestProgIDVers=" & version & " "
            strQuery = strQuery & "And TestProgIDVers= 0 "
            strQuery = strQuery & "And Device='" & device & "' "
            strQuery = strQuery & "And TestStepTemp='" & temp & "' "
            strQuery = strQuery & "And TestTimeEffDate=to_date('" & effDate & "','mm/dd/yyyy') "
            strQuery = strQuery & "And SiteCount=" & siteCount & ""
            Dim dsCheck As DataSet = oOra.OraExecuteQuery(strQuery, cnnOra)

            If dsCheck.Tables.Count > 0 And dsCheck.Tables(0).Rows.Count > 0 Then
                'modal.ShowPopupMessage(wucPopupInfo, "Record found. Updating..." & NextRev("BV"))
                strQuery = "Update CmTestTime Set "
                strQuery = strQuery & "TestTime=" & testTime & " "
                If overhead.Trim <> "" Then
                    strQuery = strQuery & ",OverHead='" & overhead & "' "
                Else
                    strQuery = strQuery & ",OverHead= null "
                End If
                strQuery = strQuery & ",UserID='" & userID & "' "
                strQuery = strQuery & ",ChangeDate=SysDate "
                strQuery = strQuery & ",ChangeTypeCode='U' "
                strQuery = strQuery & "Where TestProgID='" & testProgID & "' "
                strQuery = strQuery & "And TestProgIDRev='" & rev & "' "
                strQuery = strQuery & "And TestProgIDVers= 0 "
                strQuery = strQuery & "And Device='" & device & "' "
                strQuery = strQuery & "And TestStepTemp='" & temp & "' "
                strQuery = strQuery & "And TestTimeEffDate=to_date('" & effDate & "','mm/dd/yyyy') "
                strQuery = strQuery & "And SiteCount=" & siteCount & ""
                Dim dsUpdate As DataSet = oOra.OraExecuteQuery(strQuery, cnnOra)
            Else
                'modal.ShowPopupMessage(wucPopupInfo, "Record not found. Inserting...")
                strQuery = "Insert Into CmTestTime ("
                strQuery = strQuery & "TESTPROGID"
                strQuery = strQuery & ", TESTPROGIDREV"
                strQuery = strQuery & ", TESTPROGIDVERS"
                strQuery = strQuery & ", DEVICE"
                strQuery = strQuery & ", TESTSTEPTEMP"
                strQuery = strQuery & ", SITECOUNT"
                strQuery = strQuery & ", TESTTIMEEFFDATE"
                strQuery = strQuery & ", TESTTIME"
                If overhead.Trim <> "" Then
                    strQuery = strQuery & ", OVERHEAD"
                End If
                strQuery = strQuery & ", TESTERTYPE"
                strQuery = strQuery & ", TESTPROGMAINSOURCE"
                strQuery = strQuery & ", TESTPROGEXECUTABLE"
                strQuery = strQuery & ", USERID"
                strQuery = strQuery & ", CHANGEDATE"
                strQuery = strQuery & ", CHANGETYPECODE"
                strQuery = strQuery & ") Values ("
                strQuery = strQuery & testProgID
                strQuery = strQuery & ",'" & rev & "'"
                strQuery = strQuery & ",0"
                strQuery = strQuery & ",'" & device & "'"
                strQuery = strQuery & ",'" & temp & "'"
                strQuery = strQuery & "," & siteCount & ""
                strQuery = strQuery & ",to_date('" & effDate & "','mm/dd/yyyy')"
                strQuery = strQuery & "," & testTime & ""
                If overhead.Trim <> "" Then
                    strQuery = strQuery & "," & overhead & ""
                Else
                    strQuery = strQuery & ", null "
                End If
                strQuery = strQuery & ",'" & testerType & "'"
                strQuery = strQuery & ",'" & progName & "'"
                strQuery = strQuery & ",'" & progExec & "'"
                strQuery = strQuery & ",'" & userID & "'"
                strQuery = strQuery & ",SysDate "
                strQuery = strQuery & ",'I') "
                Dim dsInsert As DataSet = oOra.OraExecuteQuery(strQuery, cnnOra)
            End If

        Catch ex As Exception
            Dim exMsg = ex.Message
            modal.ShowPopupMessage(wucPopupInfo, ex.Message)
        Finally

            CloseConnection()

        End Try

        GetListing(txtProgramID.Text, txtRevision.Text, txtVersion.Text, txtTemp.Text, txtDevice.Text, "", txtProgramName.Text, txtProgramExec.Text)

    End Sub

    Private Sub UpdateTestTimeAll(testProgID As String, rev As String, version As String, device As String, temp As String, effDate As String,
                               siteCount As Integer, testTime As String, overhead As String, testerType As String, progName As String, progExec As String, userID As String)

        Dim modal As ModalCaller = New ModalCaller
        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            GetAppConfig()
            OpenConnection()

            strQuery = "Update CmTestTime Set "
            strQuery = strQuery & "TestTime=" & testTime & " "
            If overhead.Trim <> "" Then
                strQuery = strQuery & ",OverHead='" & overhead & "' "
            Else
                strQuery = strQuery & ",OverHead= null "
            End If
            strQuery = strQuery & ",UserID='" & userID & "' "
            strQuery = strQuery & ",ChangeDate=SysDate "
            strQuery = strQuery & ",ChangeTypeCode='U' "
            strQuery = strQuery & "Where TestProgID='" & testProgID & "' "
            strQuery = strQuery & "And TestProgIDVers= 0 "
            strQuery = strQuery & "And Device='" & device & "' "
            strQuery = strQuery & "And TestStepTemp='" & temp & "' "
            strQuery = strQuery & "And TestTimeEffDate=to_date('" & effDate & "','mm/dd/yyyy') "
            strQuery = strQuery & "And SiteCount=" & siteCount & ""
            Dim dsUpdate As DataSet = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
            modal.ShowPopupMessage(wucPopupInfo, ex.Message)
        Finally

            CloseConnection()

        End Try

        GetListing(txtProgramID.Text, txtRevision.Text, txtVersion.Text, txtTemp.Text, txtDevice.Text, "", txtProgramName.Text, txtProgramExec.Text)

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

        'If popupTestTime_ddlSiteCount.SelectedValue = "" Then

        '    modal.ShowPopupMessage(wucPopupInfo, "Please enter number Of site count To generate")
        '    mpePopupTestTime.Show()
        '    Return

        'End If

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
        For item As Integer = 0 To Integer.Parse(popupTestTime_ddlSiteCount.SelectedValue) - 1
            Dim dr = dtSiteCount.NewRow
            dr("Label") = (item + 1).ToString + "x (s)"

            If popupTestTime_txtOverhead.Text.Trim <> "" And popupTestTime_txtSiteCount1TestTime.Text.Trim <> "" Then
                Dim siteCountTestTime As Double = Double.Parse(popupTestTime_txtSiteCount1TestTime.Text) + ((Double.Parse(popupTestTime_txtOverhead.Text) / 100) * item * Double.Parse(popupTestTime_txtSiteCount1TestTime.Text))
                dr("TestTime") = siteCountTestTime.ToString("F2")

            ElseIf popupTestTime_txtOverhead.Text <> "" And popupTestTime_txtSiteCount1TestTime.Text.Trim = "" Then

                modal.ShowPopupMessage(wucPopupInfo, "Please enter Site Count 1 Test Time To use the formula")
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
            strQuery = strQuery & "And TESTPROGID = '" & testProgID & "' "
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

    Public Function GetNextRev(ByVal p_strCurrentRev As String) As String

        Dim modal As ModalCaller = New ModalCaller()

        On Error GoTo ErrorHandler
        Dim strDigit1 As String
        Dim strDigit2 As String

        Select Case Len(p_strCurrentRev)
            Case 1
                If Asc(p_strCurrentRev) = 90 Then
                    GetNextRev = "AA"
                Else
                    GetNextRev = Chr(Asc(p_strCurrentRev) + 1)
                End If
            Case 2
                If Asc(Mid(p_strCurrentRev, 2, 1)) = 90 Then
                    strDigit2 = "A"
                    strDigit1 = Chr(Asc(Mid(p_strCurrentRev, 1, 1)) + 1)
                Else
                    strDigit1 = Mid(p_strCurrentRev, 1, 1)
                    strDigit2 = Chr(Asc(Mid(p_strCurrentRev, 2, 1)) + 1)
                End If
                GetNextRev = Trim(strDigit1) & Trim(strDigit2)
        End Select
        GoTo ExitFunction
ErrorHandler:
        modal.ShowPopupMessage(wucPopupInfo, "Error getting next revision")
ExitFunction:

    End Function

    Private Function GetMaxRevByTestProgID(_testProgID As String) As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            GetAppConfig()
            OpenConnection()

            strQuery = "Select * From ( " +
                "Select (Length(TestProgIDRev)) MaxRev,TestProgIDRev " +
                "From CmTestTime " +
                "Where TestProgID='102018' " +
                "Order By MaxRev DESC,TestProgIDRev DESC " +
                ") q1 " +
                "Where ROWNUM <= 1 " +
                "Order By ROWNUM DESC;"
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            CloseConnection()

        End Try

        If dsResult.Tables.Count > 0 Then
            Return dsResult.Tables(0)
        Else
            Return Nothing
        End If

    End Function

    Protected Sub btnNewProgID_Click(sender As Object, e As EventArgs)

        btnNextRev.Visible = False

        ' Call the popup and populate the values
        popupTestTime_txtProgID.Text = ""
        popupTestTime_txtRev.Text = "A"
        popupTestTime_txtVer.Text = "0"
        popupTestTime_txtTesterType.Text = ""
        popupTestTime_txtProgName.Text = ""
        popupTestTime_txtProgExec.Text = ""
        popupTestTime_txtDevice.Text = ""
        popupTestTime_txtTemp.Text = ""
        popupTestTime_txtEffDate.Text = ""
        popupTestTime_txtSiteCount1TestTime.Text = ""

        popupTestTime_btnInsertUpdate.Text = "Insert"
        popupTestTime_btnUpdateAll.Visible = False

        EnableDisableTestTimeForm("Enable")

        ' Clear values
        popupTestTime_ddlSiteCount.SelectedValue = "1"
        popupTestTime_txtOverhead.Text = ""
        rptSiteCountList.DataSource = New DataTable
        rptSiteCountList.DataBind()

        mpePopupTestTime.Show()
        popupTestTime_txtProgID.Focus()

    End Sub

    Protected Sub btnNextRev_Click(sender As Object, e As EventArgs)

        If Session("gSelRev") IsNot Nothing Then
            Dim nextRev As String = GetNextRev(Session("gSelRev").ToString)
            popupTestTime_txtRev.Text = nextRev
            mpePopupTestTime.Show()
        End If

    End Sub

    Protected Sub popupTestTime_btnUpdateAll_Click(sender As Object, e As EventArgs)
        Dim modal As ModalCaller = New ModalCaller()
        Dim testProgramID = popupTestTime_txtProgID.Text

        Dim count As Integer

        'New Revision
        If Session("gSelRev") IsNot Nothing And Session("gSelRev") <> popupTestTime_txtRev.Text Then

            count = 1
            For Each item In rptSiteCountList.Items

                Dim input As TextBox = item.FindControl("txtTestTime")
                If input IsNot Nothing Then

                    UpdateTestTime(popupTestTime_txtProgID.Text, popupTestTime_txtRev.Text, 0, popupTestTime_txtDevice.Text,
                                   popupTestTime_txtTemp.Text, popupTestTime_txtEffDate.Text, count, input.Text, popupTestTime_txtOverhead.Text, popupTestTime_txtTesterType.Text,
                                   popupTestTime_txtProgName.Text, popupTestTime_txtProgExec.Text, Session("USER_NAME").ToString())

                    count = count + 1

                End If

            Next

        End If

        count = 1
        For Each item In rptSiteCountList.Items

            Dim input As TextBox = item.FindControl("txtTestTime")
            If input IsNot Nothing Then

                UpdateTestTimeAll(popupTestTime_txtProgID.Text, popupTestTime_txtRev.Text, 0, popupTestTime_txtDevice.Text,
                               popupTestTime_txtTemp.Text, popupTestTime_txtEffDate.Text, count, input.Text, popupTestTime_txtOverhead.Text, popupTestTime_txtTesterType.Text,
                               popupTestTime_txtProgName.Text, popupTestTime_txtProgExec.Text, Session("USER_NAME").ToString())

                count = count + 1

            End If

        Next
    End Sub
End Class