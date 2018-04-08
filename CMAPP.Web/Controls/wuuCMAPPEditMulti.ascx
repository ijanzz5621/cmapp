<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="wuuCMAPPEditMulti.ascx.vb" Inherits="CMAPP.Web.wuuCMAPPEditMulti" %>

<div id="modalEditMulti" class="modal fade" role="dialog">
    <div class="modal-dialog" style="width:1240px">

    <!-- Modal content-->
    <div class="modal-content">
        <div class="modal-header" style="background-color:#b91717; color:#fff;">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Test Time Update (Multiple)</h4>
        </div>
        <div class="modal-body">
            


        </div>
        <div class="modal-footer">

            <div class="col-md-12">

                <div style="float:left;">
                    <asp:Button ID="btnDuplicateTestTime" runat="server" Text="Duplicate" CssClass="btn btn-success" Height="35" />
                </div>

                <div style="float:right;">
                    <input type="button" id="btnEditMultiClose" value="Close" class="btn btn-warning" style="height:35px;" />
                    &nbsp;
                    <asp:Button ID="btnEditTestTime" runat="server" Text="Save" CssClass="btn btn-success" Height="35" />
                    &nbsp;
                    <asp:Button ID="btnDeleteTestTime" runat="server" Text="Delete" CssClass="btn btn-danger" Height="35" />
                </div>

            </div>

        </div>
    </div>

    </div>
</div>
