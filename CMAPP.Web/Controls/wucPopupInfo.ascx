<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="wucPopupInfo.ascx.vb" Inherits="CMAPP.Web.wucPopupInfo" %>
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

<ajaxToolkit:ModalPopupExtender ID="mpePopupMessage" runat="server"
    TargetControlID="HF1"
    PopupControlID="P1"
    DropShadow="True" CancelControlID="DismissBT" PopupDragHandleControlID="P2" BackgroundCssClass="modalBackground" BehaviorID="modalPopupMessage">
</ajaxToolkit:ModalPopupExtender>
<asp:HiddenField ID="HF1" runat="server" />
<asp:Panel ID="P1" runat="server" CssClass="panel panel-primary-message" Width="400px" BackColor="#2e6da4" style="display:none;">
    <asp:Panel ID="P2" runat="server" CssClass="panel-heading" Height="40px">
        <h5 class="panel-title" style="float:left;">
            <asp:Label ID="lblHeader" runat="server" Text="Message" Font-Bold="true" Font-Size="14px"></asp:Label>
        </h5>
        <asp:Image ID="imgClose" runat="server" AlternateText="X" CssClass="ClosePopupCls" ImageUrl="~/images/delete-icon.png" Width="28" Height="28" />
    </asp:Panel>
    <div class="panel-body" style="min-height:80px; background:#ffffff;">

        <asp:Label ID="lblMessage" runat="server" Text="" Font-Bold="true" Font-Size="14px" ForeColor="#585858"></asp:Label>

    </div>
    <div class="panel-footer" style="text-align:right; background-color:#f1f1f1; border-top:none;">
        <asp:Button ID="DismissBT" runat="server" Text="Close" CssClass="btn btn-warning" Width="80px" />
    </div>
</asp:Panel>

<script>
    $(document).ready(function () {
        $('#<%=imgClose.ClientID%>').on('click', function () {
            $find('modalPopupMessage').hide();
            
        });
    });
</script>