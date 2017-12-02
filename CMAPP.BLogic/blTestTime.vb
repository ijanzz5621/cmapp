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

    Public Function GetCmTestTimeList(testProgID As String, rev As String, ver As String, progName As String, progExec As String, device As String, temp As String, maxDate As String, siteCountList As String) As DataTable

        Dim strQuery As String = ""
        Dim dsResult As DataSet = New DataSet

        Try
            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "Select TestProgID as ""Program ID"",TestProgIDRev as ""Revision"",TesterType as ""Tester Type"",TestProgMainSource as ""Program Source"",TestProgExecutable as ""Program Exec"",Device as ""Device"",TestStepTemp as ""Temp"",to_char(TestTimeEffDate,'mm/dd/yyyy') As ""Eff Date"",OverHead AS ""Overhead"", USERID as ""UserId"" "

            Dim list As String() = siteCountList.Split(",")
            If list.Count > 0 Then

                For i = 0 To list.Count - 1
                    strQuery = strQuery & ",Max(Decode(SiteCount, " & list(i) & ", TestTime, null)) x" & list(i)
                Next

            End If

            strQuery = strQuery & " From cmtesttime "
            strQuery = strQuery & " Where Not UserId Is Null "

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
            'If Len(Trim(p_strTesterType)) >= 1 Then
            '    strQuery = strQuery & " And Testertype like '" & p_strTesterType & "' "
            'End If
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

End Class
