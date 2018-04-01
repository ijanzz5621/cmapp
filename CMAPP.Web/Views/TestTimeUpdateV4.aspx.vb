Imports System.Web.Script.Services
Imports System.Web.Services
Imports CMAPP.BLogic
Imports CMAPP.Model
Imports Newtonsoft.Json

Public Class TestTimeUpdateV4
    Inherits System.Web.UI.Page

    Private Shared cnnOraString As String = ConfigurationManager.ConnectionStrings("ORA_DefaultConnString").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            If Session("USER_NAME") Is Nothing Then

                Response.Redirect("~/Default.aspx")

            End If

            GetTempList()
            GetTesterTypeList()

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

#Region "Functions"

    Private Sub GetTempList()
        Dim fnData As blGeneral = New blGeneral()
        fnData.ConnectionString = cnnOraString
        Dim dsResult As DataTable = fnData.GetTempList()
        ddlTemp.DataSource = dsResult
        ddlTemp.DataTextField = "TESTSTEPTEMP"
        ddlTemp.DataValueField = "TESTSTEPTEMP"
        ddlTemp.DataBind()
    End Sub

    Private Sub GetTesterTypeList()
        Dim fnData As blGeneral = New blGeneral()
        fnData.ConnectionString = cnnOraString
        Dim dsResult As DataTable = fnData.GetTesterTypeList()
        ddlTester.DataSource = dsResult
        ddlTester.DataTextField = "TESTERTYPE"
        ddlTester.DataValueField = "TESTERTYPE"
        ddlTester.DataBind()
    End Sub

#End Region

