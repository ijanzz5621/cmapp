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
            

            <div id="divTestTimeEditMulti"></div>


        </div>
        <div class="modal-footer">

            <div class="col-md-12">

                <div style="float:left;">
                    
                </div>

                <div style="float:right;">
                    <input type="button" id="btnEditMultiClose" value="Close" class="btn btn-warning" style="height:35px;" />
                    &nbsp;
                    <input type="button" id="btnEditMultiSave" value="Save" class="btn btn-primary" style="height:35px;" />
                    <%--&nbsp;
                    <input type="button" id="btnEditMultiDelete" value="Remove" class="btn btn-danger" style="height:35px;" />--%>
                </div>

            </div>

        </div>
    </div>

    </div>
</div>
