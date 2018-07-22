<%@ Page Title="CM Test Time Update Multi" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TestTimeUpdateMulti.aspx.vb" Inherits="CMAPP.Web.TestTimeUpdateMulti" EnableEventValidation="false" %>

<%@ Register Src="~/Controls/wucPopupInfo.ascx" TagPrefix="uc1" TagName="wucPopupInfo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolKit" %>
<%@ Register Src="~/Controls/wucCMAPPEdit.ascx" TagPrefix="uc1" TagName="wucCMAPPEdit" %>
<%@ Register Src="~/Controls/wuuCMAPPEditMulti.ascx" TagPrefix="uc1" TagName="wuuCMAPPEditMulti" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <link href="/Content/jqueryui/jquery-ui.css" rel="stylesheet" />

    <style>
        .footer {
            width: 100%;
            position: fixed;
            bottom: 0;
            left: 0;
            text-align: center;
            background: #ffffff;
            margin: 0 auto;
        }

            .footer > div {
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
            padding: 5px;
        }

        .checkbox input[type="checkbox"] {
            float: none;
        }

        .radio, .checkbox {
            padding-left: 0;
        }

        .col-xs-1, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9, .col-xs-10, .col-xs-11, .col-xs-12, .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12, .col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12, .col-lg-1, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-10, .col-lg-11, .col-lg-12 {
            position: relative;
            min-height: 1px;
            padding-left: 5px !important;
            padding-right: 5px !important;
        }

        .row-reset {
            background-color: transparent !important;
            color: #444;
        }

        #tblListing tbody tr:hover {
            background-color: #e6e6e6 !important;
            color: #444;
        }

        .row-selected {
            background-color: #fa3232 !important;
            color: #fff;
        }

        .paging {
            list-style: none;
            margin: 0;
            padding: 0;
            margin-bottom: 15px;
            font-size: 14px;
        }

            .paging li {
                display: inline-block;
                margin-right: 15px;
                cursor: pointer;
            }

        .selected {
            font-weight: bold;
        }

            .selected a {
                color: #000000 !important;
            }
    </style>
    <%--<link href="/Content/jquery.dynatable.css" rel="stylesheet" />--%>
    <%--<link href="/Content/datatables.min.css" rel="stylesheet" />--%>

    <script src="/Scripts/table2excel.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-container">

        <h3>Test Time Update (Version 3)</h3>

        <div class="" style="padding-top: 5px;">

            <div class="row" style="margin-left: 1px; margin-right: 1px;">
                <div class="col-lg-1 col-md-2">
                    <asp:Label Text="text" runat="server" AssociatedControlID="ddlTestSite">Test Site</asp:Label>
                    <asp:DropDownList ID="ddlTestSite" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-lg-1 col-md-2">
                    <asp:Label Text="text" runat="server" AssociatedControlID="txtProgramID">Program ID</asp:Label>
                    <asp:TextBox ID="txtProgramID" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-1 col-md-2">
                    <asp:Label Text="text" runat="server" AssociatedControlID="ddlRevision">Revision</asp:Label>
                    <asp:DropDownList ID="ddlRevision" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-lg-1 col-md-2">
                    <asp:Label Text="text" runat="server" AssociatedControlID="txtVersion">Version</asp:Label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtVersion" Text="0" />
                </div>
                <div class="col-lg-2 col-md-3">
                    <asp:Label Text="text" runat="server" AssociatedControlID="ddlTester">Tester</asp:Label>
                    <asp:DropDownList ID="ddlTester" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-lg-2 col-md-3">
                    <asp:Label Text="text" runat="server" AssociatedControlID="txtProgramName">Program Name</asp:Label>
                    <asp:TextBox ID="txtProgramName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-2 col-md-3">
                    <asp:Label Text="text" runat="server" AssociatedControlID="txtProgramExec">Program Exec</asp:Label>
                    <asp:TextBox ID="txtProgramExec" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-2 col-md-3">
                    <asp:Label Text="text" runat="server" AssociatedControlID="txtDevice">Device</asp:Label>
                    <asp:TextBox ID="txtDevice" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-lg-1 col-md-2">
                    <asp:Label Text="text" runat="server" AssociatedControlID="ddlTemp">Temp</asp:Label>
                    <asp:DropDownList ID="ddlTemp" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="col-lg-4 col-md-6">
                    <ul style="list-style: none; margin: 0; padding: 0;">
                        <li style="display: inline-block; line-height: 55px;">
                            <div class="checkbox">
                                <label class="btn btn-default">
                                    <asp:CheckBox ID="chkMaxDate" runat="server" Text=" Max Date" />
                                </label>
                            </div>

                        </li>
                        <li style="display: inline-block; line-height: 55px;">
                            <div class="checkbox">
                                <label class="btn btn-default">
                                    <asp:CheckBox ID="chkMaxRev" runat="server" Text=" Max Revision" />
                                </label>
                            </div>

                        </li>
                        <%--<li style="display:inline-block; line-height: 55px;">
                            <div class="checkbox">
                                <label class="btn btn-default">
                                    <asp:CheckBox ID="chkMissingTestTime" runat="server" Text=" Missing Test Time" />
                                </label>
                            </div>  
                        
                        </li>--%>

                    </ul>
                </div>
            </div>

            <div class="row" style="margin-left: 1px;">
                <div class="col-md-12" style="vertical-align: bottom; line-height: 45px;">
                    <asp:Button Text="Search" runat="server" ID="btnSearch" CssClass="btn btn-info" OnClick="btnSearch_Click" />
                    &nbsp;
                    <asp:Button ID="btnExport" runat="server" Text="Export" CssClass="btn btn-success" ForeColor="#ffffff" />
                    &nbsp;
                    <asp:Button ID="btnNewTestTime" runat="server" Text="New" CssClass="btn btn-primary" Height="35" Style="display: inline-block;" />
                    &nbsp;
                    <asp:Button ID="btnDuplicateTestTime" runat="server" Text="Duplicate" CssClass="btn btn-success" Height="35" Style="display: none;" />
                    &nbsp;
                    <asp:Button ID="btnEditMultiTestTime" runat="server" Text="Edit" CssClass="btn btn-warning" ForeColor="#ffffff" Style="display: none;" />
                    <span id="note1" style="font-weight: bold; font-size: 18px; color: red;">Please click on the record to edit</span>
                </div>
            </div>

        </div>

        <div class="row" style="margin-left: 1px; margin-right: 1px; clear: both;">

            <br />
            <div id="divTablePaging" class="col-md-12">
                <ul id="ulTablePaging" class="paging"></ul>
            </div>

            <div class="col-md-12 col-lg-12">

                <div>

                    <table id="tblListing" class="table table-bordered table-responsive">
                        <thead>
                            <tr style="background-color: #444; color: #fff;">
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>

                </div>

            </div>

            <div id="divExport" class="col-md-12" style="display:none;">

                <table id="tblExport" class="table table-bordered table-responsive">
                    <thead>
                        <tr style="background-color:#444; color:#fff;">
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>

            </div>

        </div>

    </div>

    <!-- Modal Edit Multiple -->
    <uc1:wuuCMAPPEditMulti runat="server" ID="wuuCMAPPEditMulti" />

    <!-- Modal Add New -->
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

    <script type="text/javascript">

        // global variables
        var gSiteCountList = [];
        var gHideFirstItem = false;

        var gSortColumn = "";
        var gSelectedRowID = "";
        var gData = [];
        var gTotalRecords = 0;
        var gCurrentPage = 1;
        var gItemPerPage = 15;
        var gNext = 0;
        var gStartPaging = 1;
        var gEndPaging = 1;
        var gTotalPaging = 0;
        var gTotalCheck = 0;

        var gTestSiteList = [];

        var gTesterTypeList = [];
        var gTempList = [];
        var gSiteCountListEdit = [];
        var gTotalRows = 0;
        var gCurrentRow = 0;

        $('#divSiteCountList').hide();
        $('#<%=btnExport.ClientID%>').hide();
        $('#note1').hide();

        $(document).ready(function () {

            loadRevision();
            loadProgramIDList();
            loadProgramNameList();
            loadProgramExecList();
            loadDeviceList();
            loadPlantCode();

            saveTesterTypeList();
            saveTempList();
            populateSiteCountList();

            //Auto upper case on typing
            $('#<%=txtProgramID.ClientID%>').keyup(function () {
                $(this).val($(this).val().toUpperCase());
            });
            $('#<%=txtProgramName.ClientID%>').keyup(function () {
                $(this).val($(this).val().toUpperCase());
            });
            $('#<%=txtProgramExec.ClientID%>').keyup(function () {
                $(this).val($(this).val().toUpperCase());
            });
            $('#<%=txtVersion.ClientID%>').keyup(function () {
                $(this).val($(this).val().toUpperCase());
            });
            $('#<%=txtDevice.ClientID%>').keyup(function () {
                $(this).val($(this).val().toUpperCase());
            });

            $('#<%=txtProgramID.ClientID%>').on('blur', function (e) {
                <%--$("#<%=ddlRevision.ClientID%>").val("");
                loadRevision($("#<%=txtProgramID.ClientID%>").val());

                $("#<%=chkMaxRev.ClientID%>").attr('checked', false);--%>
            });

            $("#<%=chkMaxRev.ClientID%>").on('change', function (e) {

                //alert(this.checked);
                $("#<%=ddlRevision.ClientID%>").removeAttr('disabled');
                if (this.checked) {
                    // call ajax and get max revision
                    $.ajax({
                        url: "TestTimeUpdateMulti.aspx/GetMaxRevisionByFilterList",
                        data: "{'testSite': '" + $('#<%=ddlTestSite.ClientID%>').val() + "', 'testProgID': '" + $('#<%=txtProgramID.ClientID%>').val() + "', 'version':'" + $('#<%=txtVersion.ClientID%>').val() + "', 'tester':'" + $('#<%=ddlTester.ClientID%>').val() + "', 'progName':'" + $('#<%=txtProgramName.ClientID%>').val() + "', 'progExec':'" + $('#<%=txtProgramExec.ClientID%>').val() + "', 'device':'" + $('#<%=txtDevice.ClientID%>').val() + "', 'temp':'" + $('#<%=ddlTemp.ClientID%>').val() + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {

                            if (JSON.parse(data.d).length > 0) {
                                // assign the max revision to the revision dropdown
                                $("#<%=ddlRevision.ClientID%>").val(JSON.parse(data.d)[0].TESTPROGIDREV);

                                //disable the revision dropdown
                                $("#<%=ddlRevision.ClientID%>").attr('disabled', true);
                            }
                        },
                        error: function (a, b, c) {
                            //console.log('error: ' + JSON.stringify(a));
                        }
                    });

                } else {
                    $("#<%=ddlRevision.ClientID%>").val("");
                }

            });

            $('#<%=btnSearch.ClientID%>').on('click', function (e) {
                e.preventDefault();

                gCurrentPage = 1;

                //close the edit div
                $('#tblListing tbody tr').removeClass("row-selected");
                $('#divSiteCountList').hide('slow');
                $('#modalEdit').modal('hide');
                // $("#<%=ddlTestSite.ClientID%>").val().trim() === "" &&
                if ($("#<%=txtProgramID.ClientID%>").val().trim() === "" && $("#<%=ddlRevision.ClientID%>").val().trim() === ""
                    && $("#<%=ddlTester.ClientID%>").val().trim() === "" && $("#<%=txtProgramName.ClientID%>").val().trim() === ""
                    && $("#<%=txtProgramExec.ClientID%>").val().trim() === "" && $("#<%=txtDevice.ClientID%>").val().trim() === ""
                    && $("#<%=ddlTemp.ClientID%>").val().trim() === "") {
                    showPopupMessage("Please enter at least one filter to search");
                    return;
                }

                getListing($("#<%=ddlTestSite.ClientID%>").val(), $("#<%=txtProgramID.ClientID%>").val(), $("#<%=ddlRevision.ClientID%>").val(), $('#<%=txtVersion.ClientID%>').val(), $('#<%=ddlTester.ClientID%>').val(), $("#<%=txtProgramName.ClientID%>").val(), $("#<%=txtProgramExec.ClientID%>").val(), $("#<%=txtDevice.ClientID%>").val(), $("#<%=ddlTemp.ClientID%>").val(), $("input[id='<%=chkMaxDate.ClientID%>']:checked").val());
            });

            $('#<%=btnExport.ClientID%>').on('click', function (e) {
                e.preventDefault();
                exportData();
            });

            // Edit multiple click
            $('#<%=btnEditMultiTestTime.ClientID%>').on('click', function (e) {

                e.preventDefault();

                // Loop the checked row
                displayMultiEdit(function () {

                    //Show the modal
                    $('#modalEditMulti').modal();

                });

            });

            $('#btnEditMultiClose').on('click', function (e) {
                e.preventDefault();

                //// call function to reset the textboxes
                //resetEdit();

                //close the edit div
                //  $('#tblListing tbody tr').removeClass("row-selected");
                $('#divSiteCountList').hide('slow');
                $('#modalEditMulti').modal('hide');

            });

            //convert to upper case
            $('.toUppercase').on('keyup', function (e) {
                $(this).val(($(this).val()).toUpperCase());
            });

            $('#btnEditMultiSave').on('click', function (e) {

                var emptySiteCount1 = false;
                var row = 1;
                $('#divTestTimeEditMulti .row-item').each(function () {
                    var x1TestTime = $(this).find('#txtEditSiteCount1TestTime_Row_' + row).val();
                    if (x1TestTime.trim() === "")
                        emptySiteCount1 = true;
                    row++;
                });

                if (emptySiteCount1) {
                    $.confirm({
                        title: 'Site Count 1 empty',
                        content: 'Some of the site count 1 has not been filled up. Are you sure to proceed?',
                        buttons: {
                            cancel: function () {
                                //$.alert('Canceled!');
                            },
                            confirm: {
                                text: 'Confirm',
                                btnClass: 'btn-blue',
                                keys: ['enter', 'shift'],
                                action: function () {

                                    saveSiteCount();

                                } // end of action 
                            } // end of confirm
                        } // end of button
                    }); // end of confirm
                } else {
                    saveSiteCount();
                }

            });

            //$('#MainContent_wuuCMAPPEditMulti_btnDuplicateTestTime').on('click', function (e) {
            //    e.preventDefault();
            //    $(this).val("Duplicated");
            //    resetEditRemainValue();
            //});

            $('#MainContent_wucCMAPPEditSingle_btnEditCloseSingle').on('click', function (e) {
                e.preventDefault();

                //// call function to reset the textboxes
                //resetEdit();

                //close the edit div
                //  $('#tblListing tbody tr').removeClass("row-selected");
                $('#divSiteCountListSingle').hide('slow');
                $('#modalEditSingle').modal('hide');

            });

            // *********************** ADD NEW SECTION *******************************

            $('#<%=btnNewTestTime.ClientID%>').on('click', function (e) {
                e.preventDefault();
                resetEditAddNew();

                $('#divSiteCountListSingle').show('slow');
                $('#modalEditSingle').modal();
            });

            $('#<%=btnEditCloseSingle.ClientID%>').on('click', function (e) {
                e.preventDefault();

                resetEditAddNew();

                //close the edit div
                $('#divSiteCountListSingle').hide('slow');
                $('#modalEditSingle').modal('hide');

            });

            $("#MainContent_cblSiteCountSingle input").on('change', function () {
                gSiteCountList = [];
                $("[id*=<%=cblSiteCountSingle.ClientID%>] input:checked").each(function () {
                    var data = { label: "X" + $(this).val(), labelValue: $(this).val(), value: "" };
                    gSiteCountList.push(data);
                });

                populateSiteCountAddNew();
            });

            $('#<%=btnEditCalculateSingle.ClientID%>').on('click', function (e) {
                e.preventDefault();

                if ($('#<%=txtEditSiteCount1TestTimeSingle.ClientID%>').val() === "" || $('#<%=txtEditOverheadSingle.ClientID%>').val() === "") {
                    showPopupMessage("Please enter X1 Test Time and Overhead value if you want to calculate");
                    return;
                }

                populateSiteCountCalculateSingle();
            });

            $('#<%=btnEditTestTimeSingle.ClientID%>').on('click', function (e) {
                e.preventDefault();
                UpdateTestTimeSingle();
            }); // end of btnEditTestTime click

            // *********************** END OF ADD NEW SECTION ************************

            $('#<%=btnDuplicateTestTime.ClientID%>').on('click', function (e) {
                e.preventDefault();
                $(this).val("Duplicated");

                // Loop the checked row
                displayMultiEdit(function () {

                    resetEditRemainValue();
                    //Show the modal
                    $('#modalEditMulti').modal();

                });
            });

        }); // end of document ready 

        function resetEditRemainValue() {
            var row = 1;
            $('#divTestTimeEditMulti .row-item').each(function () {

                $(this).find('#ddlTestSite_Row_' + row).removeAttr('disabled');
                $(this).find('#txtEditProgramID_Row_' + row).removeAttr('readonly');
                $(this).find('#txtEditRevision_Row_' + row).removeAttr('readonly');
                $(this).find('#txtEditVersion_Row_' + row).removeAttr('readonly');
                $(this).find('#ddlTesterEdit_Row_' + row).removeAttr('disabled');
                $(this).find('#txtEditDevice_Row_' + row).removeAttr('readonly');
                $(this).find('#ddlTempEdit_Row_' + row).removeAttr('disabled');
                $(this).find('#txtEditProgName_Row_' + row).removeAttr('readonly');
                $(this).find('#txtEditProgExec_Row_' + row).removeAttr('readonly');
                $(this).find('#txtEditEffDate_Row_' + row).removeAttr('readonly');
                $(this).find('#txtEditSiteCount1TestTime_Row_' + row).removeAttr('readonly');
                $(this).find('#txtEditOverhead_Row_' + row).removeAttr('readonly');

                row++;
            });
        }

        function resetEditAddNew() {

            $('#<%=ddlTestSiteEditSingle.ClientID%>').removeAttr('readonly');
            $('#<%=ddlTestSiteEditSingle.ClientID%>').val("");
            $('#<%=txtEditProgramIDSingle.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditProgramIDSingle.ClientID%>').val("");
            $('#<%=txtEditRevisionSingle.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditRevisionSingle.ClientID%>').val("");
            $('#<%=ddlTesterEditSingle.ClientID%>').removeAttr('readonly');
            $('#<%=ddlTesterEditSingle.ClientID%>').val("");
            $('#<%=txtEditVersionSingle.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditVersionSingle.ClientID%>').val("");

            $('#<%=txtEditProgNameSingle.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditProgNameSingle.ClientID%>').val("");
            $('#<%=txtEditProgExecSingle.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditProgExecSingle.ClientID%>').val("");
            $('#<%=txtEditDeviceSingle.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditDeviceSingle.ClientID%>').val("");
            $('#<%=ddlTempEditSingle.ClientID%>').removeAttr('readonly');
            $('#<%=ddlTempEditSingle.ClientID%>').val("");
            $('#<%=txtEditEffDateSingle.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditEffDateSingle.ClientID%>').val("");

            $('#<%=txtEditSiteCount1TestTimeSingle.ClientID%>').val("");

            $('#<%=txtEditOverheadSingle.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditOverheadSingle.ClientID%>').val("");
        }

        function exportData() {

            if (gData.length > 0) {

                for (var key in gData[0]) {
                    $('#tblExport thead tr').append("<td>" + key + "</td>");
                }

                $('#tblExport tbody').html("");

                var row = "";
                var rowCount = 0;
                $.each(gData, function (key, val) {

                    var keyName = "";
                    var rowColor = "transparent";
                    if (rowCount % 2 === 0)
                        rowColor = "#fff";

                    row = row + "<tr style='cursor:pointer; background-color:" + rowColor + "'>";
                    $.each(val, function (_, text) {
                        row = row + "<td>" + ((text === null) ? "" : text) + "</td>";
                    });
                    row = row + "</tr>";

                });

                $('#tblExport tbody').append(row);

                $("#tblExport").table2excel({
                    filename: "CMAPPTestTimeExport.xls"
                });

            } else {
                alert("No data to export!");
            }
        }

        function saveSiteCount() {

            $.confirm({
                title: 'Save confirmation',
                content: 'Are you sure to save? This will update the selected revision with the new calculated test time values.',
                buttons: {
                    cancel: function () {
                        //$.alert('Canceled!');
                    },
                    confirm: {
                        text: 'Confirm',
                        btnClass: 'btn-blue',
                        keys: ['enter', 'shift'],
                        action: function () {

                            gTotalRows = 0;
                            gCurrentRow = 0;
                            $('#divTestTimeEditMulti .row-item').each(function () {
                                gTotalRows = gTotalRows + 1;
                            });

                            var row = 1;
                            $('#divTestTimeEditMulti .row-item').each(function () {
                                //alert(this.innerHTML);

                                var _siteCountList = [];

                                var testSite = $(this).find('#ddlTestSite_Row_' + row).val();
                                var programID = $(this).find('#txtEditProgramID_Row_' + row).val();
                                var revision = $(this).find('#txtEditRevision_Row_' + row).val();
                                var version = $(this).find('#txtEditVersion_Row_' + row).val();
                                var testerType = $(this).find('#ddlTesterEdit_Row_' + row).val();
                                var device = $(this).find('#txtEditDevice_Row_' + row).val();
                                var temp = $(this).find('#ddlTempEdit_Row_' + row).val();
                                var progName = $(this).find('#txtEditProgName_Row_' + row).val();
                                var progExec = $(this).find('#txtEditProgExec_Row_' + row).val();
                                var effDate = $(this).find('#txtEditEffDate_Row_' + row).val();
                                var x1TestTime = $(this).find('#txtEditSiteCount1TestTime_Row_' + row).val();
                                var overhead = $(this).find('#txtEditOverhead_Row_' + row).val();

                                // 2018-07-22
                                //// manual add for site count 1
                                if (x1TestTime != null && x1TestTime != "") {
                                    var dataItem = { label: "X1", labelValue: "1", value: x1TestTime };
                                    _siteCountList.push(dataItem);
                                }
                                
                                $('#ulSiteCountList_Row_' + row + ' li').each(function (index) {
                                    //TODO
                                    var lbl = $(this).find("label").text();
                                    var val = $(this).find("input").val();
                                    dataItem = { label: lbl, labelValue: lbl.replace("X", ""), value: val };
                                    _siteCountList.push(dataItem);
                                });

                                // call ajax and update database
                                $.ajax({
                                    url: "TestTimeUpdateMulti.aspx/UpdateTestTime",
                                    data: "{ 'testSite': '" + testSite + "', 'testProgID': '" + programID + "', 'rev': '" + revision + "', 'testerType': '" + testerType + "', 'progName': '" + progName + "', 'programExec': '" + progExec + "', 'device': '" + device + "', 'temp': '" + temp + "', 'effDate': '" + effDate + "', 'siteCountList': '" + JSON.stringify(_siteCountList) + "', 'overhead': '" + overhead + "', 'updateType': 'Single'}",
                                    dataType: "json",
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    success: function (data) {
                                        gCurrentRow++;
                                        refreshAfterUpdate();
                                    },
                                    beforeSend: function (request) {
                                        HoldOn.open({ theme: "sk-rect" });
                                    }
                                    , complete: function () {
                                        HoldOn.close();
                                    },
                                    error: function (a, b, c) {
                                        //console.log('error: ' + JSON.stringify(a));
                                        gCurrentRow++;    
                                        refreshAfterUpdate();
                                    }
                                });

                                row++;
                            });

                        } // end of action 
                    } // end of confirm
                } // end of button
            }); // end of confirm

        }

        function refreshAfterUpdate() {
            if (gCurrentRow === gTotalRows) {
                // resetEdit();
                // $('#tblListing tbody tr').removeClass("row-selected");
                //$('#divSiteCountList').hide('slow');
                $('#modalEditMulti').modal('hide');

                getListing($("#<%=ddlTestSite.ClientID%>").val(), $("#<%=txtProgramID.ClientID%>").val(), $("#<%=ddlRevision.ClientID%>").val(), $('#<%=txtVersion.ClientID%>').val(), $('#<%=ddlTester.ClientID%>').val(), $("#<%=txtProgramName.ClientID%>").val(), $("#<%=txtProgramExec.ClientID%>").val(), $("#<%=txtDevice.ClientID%>").val(), $("#<%=ddlTemp.ClientID%>").val(), $("input[id='<%=chkMaxDate.ClientID%>']:checked").val());
            }
        }

        function saveTempList() {
            $("#<%=ddlTemp.ClientID%> > option").each(function () {
                gTempList.push({ text: this.text, value: this.value });
            });
        }

        function saveTesterTypeList() {
            $("#<%=ddlTester.ClientID%> > option").each(function () {
                gTesterTypeList.push({ text: this.text, value: this.value });
            });
        }

        function populateSiteCountList() {
            for (var i = 1; i <= 320; i++) {
                gSiteCountListEdit.push({ text: 'X'+i, value:i });
            }
        }

        function displayMultiEdit(cb) {

            $('#divTestTimeEditMulti').empty();

            // Loop the table row and check if the row is checked, then create objects to edit
            var row = 1;
            $('#tblListing tbody tr').each(function () {

                var checkbox = $(this).find("td:nth-child(1) input[type='checkbox']")[0];

                if (checkbox.checked === true) {

                    // get the row data
                    var testSite = $(this).find("td:nth-child(2)").html();
                    var programID = $(this).find("td:nth-child(3)").html();
                    var revision = $(this).find("td:nth-child(4)").html();
                    var testerType = $(this).find("td:nth-child(5)").html();
                    var device = $(this).find("td:nth-child(6)").html();
                    var temp = $(this).find("td:nth-child(7)").html();
                    var effDate = $(this).find("td:nth-child(8)").html();
                    var programSource = $(this).find("td:nth-child(9)").html();
                    var programExec = $(this).find("td:nth-child(10)").html();
                    var overhead = $(this).find("td:nth-child(11)").html();
                    //alert(testSite);

                    // build the textbox
                    var html = '<div class="col-md-12 row-item">';
                    html = html + '<div class="row">';
                    html = html + '<div class="col-lg-1 col-md-2">';
                    html = html + '<label for="ddlTestSite_Row_' + row + '">Test Site</label>';
                    html = html + '<select name="ddlTestSite_Row_' + row + '" id="ddlTestSite_Row_' + row + '" class="form-control" disabled>';
                    html = html + '</select>';    
                    html = html + '</div>';
                    html = html + '<div class="col-lg-1 col-md-2">';
                    html = html + '<label for="txtEditProgramID_Row_' + row + '">Program ID</label>';
                    html = html + '<input name="txtEditProgramID_Row_' + row + '" type="text" id="txtEditProgramID_Row_' + row + '" class="form-control toUppercase" value="' + programID + '" readonly="readonly" />';
                    html = html + '</div>';
                    html = html + '<div class="col-lg-1 col-md-2">';
                    html = html + '<label for="txtEditRevision_Row_' + row + '">Revision</label>';
                    html = html + '<input name="txtEditRevision_Row_' + row + '" type="text" id="txtEditRevision_Row_' + row + '" class="form-control toUppercase" value="' + revision + '" readonly="readonly" />';
                    html = html + '</div>';
                    html = html + '<div class="col-lg-1 col-md-2">';
                    html = html + '<label for="txtEditVersion_Row_' + row + '">Version</label>';
                    html = html + '<input name="txtEditVersion_Row_' + row + '" type="text" value="0" id="txtEditVersion_Row_' + row + '" class="form-control toUppercase" readonly="readonly" />';
                    html = html + '</div>';
                    html = html + '<div class="col-lg-1 col-md-2">';
                    html = html + '<label for="ddlTesterEdit_Row_' + row + '">Tester Type</label>';
                    html = html + '<select name="ddlTesterEdit_Row_' + row + '" id="ddlTesterEdit_Row_' + row + '" class="form-control" disabled>';
                    html = html + '</select>';
                    html = html + '</div>';
                    html = html + '<div class="col-lg-2 col-md-3">';
                    html = html + '<label for="txtEditDevice_Row_' + row + '">Device</label>';
                    html = html + '<input name="txtEditDevice_Row_' + row + '" type="text" id="txtEditDevice_Row_' + row + '" class="form-control toUppercase" value="' + device + '" readonly="readonly" />';
                    html = html + '</div>';
                    html = html + '<div class="col-lg-1 col-md-2">';
                    html = html + '<label for="ddlTempEdit_Row_' + row + '">Temp</label>';
                    html = html + '<select name="ddlTempEdit_Row_' + row + '" id="ddlTempEdit_Row_' + row + '" class="form-control" disabled>';
                    html = html + '</select>';
                    html = html + '</div>';
                    html = html + '<div class="col-lg-2 col-md-3">';
                    html = html + '<label for="txtEditProgName_Row_' + row + '">Program Name</label>';
                    html = html + '<input name="txtEditProgName_Row_' + row + '" type="text" id="txtEditProgName_Row_' + row + '" class="form-control toUppercase" value="' + programSource + '" readonly="readonly" />';
                    html = html + '</div>';
                    html = html + '<div class="col-lg-2 col-md-3">';
                    html = html + '<label for="txtEditProgExec_Row_' + row + '">Program Exec</label>';
                    html = html + '<input name="txtEditProgExec_Row_' + row + '" type="text" id="txtEditProgExec_Row_' + row + '" class="form-control toUppercase" value="' + programExec + '" readonly="readonly" />';
                    html = html + '</div>';
                    html = html + '</div>'; // end of row

                    html = html + '<div class="row">';
                    html = html + '<div class="col-lg-1 col-md-2">';
                    html = html + '<label for="txtEditEffDate_Row_' + row + '">Effective Date</label><br />';
                    html = html + '<input name="txtEditEffDate_Row_' + row + '" type="text" id="txtEditEffDate_Row_' + row + '" class="form-control" value="' + effDate + '" readonly="readonly" />';
                    html = html + '</div>';
                    html = html + '<div class="col-lg-1 col-md-2">';
                    html = html + '<label for="txtEditSiteCount1TestTime_Row_' + row + '">X1 Test Time</label><br />';
                    html = html + '<input name="txtEditSiteCount1TestTime_Row_' + row + '" type="text" id="txtEditSiteCount1TestTime_Row_' + row + '" class="form-control" />';
                    html = html + '</div>';
                    html = html + '<div class="col-lg-1 col-md-2">';
                    html = html + '<label for="txtEditOverhead_Row_' + row + '">Overhead (%)</label><br />';
                    html = html + '<input name="txtEditOverhead_Row_' + row + '" type="text" id="txtEditOverhead_Row_' + row + '" class="form-control" value="' + overhead + '" />';
                    html = html + '</div>';
                    html = html + '<div class="col-lg-1 col-md-1">';
                    html = html + '<span></span>&nbsp;<br />';
                    html = html + '<input type="button" name="btnEditCalculate_Row_' + row + '" value="Calculate" id="btnEditCalculate_Row_' + row + '" class="btn btn-primary" style="width:100%;" onclick="calculateSiteCount(\'' + row + '\')" />';
                    html = html + '</div>';
                    html = html + '<div class="col-lg-8 col-md-5">';
                    html = html + '<div style="width:100%; overflow-x:scroll;">';
                    html = html + '<table id="cblSiteCount_Row_' + row + '" style="overflow:auto;">';
                    html = html + '<tbody>';
                    html = html + '<tr></tr>';
                    html = html + '</tbody>';
                    html = html + '</table>';
                    html = html + '</div>';
                    html = html + '</div>';
                    html = html + '</div>'; // end of row

                    html = html + '<div class="row" style="margin-top:15px;">';
                    html = html + '<div class="col-lg-12 col-md-12">';
                    html = html + '<ul id="ulSiteCountList_Row_' + row + '" style="list-style:none; display:inline-block; margin:0; padding:0;">';
                    html = html + '</ul>';
                    html = html + '</div>';
                    html = html + '</div>'; // end of row

                    html = html + '<div class="row" style="margin-top:15px;">';
                    html = html + '<div class="col-lg-12 col-md-12"><hr style="margin:0; padding:0; margin-top:5px; margin-bottom:5px;"/></div>';
                    html = html + '</div>'; // end of row

                    html = html + '</div>'; // end of row item

                    $('#divTestTimeEditMulti').append(html);

                    //Load data and show value for dropdown
                    LoadDataForDropownAndShowValue("#ddlTestSite_Row_" + row, gTestSiteList, testSite, "#ddlTesterEdit_Row_" + row, gTesterTypeList, testerType, "#ddlTempEdit_Row_" + row, gTempList, temp);

                    //Load site count list
                    LoadSiteCountList(testSite, programID, revision, testerType, programSource, programExec, device, temp, effDate, "#txtEditSiteCount1TestTime_Row_" + row, "#cblSiteCount_Row_" + row, "#ulSiteCountList_Row_" + row, "#cblSiteCount_Row_" + row, row);

                    //Load Site Count 1 and populate data
                    getSiteCount1TestTime(testSite, programID, revision, testerType, programSource, programExec, device, temp, effDate, "#txtEditSiteCount1TestTime_Row_" + row, "#cblSiteCount_Row_" + row, "#ulSiteCountList_Row_" + row);

                    row++;
                }

            });

            return cb();
        }

        function calculateSiteCount(_row) {

            // alert("Row: " + _row);
            if ($('#txtEditSiteCount1TestTime_Row_' + _row).val() === "" || $('#txtEditOverhead_Row_' + _row).val() === "") {
                showPopupMessage("Please enter X1 Test Time and Overhead value if you want to calculate");
                return;
            }

            populateSiteCountCalculate(_row);

        }

        function populateSiteCountCalculate(_row) {

            _siteCountList = [];
            $("#cblSiteCount_Row_" + _row + " input:checked").each(function () {
                var data = { label: "X" + $(this).val(), labelValue: $(this).val(), value: "0.00" };
                _siteCountList.push(data);
            });

            if (_siteCountList.length > 0) {

                var item = "";

                $.each(_siteCountList, function (key, val) {

                    // use the formula
                    if ($('#txtEditOverhead_Row_' + _row).val() !== "" && $('#txtEditSiteCount1TestTime_Row_' + _row).val() !== "") {

                        var scValue = parseFloat($('#txtEditSiteCount1TestTime_Row_' + _row).val()) + ((parseFloat($('#txtEditOverhead_Row_' + _row).val()) / 100) * (parseInt(val.labelValue) - 1) * parseFloat($('#txtEditSiteCount1TestTime_Row_' + _row).val()));
                        val.value = scValue.toFixed(2);

                    } else {

                        if ($.trim(val.labelValue) === "1")
                            val.value = $('#txtEditSiteCount1TestTime_Row_' + _row).val();
                        else
                            val.value = "";
                    }

                    item = item + "<li style='display: inline-block; text-align:center; margin:5px;'>" +
                        "<div><label>" + val.label + "</label> " +
                        "<input type='text' class='form-control' value='" + val.value + "' style='width:80px; text-align:center;' /> " +
                        "</div></li>";

                });

                $('#ulSiteCountList_Row_' + _row).html("");
                $('#ulSiteCountList_Row_' + _row).append(item);
            }
        }

        function getSiteCount1TestTime(_testSite, _testProgID, _rev, _testerType, _progName, _programExec, _device, _temp, _effDate, objTestTime1, objSiteCount, objUlSiteCount) {
            $.ajax({
                url: "TestTimeUpdateMulti.aspx/GetSiteCount1TestTime",
                data: "{ 'testSite': '" + _testSite + "', 'testProgID': '" + _testProgID + "', 'rev': '" + _rev + "', 'testerType': '" + _testerType + "', 'progName': '" + _progName + "', 'programExec': '" + _programExec + "', 'device': '" + _device + "', 'temp': '" + _temp + "', 'effDate': '" + _effDate + "'}",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    if (JSON.parse(data.d).length > 0) {
                        var sc1TT = JSON.parse(data.d)[0].TESTTIME;
                        //alert(sc1TT);
                        $(objTestTime1).val(sc1TT);
                    }

                    populateSiteCount("SERVER", _testSite, _testProgID, _rev, _testerType, _progName, _programExec, _device, _temp, _effDate, objTestTime1, objSiteCount, objUlSiteCount);
                },
                error: function (a, b, c) {
                    console.log('error: ' + JSON.stringify(a));
                }
            });
        }

        function populateSiteCount(_type, _testSite, _testProgID, _rev, _testerType, _progName, _programExec, _device, _temp, _effDate, objTestTime1, objSiteCount, objUlSiteCount) {

            var item = "";

            $.ajax({
                url: "TestTimeUpdateMulti.aspx/GetSelectedSiteCountList",
                dataType: "json",
                data: "{ 'testSite': '" + _testSite + "', 'testProgID': '" + _testProgID + "', 'rev': '" + _rev + "', 'testerType': '" + _testerType + "', 'progName': '" + _progName + "', 'programExec': '" + _programExec + "', 'device': '" + _device + "', 'temp': '" + _temp + "', 'effDate': '" + _effDate + "'}",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    if (_type === "SERVER") {

                        $(objSiteCount + " input").each(function () {
                            this.checked = false;
                        });

                        gSiteCountList = [];
                        $.each(JSON.parse(data.d), function (key, val) {
                            var dataItem = { label: "X" + val.SITECOUNT, labelValue: val.SITECOUNT, value: "0.00" };
                            gSiteCountList.push(dataItem);
                        });

                        var found = 0;
                        $(objSiteCount + " input").each(function () {
                            if (getObjects(gSiteCountList, 'labelValue', $(this).val()).length > 0) {
                                this.checked = true;
                                found++;
                            }
                        });
                    }

                    $.each(gSiteCountList, function (key, val) {

                        var savedValue = "";
                        if (JSON.parse(data.d).length > 0) {
                            $.each(JSON.parse(data.d), function (subKey, subVal) {  
                                if ($.trim(subVal.SITECOUNT) === $.trim(val.labelValue)) {
                                    savedValue = subVal.TESTTIME;
                                    return false;
                                }
                            });
                        }

                        if (savedValue === null)
                            savedValue = "";

                        if ($.trim(val.labelValue) === "1")
                            val.value = $(objTestTime1).val();
                        else
                            val.value = savedValue;

                        item = item + "<li style='display: inline-block; text-align:center; margin:5px;'>" +
                            "<div><label>" + val.label + "</label> " +
                            "<input type='text' class='form-control' value='" + val.value + "' style='width:80px; text-align:center;' /> " +
                            "</div></li>";

                    });

                    $(objUlSiteCount).html("");
                    $(objUlSiteCount).append(item);
                },
                error: function (a, b, c) {
                    //console.log('error: ' + JSON.stringify(a));
                }
            });
        }

        function populateSiteCountAddNew() {

            var item = "";

            $.each(gSiteCountList, function (key, val) {

                item = item + "<li style='display: inline-block; text-align:center; margin:5px;'>" +
                    "<div><label>" + val.label + "</label> " +
                    "<input type='text' class='form-control' value='" + val.value + "' style='width:80px; text-align:center;' /> " +
                    "</div></li>";

            });

            $('#ulSiteCountListSingle').html("");
            $('#ulSiteCountListSingle').append(item);
        }

        function LoadSiteCountList(_testSite, _testProgID, _rev, _testerType, _progName, _programExec, _device, _temp, _effDate, objTestTime1, objSiteCount, objUlSiteCount, row) {
            var col = 1;
            var style = "";
            $.each(gSiteCountListEdit, function (key, val) {
                if (col === 1)
                    style = "display:none;";
                else
                    style = "";

                $(objSiteCount + " > tbody > tr").append("<td style='" + style + "'><input name='cblSiteCount_" + row + "_" + col + "' id='cblSiteCount_" + row + "_" + col + "' type='checkbox' value='" + val.value + "' onchange='repopulateSiteCount(\"" + _testSite + "\", \"" + _testProgID + "\", \"" + _rev + "\", \"" + _testerType + "\", \"" + _progName + "\", \"" + _programExec + "\", \"" + _device + "\", \"" + _temp + "\", \"" + _effDate + "\", \"" + objTestTime1 + "\", \"" + objSiteCount + "\", \"" + objUlSiteCount + "\")'><label for='cblSiteCount_" + row + "_" + col + "'> " + val.text + " </label></td>");
                col++;
            });
        }

        function repopulateSiteCount(_testSite, _testProgID, _rev, _testerType, _progName, _programExec, _device, _temp, _effDate, objTestTime1, objSiteCount, objUlSiteCount) {
            gSiteCountList = [];
            $(objSiteCount +" input:checked").each(function () {
                var data = { label: "X" + $(this).val(), labelValue: $(this).val(), value: "0.00" };
                gSiteCountList.push(data);
            });

            populateSiteCount("LOCAL", _testSite, _testProgID, _rev, _testerType, _progName, _programExec, _device, _temp, _effDate, objTestTime1, objSiteCount, objUlSiteCount);
        }

        function LoadDataForDropownAndShowValue(objTestSite, dataTestSite, valTestSite, objTesterType, dataTesterType, valTesterType, objTemp, dataTemp, valTemp) {
            LoadOptions(objTestSite, dataTestSite, function () {
                $(objTestSite).val(valTestSite);
            });

            LoadOptions(objTesterType, dataTesterType, function () {
                $(objTesterType).val(valTesterType);
            });

            LoadOptions(objTemp, dataTemp, function () {
                $(objTemp).val(valTemp);
            });
        }

        function LoadOptions(obj, data, cb) {
            //alert(obj);
            $.each(data, function (key, val) {
                //alert(val.value);
                $(obj).append("<option value='" + val.value + "'>" + val.text + "</option>");
            });

            return cb();
        }

        function changePage(_page) {
            gCurrentPage = _page;
            displayReport(gData);
        }

        function displayPaging() {

            $('#ulTablePaging').empty();

            gStartPaging = 1 + gNext;
            // gCurrentPage = gStartPaging;

            //alert(gTotalPaging);

            if (gStartPaging + 10 < gTotalPaging)
                gEndPaging = gStartPaging + (10 - 1);
            else
                gEndPaging = gTotalPaging;

            if (gStartPaging > 1)
                $('#ulTablePaging').append("<li id='" + i + "' class='" + ((gCurrentPage === i) ? "selected" : "") + "'><a onclick='prevPaging(); return false;'>Previous<a></li>")

            for (var i = gStartPaging; i <= gEndPaging; i++) {
                $('#ulTablePaging').append("<li id='" + i + "' class='" + ((gCurrentPage === i) ? "selected" : "") + "'><a onclick='changePage(\"" + i + "\"); return false;'>" + i + "<a></li>")
            }

            if (gEndPaging < gTotalPaging)
                $('#ulTablePaging').append("<li id='" + i + "' class='" + ((gCurrentPage === i) ? "selected" : "") + "'><a onclick='nextPaging(); return false;'>Next<a></li>")
        }

        function nextPaging() {
            gNext = gNext + 10;
            displayPaging();
            changePage(gCurrentPage);
        }

        function prevPaging() {
            gNext = gNext - 10;
            displayPaging();
            changePage(gCurrentPage);
        }

        function displayReport(_gData) {

            // reset total check
            gTotalCheck = 0;
            // hide edit button
            $('#<%=btnEditMultiTestTime.ClientID%>').hide('slow');
            $('#<%=btnDuplicateTestTime.ClientID%>').hide('slow');

            $('#ulTablePaging li').removeClass("selected");
            $('#ulTablePaging li[id="' + gCurrentPage + '"]').addClass("selected");

            $('#tblListing tbody').html("");

            // *********************** DATA ROW ***********************
            var firstPage = ((gCurrentPage - 1) * gItemPerPage) + 1;
            var lastPage = firstPage + (gItemPerPage - 1);

            var row = "";
            var rowCount = 0;
            $.each(_gData, function (key, val) {

                if (rowCount + 1 >= firstPage && rowCount + 1 <= lastPage) {

                    var rowColor = "transparent";
                    if (rowCount % 2 === 0)
                        rowColor = "#fff";

                    row = row + "<tr id='" + val.RowID + "' class='' style='cursor:pointer; background-color:" + rowColor + "'>";

                    // " + ((gSelectedRowID.indexOf(val.RowID) >= 0) ? "checked" : "") + "
                    // Add a checkbox
                    row = row + "<td style='text-align:center;'><input type='checkbox' id='chk_" + val.RowID + "' onclick='selectRow(this, \"" + val.RowID + "\");' /></td>";

                    $.each(val, function (_, text) {
                        if (_ !== "RowID")
                            row = row + "<td>" + ((text === null) ? "" : text) + "</td>";
                    });
                    row = row + "</tr>";

                }

                rowCount++;
            });
            $('#tblListing tbody').append(row);
        }

        function guid() {
          function s4() {
            return Math.floor((1 + Math.random()) * 0x10000)
              .toString(16)
              .substring(1);
          }
          return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
        }

        function selectRow(obj, _uuid) {

            if ($(obj).is(':checked')) {

                if (gSelectedRowID.indexOf(_uuid) < 0) {
                    gSelectedRowID = gSelectedRowID + "," + _uuid;
                }

                gTotalCheck++;
                $(obj).closest('tr').addClass("row-selected");

            } else {

                gSelectedRowID = gSelectedRowID.replace("," + _uuid, "");

                gTotalCheck--;
                $(obj).closest('tr').removeClass("row-selected");
            }

            showEditButton();
        }

        function showEditButton() {

            if (gTotalCheck > 0) {
                $('#<%=btnEditMultiTestTime.ClientID%>').show('slow');
                $('#<%=btnDuplicateTestTime.ClientID%>').show('slow');
            } else {
                $('#<%=btnEditMultiTestTime.ClientID%>').hide('slow');
                $('#<%=btnDuplicateTestTime.ClientID%>').hide('slow');
            }
        }

        function loadProgramIDList() {

            $("#<%=txtProgramID.ClientID%>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "TestTimeUpdateMulti.aspx/GetTestProgramIDList",
                        data: "{ 'q': '" + $("#<%=txtProgramID.ClientID%>").val() + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {

                            //console.log(JSON.parse(data.d).length);

                            if (JSON.parse(data.d).length > 0) {
                                response($.map(JSON.parse(data.d), function (item) {
                                    return {
                                        label: item.TESTPROGID,
                                        value: item.TESTPROGID
                                    }
                                }));
                            }
                        },
                        error: function (a, b, c) {
                            console.log('error: ' + JSON.stringify(a));
                        }
                    });
                },
                minLength: 2,
                select: function (event, ui) {
                }
            });
        }

        function loadProgramNameList() {
            $("#<%=txtProgramName.ClientID%>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "TestTimeUpdateMulti.aspx/GetTestProgramNameList",
                        data: "{ 'q': '" + $("#<%=txtProgramName.ClientID%>").val() + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {

                            //console.log(JSON.parse(data.d).length);

                            if (JSON.parse(data.d).length > 0) {
                                response($.map(JSON.parse(data.d), function (item) {
                                    return {
                                        label: item.TESTPROGMAINSOURCE,
                                        value: item.TESTPROGMAINSOURCE
                                    }
                                }));
                            }
                        },
                        error: function (a, b, c) {
                            console.log('error: ' + JSON.stringify(a));
                        }
                    });
                },
                minLength: 2,
                select: function (event, ui) {
                }
            });
        }

        function loadProgramExecList() {
            $("#<%=txtProgramExec.ClientID%>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "TestTimeUpdateMulti.aspx/GetTestProgramExecList",
                        data: "{ 'q': '" + $("#<%=txtProgramExec.ClientID%>").val() + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {

                            //console.log(JSON.parse(data.d).length);

                            if (JSON.parse(data.d).length > 0) {
                                response($.map(JSON.parse(data.d), function (item) {
                                    return {
                                        label: item.TESTPROGEXECUTABLE,
                                        value: item.TESTPROGEXECUTABLE
                                    }
                                }));
                            }
                        },
                        error: function (a, b, c) {
                            console.log('error: ' + JSON.stringify(a));
                        }
                    });
                },
                minLength: 2,
                select: function (event, ui) {
                }
            });
        }

        function loadDeviceList() {
            // TODO
            $("#<%=txtDevice.ClientID%>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "TestTimeUpdateMulti.aspx/GetDeviceList",
                        data: "{ 'q': '" + $("#<%=txtDevice.ClientID%>").val() + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {

                            //console.log(JSON.parse(data.d).length);

                            if (JSON.parse(data.d).length > 0) {
                                response($.map(JSON.parse(data.d), function (item) {
                                    return {
                                        label: item.DEVICE,
                                        value: item.DEVICE
                                    }
                                }));
                            }
                        },
                        error: function (a, b, c) {
                            console.log('error: ' + JSON.stringify(a));
                        }
                    });
                },
                minLength: 2,
                select: function (event, ui) {
                }
            });
        }

        function loadRevision() {

            $("#<%=ddlRevision.ClientID%>").attr('disabled', true);

            $.ajax({
                url: "TestTimeUpdateMulti.aspx/GetRevisionList",
                //data: "{ '': ''}",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    if (JSON.parse(data.d).length > 0) {

                        $.each(JSON.parse(data.d), function () {
                            $("#<%=ddlRevision.ClientID%>").append($("<option />").val(this.TESTPROGIDREV).text(this.TESTPROGIDREV));
                        });

                    }

                    $("#<%=ddlRevision.ClientID%>").removeAttr('disabled');
                },
                error: function (a, b, c) {
                    console.log('error: ' + JSON.stringify(a));
                    $("#<%=ddlRevision.ClientID%>").removeAttr('disabled');
                }
            });
        }

        function loadPlantCode() {

            gTestSiteList = [];
            $("#<%=ddlTestSite.ClientID%>").attr('disabled', true);
            $("#<%=ddlTestSiteEditSingle.ClientID%>").attr('disabled', true);

            $.ajax({
                url: "TestTimeUpdateMulti.aspx/GetPlantCodeList",
                //data: "{ '': ''}",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    if (JSON.parse(data.d).length > 0) {

                        $.each(JSON.parse(data.d), function (key, val) {
                            gTestSiteList.push({ text: val.PLANTCODE, value: val.PLANTCODE});
                            $("#<%=ddlTestSite.ClientID%>").append($("<option />").val(val.PLANTCODE).text(val.PLANTCODE));
                            $("#<%=ddlTestSiteEditSingle.ClientID%>").append($("<option />").val(val.PLANTCODE).text(val.PLANTCODE));
                        });

                    }

                    $("#<%=ddlTestSite.ClientID%>").removeAttr('disabled');
                    $("#<%=ddlTestSiteEditSingle.ClientID%>").removeAttr('disabled');
                },
                error: function (a, b, c) {
                    console.log('error: ' + JSON.stringify(a));
                    $("#<%=ddlTestSite.ClientID%>").removeAttr('disabled');
                    $("#<%=ddlTestSiteEditSingle.ClientID%>").removeAttr('disabled');
                }
            });
        }

        function showPopupMessage(message) {
            $('#MainContent_wucPopupInfo_lblMessage').text(message);
            $find("modalPopupMessage").show();
        }

        function getObjects(obj, key, val) {
            var objects = [];
            for (var i in obj) {
                if (!obj.hasOwnProperty(i)) continue;
                if (typeof obj[i] == 'object') {
                    objects = objects.concat(getObjects(obj[i], key, val));
                } else if (i == key && obj[key] == val) {
                    objects.push(obj);
                }
            }
            return objects;
        }

        function getListing(_testSite, _testProgID, _rev, _ver, _testerType, _progName, _progExec, _device, _temp, _maxDate) {

            // clear the table
            $('#tblListing thead tr').html("");
            $('#tblListing tbody').html("");

            $.ajax({
                url: "TestTimeUpdateMulti.aspx/GetSiteCountListByFilter",
                data: "{ 'testSite': '" + _testSite + "', 'testProgID': '" + _testProgID + "', 'rev': '" + _rev + "', 'testerType': '" + _testerType + "', 'progName': '" + _progName + "', 'programExec': '" + _progExec + "', 'device': '" + _device + "', 'temp': '" + _temp + "'}",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    gSiteCountList = [];
                    $.each(JSON.parse(data.d), function (key, val) {
                        var dataItem = { label: "X" + val.SITECOUNT, labelValue: val.SITECOUNT, value: "0.00" };
                        gSiteCountList.push(dataItem);
                    });

                    $.ajax({
                        url: "TestTimeUpdateMulti.aspx/GetListing",
                        data: "{ 'testSite': '" + _testSite + "', 'testProgID': '" + _testProgID + "', 'rev': '" + _rev + "', 'ver': '" + _ver + "', 'testerType': '" + _testerType + "', 'progName': '" + _progName + "', 'progExec': '" + _progExec + "', 'device': '" + _device + "', 'temp': '" + _temp + "', 'maxDate': '" + _maxDate + "', 'siteCountList': '" + JSON.stringify(gSiteCountList) + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {

                            // gDataList = JSON.parse(data.d);
                            gNext = 0;
                            // gCurrentPage = 1;
                            gStartPaging = 1;
                            gData = JSON.parse(data.d);

                            // clear the paging
                            $('#ulTablePaging').empty();

                            if (JSON.parse(data.d).length > 0) {

                                // ********************** PAGING ***********************
                                gTotalRecords = gData.length;
                                //alert("gTotalRecords: " + gTotalRecords.toString());

                                gTotalPaging = parseInt((gTotalRecords % gItemPerPage) > 0 ? ((gTotalRecords / gItemPerPage) + 1) : (gTotalRecords / gItemPerPage));
                                //alert(gTotalPaging);

                                displayPaging();

                                $('#tblListing thead tr').append("<td>&nbsp;</td>");

                                for (var key in JSON.parse(data.d)[0]) {
                                    if (key !== "RowID")
                                        $('#tblListing thead tr').append("<td><a href='#' style='color:#fff;' onclick='sortColumn(\"" + key + "\");'>" + key + "</a></td>");
                                }

                                displayReport(gData);

                                $('#<%=btnExport.ClientID%>').show('slow');
                                $('#note1').show('slow');

                                // alert(gSelectedRowID);

                            } else {
                                showPopupMessage("No data found!");
                                $('#<%=btnExport.ClientID%>').hide();
                                $('#note1').hide();
                            }

                        }
                        , complete: function () {
                            HoldOn.close();
                        },
                        error: function (a, b, c) {
                            console.log('error: ' + JSON.stringify(a));
                        }
                    });
                },
                beforeSend: function (request) {
                    HoldOn.open({ theme: "sk-rect" });
                }
                , error: function (a, b, c) {
                    console.log('error: ' + JSON.stringify(a));
                }
            });
        }

        function sortColumn(_columnName) {
            if (gSortColumn !== _columnName) {
                gSortColumn = _columnName;
                gData.sort(GetSortOrder(_columnName));
                displayReport(gData);
            } else {

            }
            
        }

        function GetSortOrder(prop) {
            return function (a, b) {
                if (a[prop] > b[prop]) {
                    return 1;
                } else if (a[prop] < b[prop]) {
                    return -1;
                }

                return 0;
            }
        }

        function UpdateTestTimeSingle() {

            $.confirm({
                title: 'Save confirmation',
                content: 'Are you sure to save? This will update the selected revision with the new calculated test time values.',
                buttons: {
                    cancel: function () {
                        //$.alert('Canceled!');
                    },
                    confirm: {
                        text: 'Confirm',
                        btnClass: 'btn-blue',
                        keys: ['enter', 'shift'],
                        action: function () {

                            // manual add for site count 1
                            var dataItem = { label: "X1", labelValue: "1", value: $("#<%=txtEditSiteCount1TestTimeSingle.ClientID%>").val() };
                            gSiteCountList.push(dataItem);

                            // loop the input in the site count list
                            $('#ulSiteCountListSingle li').each(function (index) {

                                //alert($(this).find("input").val());
                                //update the json object (user might change the value manually)
                                if (gHideFirstItem)
                                    gSiteCountList[index + 1].value = $(this).find("input").val(); // index + 1 because first item (1) has been hide
                                else
                                    gSiteCountList[index].value = $(this).find("input").val();
                            });

                            // call ajax and update database
                            $.ajax({
                                url: "TestTimeUpdate.aspx/UpdateTestTime",
                                data: "{ 'testSite': '" + $("#<%=ddlTestSiteEditSingle.ClientID%>").val() + "', 'testProgID': '" + $("#<%=txtEditProgramIDSingle.ClientID%>").val() + "', 'rev': '" + $("#<%=txtEditRevisionSingle.ClientID%>").val() + "', 'testerType': '" + $("#<%=ddlTesterEditSingle.ClientID%>").val() + "', 'progName': '" + $("#<%=txtEditProgNameSingle.ClientID%>").val() + "', 'programExec': '" + $("#<%=txtEditProgExecSingle.ClientID%>").val() + "', 'device': '" + $("#<%=txtEditDeviceSingle.ClientID%>").val() + "', 'temp': '" + $("#<%=ddlTempEditSingle.ClientID%>").val() + "', 'effDate': '" + $("#<%=txtEditEffDateSingle.ClientID%>").val() + "', 'siteCountList': '" + JSON.stringify(gSiteCountList) + "', 'overhead': '" + $("#<%=txtEditOverheadSingle.ClientID%>").val() + "', 'updateType': 'Single'}",
                                dataType: "json",
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                success: function (data) {

                                    resetEditAddNew();
                                    $('#divSiteCountListSingle').hide('slow');
                                    $('#modalEditSingle').modal('hide');

                                    getListing($("#<%=ddlTestSite.ClientID%>").val(), $("#<%=txtProgramID.ClientID%>").val(), $("#<%=ddlRevision.ClientID%>").val(), $('#<%=txtVersion.ClientID%>').val(), $('#<%=ddlTester.ClientID%>').val(), $("#<%=txtProgramName.ClientID%>").val(), $("#<%=txtProgramExec.ClientID%>").val(), $("#<%=txtDevice.ClientID%>").val(), $("#<%=ddlTemp.ClientID%>").val(), $("input[id='<%=chkMaxDate.ClientID%>']:checked").val());
                                },
                                beforeSend: function (request) {
                                    HoldOn.open({ theme: "sk-rect" });
                                }
                                , complete: function () {
                                    HoldOn.close();
                                },
                                error: function (a, b, c) {
                                    //console.log('error: ' + JSON.stringify(a));
                                }
                            });

                        } // end of action 
                    } // end of confirm
                } // end of button
            }); // end of confirm
        }

        function populateSiteCountCalculateSingle() {

            gHideFirstItem = false;

            if (gSiteCountList.length > 0) {

                var item = "";

                $.each(gSiteCountList, function (key, val) {

                    // use the formula
                    if ($('#<%=txtEditOverheadSingle.ClientID%>').val() !== "" && $('#<%=txtEditSiteCount1TestTimeSingle.ClientID%>').val() !== "") {

                        var scValue = parseFloat($('#<%=txtEditSiteCount1TestTimeSingle.ClientID%>').val()) + ((parseFloat($('#<%=txtEditOverheadSingle.ClientID%>').val()) / 100) * (parseInt(val.labelValue) - 1) * parseFloat($('#<%=txtEditSiteCount1TestTimeSingle.ClientID%>').val()));
                        val.value = scValue.toFixed(2);

                    } else {

                        if ($.trim(val.labelValue) === "1")
                            val.value = $('#<%=txtEditSiteCount1TestTimeSingle.ClientID%>').val();
                        else
                            val.value = "";
                    }

                    item = item + "<li style='display: inline-block; text-align:center; margin:5px;'>" +
                        "<div><label>" + val.label + "</label> " +
                        "<input type='text' class='form-control' value='" + val.value + "' style='width:80px; text-align:center;' /> " +
                        "</div></li>";

                });

                $('#ulSiteCountListSingle').html("");
                $('#ulSiteCountListSingle').append(item);
            }
        }

    </script>

    <uc1:wucPopupInfo runat="server" ID="wucPopupInfo" />

</asp:Content>
