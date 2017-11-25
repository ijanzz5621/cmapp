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
            strQuery = "select distinct TESTPROGID from CM.PDCTESTPROGRAMREVISION"
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

    Public Function GetProgramNameList() As DataTable

        Dim strQuery As String
        Dim dsResult As DataSet = New DataSet

        Try

            oOra.OpenOraConnection(cnnOra, connStr)
            strQuery = "select distinct TESTPROGMAINSOURCE from CM.PDCTESTPROGRAMREVISION ORDER BY TESTPROGMAINSOURCE"
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
            strQuery = "select distinct TESTPROGEXECUTABLE from CM.PDCTESTPROGRAMREVISION ORDER BY TESTPROGEXECUTABLE"
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
            strQuery = "select distinct DEVICE from CM.PDCMPCTESTATTRIBUTES ORDER BY DEVICE"
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

End Class
