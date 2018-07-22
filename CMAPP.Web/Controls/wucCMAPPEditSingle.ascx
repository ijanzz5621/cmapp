<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="wucCMAPPEditSingle.ascx.vb" Inherits="CMAPP.Web.wucCMAPPEditSingle" %>

<!-- Modal -->
<div id="modalEditSingle" class="modal fade" role="dialog">
    <div class="modal-dialog" style="width: 1240px">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" style="background-color: #b91717; color: #fff;">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Test Time Update (Add New)</h4>
            </div>
            <div class="modal-body">


                <div class="row">

                    <div class="col-lg-1 col-md-2">
                        <asp:Label Text="text" runat="server" AssociatedControlID="ddlTestSiteEditSingle">Test Site</asp:Label>
                        <asp:DropDownList ID="ddlTestSiteEditSingle" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                            <asp:ListItem Text="ASCL" Value="ASCL"></asp:ListItem>
                            <asp:ListItem Text="ASE" Value="ASE"></asp:ListItem>
                            <asp:ListItem Text="ASE9" Value="ASE9"></asp:ListItem>
                            <asp:ListItem Text="ASSH" Value="ASSH"></asp:ListItem>
                            <asp:ListItem Text="ATP7" Value="ATP7"></asp:ListItem>
                            <asp:ListItem Text="MMT" Value="MMT"></asp:ListItem>
                            <asp:ListItem Text="MPHL" Value="MPHL"></asp:ListItem>
                            <asp:ListItem Text="MTAI" Value="MTAI"></asp:ListItem>
                            <asp:ListItem Text="NSEB" Value="NSEB"></asp:ListItem>
                            <asp:ListItem Text="OSE" Value="OSE"></asp:ListItem>
                            <asp:ListItem Text="SIGH" Value="SIGH"></asp:ListItem>
                            <asp:ListItem Text="SIGN" Value="SIGN"></asp:ListItem>
                            <asp:ListItem Text="SIGT" Value="SIGT"></asp:ListItem>
                            <asp:ListItem Text="UNIS" Value="UNIS"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-1 col-md-2">
                        <asp:Label Text="text" runat="server" AssociatedControlID="txtEditProgramIDSingle">Program ID</asp:Label>
                        <asp:TextBox ID="txtEditProgramIDSingle" runat="server" CssClass="form-control toUppercase"></asp:TextBox>
                    </div>
                    <div class="col-lg-1 col-md-2">
                        <asp:Label Text="text" runat="server" AssociatedControlID="txtEditRevisionSingle">Revision</asp:Label>
                        <asp:TextBox ID="txtEditRevisionSingle" runat="server" CssClass="form-control toUppercase"></asp:TextBox>
                    </div>
                    <div class="col-lg-1 col-md-2">
                        <asp:Label Text="text" runat="server" AssociatedControlID="txtEditVersionSingle">Version</asp:Label>
                        <asp:TextBox runat="server" CssClass="form-control toUppercase" ID="txtEditVersionSingle" Text="0" />
                    </div>
                    <div class="col-lg-1 col-md-2">
                        <asp:Label Text="text" runat="server" AssociatedControlID="ddlTesterEditSingle">Tester Type</asp:Label>
                        <asp:DropDownList ID="ddlTesterEditSingle" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-2 col-md-3">
                        <asp:Label Text="text" runat="server" AssociatedControlID="txtEditDeviceSingle">Device</asp:Label>
                        <asp:TextBox ID="txtEditDeviceSingle" runat="server" CssClass="form-control toUppercase"></asp:TextBox>
                    </div>
                    <div class="col-lg-1 col-md-2">
                        <asp:Label Text="text" runat="server" AssociatedControlID="ddlTempEditSingle">Temp</asp:Label>
                        <%--<asp:TextBox ID="txtEditTemp" runat="server" CssClass="form-control toUppercase"></asp:TextBox>--%>
                        <asp:DropDownList ID="ddlTempEditSingle" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-2 col-md-3">
                        <asp:Label Text="text" runat="server" AssociatedControlID="txtEditProgNameSingle">Program Name</asp:Label>
                        <asp:TextBox ID="txtEditProgNameSingle" runat="server" CssClass="form-control toUppercase"></asp:TextBox>
                    </div>
                    <div class="col-lg-2 col-md-3">
                        <asp:Label Text="text" runat="server" AssociatedControlID="txtEditProgExecSingle">Program Exec</asp:Label>
                        <asp:TextBox ID="txtEditProgExecSingle" runat="server" CssClass="form-control toUppercase"></asp:TextBox>
                    </div>

                </div>

                <div class="row">

                    <div class="col-lg-1 col-md-2">
                        <asp:Label runat="server" AssociatedControlID="txtEditEffDateSingle">Effective Date</asp:Label><br />
                        <asp:TextBox ID="txtEditEffDateSingle" runat="server" CssClass="form-control" />
                        <ajaxToolkit:CalendarExtender ID="calEditEffDateSingle" PopupButtonID="imgPopup2" runat="server" TargetControlID="txtEditEffDateSingle" Format="MM/dd/yyyy"></ajaxToolkit:CalendarExtender>
                    </div>
                    <div class="col-lg-1 col-md-2">
                        <asp:Label runat="server" AssociatedControlID="txtEditSiteCount1TestTimeSingle">X1 Test Time</asp:Label><br />
                        <asp:TextBox ID="txtEditSiteCount1TestTimeSingle" runat="server" CssClass="form-control" />
                    </div>

                    <div class="col-lg-1 col-md-2">
                        <asp:Label runat="server" AssociatedControlID="txtEditOverheadSingle">Overhead (%)</asp:Label><br />
                        <asp:TextBox ID="txtEditOverheadSingle" runat="server" CssClass="form-control" />
                    </div>
                    <div class="col-lg-1 col-md-1">
                        <asp:Label Text="" runat="server" />&nbsp;<br />
                        <asp:Button ID="btnEditCalculateSingle" Text="Calculate" runat="server" CssClass="btn btn-primary" Style="width: 100%;" />
                    </div>
                    <div class="col-lg-8 col-md-5">
                        <div style="width: 100%; overflow-x: scroll">
                            <asp:CheckBoxList ID="cblSiteCountSingle" runat="server" RepeatDirection="Horizontal" Style="overflow: auto;">
                            </asp:CheckBoxList>
                        </div>
                    </div>

                </div>

                <div class="row" style="margin-top: 15px;">

                    <ul id="ulSiteCountListSingle" style="list-style: none; display: inline-block; margin: 0; padding: 0;">
                    </ul>

                </div>

            </div>
            <div class="modal-footer">

                <div class="col-md-12">

                    <div style="float: right;">
                        <asp:Button ID="btnEditCloseSingle" runat="server" Text="Close" CssClass="btn btn-warning" Height="35" />
                        &nbsp;
                        <asp:Button ID="btnEditTestTimeSingle" runat="server" Text="Save" CssClass="btn btn-success" Height="35" />
                    </div>

                </div>

            </div>
        </div>

    </div>
</div>
