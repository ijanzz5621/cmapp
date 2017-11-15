Public Class TestTime

    '    Public Function RefreshListViewData(ByRef p_lvwData As ListView, ByRef p_mfgData As MSFlexGrid,
    '                                    Optional ByVal p_strTestProgID As String = vbNullString,
    '                                    Optional ByVal p_strTestProgIDRev As String = vbNullString,
    '                                    Optional ByVal p_strTestProgIDVers As String = vbNullString,
    '                                    Optional ByVal p_strDevice As String = vbNullString,
    '                                    Optional ByVal p_strTestStepTemp As String = vbNullString,
    '                                    Optional ByVal p_strTesterType As String = vbNullString,
    '                                    Optional ByVal p_strProgMainSource As String = vbNullString,
    '                                    Optional ByVal p_strProgExec As String = vbNullString) As Boolean

    '        On Error GoTo ErrorHandle
    '        Dim strFunc As String : strFunc = "RefreshTestStepTempCombo"
    '        Dim recAdor As New ADOR.Recordset
    '        Dim lstItem As ListItem
    '        Dim i As Integer
    '        DisplayStatus gc_strStatus, "Refresh listview data..."

    '        p_lvwData.ListItems.Clear
    '        If Len(Trim(p_strTestProgID)) = 0 Then
    '            p_strTestProgID = "%"
    '        Else
    '            p_strTestProgID = p_strTestProgID & "%"
    '        End If

    '        If Len(Trim(p_strTestProgIDRev)) = 0 Then
    '            p_strTestProgIDRev = "%"
    '        Else
    '            p_strTestProgIDRev = p_strTestProgIDRev & "%"
    '        End If

    '        If Len(Trim(p_strTestProgIDVers)) = 0 Then
    '            p_strTestProgIDVers = "%"
    '        Else
    '            p_strTestProgIDVers = p_strTestProgIDVers & "%"
    '        End If

    '        If Len(Trim(p_strDevice)) = 0 Then
    '            p_strDevice = "%"
    '        Else
    '            p_strDevice = p_strDevice & "%"
    '        End If

    '        If Len(Trim(p_strTestStepTemp)) = 0 Then
    '            p_strTestStepTemp = "%"
    '        Else
    '            p_strTestStepTemp = p_strTestStepTemp & "%"
    '        End If

    '        If Len(Trim(p_strTesterType)) = 0 Then
    '            p_strTesterType = "%"
    '        Else
    '            p_strTesterType = p_strTesterType & "%"
    '        End If

    '        If Len(Trim(p_strProgMainSource)) = 0 Then
    '            p_strProgMainSource = "%"
    '        Else
    '            p_strProgMainSource = p_strProgMainSource & "%"
    '        End If

    '        If Len(Trim(p_strProgExec)) = 0 Then
    '            p_strProgExec = "%"
    '        Else
    '            p_strProgExec = p_strProgExec & "%"
    '        End If
    '        strQuery = "Select TestProgID,TestProgIDRev,TestProgIDVers,TesterType,TestProgMainSource,TestProgExecutable,Device,TestStepTemp,to_char(TestTimeEffDate,'mm/dd/yyyy') As TestTimeEffDate,OverHead,' ' as UserId "
    '        For i = 1 To gc_intMaxSiteCount
    '            strQuery = strQuery & ",Max(Decode(SiteCount, " & i & ", TestTime, null)) x" & i
    '        Next
    '        strQuery = strQuery & " From  hdbprd1.cmtesttime "

    '        strQuery = strQuery & " Where Not UserId Is Null"

    '        If Len(Trim(p_strTestProgID)) > 1 Then
    '            strQuery = strQuery & " And TestProgId like '" & p_strTestProgID & "'"
    '        End If
    '        If Len(Trim(p_strTestProgIDRev)) > 1 Then
    '            strQuery = strQuery & " And testprogidrev like '" & p_strTestProgIDRev & "'"
    '        Else

    '        End If
    '        If Len(Trim(p_strTestProgIDVers)) > 1 Then
    '            strQuery = strQuery & " And testprogidvers like '" & p_strTestProgIDVers & "'"
    '        End If
    '        If Len(Trim(p_strTestStepTemp)) > 1 Then
    '            strQuery = strQuery & " And teststeptemp like '" & p_strTestStepTemp & "'"
    '        End If
    '        If Len(Trim(p_strDevice)) > 1 Then
    '            strQuery = strQuery & " And device like '" & p_strDevice & "'"
    '        End If
    '        If Len(Trim(p_strTesterType)) > 1 Then
    '            strQuery = strQuery & " And Testertype like '" & p_strTesterType & "'"
    '        End If
    '        If Len(Trim(p_strProgMainSource)) > 1 Then
    '            strQuery = strQuery & " And TestProgMainSource  like '" & p_strProgMainSource & "'"
    '        End If
    '        If Len(Trim(p_strProgExec)) > 1 Then
    '            strQuery = strQuery & " And Testprogexecutable like '" & p_strProgExec & "'"
    '        End If

    '        strQuery = strQuery & " Group By  TestProgId , TestProgIdRev, TestProgIdVers, TestStepTemp, device,Testertype, TestProgMainSource,TestProgExecutable,TestTimeEffDate,OverHead"

    '        recAdor.Open strQuery, Conn, adOpenForwardOnly, adLockReadOnly
    '        If Not recAdor.BOF And Not recAdor.EOF Then
    '            If Not p_lvwData Is Nothing Then
    '                For i = 12 To gc_intMaxSiteCount + 11 'set column  site count  width=0
    '                    p_lvwData.ColumnHeaders(i).Width = 0
    '                Next
    '                For i = 10 To gc_intMaxSiteCount + 9 'set column  site count  width=0
    '                    p_mfgData.ColWidth(i) = 0
    '                Next
    '                p_mfgData.Rows = 1
    '                Do While Not recAdor.EOF
    '                    Set lstItem = p_lvwData.ListItems.Add(, , recAdor.Fields(0).Value)
    '                    For i = 1 To gc_intMaxSiteCount + 10
    '                        If Not recAdor.Fields(i).Value = vbNullString Then
    '                            lstItem.SubItems(i) = IIFNull(recAdor.Fields(i).Value)

    '                            If i > 10 Then 'initial column site count only
    '                                p_lvwData.ColumnHeaders(i + 1).Width = 700
    '                            End If
    '                            If i > 10 Then 'initial column site count only
    '                                p_mfgData.ColWidth(i - 1) = 700
    '                            End If
    '                        End If
    '                    Next
    '                    recAdor.MoveNext
    '                Loop
    '                RefreshListViewData = vbTrue
    '            End If
    '        Else
    '            RefreshListViewData = False
    '        End If
    '        recAdor.Close
    '        GoTo EndProcedure
    'ErrorHandle:
    '        DisplayStatus gc_strError & "(" & strFunc & ")", Err.Description
    'EndProcedure:
    '    Set recAdor = Nothing
    '    Set lstItem = Nothing
    'End Function

    ' ##############################################################################################################################################################################

    '    Public Function SaveCmTestTime(ByVal p_mfgData As MSFlexGrid, ByVal p_strUserId As String) As Boolean
    '        On Error GoTo ErrorHandler
    '        Dim recAdor As New ADOR.Recordset
    '        Dim recAdodb As New ADODB.Recordset
    '        Dim strStatus As String
    '        Dim i As Integer
    '        Dim j As Integer
    '        Dim k As Integer
    '        DisplayStatus "Status", "Start to saving..."
    '    With p_mfgData
    '            If .Rows = 1 Then
    '                MsgBox "Please select test program for save.", vbExclamation, "Warning"
    '            GoTo ExitFunction
    '            End If

    '            Conn.BeginTrans
    '            For i = 1 To .Rows - 1
    '                If Len(.TextMatrix(i, 0)) = 0 Or Len(.TextMatrix(i, 1)) = 0 _
    '                   Or Len(.TextMatrix(i, 2)) = 0 Or Len(.TextMatrix(i, 6)) = 0 _
    '                   Or Len(.TextMatrix(i, 7)) = 0 Or Len(.TextMatrix(i, 8)) = 0 Then
    '                    MsgBox "Please Input Test program ID Or Test revision Or Test version Or Device Or Test Temp  Or Effective Date before save.", vbExclamation, "Warning"
    '                        Conn.RollbackTrans
    '                    GoTo ExitFunction
    '                End If
    '                k = 10
    '                For j = k To gc_intMaxSiteCount + 9
    '                    If .ColWidth(j) > 0 Then
    '                        strStatus = " Test Program ID : " & .TextMatrix(i, 0) & "." & .TextMatrix(i, 1) & "." & .TextMatrix(i, 2) & " Site Count : " & Mid(.TextMatrix(0, j), 2)
    '                        strQuery = "Select 1 From HDBPRD1.CmTestTime "
    '                        strQuery = strQuery & "Where TestProgID=" & .TextMatrix(i, 0) & " "
    '                        strQuery = strQuery & "And TestProgIDRev='" & .TextMatrix(i, 1) & "' "
    '                        strQuery = strQuery & "And TestProgIDVers=" & .TextMatrix(i, 2) & " "
    '                        strQuery = strQuery & "And Device='" & .TextMatrix(i, 6) & "' "
    '                        strQuery = strQuery & "And TestStepTemp='" & .TextMatrix(i, 7) & "' "
    '                        strQuery = strQuery & "And TestTimeEffDate=to_date('" & .TextMatrix(i, 8) & "','mm/dd/yyyy') "
    '                        strQuery = strQuery & "And SiteCount=" & Mid(.TextMatrix(0, j), 2, InStr(.TextMatrix(0, j), "(s)") - 2)
    '                        recAdor.Open strQuery, Conn, adOpenForwardOnly, adLockOptimistic
    '                    If Not recAdor.BOF And Not recAdor.EOF Then
    '                            strQuery = "Update HDBPRD1.CmTestTime Set "
    '                            strQuery = strQuery & "TestTime=" & NullString(.TextMatrix(i, j)) & " "
    '                            strQuery = strQuery & ",OverHead=" & NullString(.TextMatrix(i, 9)) & " "
    '                            strQuery = strQuery & ",UserID='" & p_strUserId & "' "
    '                            strQuery = strQuery & ",ChangeDate=SysDate "
    '                            strQuery = strQuery & ",ChangeTypeCode='U' "
    '                            strQuery = strQuery & "Where TestProgID=" & .TextMatrix(i, 0) & " "
    '                            strQuery = strQuery & "And TestProgIDRev='" & .TextMatrix(i, 1) & "' "
    '                            strQuery = strQuery & "And TestProgIDVers=" & .TextMatrix(i, 2) & " "
    '                            strQuery = strQuery & "And Device='" & .TextMatrix(i, 6) & "' "
    '                            strQuery = strQuery & "And TestStepTemp='" & .TextMatrix(i, 7) & "' "
    '                            strQuery = strQuery & "And TestTimeEffDate=to_date('" & .TextMatrix(i, 8) & "','mm/dd/yyyy') "
    '                            strQuery = strQuery & "And SiteCount=" & Mid(.TextMatrix(0, j), 2, InStr(.TextMatrix(0, j), "(s)") - 2)
    '                            Conn.Execute strQuery
    '                        DisplayStatus "Status", "Inserted " & strStatus
    '                    ElseIf Len(.TextMatrix(i, j)) > 0 Then
    '                            strQuery = "Insert Into HDBPRD1.CmTestTime Values("
    '                            strQuery = strQuery & .TextMatrix(i, 0)
    '                            strQuery = strQuery & ",'" & Replace(.TextMatrix(i, 1), Chr(13), "") & "'"
    '                            strQuery = strQuery & "," & .TextMatrix(i, 2) & ""
    '                            strQuery = strQuery & ",'" & Replace(.TextMatrix(i, 6), Chr(13), "") & "'"
    '                            strQuery = strQuery & ",'" & Replace(.TextMatrix(i, 7), Chr(13), "") & "'"
    '                            strQuery = strQuery & "," & Mid(.TextMatrix(0, j), 2, InStr(.TextMatrix(0, j), "(s)") - 2)
    '                            strQuery = strQuery & ",to_date('" & .TextMatrix(i, 8) & "','mm/dd/yyyy')"
    '                            strQuery = strQuery & "," & NullString(.TextMatrix(i, j)) & ""
    '                            strQuery = strQuery & "," & NullString(.TextMatrix(i, 9)) & ""
    '                            strQuery = strQuery & ",'" & Replace(.TextMatrix(i, 3), Chr(13), "") & "'"
    '                            strQuery = strQuery & ",'" & Replace(.TextMatrix(i, 4), Chr(13), "") & "'"
    '                            strQuery = strQuery & ",'" & Replace(.TextMatrix(i, 5), Chr(13), "") & "'"
    '                            strQuery = strQuery & ",'" & p_strUserId & "'"
    '                            strQuery = strQuery & ",SysDate "
    '                            strQuery = strQuery & ",'I') "
    '                            Conn.Execute strQuery
    '                        DisplayStatus "Status", "Inserted " & strStatus
    '                    End If
    '                        recAdor.Close
    '                        k = j + 1
    '                    End If
    '                Next
    '            Next
    '        End With
    '        Conn.CommitTrans
    '        DisplayStatus "Status", "Save data completed."
    '    SaveCmTestTime = vbTrue
    '        GoTo ExitFunction
    'ErrorHandler:
    '        Conn.RollbackTrans
    '        MsgBox Err.Description, vbCritical, "Error"
    'ExitFunction:
    '    Set recAdor = Nothing
    '    Set recAdodb = Nothing
    'End Function


End Class
