Public Class Home
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub DetailsView1_ItemCommand(sender As Object, e As DetailsViewCommandEventArgs) Handles DetailsView1.ItemCommand
        ' This code line calls the funtion in Javascript file for reload the form dialog.
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "ShowModal();", True)
    End Sub
End Class