Public Class TestTimeUpdate
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            gvListing.DataSource = New DataTable
            gvListing.DataBind()

        End If

    End Sub

End Class