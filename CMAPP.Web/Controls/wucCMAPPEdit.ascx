<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="wucCMAPPEdit.ascx.vb" Inherits="CMAPP.Web.wucCMAPPEdit" %>

    <div id="modalEditMulti" class="modal fade" role="dialog">
      <div class="modal-dialog" style="width:1240px">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header" style="background-color:#b91717; color:#fff;">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Test Time Update</h4>
          </div>
          <div class="modal-body">
            

              <div class="row">

                    <div class="col-lg-2 col-md-3">
                        <asp:Label Text="text" runat="server" AssociatedControlID="ddlTestSiteEdit">Test Site</asp:Label>
                            <asp:DropDownList ID="ddlTestSiteEdit" runat="server" CssClass="form-control" AppendDataBoundItems="true">
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
                        <asp:Label Text="text" runat="server" AssociatedControlID="txtEditProgramID">Program ID</asp:Label>
                        <asp:TextBox ID="txtEditProgramID" runat="server" CssClass="form-control toUppercase"></asp:TextBox>
                    </div>
                    <div class="col-lg-1 col-md-2">
                        <asp:Label Text="text" runat="server" AssociatedControlID="txtEditRevision">Revision</asp:Label>
                        <asp:TextBox ID="txtEditRevision" runat="server" CssClass="form-control toUppercase"></asp:TextBox>
                    </div>
                    <div class="col-lg-1 col-md-2">
                        <asp:Label Text="text" runat="server" AssociatedControlID="txtEditVersion">Version</asp:Label>
                        <asp:TextBox runat="server" CssClass="form-control toUppercase" ID="txtEditVersion" Text="0" />
                    </div>
                    <div class="col-lg-2 col-md-3">
                        <asp:Label Text="text" runat="server" AssociatedControlID="ddlTesterEdit">Tester Type</asp:Label>
                        <asp:DropDownList ID="ddlTesterEdit" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:DropDownList>
                    </div>
                    <div class="col-lg-2 col-md-3">
                        <asp:Label Text="text" runat="server" AssociatedControlID="txtEditDevice">Device</asp:Label>
                        <asp:TextBox ID="txtEditDevice" runat="server" CssClass="form-control toUppercase"></asp:TextBox>
                    </div>
                    <div class="col-lg-1 col-md-2">
                        <asp:Label Text="text" runat="server" AssociatedControlID="ddlTempEdit">Temp</asp:Label>
                        <%--<asp:TextBox ID="txtEditTemp" runat="server" CssClass="form-control toUppercase"></asp:TextBox>--%>
                        <asp:DropDownList ID="ddlTempEdit" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:DropDownList>
                    </div>
                    <div class="col-lg-2 col-md-3">
                        <asp:Label Text="text" runat="server" AssociatedControlID="txtEditProgName">Program Name</asp:Label>
                        <asp:TextBox ID="txtEditProgName" runat="server" CssClass="form-control toUppercase"></asp:TextBox>
                    </div>
                    <div class="col-lg-2 col-md-3">
                        <asp:Label Text="text" runat="server" AssociatedControlID="txtEditProgExec">Program Exec</asp:Label>
                        <asp:TextBox ID="txtEditProgExec" runat="server" CssClass="form-control toUppercase"></asp:TextBox>
                    </div>
                
                </div>

                <div class="row">

                    <div class="col-lg-1 col-md-2">
                        <asp:Label runat="server" AssociatedControlID="txtEditEffDate">Effective Date</asp:Label><br />
                        <asp:TextBox ID="txtEditEffDate" runat="server" CssClass="form-control" />
                        <ajaxToolKit:CalendarExtender ID="calEditEffDate" PopupButtonID="imgPopup" runat="server" TargetControlID="txtEditEffDate" Format="MM/dd/yyyy"> </ajaxToolKit:CalendarExtender>
                    </div>
                    <div class="col-lg-1 col-md-2">
                        <asp:Label runat="server" AssociatedControlID="txtEditSiteCount1TestTime">X1 Test Time</asp:Label><br />
                        <asp:TextBox ID="txtEditSiteCount1TestTime" runat="server" CssClass="form-control" />
                    </div>

                    <div class="col-lg-1 col-md-2">
                        <asp:Label runat="server" AssociatedControlID="txtEditOverhead">Overhead (%)</asp:Label><br />
                        <asp:TextBox ID="txtEditOverhead" runat="server" CssClass="form-control" />
                    </div>
                    <div class="col-lg-1 col-md-1">
                        <asp:Label Text="" runat="server" />&nbsp;<br />
                        <asp:Button ID="btnEditCalculate" Text="Calculate" runat="server" CssClass="btn btn-primary" style="width:100%;" />
                    </div>
                    <div class="col-lg-8 col-md-5">
                        <div style="width:100%; overflow-x:scroll">
                            <asp:CheckBoxList ID="cblSiteCount" runat="server" RepeatDirection="Horizontal" style="overflow: auto;">
                            </asp:CheckBoxList>
                        </div>
                    </div>

                </div>

                <div class="row" style="margin-top:15px;">

                    <ul id="ulSiteCountList" style="list-style:none; display:inline-block; margin:0; padding:0;">
                    </ul>

                </div>

          </div>
          <div class="modal-footer">
              <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>

              <div class="col-md-12">

                    <div style="float:left;">
                        <asp:Button ID="btnDuplicateTestTime" runat="server" Text="Duplicate" CssClass="btn btn-success" Height="35" />
                    </div>

                    <div style="float:right;">
                        <asp:Button ID="btnEditClose" runat="server" Text="Close" CssClass="btn btn-warning" Height="35" />
                        &nbsp;
                        <asp:Button ID="btnEditTestTime" runat="server" Text="Save" CssClass="btn btn-success" Height="35" />
                        &nbsp;
                        <asp:Button ID="btnDeleteTestTime" runat="server" Text="Delete" CssClass="btn btn-danger" Height="35" />
                        <%--&nbsp;
                        <asp:Button ID="btnEditTestTimeAll" runat="server" Text="Save All" CssClass="btn btn-info" Height="35" />--%>
                    </div>

                </div>

          </div>
        </div>

      </div>
    </div>
