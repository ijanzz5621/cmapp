<%@ Page Title="Test Time Update" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TestTimeUpdate.aspx.vb" Inherits="CMAPP.Web.TestTimeUpdate" %>
<%@ Register Src="~/Controls/wucPopupInfo.ascx" TagPrefix="uc1" TagName="wucPopupInfo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolKit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">

    <script src="/Scripts/table2excel.js"></script>

    <style>
        .footer{
            width:100%;
            position:fixed;
            bottom:0;
            left: 0;
            text-align: center;
            background:#ffffff;
            margin:0 auto;
        }

            .footer > div{
                margin: 0 auto;
                padding: 5px;
            }

        .checkbox .btn, .checkbox-inline .btn {
            padding-left: 2em;
            min-width: 8em;
        }
        .checkbox label, .checkbox-inline label {
            text-align: left;
            padding-left: 0.5em;
        }
        .checkbox input[type="checkbox"]{
            float:none;
        }

        .radio, .checkbox {
            padding-left: 0;
        }


    </style>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3>Test Time Update</h3>

    <div class="page-container">

        <div class="row">
            <div class="col-lg-1 col-md-2">
                <asp:Label Text="text" runat="server" AssociatedControlID="ddlProgramID">Program ID</asp:Label>
                <asp:DropDownList ID="ddlProgramID" runat="server" CssClass="form-control" AutoPostBack="true" 
                    OnSelectedIndexChanged="ddlProgramID_SelectedIndexChanged" AppendDataBoundItems="true">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-lg-1 col-md-2">
                <asp:Label Text="text" runat="server" AssociatedControlID="ddlRevision">Revision</asp:Label>
                <asp:DropDownList ID="ddlRevision" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
            <%--<div class="col-lg-1 col-md-2">
                <asp:Label Text="text" runat="server" AssociatedControlID="txtVersion">Version</asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtVersion" />
            </div>--%>
            <div class="col-lg-2 col-md-3">
                <asp:Label Text="text" runat="server" AssociatedControlID="ddlProgramName">Program Name</asp:Label>
                <asp:DropDownList ID="ddlProgramName" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-lg-2 col-md-3">
                <asp:Label Text="text" runat="server" AssociatedControlID="ddlProgramExec">Program Exec</asp:Label>
                <asp:DropDownList ID="ddlProgramExec" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-lg-2 col-md-3">
                <asp:Label Text="text" runat="server" AssociatedControlID="ddlDevice">Device</asp:Label>
                <asp:DropDownList ID="ddlDevice" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-lg-1 col-md-2">
                <asp:Label Text="text" runat="server" AssociatedControlID="ddlTemp">Temp</asp:Label>
                <asp:DropDownList ID="ddlTemp" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
            
            <div class="col-lg-3 col-md-4">
                <ul style="list-style:none; margin:0; padding:0;">
                    <li style="display:inline-block;">
                            <asp:Label Text="" runat="server" AssociatedControlID="chkMaxDate" />
                            <div class="checkbox">
                                <label class="btn btn-default">
                                    <asp:CheckBox ID="chkMaxDate" runat="server" Text=" Max Date" />
                                </label>
                            </div>
  
                    </li>
                    <li style="display:inline-block;">
                        <asp:Label Text="" runat="server" AssociatedControlID="chkMaxDate" />
                        <div class="checkbox">
                            <label class="btn btn-default">
                                <asp:CheckBox ID="chkMaxRev" runat="server" Text=" Max Revision" OnCheckedChanged="chkMaxRev_CheckedChanged" AutoPostBack="true" />
                            </label>
                        </div>  
                        
                    </li>
                </ul>
            </div>
        </div>

        <div class="row">

            <div class="col-md-12 col-lg-12">

                <div style="width:100%; overflow-x:scroll">
                    <asp:CheckBoxList ID="cblSiteCount" runat="server" RepeatDirection="Horizontal" style="overflow: auto;">
                </asp:CheckBoxList>
                </div>

            </div>

        </div>

        <div class="row">

            <div class="col-md-6" style="vertical-align:bottom; line-height:45px;">
                    <asp:Button Text="Search" runat="server" ID="btnSearch" CssClass="btn btn-info" />
                    <%--&nbsp;
                    <asp:Button Text="Excel" runat="server" ID="btnExport" CssClass="btn btn-success" />--%>
                    <%--&nbsp;
                    <asp:Button Text="Delete" runat="server" ID="btnDelete" CssClass="btn btn-danger" />--%>
                    &nbsp;&nbsp;
                    <asp:Button ID="btnNewProgID" runat="server" Text="New Prog ID" CssClass="btn btn-success" ForeColor="#ffffff" OnClick="btnNewProgID_Click" />
                    &nbsp;
                    <asp:Button ID="btnEditTestTime" runat="server" Text="Edit Test Time" CssClass="btn btn-warning" ForeColor="#ffffff" OnClick="btnEditTestTime_Click" />
            </div>

        </div>

        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="gvListing" runat="server" CssClass="table table-responsive table-bordered" 
                    ShowHeaderWhenEmpty="True"
                    HeaderStyle-BackColor="#1e1e1e" HeaderStyle-ForeColor="#ffffff"
                    AlternatingRowStyle-BackColor="#fafafa" AutoGenerateSelectButton="True"
                    SelectedRowStyle-BackColor="#e10005" SelectedRowStyle-ForeColor="#ffffff"
                    OnSelectedIndexChanged="gvListing_SelectedIndexChanged"
                    >
                    <%--<Columns>
                        <asp:BoundField DataField="TestProgID" HeaderText="Test Prog ID" />
                        <asp:BoundField DataField="TestProgIDRev" HeaderText="Rev" />
                        <asp:BoundField DataField="TesterType" HeaderText="Tester Type" />
                        <asp:BoundField DataField="TestProgMainSource" HeaderText="Program Name" />
                        <asp:BoundField DataField="TestProgExecutable" HeaderText="Program Exec" />
                        <asp:BoundField DataField="Device" HeaderText="Device" />
                        <asp:BoundField DataField="TestStepTemp" HeaderText="Temp" />
                        <asp:BoundField DataField="TestTimeEffDate" HeaderText="Effective Date" />
                        <asp:BoundField DataField="Overhead" HeaderText="Overhead (%)" />
                        <asp:BoundField DataField="x1" HeaderText="x1(s)" />
                        <asp:BoundField DataField="x2" HeaderText="x2(s)" />
                        <asp:BoundField DataField="x3" HeaderText="x3(s)" />
                        <asp:BoundField DataField="x4" HeaderText="x4(s)" />
                    </Columns>--%>

                </asp:GridView>
            </div>
        </div>

    </div>

    
   <%-- <div class="footer">

        <div>
            <asp:Button ID="btnNewProject" runat="server" Text="New Project" CssClass="btn" Width="120px" BackColor="#ff0000" ForeColor="#ffffff" OnClick="btnNewProject_Click" />
            <asp:Button ID="btnNewProgID" runat="server" Text="New Prog ID" CssClass="btn" Width="120px" BackColor="#ff0000" ForeColor="#ffffff" />
            <asp:Button ID="btnNextRev" runat="server" Text="Next Revision" CssClass="btn" Width="120px" BackColor="#ff0000" ForeColor="#ffffff" />
            <asp:Button ID="btnEditTestTime" runat="server" Text="Edit Test Time" CssClass="btn" Width="120px" BackColor="#ff0000" ForeColor="#ffffff" OnClick="btnEditTestTime_Click" />
            <asp:Button ID="btnEditAll" runat="server" Text="Edit All" CssClass="btn" Width="120px" BackColor="#ff0000" ForeColor="#ffffff" />
            <asp:Button ID="btnSaveRev" runat="server" Text="Save Revision" CssClass="btn" Width="120px" BackColor="#ff0000" ForeColor="#ffffff" />
        </div>

    </div>--%>

    <ajaxtoolkit:modalpopupextender ID="mpePopupTestTime" runat="server"
        TargetControlID="mpePopupTestTime_HF1"
        PopupControlID="mpePopupTestTime_P1"
        DropShadow="True" CancelControlID="mpePopupTestTime_DismissBT" PopupDragHandleControlID="mpePopupTestTime_P2" BackgroundCssClass="modalBackground" BehaviorID="modalPopupTestTime">
    </ajaxtoolkit:modalpopupextender>
    <asp:HiddenField ID="mpePopupTestTime_HF1" runat="server" />
    <asp:Panel ID="mpePopupTestTime_P1" runat="server" CssClass="panel panel-primary-message" Width="800px" BackColor="#2e6da4" style="display:none;">
        <asp:Panel ID="mpePopupTestTime_P2" runat="server" CssClass="panel-heading" Height="40px">
            <h5 class="panel-title" style="float:left;">
                <asp:Label ID="lblHeader" runat="server" Text="Test Time Update" Font-Bold="true" Font-Size="14px" style="line-height:30px; vertical-align:middle;"></asp:Label>
            </h5>
            <%--<asp:Image ID="mpePopupTestTime_imgClose" runat="server" AlternateText="X" CssClass="ClosePopupCls" ImageUrl="~/images/delete-icon.png" Width="28" Height="28" />--%>
        </asp:Panel>
        <div class="panel-body" style="min-height:400px; background:#ffffff;">

            <div class="row">

                <div class="col-md-12">
                    <asp:Button ID="btnNewProject" runat="server" Text="New Project" CssClass="btn btn-success" Width="120px" ForeColor="#ffffff" Visible="false" />
                    <asp:Button ID="btnNewProgID2" runat="server" Text="New Prog ID" CssClass="btn btn-success" Width="120px" ForeColor="#ffffff" Visible="false" />
                    <asp:Button ID="btnNextRev" runat="server" Text="Next Revision" CssClass="btn btn-success" Width="120px" ForeColor="#ffffff" OnClick="btnNextRev_Click" />
                </div>

            </div>

            <hr />

            <div class="row">

                <div class="col-md-3">
                    <asp:Label runat="server" AssociatedControlID="popupTestTime_txtProgID">Test Program ID</asp:Label><br />
                    <asp:TextBox ID="popupTestTime_txtProgID" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-2">
                    <asp:Label runat="server" AssociatedControlID="popupTestTime_txtRev">Revision</asp:Label><br />
                    <asp:TextBox ID="popupTestTime_txtRev" runat="server" CssClass="form-control" ReadOnly="true" />
                </div>
                <div class="col-md-2">
                    <asp:Label runat="server" AssociatedControlID="popupTestTime_txtVer">Version</asp:Label><br />
                    <asp:TextBox ID="popupTestTime_txtVer" runat="server" CssClass="form-control" Text="0" ReadOnly="true" />
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
                    <asp:Label runat="server" AssociatedControlID="popupTestTime_txtDevice">Device</asp:Label><br />
                    <asp:TextBox ID="popupTestTime_txtDevice" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-2">
                    <asp:Label runat="server" AssociatedControlID="popupTestTime_txtTemp">Temp</asp:Label><br />
                    <asp:TextBox ID="popupTestTime_txtTemp" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-2">
                    <asp:Label runat="server" AssociatedControlID="popupTestTime_txtEffDate">Effective Date</asp:Label><br />
                    <asp:TextBox ID="popupTestTime_txtEffDate" runat="server" CssClass="form-control" />
                    <ajaxToolKit:CalendarExtender ID="Calendar1" PopupButtonID="imgPopup" runat="server" TargetControlID="popupTestTime_txtEffDate" Format="MM/dd/yyyy"> </ajaxToolKit:CalendarExtender>
                </div>
                <div class="col-md-3">
                    <asp:Label runat="server" AssociatedControlID="popupTestTime_txtSiteCount1TestTime">Site Count 1 Test Time</asp:Label><br />
                    <asp:TextBox ID="popupTestTime_txtSiteCount1TestTime" runat="server" CssClass="form-control" />
                </div>

            </div>

            <hr />

            <div class="row">
                <%--<div class="col-md-2">
                    <asp:Label runat="server" AssociatedControlID="popupTestTime_ddlSiteCount">Site Count</asp:Label><br />
                    <asp:DropDownList ID="popupTestTime_ddlSiteCount" CssClass="form-control" runat="server">
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                        <asp:ListItem Text="16" Value="16"></asp:ListItem>
                        <asp:ListItem Text="32" Value="32"></asp:ListItem>
                    </asp:DropDownList>
                </div>--%>
                <div class="col-md-2">
                    <asp:Label runat="server" AssociatedControlID="popupTestTime_txtOverhead">Overhead</asp:Label><br />
                    <asp:TextBox ID="popupTestTime_txtOverhead" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-1">
                    <asp:Label Text="" runat="server" /><br />
                    <asp:Button ID="popupTestTime_btnCalc" Text="Calculate" runat="server" CssClass="btn btn-success" OnClick="popupTestTime_btnCalc_Click" />
                </div>
            </div>

            <hr />

            <div class="row" style="margin-top:15px;">
                
                <div class="col-md-12" style="overflow:auto;">

                    <asp:UpdatePanel runat="server" UpdateMode="Always">
                        <Triggers>
                            <asp:PostBackTrigger ControlID="popupTestTime_btnCalc" />
                        </Triggers>
                        <ContentTemplate>
                            <%--<asp:GridView ID="gvSiteCountList" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-responsive table-bordered"
                                HeaderStyle-BackColor="#1e1e1e" HeaderStyle-ForeColor="#ffffff"
                                AlternatingRowStyle-BackColor="#fafafa" SelectedRowStyle-BackColor="#e10005" SelectedRowStyle-ForeColor="#ffffff"
                                >
                            </asp:GridView>--%>
                            <div class="row">
                                <asp:Repeater ID="rptSiteCountList" runat="server">
                                    <HeaderTemplate>
                                        <ul style="list-style:none; display:inline-block;">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li style="display:inline-block;">
                                            <div>

                                                <label><%# Eval("Label") %></label>
                                                <asp:TextBox runat="server" Text='<%# Eval("TestTime") %>' ID="txtTestTime" CssClass="form-control" Width="80px"></asp:TextBox>

                                            </div>
                                        
                                        </li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
                
            </div>

        </div>
        <div class="panel-footer" style="text-align:right; background-color:#f1f1f1; border-top:none;">
            <asp:Button ID="popupTestTime_btnUpdateAll" Text="Update All" runat="server" CssClass="btn btn-success" OnClick="popupTestTime_btnUpdateAll_Click" />
            <asp:Button ID="popupTestTime_btnInsertUpdate" Text="Update" runat="server" CssClass="btn btn-success" OnClick="popupTestTime_btnInsertUpdate_Click" />
            <asp:Button ID="mpePopupTestTime_DismissBT" runat="server" Text="Close" CssClass="btn btn-warning" Width="80px" />
        </div>
    </asp:Panel>
    

    <script>

        $(function () {
            $('#MainContent_popupTestTime_txtEffDate').keypress(function (event) {
                event.preventDefault();
                return false;
            });
            $('#MainContent_popupTestTime_txtEffDate').keydown(false);
        });

        $(document).ready(function () {

            //$('#<%=popupTestTime_txtEffDate.ClientID%>').datepicker();
            
        });

    </script>



    <uc1:wucPopupInfo runat="server" ID="wucPopupInfo" />

</asp:Content>
