Imports CMAPP.Model
Imports Oracle.ManagedDataAccess.Client

Public Class blTestTime

    Private connStr As String
    Private oOra As New CMAPP.Data.Oracle
    Private cnnOra As OracleConnection = Nothing

    Public Property ConnectionString As String
        Get
            Return connStr
        End Get
        Set(value As String)
            connStr = value
        End Set
    End Property

    Public Function GetSiteCount1TestTime(testProgID As String, rev As String, testerType As String, progName As String, programExec As String, device As String, temp As String, effDate As String) As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "Select * from cmtesttime "
            strQuery = strQuery & "where "
            strQuery = strQuery & "SITECOUNT = 1 "
            strQuery = strQuery & "And TESTPROGID = '" & testProgID & "' "
            strQuery = strQuery & "and TESTPROGIDREV = '" & rev & "' "
            strQuery = strQuery & "and TESTERTYPE = '" & testerType & "' "
            strQuery = strQuery & "and TESTPROGMAINSOURCE = '" & progName & "' "
            strQuery = strQuery & "and TESTPROGEXECUTABLE = '" & programExec & "' "
            strQuery = strQuery & "and DEVICE = '" & device & "' "
            strQuery = strQuery & "and TESTSTEPTEMP = '" & temp & "' "
            strQuery = strQuery & "and to_char(TESTTIMEEFFDATE,'mm/dd/yyyy') = '" & effDate & "' "
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            oOra.CloseOraConnection(cnnOra)

        End Try

        Return dsResult.Tables(0)

    End Function

    Public Function GetSiteCountListByFilter(testProgID As String, rev As String, testerType As String, progName As String, programExec As String, device As String, temp As String) As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "Select distinct SITECOUNT from cmtesttime "
            strQuery = strQuery & "where 1=1 "
            'strQuery = strQuery & "And TESTPROGID = '" & testProgID & "' "
            'strQuery = strQuery & "and TESTPROGIDREV = '" & rev & "' "
            'strQuery = strQuery & "and TESTERTYPE = '" & testerType & "' "
            'strQuery = strQuery & "and TESTPROGMAINSOURCE = '" & progName & "' "
            'strQuery = strQuery & "and TESTPROGEXECUTABLE = '" & programExec & "' "
            'strQuery = strQuery & "and DEVICE = '" & device & "' "
            'strQuery = strQuery & "and TESTSTEPTEMP = '" & temp & "' "
            'strQuery = strQuery & "and to_char(TESTTIMEEFFDATE,'mm/dd/yyyy') = '" & effDate & "' "

            If Len(Trim(testProgID)) >= 1 Then
                strQuery = strQuery & "And TestProgId = '" & testProgID & "' "
            End If
            If Len(Trim(rev)) >= 1 Then
                strQuery = strQuery & " And testprogidrev = '" & rev & "' "
            End If
            If Len(Trim(temp)) >= 1 Then
                strQuery = strQuery & " And teststeptemp = '" & temp & "' "
            End If
            If Len(Trim(device)) >= 1 Then
                strQuery = strQuery & " And device like '" & device & "' "
            End If
            If Len(Trim(testerType)) >= 1 Then
                strQuery = strQuery & " And Testertype like '" & testerType & "' "
            End If
            If Len(Trim(progName)) >= 1 Then
                strQuery = strQuery & " And TestProgMainSource like '" & progName & "' "
            End If
            If Len(Trim(programExec)) >= 1 Then
                strQuery = strQuery & " And Testprogexecutable like '" & programExec & "' "
            End If

            strQuery = strQuery & "order by SITECOUNT "
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            oOra.CloseOraConnection(cnnOra)

        End Try

        Return dsResult.Tables(0)

    End Function

    Public Function GetSelectedSiteCountList(testProgID As String, rev As String, testerType As String, progName As String, programExec As String, device As String, temp As String, effDate As String) As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "Select distinct CAST(SITECOUNT AS INT) AS SITECOUNT, TESTTIME from cmtesttime "
            strQuery = strQuery & "where TestProgId = '" & testProgID & "' And testprogidrev = '" & rev & "' And teststeptemp = '" & temp & "' And device like '" & device & "' And Testertype like '" & testerType & "' And TestProgMainSource like '" & progName & "' And Testprogexecutable like '" & programExec & "' "
            strQuery = strQuery & "order by SITECOUNT "
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            oOra.CloseOraConnection(cnnOra)

        End Try

        Return dsResult.Tables(0)

    End Function

    Public Function GetTestProgramRevisionList(testProgID As String) As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "select distinct TESTPROGIDREV from cm.cmtesttime where TESTPROGID = '" & testProgID & "'"
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            oOra.CloseOraConnection(cnnOra)

        End Try

        Return dsResult.Tables(0)

    End Function

    Public Function GetCmTestTimeList(testProgID As String, rev As String, ver As String, testerType As String, progName As String, progExec As String, device As String, temp As String, maxDate As String, siteCountList As SiteCount()) As DataTable

        Dim strQuery As String = ""
        Dim dsResult As DataSet = New DataSet

        Try
            oOra.OpenOraConnection(cnnOra, connStr)

            ' Changes 2017-12-08
            ' Get distinct site count to loop from table




            strQuery = "Select TestProgID as ""Program ID"",TestProgIDRev as ""Revision"",TesterType as ""Tester Type"", Device as ""Device"", TestStepTemp as ""Temp"", to_char(TestTimeEffDate,'mm/dd/yyyy') As ""Eff Date"", TestProgMainSource as ""Program Source"",TestProgExecutable as ""Program Exec"", OverHead AS ""Overhead"", USERID as ""UserId"" "

            For Each siteCount As SiteCount In siteCountList
                strQuery = strQuery & ",Max(Decode(SiteCount, " & siteCount.labelValue & ", TestTime, null)) x" & siteCount.labelValue
            Next

            strQuery = strQuery & " From cmtesttime "
            'strQuery = strQuery & " Where Not UserId Is Null "
            strQuery = strQuery & " Where ROWNUM <= 500 "

            If Len(Trim(testProgID)) >= 1 Then
                strQuery = strQuery & " And TestProgId = '" & testProgID & "' "
            End If
            If Len(Trim(rev)) >= 1 Then
                strQuery = strQuery & " And testprogidrev like '" & rev & "' "
            Else

            End If
            If Len(Trim(ver)) >= 1 Then
                strQuery = strQuery & " And testprogidvers like '" & ver & "' "
            End If
            If Len(Trim(temp)) >= 1 Then
                strQuery = strQuery & " And teststeptemp like '" & temp & "' "
            End If
            If Len(Trim(device)) >= 1 Then
                strQuery = strQuery & " And device like '" & device & "' "
            End If
            If Len(Trim(testerType)) >= 1 Then
                strQuery = strQuery & " And Testertype like '" & testerType & "' "
            End If
            If Len(Trim(progName)) >= 1 Then
                strQuery = strQuery & " And TestProgMainSource  like '" & progName & "' "
            End If
            If Len(Trim(progExec)) >= 1 Then
                strQuery = strQuery & " And Testprogexecutable like '" & progExec & "' "
            End If

            'If maxDate.Checked And Session("gMaxEffDate") IsNot Nothing Then
            '    strQuery = strQuery & " And to_char(TESTTIMEEFFDATE,'mm/dd/yyyy') = '" & Session("gMaxEffDate").ToString & "' "
            'End If

            strQuery = strQuery & " Group By  TestProgId , TestProgIdRev, TestProgIdVers, TestStepTemp, device,Testertype, TestProgMainSource,TestProgExecutable,TestTimeEffDate,OverHead, UserID "
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            oOra.CloseOraConnection(cnnOra)

        End Try

        Return dsResult.Tables(0)

    End Function

    Public Function UpdateTestTime(testProgID As String, rev As String, version As String, device As String, temp As String, effDate As String,
                               siteCount As Integer, testTime As String, overhead As String, testerType As String, progName As String, progExec As String, userID As String) As String

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet
        Dim strResult As String

        Try

            oOra.OpenOraConnection(cnnOra, connStr)

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
                strQuery = strQuery & ",TestTimeEffDate=to_date(to_char(SysDate,'mm/dd/yyyy'), 'mm/dd/yyyy') "
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
                strQuery = strQuery & ",to_date(to_char(SysDate,'mm/dd/yyyy'), 'mm/dd/yyyy')"
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

            strResult = "SUCCESS"

        Catch ex As Exception
            Dim exMsg = ex.Message
            strResult = "FAILED"
        Finally
            oOra.CloseOraConnection(cnnOra)
        End Try

        Return strResult

    End Function

    Public Function DeleteTestTimeAllExceptSC1(testProgID As String, rev As String, device As String, temp As String, effDate As String,
                               overhead As String, testerType As String, progName As String, progExec As String, userID As String) As String

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet
        Dim strResult As String

        Try

            If overhead = "" Then
                overhead = "0"
            End If

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "Delete From CmTestTime "
            strQuery = strQuery & "Where TestProgID='" & testProgID & "' "
            strQuery = strQuery & "And TestProgIDRev='" & rev & "' "
            strQuery = strQuery & "And Device='" & device & "' "
            strQuery = strQuery & "And TestStepTemp='" & temp & "' "
            strQuery = strQuery & "And TestProgMainSource='" & progName & "' "
            strQuery = strQuery & "And TestProgExecutable='" & progExec & "' "
            'strQuery = strQuery & "And TestTimeEffDate=to_date('" & effDate & "','mm/dd/yyyy') "
            strQuery = strQuery & "And NVL(Overhead, '0') = '" & overhead & "' "
            'strQuery = strQuery & "And SiteCount > 1 "
            Dim dsCheck As DataSet = oOra.OraExecuteQuery(strQuery, cnnOra)

            strResult = "SUCCESS"

        Catch ex As Exception
            Dim exMsg = ex.Message
            strResult = "FAILED"
        Finally
            oOra.CloseOraConnection(cnnOra)
        End Try

        Return strResult

    End Function

    Public Function DeleteTestTime(testProgID As String, rev As String, device As String, temp As String, effDate As String,
                               overhead As String, testerType As String, progName As String, progExec As String, userID As String) As String

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet
        Dim strResult As String

        Try

            If overhead = "" Then
                overhead = "0"
            End If

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "Delete From CmTestTime "
            strQuery = strQuery & "Where TestProgID='" & testProgID & "' "
            strQuery = strQuery & "And TestProgIDRev='" & rev & "' "
            'strQuery = strQuery & "And TestProgIDVers= 0 "
            strQuery = strQuery & "And Device='" & device & "' "
            strQuery = strQuery & "And TestStepTemp='" & temp & "' "
            strQuery = strQuery & "And TestTimeEffDate=to_date('" & effDate & "','mm/dd/yyyy') "
            strQuery = strQuery & "And NVL(Overhead, '0') = '" & overhead & "' "
            Dim dsCheck As DataSet = oOra.OraExecuteQuery(strQuery, cnnOra)

            strResult = "SUCCESS"

        Catch ex As Exception
            Dim exMsg = ex.Message
            strResult = "FAILED"
        Finally
            oOra.CloseOraConnection(cnnOra)
        End Try

        Return strResult

    End Function

End Class
