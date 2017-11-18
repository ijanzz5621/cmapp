Imports AjaxControlToolkit

Public Class wucTestTime
    Inherits System.Web.UI.UserControl

    'Dim ucPopup As UserControl

    'Sub New(_ucPopup As UserControl)
    '    ucPopup = _ucPopup
    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub popupTestTime_btnInsertUpdate_Click(sender As Object, e As EventArgs)

        Dim modal As ModalCaller = New ModalCaller()
        'Dim mpe As ModalPopupExtender = ucPopup.FindControl("mpePopupMessage")
        'modal.ShowPopupMessage(, popupTestTime_txtProgID.Text)


    End Sub
End Class