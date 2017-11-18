Imports AjaxControlToolkit

Public Class ModalCaller

    Public Sub ShowPopupMessage(modal As wucPopupInfo, content As String)
        Dim mpe As ModalPopupExtender = modal.FindControl("mpePopupMessage")
        Dim lbl As Label = modal.FindControl("lblMessage")
        If modal IsNot Nothing And lbl IsNot Nothing Then
            lbl.Text = content
            mpe.Show()
        End If
    End Sub

End Class
