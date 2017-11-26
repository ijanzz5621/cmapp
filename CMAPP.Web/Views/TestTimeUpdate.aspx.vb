
Imports oOra = CMAPP.Data.Oracle
Imports Oracle.ManagedDataAccess.Client

Imports CMAPP.Web.GlobalVar
Imports AjaxControlToolkit

Imports CMAPP.BLogic

Public Class TestTimeUpdate
    Inherits System.Web.UI.Page

    'Oracle
    Private oOra As New oOra
    Private cnnOra As OracleConnection = Nothing
    Private cnnOraString As String = ConfigurationManager.ConnectionStrings("ORA_DefaultConnString").ConnectionString
    Private gSelRev As String = ""
    Private gMaxRev As String = ""

    Private dtSiteCount As DataTable
    Private dtSiteCount1 As DataTable

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            btnEditTestTime.Visible = False
            'GetListing("", "", "", "", "", "", "", "")

            PopulateSiteCountList()

            ' Load combobox data
            GetProgIDList()
            GetProgNameList()
            'GetProgExecList()
            GetDeviceList()
            GetTempList()

        End If

    End Sub

    Private Sub PopulateSiteCountList()

        For item As Integer = 1 To 320

            Dim li As ListItem = New ListItem()
            li.Text = item & "x(s)"
            li.Value = item
            cblSiteCount.Items.Add(li)

        Next

    End Sub

    Private Sub GetProgIDList()
        Dim fnData As blGeneral = New blGeneral()
        fnData.ConnectionString = cnnOraString
        Dim dsResult As DataTable = fnData.GetProgramIDList()
        ddlProgramID.DataSource = dsResult
        ddlProgramID.DataTextField = "TESTPROGID"
        ddlProgramID.DataValueField = "TESTPROGID"
        ddlProgramID.DataBind()
    End Sub

    Private Sub GetProgNameList()
        Dim fnData As blGeneral = New blGeneral()
        fnData.ConnectionString = cnnOraString
        Dim dsResult As DataTable = fnData.GetProgramNameList()
        ddlProgramName.DataSource = dsResult
        ddlProgramName.DataTextField = "TESTPROGMAINSOURCE"
        ddlProgramName.DataValueField = "TESTPROGMAINSOURCE"
        ddlProgramName.DataBind()
    End Sub

    Private Sub GetProgExecList()
        Dim fnData As blGeneral = New blGeneral()
        fnData.ConnectionString = cnnOraString
        Dim dsResult As DataTable = fnData.GetProgramExecList()
        ddlProgramExec.DataSource = dsResult
        ddlProgramExec.DataTextField = "TESTPROGEXECUTABLE"
        ddlProgramExec.DataValueField = "TESTPROGEXECUTABLE"
        ddlProgramExec.DataBind()
    End Sub

    Private Sub GetDeviceList()
        Dim fnData As blGeneral = New blGeneral()
        fnData.ConnectionString = cnnOraString
        Dim dsResult As DataTable = fnData.GetDeviceList()
        ddlDevice.DataSource = dsResult
        ddlDevice.DataTextField = "DEVICE"
        ddlDevice.DataValueField = "DEVICE"
        ddlDevice.DataBind()
    End Sub

    Private Sub GetTempList()
        Dim fnData As blGeneral = New blGeneral()
        fnData.ConnectionString = cnnOraString
        Dim dsResult As DataTable = fnData.GetTempList()
        ddlTemp.DataSource = dsResult
        ddlTemp.DataTextField = "TESTSTEPTEMP"
        ddlTemp.DataValueField = "TESTSTEPTEMP"
        ddlTemp.DataBind()
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

        Dim strQuery As String = ""

        Try
            btnEditTestTime.Visible = False

            GetAppConfig()
            OpenConnection()

            'If chkMaxDate.Checked = False Then

            strQuery = "Select TestProgID as ""Program ID"",TestProgIDRev as ""Revision"",TesterType as ""Tester Type"",TestProgMainSource as ""Program Source"",TestProgExecutable as ""Program Exec"",Device as ""Device"",TestStepTemp as ""Temp"",to_char(TestTimeEffDate,'mm/dd/yyyy') As ""Eff Date"",OverHead AS ""Overhead"", USERID as ""UserId"" "

            For i = 1 To cblSiteCount.Items.Count
                If cblSiteCount.Items.Item(i - 1).Selected Then
                    strQuery = strQuery & ",Max(Decode(SiteCount, " & i & ", TestTime, null)) x" & i
                End If
            Next
            strQuery = strQuery & " From cmtesttime "
            strQuery = strQuery & " Where Not UserId Is Null "

            If Len(Trim(p_strTestProgID)) >= 1 Then
                strQuery = strQuery & " And TestProgId = '" & p_strTestProgID & "' "
            End If
            If Len(Trim(p_strTestProgIDRev)) >= 1 Then
                strQuery = strQuery & " And testprogidrev like '" & p_strTestProgIDRev & "' "
            Else

            End If
            If Len(Trim(p_strTestProgIDVers)) >= 1 Then
                strQuery = strQuery & " And testprogidvers like '" & p_strTestProgIDVers & "' "
            End If
            If Len(Trim(p_strTestStepTemp)) >= 1 Then
                strQuery = strQuery & " And teststeptemp like '" & p_strTestStepTemp & "' "
            End If
            If Len(Trim(p_strDevice)) >= 1 Then
                strQuery = strQuery & " And device like '" & p_strDevice & "' "
            End If
            If Len(Trim(p_strTesterType)) >= 1 Then
                strQuery = strQuery & " And Testertype like '" & p_strTesterType & "' "
            End If
            If Len(Trim(p_strProgMainSource)) >= 1 Then
                strQuery = strQuery & " And TestProgMainSource  like '" & p_strProgMainSource & "' "
            End If
            If Len(Trim(p_strProgExec)) >= 1 Then
                strQuery = strQuery & " And Testprogexecutable like '" & p_strProgExec & "' "
            End If

            If chkMaxDate.Checked And Session("gMaxEffDate") IsNot Nothing Then
                strQuery = strQuery & " And TestTimeEffDate = to_date('" & Session("gMaxEffDate").ToString & "','mm/dd/yyyy') "
            End If

            strQuery = strQuery & " Group By  TestProgId , TestProgIdRev, TestProgIdVers, TestStepTemp, device,Testertype, TestProgMainSource,TestProgExecutable,TestTimeEffDate,OverHead, UserID "

            'Else

            '    strQuery = "Select Master.TestProgID,Master.TestProgIDRev,Master.TestProgIDVers,Master.TesterType,Master.TestProgMainSource,Master.TestProgExecutable,Master.Device,Master.TestStepTemp,to_char(Max(Master.TestTimeEffDate),'mm/dd/yyyy')  As TestTimeEffDate,Master.OverHead,' ' as UserId "
            '    For i = 1 To cblSiteCount.Items.Count
            '        If cblSiteCount.Items.Item(i - 1).Selected Then
            '            strQuery = strQuery & ",Max(Decode(Child.SiteCount, " & i & ", Child.TestTime, null)) x" & i
            '        End If
            '    Next
            '    strQuery = strQuery & " From cmtesttime Master, cmtesttime Child"
            '    strQuery = strQuery & " Where Not Child.UserId Is Null"
            '    strQuery = strQuery & " And Child.TestProgId = Master.TestProgId"
            '    strQuery = strQuery & " And Child.TestProgIdRev = Master.TestProgIdRev"
            '    strQuery = strQuery & " And Child.TestProgIdVers = Master.TestProgIdVers"
            '    strQuery = strQuery & "  And Child.Device = Master.Device"
            '    strQuery = strQuery & " And Child.TestStepTemp = Master.TestStepTemp"
            '    strQuery = strQuery & "  And Child.SiteCount = Master.SiteCount"
            '    strQuery = strQuery & "  And Child.TESTTIMEEFFDATE = Master.TESTTIMEEFFDATE"
            '    strQuery = strQuery & "  And Child.TesterType = Master.TesterType"
            '    strQuery = strQuery & " And Child.TESTPROGMAINSOURCE = Master.TESTPROGMAINSOURCE"
            '    strQuery = strQuery & " And Child.TESTPROGEXECUTABLE = Master.TESTPROGEXECUTABLE "

            '    If Len(Trim(p_strTestProgID)) >= 1 Then
            '        strQuery = strQuery & " And Child.TestProgId = '" & p_strTestProgID & "'"
            '    End If
            '    If Len(Trim(p_strTestProgIDRev)) >= 1 Then
            '        strQuery = strQuery & " And Child.testprogidrev = '" & p_strTestProgIDRev & "'"
            '    End If
            '    If Len(Trim(p_strTestProgIDVers)) >= 1 Then
            '        strQuery = strQuery & " And Child.testprogidvers like '" & p_strTestProgIDVers & "'"
            '    End If
            '    If Len(Trim(p_strDevice)) >= 1 Then
            '        strQuery = strQuery & " And Child.device like '" & p_strDevice & "'"
            '    End If

            '    If Len(Trim(p_strTestStepTemp)) >= 1 Then
            '        strQuery = strQuery & " And Child.teststeptemp like '" & p_strTestStepTemp & "'"
            '    End If

            '    If Len(Trim(p_strTesterType)) >= 1 Then
            '        strQuery = strQuery & " And Child.Testertype like '" & p_strTesterType & "'"
            '    End If
            '    If Len(Trim(p_strProgMainSource)) >= 1 Then
            '        strQuery = strQuery & " And Child.TestProgMainSource  like '" & p_strProgMainSource & "'"
            '    End If
            '    If Len(Trim(p_strProgExec)) >= 1 Then
            '        strQuery = strQuery & " And Child.Testprogexecutable like '" & p_strProgExec & "'"
            '    End If

            '    strQuery = strQuery & " Group by Master.TestProgId , Master.TestProgIdRev, Master.TestProgIdVers, Master.TestStepTemp, Master.device, Master.TesterType, Master.TestProgMainSource, Master.TestProgExecutable, Master.OVERHEAD"

            'End If

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

        If ddlProgramID.SelectedValue = "" Then

            'Call popup here...
            Dim modal As ModalCaller = New ModalCaller()
            modal.ShowPopupMessage(wucPopupInfo, "Please enter Program ID to search")

            Return

        End If

        GetListing(ddlProgramID.SelectedValue, ddlRevision.SelectedValue, 0, ddlTemp.SelectedValue, ddlDevice.SelectedValue, "", ddlProgramName.SelectedValue, ddlProgramExec.SelectedValue)

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

            popupTestTime_txtOverhead.Text = ""
            'rptSiteCountList.DataSource = New DataTable
            'rptSiteCountList.DataBind()
            GenerateSiteCountList()

            mpePopupTestTime.Show()
        Else

            modal.ShowPopupMessage(wucPopupInfo, "No data to select. Please search for the data before proceed with the test time edit")

        End If



    End Sub

    Protected Sub popupTestTime_btnInsertUpdate_Click(sender As Object, e As EventArgs)
        Dim modal As ModalCaller = New ModalCaller()
        Dim testProgramID = popupTestTime_txtProgID.Text

        ' Check if empty
        If popupTestTime_txtProgID.Text.Trim = "" Then
            modal.ShowPopupMessage(wucPopupInfo, "Please enter Test Program ID")
            mpePopupTestTime.Show()
            Return
        End If
        If popupTestTime_txtRev.Text.Trim = "" Then
            modal.ShowPopupMessage(wucPopupInfo, "Please enter Revision")
            mpePopupTestTime.Show()
            Return
        End If
        If popupTestTime_txtTesterType.Text.Trim = "" Then
            modal.ShowPopupMessage(wucPopupInfo, "Please enter Tester Type")
            mpePopupTestTime.Show()
            Return
        End If
        If popupTestTime_txtProgName.Text.Trim = "" Then
            modal.ShowPopupMessage(wucPopupInfo, "Please enter Test Program Name")
            mpePopupTestTime.Show()
            Return
        End If
        If popupTestTime_txtProgExec.Text.Trim = "" Then
            modal.ShowPopupMessage(wucPopupInfo, "Please enter Test Program Executable")
            mpePopupTestTime.Show()
            Return
        End If
        If popupTestTime_txtDevice.Text.Trim = "" Then
            modal.ShowPopupMessage(wucPopupInfo, "Please enter Device")
            mpePopupTestTime.Show()
            Return
        End If
        If popupTestTime_txtTemp.Text.Trim = "" Then
            modal.ShowPopupMessage(wucPopupInfo, "Please enter Temp")
            mpePopupTestTime.Show()
            Return
        End If
        If popupTestTime_txtEffDate.Text.Trim = "" Then
            modal.ShowPopupMessage(wucPopupInfo, "Please select Effective Date from the calendar")
            mpePopupTestTime.Show()
            Return
        End If

        If rptSiteCountList.Items.Count = 0 Then
            modal.ShowPopupMessage(wucPopupInfo, "Please select Site Count and Click Generate")
            mpePopupTestTime.Show()
            Return
        End If

        Dim count As Integer
        count = 1
        For Each item In rptSiteCountList.Items

            Dim input As TextBox = item.FindControl("txtTestTime")
            If input IsNot Nothing Then

                ' Get value from datatable
                Dim dtSiteCount As DataTable = Session("dtSiteCount")
                If dtSiteCount IsNot Nothing Then

                    Dim siteCount As Integer = dtSiteCount.Rows(count - 1)("Value").ToString

                    ' Call a function to save or update the test time 1 by 1
                    ' TODO
                    UpdateTestTime(popupTestTime_txtProgID.Text, popupTestTime_txtRev.Text, 0, popupTestTime_txtDevice.Text,
                                   popupTestTime_txtTemp.Text, popupTestTime_txtEffDate.Text, siteCount, input.Text, popupTestTime_txtOverhead.Text, popupTestTime_txtTesterType.Text,
                                   popupTestTime_txtProgName.Text, popupTestTime_txtProgExec.Text, Session("USER_NAME").ToString())

                End If

                count = count + 1

            End If

        Next

        mpePopupTestTime.Hide()

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
            strQuery = strQuery & "And TestProgIDVers= 0 "
            strQuery = strQuery & "And Device='" & device & "' "
            strQuery = strQuery & "And TestStepTemp='" & temp & "' "
            strQuery = strQuery & "And TestTimeEffDate=to_date('" & effDate & "','mm/dd/yyyy') "
            strQuery = strQuery & "And SiteCount=" & siteCount & ""
            Dim dsCheck As DataSet = oOra.OraExecuteQuery(strQuery, cnnOra)

            If dsCheck.Tables.Count > 0 And dsCheck.Tables(0).Rows.Count > 0 Then
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
                strQuery = "Insert Into CmTestTime ("
                strQuery = strQuery & "TESTPROGID"
                strQuery = strQuery & ", TESTPROGIDREV"
                strQuery = strQuery & ", TESTPROGIDVERS"
                strQuery = strQuery & ", DEVICE"
                strQuery = strQuery & ", TESTSTEPTEMP"
                strQuery = strQuery & ", SITECOUNT"
                strQuery = strQuery & ", TESTTIMEEFFDATE"
                strQuery = strQuery & ", TESTTIME"
                strQuery = strQuery & ", OVERHEAD"
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

        GetListing(ddlProgramID.SelectedValue, ddlRevision.SelectedValue, 0, ddlTemp.SelectedValue, ddlDevice.SelectedValue, "", ddlProgramName.SelectedValue, ddlProgramExec.SelectedValue)

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

        GetListing(ddlProgramID.SelectedValue, ddlRevision.SelectedValue, 0, ddlTemp.SelectedValue, ddlDevice.SelectedValue, "", ddlProgramName.SelectedValue, ddlProgramExec.SelectedValue)

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

        If popupTestTime_txtOverhead.Text <> "" And popupTestTime_txtSiteCount1TestTime.Text.Trim = "" Then

            modal.ShowPopupMessage(wucPopupInfo, "Please enter Site Count 1 Test Time To use the formula")
            mpePopupTestTime.Show()
            Return
        End If

        GenerateSiteCountList()

        mpePopupTestTime.Show()

    End Sub

    Private Sub GenerateSiteCountList()

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
        dtSiteCount.Columns.Add("Value", GetType(String))
        dtSiteCount.Columns.Add("TestTime", GetType(String))
        'For item As Integer = 0 To Integer.Parse(popupTestTime_ddlSiteCount.SelectedValue) - 1
        For item As Integer = 0 To cblSiteCount.Items.Count - 1

            If cblSiteCount.Items.Item(item).Selected Then

                Dim dr = dtSiteCount.NewRow
                dr("Label") = (item + 1).ToString + "x (s)"
                dr("Value") = item + 1

                If popupTestTime_txtOverhead.Text.Trim <> "" And popupTestTime_txtSiteCount1TestTime.Text.Trim <> "" Then
                    Dim siteCountTestTime As Double = Double.Parse(popupTestTime_txtSiteCount1TestTime.Text) + ((Double.Parse(popupTestTime_txtOverhead.Text) / 100) * item * Double.Parse(popupTestTime_txtSiteCount1TestTime.Text))
                    dr("TestTime") = siteCountTestTime.ToString("F2")

                Else

                    dr("TestTime") = "0.00"

                End If


                dtSiteCount.Rows.Add(dr)

            End If

        Next

        ' Save dtSiteCount to Session for later use
        Session("dtSiteCount") = dtSiteCount

        rptSiteCountList.DataSource = dtSiteCount
        rptSiteCountList.DataBind()

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
                "Where TestProgID='" & _testProgID & "' " +
                "Order By MaxRev DESC,TestProgIDRev DESC " +
                ") q1 " +
                "Where ROWNUM <= 1 " +
                "Order By ROWNUM DESC"
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

    Private Function GetMaxEffDateByTestProgID(_testProgID As String) As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            GetAppConfig()
            OpenConnection()

            strQuery = "select to_date(MAX(TESTTIMEEFFDATE),'mm/dd/yyyy') AS MAXDATE from cmtesttime where TESTPROGID = '" & _testProgID & "'"
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
        'popupTestTime_ddlSiteCount.SelectedValue = "1"
        popupTestTime_txtOverhead.Text = ""
        'rptSiteCountList.DataSource = New DataTable
        'rptSiteCountList.DataBind()

        GenerateSiteCountList()

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

        mpePopupTestTime.Hide()

    End Sub

    Protected Sub ddlProgramID_SelectedIndexChanged(sender As Object, e As EventArgs)

        ddlRevision.Enabled = True
        Session("gMaxRev") = ""
        ddlRevision.SelectedValue = ""
        chkMaxRev.Checked = False

        Dim fnData As blGeneral = New blGeneral()
        fnData.ConnectionString = cnnOraString
        Dim dsProgRev As DataTable = fnData.GetProgramRevList(ddlProgramID.SelectedValue)
        ddlRevision.DataSource = dsProgRev
        ddlRevision.DataTextField = "TESTPROGIDREV"
        ddlRevision.DataValueField = "TESTPROGIDREV"
        ddlRevision.DataBind()

        ' Call function to get max revision and store it onto global variable
        Dim dtMaxRev As DataTable = GetMaxRevByTestProgID(ddlProgramID.SelectedValue)
        If dtMaxRev IsNot Nothing Then
            If dtMaxRev.Rows.Count > 0 Then
                Session("gMaxRev") = dtMaxRev.Rows(0)("TESTPROGIDREV").ToString
            End If
        End If

        ' Call Function to get max eff date
        Dim dtMaxEffDate As DataTable = GetMaxEffDateByTestProgID(ddlProgramID.SelectedValue)
        If dtMaxEffDate IsNot Nothing Then
            If dtMaxEffDate.Rows.Count > 0 Then
                Session("gMaxEffDate") = dtMaxEffDate.Rows(0)("MAXDATE").ToString
            End If
        End If

    End Sub

    Protected Sub chkMaxRev_CheckedChanged(sender As Object, e As EventArgs)

        If chkMaxRev.Checked Then

            If Session("gMaxRev") IsNot Nothing Then
                ddlRevision.SelectedValue = Session("gMaxRev").ToString
            End If

            ddlRevision.Enabled = False
        Else

            ddlRevision.Enabled = True

        End If

    End Sub
End Class