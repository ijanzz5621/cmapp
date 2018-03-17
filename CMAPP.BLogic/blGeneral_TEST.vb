Imports Oracle.ManagedDataAccess.Client

Public Class blGeneral_TEST

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
            strQuery = "select distinct TESTPROGID from PDCTESTPROGRAMREVISION ORDER BY TESTPROGID"
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
            strQuery = "select distinct TESTPROGID from PDCTESTPROGRAMREVISION where TESTPROGID like '" & q & "%' and rownum <= 150"
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
            strQuery = "select distinct TESTPROGIDREV from PDCTESTPROGRAMREVISION where TESTPROGID = '" & _progID & "' and TESTPROGIDVERS = 0 order by TESTPROGIDREV"
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

    Public Function GetProgramNameList() As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "select distinct TESTPROGMAINSOURCE from PDCTESTPROGRAMREVISION where rownum <= 150 ORDER BY TESTPROGMAINSOURCE"
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
            strQuery = "select distinct TESTPROGMAINSOURCE from PDCTESTPROGRAMREVISION where TESTPROGMAINSOURCE like '" & q & "%' and rownum <= 150 ORDER BY TESTPROGMAINSOURCE"
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
            strQuery = "select distinct TESTPROGEXECUTABLE from PDCTESTPROGRAMREVISION where rownum <= 150 ORDER BY TESTPROGEXECUTABLE"
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
            strQuery = "select distinct TESTPROGEXECUTABLE from PDCTESTPROGRAMREVISION where TESTPROGEXECUTABLE like '" & q & "%' and rownum <= 150 ORDER BY TESTPROGEXECUTABLE"
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
            strQuery = "select distinct TESTERTYPE from pdcTesterType"
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
            strQuery = "select distinct DEVICE from PDCMPCTESTATTRIBUTES where rownum <= 150 ORDER BY DEVICE"
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
            strQuery = "select distinct DEVICE from PDCMPCTESTATTRIBUTES where DEVICE like '" & q & "%' and rownum <= 150 ORDER BY DEVICE"
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
            strQuery = "select distinct TESTSTEPTEMP from PDCTESTTEMP ORDER BY TESTSTEPTEMP"
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
