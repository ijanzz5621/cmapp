Imports Oracle.ManagedDataAccess.Client

Public Class blGeneral

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

    Public Function GetProgramIDList() As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "select distinct TESTPROGID from CM.PDCTESTPROGRAMREVISION ORDER BY TESTPROGID"
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            oOra.CloseOraConnection(cnnOra)

        End Try

        Return dsResult.Tables(0)

    End Function

    Public Function GetProgramIDListWithFilter(q As String) As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "select distinct TESTPROGID from CM.PDCTESTPROGRAMREVISION where TESTPROGID like '" & q & "%' and rownum <= 150"
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            oOra.CloseOraConnection(cnnOra)

        End Try

        Return dsResult.Tables(0)

    End Function

    Public Function GetProgramRevList(_progID As String) As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "select distinct TESTPROGIDREV from CM.PDCTESTPROGRAMREVISION where TESTPROGID = '" & _progID & "' and TESTPROGIDVERS = 0 order by TESTPROGIDREV"
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            oOra.CloseOraConnection(cnnOra)

        End Try

        Return dsResult.Tables(0)

    End Function

    Public Function GetProgramRevListV2() As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "select distinct TESTPROGIDREV from CM.PDCTESTPROGRAMREVISION "
            strQuery = strQuery & "order by TESTPROGIDREV"
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            oOra.CloseOraConnection(cnnOra)

        End Try

        Return dsResult.Tables(0)

    End Function

    Public Function GetMaxRevByTestProgID(_testProgID As String) As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
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

            oOra.CloseOraConnection(cnnOra)

        End Try

        Return dsResult.Tables(0)

    End Function

    Public Function GetMaxRevByFilterList(testSite As String, testProgID As String, version As String, tester As String, progName As String, progExec As String, device As String, temp As String) As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "Select * From ( " +
                "Select (Length(TestProgIDRev)) MaxRev,TestProgIDRev " +
                "From CmTestTime "

            strQuery = strQuery & " Where 1 = 1 "

            If Len(Trim(testSite)) >= 1 Then
                strQuery = strQuery & " And TestSite = '" & testSite & "' "
            End If
            If Len(Trim(testProgID)) >= 1 Then
                strQuery = strQuery & " And TestProgId = '" & testProgID & "' "
            End If
            If Len(Trim(version)) >= 1 Then
                strQuery = strQuery & " And testprogidvers like '" & version & "' "
            End If
            If Len(Trim(temp)) >= 1 Then
                strQuery = strQuery & " And teststeptemp like '" & temp & "' "
            End If
            If Len(Trim(device)) >= 1 Then
                strQuery = strQuery & " And device like '" & device & "' "
            End If
            If Len(Trim(tester)) >= 1 Then
                strQuery = strQuery & " And Testertype like '" & tester & "' "
            End If
            If Len(Trim(progName)) >= 1 Then
                strQuery = strQuery & " And TestProgMainSource  like '" & progName & "' "
            End If
            If Len(Trim(progExec)) >= 1 Then
                strQuery = strQuery & " And Testprogexecutable like '" & progExec & "' "
            End If

            strQuery = strQuery & "Order By MaxRev DESC,TestProgIDRev DESC " +
                ") q1 " +
                "Where ROWNUM <= 1 " +
                "Order By ROWNUM DESC"
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            oOra.CloseOraConnection(cnnOra)

        End Try

        Return dsResult.Tables(0)

    End Function

    Public Function GetProgramNameList() As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "select distinct TESTPROGMAINSOURCE from CM.PDCTESTPROGRAMREVISION where rownum <= 150 ORDER BY TESTPROGMAINSOURCE"
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            oOra.CloseOraConnection(cnnOra)

        End Try

        Return dsResult.Tables(0)

    End Function

    Public Function GetProgramNameListWithFilter(q As String) As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "select distinct TESTPROGMAINSOURCE from CM.PDCTESTPROGRAMREVISION where TESTPROGMAINSOURCE like '" & q & "%' and rownum <= 150 ORDER BY TESTPROGMAINSOURCE"
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            oOra.CloseOraConnection(cnnOra)

        End Try

        Return dsResult.Tables(0)

    End Function

    Public Function GetProgramExecList() As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "select distinct TESTPROGEXECUTABLE from CM.PDCTESTPROGRAMREVISION where rownum <= 150 ORDER BY TESTPROGEXECUTABLE"
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            oOra.CloseOraConnection(cnnOra)

        End Try

        Return dsResult.Tables(0)

    End Function

    Public Function GetProgramExecListWithFilter(q As String) As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "select distinct TESTPROGEXECUTABLE from CM.PDCTESTPROGRAMREVISION where TESTPROGEXECUTABLE like '" & q & "%' and rownum <= 150 ORDER BY TESTPROGEXECUTABLE"
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            oOra.CloseOraConnection(cnnOra)

        End Try

        Return dsResult.Tables(0)

    End Function

    Public Function GetTesterTypeList() As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "select distinct TESTERTYPE from cm.pdcTesterType"
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            oOra.CloseOraConnection(cnnOra)

        End Try

        Return dsResult.Tables(0)

    End Function

    Public Function GetDeviceList() As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "select distinct DEVICE from CM.PDCMPCTESTATTRIBUTES where rownum <= 150 ORDER BY DEVICE"
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            oOra.CloseOraConnection(cnnOra)

        End Try

        Return dsResult.Tables(0)

    End Function

    Public Function GetDeviceListWithFilter(q As String) As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "select distinct DEVICE from CM.PDCMPCTESTATTRIBUTES where DEVICE like '" & q & "%' and rownum <= 150 ORDER BY DEVICE"
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            oOra.CloseOraConnection(cnnOra)

        End Try

        Return dsResult.Tables(0)

    End Function

    Public Function GetTempList() As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "select distinct TESTSTEPTEMP from CM.PDCTESTTEMP ORDER BY TESTSTEPTEMP"
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            oOra.CloseOraConnection(cnnOra)

        End Try

        Return dsResult.Tables(0)

    End Function

    Public Function GetTestSiteList() As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "select distinct TESTSITE from CMTESTTIME ORDER BY TESTSITE"
            dsResult = oOra.OraExecuteQuery(strQuery, cnnOra)

        Catch ex As Exception
            Dim exMsg = ex.Message
        Finally

            oOra.CloseOraConnection(cnnOra)

        End Try

        Return dsResult.Tables(0)

    End Function

End Class
