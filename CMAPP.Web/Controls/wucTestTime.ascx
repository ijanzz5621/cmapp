<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="wucTestTime.ascx.vb" Inherits="CMAPP.Web.wucTestTime" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolKit" %>

<style>

    .panel-primary-message {
        border-color: #2e6da4;
    }

        .panel-primary-message > .panel-heading {
            background:#2e6da4;
            border-color:#235f92;
            color:#e0e0e0;
        }

</style>

<ajaxToolkit:ModalPopupExtender ID="mpePopupTestTime" runat="server"
    TargetControlID="mpePopupTestTime_HF1"
    PopupControlID="mpePopupTestTime_P1"
    DropShadow="True" CancelControlID="mpePopupTestTime_DismissBT" PopupDragHandleControlID="mpePopupTestTime_P2" BackgroundCssClass="modalBackground" BehaviorID="modalPopupTestTime">
</ajaxToolkit:ModalPopupExtender>
<asp:HiddenField ID="mpePopupTestTime_HF1" runat="server" />
<asp:Panel ID="mpePopupTestTime_P1" runat="server" CssClass="panel panel-primary-message" Width="1000px" BackColor="#2e6da4" style="display:none;">
    <asp:Panel ID="mpePopupTestTime_P2" runat="server" CssClass="panel-heading" Height="40px">
        <h5 class="panel-title" style="float:left;">
            <asp:Label ID="lblHeader" runat="server" Text="Test Time Update" Font-Bold="true" Font-Size="14px" style="line-height:30px; vertical-align:middle;"></asp:Label>
        </h5>
        <%--<asp:Image ID="mpePopupTestTime_imgClose" runat="server" AlternateText="X" CssClass="ClosePopupCls" ImageUrl="~/images/delete-icon.png" Width="28" Height="28" />--%>
    </asp:Panel>
    <div class="panel-body" style="min-height:400px; background:#ffffff;">

        <div class="row">

            <div class="col-md-2">
                <asp:Label runat="server" AssociatedControlID="popupTestTime_txtProgID">Test Program ID</asp:Label><br />
                <asp:TextBox ID="popupTestTime_txtProgID" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-1">
                <asp:Label runat="server" AssociatedControlID="popupTestTime_txtRev">Revision</asp:Label><br />
                <asp:TextBox ID="popupTestTime_txtRev" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-1">
                <asp:Label runat="server" AssociatedControlID="popupTestTime_txtVer">Version</asp:Label><br />
                <asp:TextBox ID="popupTestTime_txtVer" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-2">
                <asp:Label runat="server" AssociatedControlID="popupTestTime_txtTesterType">Tester Type</asp:Label><br />
                <asp:TextBox ID="popupTestTime_txtTesterType" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-3">
                <asp:Label runat="server" AssociatedControlID="popupTestTime_txtProgName">Program Name</asp:Label><br />
                <asp:TextBox ID="popupTestTime_txtProgName" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-3">
                <asp:Label runat="server" AssociatedControlID="popupTestTime_txtProgExec">Program Exec</asp:Label><br />
                <asp:TextBox ID="popupTestTime_txtProgExec" runat="server" CssClass="form-control" />
            </div>

            <div class="col-md-2">
                <asp:Label runat="server" AssociatedControlID="popupTestTime_txtDevice">Test Program ID</asp:Label><br />
                <asp:TextBox ID="popupTestTime_txtDevice" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-1">
                <asp:Label runat="server" AssociatedControlID="popupTestTime_txtTemp">Temp</asp:Label><br />
                <asp:TextBox ID="popupTestTime_txtTemp" runat="server" CssClass="form-control" />
            </div>

        </div>

    </div>
    <div class="panel-footer" style="text-align:right; background-color:#f1f1f1; border-top:none;">
        <asp:Button ID="popupTestTime_btnInsertUpdate" Text="Update" runat="server" CssClass="btn btn-success" OnClick="popupTestTime_btnInsertUpdate_Click" />
        <asp:Button ID="mpePopupTestTime_DismissBT" runat="server" Text="Close" CssClass="btn btn-warning" Width="80px" />
    </div>
</asp:Panel>

<script>
    $(document).ready(function () {
        <%--$('#<%=mpePopupTestTime_imgClose.ClientID%>').on('click', function () {
            $find('modalPopupTestTime').hide();
            
        });--%>
    });
</script>