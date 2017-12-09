﻿Imports System.Web.Script.Services
Imports System.Web.Services
Imports CMAPP.BLogic
Imports CMAPP.Model
Imports Newtonsoft.Json

Public Class TestTimeUpdateV2
    Inherits System.Web.UI.Page

    Private Shared cnnOraString As String = ConfigurationManager.ConnectionStrings("ORA_DefaultConnString").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            If Session("USER_NAME") Is Nothing Then

                Response.Redirect("~/Default.aspx")

            End If

            GetTempList()
            GetTesterTypeList()
            PopulateSiteCountList()

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

    Private Sub PopulateSiteCountList()

        For item As Integer = 1 To 320

            Dim li As ListItem = New ListItem()
            li.Text = item & "x(s)"
            li.Value = item

            If item = 1 Or item = 2 Or item = 3 Or item = 4 Or item = 8 Then
                li.Selected = True
            End If

            cblSiteCount.Items.Add(li)

        Next

    End Sub

#End Region

#Region "Web Methods"

    <WebMethod>
    Public Shared Function GetListing(testProgID As String, rev As String, ver As String, testerType As String, progName As String, progExec As String, device As String, temp As String, maxDate As String, siteCountList As String) As Object

        Dim obj As Object = JsonConvert.SerializeObject("")

        Try

            Dim siteCountListObj As SiteCount() = JsonConvert.DeserializeObject(Of SiteCount())(siteCountList)

            Dim fnData As blTestTime = New blTestTime()
            fnData.ConnectionString = cnnOraString
            Dim dsResult As DataTable = fnData.GetCmTestTimeList(testProgID, rev, ver, testerType, progName, progExec, device, temp, maxDate, siteCountListObj)

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

    '<WebMethod>
    'Public Shared Function GetTestProgramIDList() As Object

    '    Dim obj As Object = JsonConvert.SerializeObject("")

    '    Try

    '        Dim fnData As blGeneral = New blGeneral()
    '        fnData.ConnectionString = cnnOraString
    '        Dim dsResult As DataTable = fnData.GetProgramIDList()

    '        obj = JsonConvert.SerializeObject(dsResult)

    '    Catch ex As Exception

    '    End Try

    '    Return obj

    'End Function

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
    Public Shared Function GetSiteCount1TestTime(testProgID As String, rev As String, testerType As String, progName As String, programExec As String, device As String, temp As String, effDate As String) As Object

        Dim obj As Object = JsonConvert.SerializeObject("")

        Try

            Dim fnData As blTestTime = New blTestTime()
            fnData.ConnectionString = cnnOraString
            Dim dsResult As DataTable = fnData.GetSiteCount1TestTime(testProgID, rev, testerType, progName, programExec, device, temp, effDate)

            obj = JsonConvert.SerializeObject(dsResult)

        Catch ex As Exception

        End Try

        Return obj

    End Function

    <WebMethod>
    Public Shared Function GetSiteCountListByFilter(testProgID As String, rev As String, testerType As String, progName As String, programExec As String, device As String, temp As String) As Object

        Dim obj As Object = JsonConvert.SerializeObject("")

        Try

            Dim fnData As blTestTime = New blTestTime()
            fnData.ConnectionString = cnnOraString
            Dim dsResult As DataTable = fnData.GetSiteCountListByFilter(testProgID, rev, testerType, progName, programExec, device, temp)

            obj = JsonConvert.SerializeObject(dsResult)

        Catch ex As Exception

        End Try

        Return obj

    End Function

    <WebMethod>
    Public Shared Function UpdateTestTime(testProgID As String, rev As String, testerType As String, progName As String, programExec As String, device As String, temp As String, effDate As String, siteCountList As String, overhead As String, updateType As String) As Object

        Dim obj As Object = JsonConvert.SerializeObject("")

        Try

            Dim siteCountListObj As SiteCount() = JsonConvert.DeserializeObject(Of SiteCount())(siteCountList)

            Dim fnData As blTestTime = New blTestTime()
            fnData.ConnectionString = cnnOraString

            If updateType = "Single" Then

                For Each siteCount As SiteCount In siteCountListObj

                    Dim dsResult As String = fnData.UpdateTestTime(testProgID, rev, "0", device, temp, effDate, siteCount.labelValue, siteCount.value, overhead, testerType, progName, programExec, HttpContext.Current.Session("USER_NAME").ToString())

                Next

            ElseIf updateType = "All" Then

                ' Get all the revision for the selected test prog id, loop it and update
                Dim revList As DataTable = fnData.GetTestProgramRevisionList(testProgID)
                If revList IsNot Nothing And revList.Rows.Count > 0 Then

                    For Each revRow As DataRow In revList.Rows

                        For Each siteCount As SiteCount In siteCountListObj

                            Dim dsResult As String = fnData.UpdateTestTime(testProgID, revRow("TESTPROGIDREV").ToString(), "0", device, temp, effDate, siteCount.labelValue, siteCount.value, overhead, testerType, progName, programExec, HttpContext.Current.Session("USER_NAME").ToString())

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

#End Region

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs)

    End Sub


End Class