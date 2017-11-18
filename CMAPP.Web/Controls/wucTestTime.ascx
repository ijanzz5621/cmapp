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
    DropShadow="True" CancelControlID="DismissBT" PopupDragHandleControlID="mpePopupTestTime_P2" BackgroundCssClass="modalBackground" BehaviorID="modalPopupTestTime">
</ajaxToolkit:ModalPopupExtender>
<asp:HiddenField ID="mpePopupTestTime_HF1" runat="server" />
<asp:Panel ID="mpePopupTestTime_P1" runat="server" CssClass="panel panel-primary-message" Width="1000px" BackColor="#2e6da4" style="display:none;;">
    <asp:Panel ID="mpePopupTestTime_P2" runat="server" CssClass="panel-heading" Height="40px">
        <h5 class="panel-title" style="float:left;">
            <asp:Label ID="lblHeader" runat="server" Text="Test Time Update" Font-Bold="true" Font-Size="14px" style="line-height:30px; vertical-align:middle;"></asp:Label>
        </h5>
        <asp:Image ID="imgClose" runat="server" AlternateText="X" CssClass="ClosePopupCls" ImageUrl="~/images/delete-icon.png" Width="28" Height="28" />
    </asp:Panel>
    <div class="panel-body" style="min-height:200px; background:#ffffff;">

        <table class="table table-bordered table-responsive">
            <thead>
                <tr>
                    <td>Column 1</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Value 1</td>
                </tr>
            </tbody>
        </table>

    </div>
    <div class="panel-footer" style="text-align:right; background-color:#f1f1f1; border-top:none;">
        <asp:Button ID="DismissBT" runat="server" Text="Close" CssClass="btn btn-warning" Width="80px" />
    </div>
</asp:Panel>

<script>
    $(document).ready(function () {
        $('#<%=imgClose.ClientID%>').on('click', function () {
            $find('modalPopupTestTime').hide();
            
        });
    });
</script>