#Region "Web Methods"

    <WebMethod>
    Public Shared Function GetListing(testSite As String, testProgID As String, rev As String, ver As String, testerType As String, progName As String, progExec As String, device As String, temp As String, maxDate As String, siteCountList As String) As Object

        Dim obj As Object = JsonConvert.SerializeObject("")

        Try

            Dim siteCountListObj As SiteCount() = JsonConvert.DeserializeObject(Of SiteCount())(siteCountList)

            Dim fnData As blTestTime = New blTestTime()
            fnData.ConnectionString = cnnOraString

            Dim strMaxDate As String = fnData.GetMaxDate(testSite, testProgID, rev, ver, testerType, progName, progExec, device, temp)

            Dim dsResult As DataTable = fnData.GetCmTestTimeListV3(testSite, testProgID, rev, ver, testerType, progName, progExec, device, temp, strMaxDate, maxDate, siteCountListObj)

            obj = JsonConvert.SerializeObject(dsResult)

        Catch ex As Exception

        End Try

        Return obj

    End Function

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
    Public Shared Function GetRevisionList() As Object

        Dim obj As Object = JsonConvert.SerializeObject("")

        Try

            Dim fnData As blGeneral = New blGeneral()
            fnData.ConnectionString = cnnOraString
            Dim dsResult As DataTable = fnData.GetProgramRevListV2()

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
    Public Shared Function GetMaxRevisionByFilterList(testSite As String, testProgID As String, version As String, tester As String, progName As String, progExec As String, device As String, temp As String) As Object

        Dim obj As Object = JsonConvert.SerializeObject("")

        Try

            Dim fnData As blGeneral = New blGeneral()
            fnData.ConnectionString = cnnOraString
            Dim dsResult As DataTable = fnData.GetMaxRevByFilterList(testSite, testProgID, version, tester, progName, progExec, device, temp)

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

    <WebMethod>
    Public Shared Function GetDeviceList(q As String) As Object

        Dim obj As Object = JsonConvert.SerializeObject("")

        Try

            Dim fnData As blGeneral = New blGeneral()
            fnData.ConnectionString = cnnOraString
            Dim dsResult As DataTable = fnData.GetDeviceListWithFilter(q)

            obj = JsonConvert.SerializeObject(dsResult)

        Catch ex As Exception

        End Try

        Return obj

    End Function

    <WebMethod>
    Public Shared Function GetTestSiteList() As Object

        Dim obj As Object = JsonConvert.SerializeObject("")

        Try

            Dim fnData As blGeneral = New blGeneral()
            fnData.ConnectionString = cnnOraString
            Dim dsResult As DataTable = fnData.GetTestSiteList()

            obj = JsonConvert.SerializeObject(dsResult)

        Catch ex As Exception

        End Try

        Return obj

    End Function

    <WebMethod>
    Public Shared Function GetSiteCount1TestTime(testSite As String, testProgID As String, rev As String, testerType As String, progName As String, programExec As String, device As String, temp As String, effDate As String) As Object

        Dim obj As Object = JsonConvert.SerializeObject("")

        Try

            Dim fnData As blTestTime = New blTestTime()
            fnData.ConnectionString = cnnOraString
            Dim dsResult As DataTable = fnData.GetSiteCount1TestTime(testSite, testProgID, rev, testerType, progName, programExec, device, temp, effDate)

            obj = JsonConvert.SerializeObject(dsResult)

        Catch ex As Exception

        End Try

        Return obj

    End Function

    <WebMethod>
    Public Shared Function GetSiteCountListByFilter(testSite As String, testProgID As String, rev As String, testerType As String, progName As String, programExec As String, device As String, temp As String) As Object

        Dim obj As Object = JsonConvert.SerializeObject("")

        Try

            Dim fnData As blTestTime = New blTestTime()
            fnData.ConnectionString = cnnOraString
            Dim dsResult As DataTable = fnData.GetSiteCountListByFilter(testSite, testProgID, rev, testerType, progName, programExec, device, temp)

            obj = JsonConvert.SerializeObject(dsResult)

        Catch ex As Exception

        End Try

        Return obj

    End Function

    <WebMethod>
    Public Shared Function UpdateTestTime(testSite As String, testProgID As String, rev As String, testerType As String, progName As String, programExec As String, device As String, temp As String, effDate As String, siteCountList As String, overhead As String, updateType As String) As Object

        Dim obj As Object = JsonConvert.SerializeObject("")

        Try

            Dim siteCountListObj As SiteCount() = JsonConvert.DeserializeObject(Of SiteCount())(siteCountList)

            Dim fnData As blTestTime = New blTestTime()
            fnData.ConnectionString = cnnOraString

            If updateType = "Single" Then

                Dim dsDelete As String = fnData.DeleteTestTimeAllExceptSC1(testSite, testProgID, rev, device, temp, effDate, overhead, testerType, progName, programExec, HttpContext.Current.Session("USER_NAME").ToString())

                For Each siteCount As SiteCount In siteCountListObj

                    'If siteCount.labelValue <> "1" Then

                    If siteCount.value = "" Then
                        Dim dsDelSC = fnData.DeleteTestTimeSiteCountEmpty(testSite, testProgID, rev, device, temp, effDate, overhead, testerType, progName, programExec, HttpContext.Current.Session("USER_NAME").ToString(), siteCount.labelValue)
                    Else
                        Dim dsResult As String = fnData.UpdateTestTime(testSite, testProgID, rev, "0", device, temp, effDate, siteCount.labelValue, siteCount.value, overhead, testerType, progName, programExec, HttpContext.Current.Session("USER_NAME").ToString())
                    End If

                    'End If

                Next

            ElseIf updateType = "All" Then

                ' Get all the revision for the selected test prog id, loop it and update
                Dim revList As DataTable = fnData.GetTestProgramRevisionList(testProgID)
                If revList IsNot Nothing And revList.Rows.Count > 0 Then

                    For Each revRow As DataRow In revList.Rows

                        For Each siteCount As SiteCount In siteCountListObj

                            'If siteCount.labelValue <> "1" Then
                            Dim dsResult As String = fnData.UpdateTestTime(testSite, testProgID, revRow("TESTPROGIDREV").ToString(), "0", device, temp, effDate, siteCount.labelValue, siteCount.value, overhead, testerType, progName, programExec, HttpContext.Current.Session("USER_NAME").ToString())
                            'End If


                        Next

                    Next

                End If

            End If



            obj = JsonConvert.SerializeObject("SUCCESS")

        Catch ex As Exception

            obj = JsonConvert.SerializeObject(ex.Message)

        End Try

        Return obj

    End Function

    <WebMethod>
    Public Shared Function DeleteTestTime(testSite As String, testProgID As String, rev As String, testerType As String, progName As String, programExec As String, device As String, temp As String, effDate As String, overhead As String) As Object

        Dim obj As Object = JsonConvert.SerializeObject("")

        Try

            Dim fnData As blTestTime = New blTestTime()
            fnData.ConnectionString = cnnOraString

            Dim dsResult As String = fnData.DeleteTestTime(testSite, testProgID, rev, device, temp, effDate, overhead, testerType, progName, programExec, HttpContext.Current.Session("USER_NAME").ToString())

            obj = JsonConvert.SerializeObject("SUCCESS")

        Catch ex As Exception

            obj = JsonConvert.SerializeObject(ex.Message)

        End Try

        Return obj

    End Function

    <WebMethod>
    Public Shared Function GetSelectedSiteCountList(testSite As String, testProgID As String, rev As String, testerType As String, progName As String, programExec As String, device As String, temp As String, effDate As String) As Object
        Dim obj As Object = JsonConvert.SerializeObject("")

        Try

            Dim fnData As blTestTime = New blTestTime()
            fnData.ConnectionString = cnnOraString
            Dim dsResult As DataTable = fnData.GetSelectedSiteCountList(testSite, testProgID, rev, testerType, progName, programExec, device, temp, effDate)

            obj = JsonConvert.SerializeObject(dsResult)

        Catch ex As Exception

        End Try

        Return obj
    End Function

#End Region

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs)

    End Sub


End Class