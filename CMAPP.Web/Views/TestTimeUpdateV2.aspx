<%@ Page Title="Test Time Update V2" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TestTimeUpdateV2.aspx.vb" Inherits="CMAPP.Web.TestTimeUpdateV2" EnableEventValidation="false" %>
<%@ Register Src="~/Controls/wucPopupInfo.ascx" TagPrefix="uc1" TagName="wucPopupInfo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolKit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <link href="/Content/jqueryui/jquery-ui.css" rel="stylesheet" />

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
            padding:5px;
        }
        .checkbox input[type="checkbox"]{
            float:none;
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

        .row-reset{
            background-color:transparent !important;
            color:#444;
        }

        #tblListing tbody tr:hover{
            background-color:#e6e6e6 !important;
            color:#444;
        }

        .row-selected{
            background-color:#fa3232 !important;
            color:#fff;
        }



    </style>

    <script src="/Scripts/table2excel.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h3>Test Time Update (Version 2)</h3>

    <div class="page-container">

        <div class="row" style="margin-left:1px; margin-right:1px;">
            <div class="col-lg-1 col-md-2">
                <asp:Label Text="text" runat="server" AssociatedControlID="txtProgramID">Program ID</asp:Label>
                <asp:TextBox ID="txtProgramID" runat="server" CssClass="form-control"></asp:TextBox>
                <%--<asp:DropDownList ID="ddlProgramID" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                </asp:DropDownList>--%>
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
                <%--<asp:TextBox ID="txtTester" runat="server" CssClass="form-control"></asp:TextBox>--%>
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
            
            <div class="col-lg-2 col-md-4">
                <ul style="list-style:none; margin:0; padding:0;">
                    <li style="display:inline-block;">
                            <div class="checkbox">
                                <label class="btn btn-default">
                                    <asp:CheckBox ID="chkMaxDate" runat="server" Text=" Max Date" />
                                </label>
                            </div>
  
                    </li>
                    <li style="display:inline-block;">
                        <div class="checkbox">
                            <label class="btn btn-default">
                                <asp:CheckBox ID="chkMaxRev" runat="server" Text=" Max Revision" />
                            </label>
                        </div>  
                        
                    </li>
                </ul>
            </div>
        </div>

        <div class="row" style="margin-left:1px;">
            <div class="col-md-12" style="vertical-align:bottom; line-height:45px;">
                <asp:Button Text="Search" runat="server" ID="btnSearch" CssClass="btn btn-info" OnClick="btnSearch_Click" />
                &nbsp;
                <asp:Button ID="btnExport" runat="server" Text="Export" CssClass="btn btn-success" ForeColor="#ffffff" />
                &nbsp;
                <asp:Button ID="btnNewTestTime" runat="server" Text="New" CssClass="btn btn-primary" Height="35" style="display:inline-block;" />
                &nbsp;
                <%--&nbsp;
                <asp:Button ID="btnNewProgID" runat="server" Text="New Prog ID" CssClass="btn btn-success" ForeColor="#ffffff" />--%>
                <%--&nbsp;
                <asp:Button ID="btnEditTestTime" runat="server" Text="Edit Test Time" CssClass="btn btn-warning" ForeColor="#ffffff" />--%>
                <span id="note1" style="font-weight:bold;font-size:18px; color:red;">Please click on the record to edit</span>
            </div>
        </div>

        <div id="divEdit" style="padding:15px; margin-left:5px; margin-right:5px; min-height:100px; margin-top:5px; margin-bottom:5px; border:1px solid #c3c1c1; border-radius:6px; background-color:#f1f1f1; display:none">

            <div class="row">

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
                    <%--<asp:TextBox ID="txtEditTesterType" runat="server" CssClass="form-control toUppercase"></asp:TextBox>--%>
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
                    <asp:Label runat="server" AssociatedControlID="txtEditOverhead">Overhead</asp:Label><br />
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

            <div class="row" style="margin-top:30px;">

                <ul id="ulSiteCountList" style="list-style:none; display:inline-block; margin:0; padding:0;">
                </ul>

            </div>

            <div class="row">

                <div class="col-md-12" style="margin-top:15px !important;">

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

        <div class="row" style="margin-left:1px; margin-right:1px; clear:both;">

            <div class="col-md-12 col-lg-12">

                <div>
                    
                    <table id="tblListing" class="table table-bordered table-responsive">
                        <thead>
                            <tr style="background-color:#444; color:#fff;">
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>

                </div>

            </div>

        </div>

    </div>

    <script type="text/javascript">

        // global variables
        var gSiteCountList = [];
        var gHideFirstItem = false;

        $('#divSiteCountList').hide();
        $('#<%=btnExport.ClientID%>').hide();
        $('#note1').hide();

        $(document).ready(function () {

            loadProgramIDList();
            loadTesterTypeList();
            loadProgramNameList();
            loadProgramExecList();
            loadDeviceList();
            loadDeviceEditList();

            $('#<%=txtProgramID.ClientID%>').on('blur', function (e) {
                $("#<%=ddlRevision.ClientID%>").val("");
                loadRevision($("#<%=txtProgramID.ClientID%>").val());

                $("#<%=chkMaxRev.ClientID%>").attr('checked', false);
            });

            $("#<%=chkMaxRev.ClientID%>").on('change', function (e) {
                //alert(this.checked);
                $("#<%=ddlRevision.ClientID%>").removeAttr('disabled');
                if (this.checked) {
                    // call ajax and get max revision
                    $.ajax({
                        url: "TestTimeUpdateV2.aspx/GetMaxRevisionByProgID",
                        data: "{ 'testProgID': '" + $('#<%=txtProgramID.ClientID%>').val() + "'}",
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
                            console.log('error: ' + JSON.stringify(a));
                        }
                    });

                } else {
                    $("#<%=ddlRevision.ClientID%>").val("");
                }

            });

            $('#<%=btnNewTestTime.ClientID%>').on('click', function (e) {
                e.preventDefault();
                resetEdit();

                // hide button duplicate and delete for edit
                $('#<%=btnDuplicateTestTime.ClientID%>').hide();
                $('#<%=btnDeleteTestTime.ClientID%>').hide();

                $('#divSiteCountList').show('slow');
                $('#divEdit').show('slow');

                populateSiteCount(true, "SERVER");
            });

            $('#<%=btnDuplicateTestTime.ClientID%>').on('click', function (e) {
                e.preventDefault();
                $(this).val("Duplicated");
                resetEditRemainValue();
            });

            $('#<%=btnSearch.ClientID%>').on('click', function (e) {
                e.preventDefault();

                // call function to reset the textboxes
                resetEdit();

                //close the edit div
                $('#tblListing tbody tr').removeClass("row-selected");
                $('#divSiteCountList').hide('slow');
                $('#divEdit').hide('slow');

                if ($("#<%=txtProgramID.ClientID%>").val().trim() === "" && $("#<%=ddlRevision.ClientID%>").val().trim() === ""
                    && $("#<%=ddlTester.ClientID%>").val().trim() === "" && $("#<%=txtProgramName.ClientID%>").val().trim() === ""
                    && $("#<%=txtProgramExec.ClientID%>").val().trim() === "" && $("#<%=txtDevice.ClientID%>").val().trim() === ""
                    && $("#<%=ddlTemp.ClientID%>").val().trim() === "") {
                    showPopupMessage("Please enter at least one filter to search");
                    return;
                }

                getListing($("#<%=txtProgramID.ClientID%>").val(), $("#<%=ddlRevision.ClientID%>").val(), $('#<%=txtVersion.ClientID%>').val(), $('#<%=ddlTester.ClientID%>').val(), $("#<%=txtProgramName.ClientID%>").val(), $("#<%=txtProgramExec.ClientID%>").val(), $("#<%=txtDevice.ClientID%>").val(), $("#<%=ddlTemp.ClientID%>").val(), $("input[id='<%=chkMaxDate.ClientID%>']:checked").val());
            });

            $('#<%=btnExport.ClientID%>').on('click', function (e) {
                e.preventDefault();
                $("#tblListing").table2excel({
                    filename: "cmtesttime-export.xls"
                });
            });

            $('#<%=btnEditClose.ClientID%>').on('click', function (e) {
                e.preventDefault();

                // call function to reset the textboxes
                resetEdit();

                //close the edit div
                $('#tblListing tbody tr').removeClass("row-selected");
                $('#divSiteCountList').hide('slow');
                $('#divEdit').hide('slow');

            });

            $('#<%=btnEditCalculate.ClientID%>').on('click', function (e) {
                e.preventDefault();

                if ($('#<%=txtEditSiteCount1TestTime.ClientID%>').val() === "" || $('#<%=txtEditOverhead.ClientID%>').val() === "") {
                    showPopupMessage("Please enter X1 Test Time and Overhead value if you want to calculate");
                    return;
                }

                populateSiteCountCalculate();
            });

            $('#<%=btnEditTestTime.ClientID%>').on('click', function (e) {

                e.preventDefault();

                <%--if ($('#<%=txtEditOverhead.ClientID%>').val().trim() !== "" && $('#<%=txtEditSiteCount1TestTime.ClientID%>').val().trim() === "") {
                    showPopupMessage("Please enter Test Time SC1 if you want to calculate using overhead!");
                    return;
                }--%>

                if (gSiteCountList.length === 0) {
                    showPopupMessage("Please select Site Count to update!");
                    return;
                } else {
                    var foundEmpty = false;
                    // check if one of the textbox empty, then alert user
                    $('#ulSiteCountList li').each(function (index) {
                        if ($(this).find("input").val().trim() === "") {
                            foundEmpty = true;
                        }
                    });
                }

                if (foundEmpty) {
                    showPopupMessage("Test time can't be blank, please uncheck at the Site Count");
                    return;
                } else {
                    UpdateTestTime("Single");
                }

            }); // end of btnEditTestTime click

            $("#MainContent_cblSiteCount input").on('change', function () {
                gSiteCountList = [];
                $("[id*=<%=cblSiteCount.ClientID%>] input:checked").each(function () {
                    var data = { label: "X" + $(this).val(), labelValue: $(this).val(), value: "0.00" };
                    gSiteCountList.push(data);
                });

                populateSiteCount(false, "LOCAL");
                //populateSiteCountCalculate();
            });

            $('#<%=btnDeleteTestTime.ClientID%>').on('click', function (e) {
                e.preventDefault();

                $.confirm({
                    title: 'Delete confirmation',
                    content: 'Are you sure to delete?',
                    buttons: {
                        cancel: function () {
                        },
                        confirm: {
                            text: 'Confirm',
                            btnClass: 'btn-blue',
                            keys: ['enter', 'shift'],
                            action: function () {

                                // call ajax and update database
                                $.ajax({
                                    url: "TestTimeUpdateV2.aspx/DeleteTestTime",
                                    data: "{ 'testProgID': '" + $("#<%=txtEditProgramID.ClientID%>").val() + "', 'rev': '" + $("#<%=txtEditRevision.ClientID%>").val() + "', 'testerType': '" + $("#<%=ddlTesterEdit.ClientID%>").val() + "', 'progName': '" + $("#<%=txtEditProgName.ClientID%>").val() + "', 'programExec': '" + $("#<%=txtEditProgExec.ClientID%>").val() + "', 'device': '" + $("#<%=txtEditDevice.ClientID%>").val() + "', 'temp': '" + $("#<%=ddlTempEdit.ClientID%>").val() + "', 'effDate': '" + $("#<%=txtEditEffDate.ClientID%>").val() + "', 'overhead': '" + $("#<%=txtEditOverhead.ClientID%>").val() + "'}",
                                dataType: "json",
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                success: function (data) {

                                    resetEdit();
                                    $('#tblListing tbody tr').removeClass("row-selected");
                                    $('#divSiteCountList').hide('slow');
                                    $('#divEdit').hide('slow');

                                    getListing($("#<%=txtProgramID.ClientID%>").val(), $("#<%=ddlRevision.ClientID%>").val(), $('#<%=txtVersion.ClientID%>').val(), $('#<%=ddlTester.ClientID%>').val(), $("#<%=txtProgramName.ClientID%>").val(), $("#<%=txtProgramExec.ClientID%>").val(), $("#<%=txtDevice.ClientID%>").val(), $("#<%=ddlTemp.ClientID%>").val(), $("input[id='<%=chkMaxDate.ClientID%>']:checked").val());
                                },
                                beforeSend: function (request) {
                                    HoldOn.open({ theme: "sk-rect" });
                                }
                                , complete: function () {
                                    HoldOn.close();
                                },
                                error: function (a, b, c) {
                                    console.log('error: ' + JSON.stringify(a));
                                }
                            });

                        } // end of action 
                    } // end of confirm
                } // end of button
                }); // end of confirm

            });

            //convert to upper case
            $('.toUppercase').on('keyup', function (e) {
                $(this).val(($(this).val()).toUpperCase());
            });

            //allow only AtoZ
            $('#<%=txtEditRevision.ClientID%>').keypress(function (key) {
                if (key.charCode < 64 || key.charCode > 90) return false;
            });
            

        }); // end of document ready 

        function UpdateTestTime(_updateType) {

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
                            var dataItem = { label: "X1", labelValue: "1", value: $("#<%=txtEditSiteCount1TestTime.ClientID%>").val() };
                            gSiteCountList.push(dataItem);

                            // loop the input in the site count list
                            $('#ulSiteCountList li').each(function (index) {

                                //alert($(this).find("input").val());
                                //update the json object (user might change the value manually)
                                if (gHideFirstItem)
                                    gSiteCountList[index + 1].value = $(this).find("input").val(); // index + 1 because first item (1) has been hide
                                else
                                    gSiteCountList[index].value = $(this).find("input").val();
                            });

                            // call ajax and update database
                            $.ajax({
                                url: "TestTimeUpdateV2.aspx/UpdateTestTime",
                                data: "{ 'testProgID': '" + $("#<%=txtEditProgramID.ClientID%>").val() + "', 'rev': '" + $("#<%=txtEditRevision.ClientID%>").val() + "', 'testerType': '" + $("#<%=ddlTesterEdit.ClientID%>").val() + "', 'progName': '" + $("#<%=txtEditProgName.ClientID%>").val() + "', 'programExec': '" + $("#<%=txtEditProgExec.ClientID%>").val() + "', 'device': '" + $("#<%=txtEditDevice.ClientID%>").val() + "', 'temp': '" + $("#<%=ddlTempEdit.ClientID%>").val() + "', 'effDate': '" + $("#<%=txtEditEffDate.ClientID%>").val() + "', 'siteCountList': '" + JSON.stringify(gSiteCountList) + "', 'overhead': '" + $("#<%=txtEditOverhead.ClientID%>").val() + "', 'updateType': '" + _updateType + "'}",
                                dataType: "json",
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                success: function (data) {

                                    resetEdit();
                                    $('#tblListing tbody tr').removeClass("row-selected");
                                    $('#divSiteCountList').hide('slow');
                                    $('#divEdit').hide('slow');

                                    getListing($("#<%=txtProgramID.ClientID%>").val(), $("#<%=ddlRevision.ClientID%>").val(), $('#<%=txtVersion.ClientID%>').val(), $('#<%=ddlTester.ClientID%>').val(), $("#<%=txtProgramName.ClientID%>").val(), $("#<%=txtProgramExec.ClientID%>").val(), $("#<%=txtDevice.ClientID%>").val(), $("#<%=ddlTemp.ClientID%>").val(), $("input[id='<%=chkMaxDate.ClientID%>']:checked").val());
                                },
                                beforeSend: function (request) {
                                    HoldOn.open({ theme: "sk-rect" });
                                }
                                , complete: function () {
                                    HoldOn.close();
                                },
                                error: function (a, b, c) {
                                    console.log('error: ' + JSON.stringify(a));
                                }
                            });

                        } // end of action 
                    } // end of confirm
                } // end of button
            }); // end of confirm
        }

        function populateSiteCountCalculate() {

            gHideFirstItem = false;

            if (gSiteCountList.length > 0) {

                var item = "";

                $.each(gSiteCountList, function (key, val) {

                    // use the formula
                    if ($('#<%=txtEditOverhead.ClientID%>').val() !== "" && $('#<%=txtEditSiteCount1TestTime.ClientID%>').val() !== "") {

                        var scValue = parseFloat($('#<%=txtEditSiteCount1TestTime.ClientID%>').val()) + ((parseFloat($('#<%=txtEditOverhead.ClientID%>').val()) / 100) * (parseInt(val.labelValue) - 1) * parseFloat($('#<%=txtEditSiteCount1TestTime.ClientID%>').val()));
                        val.value = scValue.toFixed(2);

                    } else {

                        //if (val.labelValue === 1)
                        if ($.trim(val.labelValue) === "1")
                            val.value = $('#<%=txtEditSiteCount1TestTime.ClientID%>').val();
                        else
                            //val.value = "0.00";
                            val.value = "";
                    }

                    var readOnlySC1 = "";

                    if ($.trim(val.labelValue) === "1") {
                        // ignore
                        //gHideFirstItem = true;
                        // readOnlySC1 = "readonly='readonly' ";
                    }

                    item = item + "<li style='display: inline-block; text-align:center; margin:5px;'>" +
                        "<div><label>" + val.label + "</label> " +
                        "<input type='text' class='form-control' value='" + val.value + "' style='width:60px; text-align:center;' " + readOnlySC1 + " /> " +
                        "</div></li>";

                });

                $('#ulSiteCountList').html("");
                $('#ulSiteCountList').append(item);
            }
        }

        function populateSiteCount(_isEmpty, _type) {

            gHideFirstItem = false;

            if (gSiteCountList.length > 0) {

                // alert(gSiteCountList.length);

                var item = "";

                // Call ajax to get list site count
                $.ajax({
                    url: "TestTimeUpdateV2.aspx/GetSelectedSiteCountList",
                    dataType: "json",
                    data: "{ 'testProgID': '" + $('#<%=txtEditProgramID.ClientID%>').val() + "', 'rev': '" + $('#<%=txtEditRevision.ClientID%>').val() + "', 'testerType': '" + $('#<%=ddlTesterEdit.ClientID%>').val() + "', 'progName': '" + $('#<%=txtEditProgName.ClientID%>').val() + "', 'programExec': '" + $('#<%=txtEditProgExec.ClientID%>').val() + "', 'device': '" + $('#<%=txtEditDevice.ClientID%>').val() + "', 'temp': '" + $('#<%=ddlTempEdit.ClientID%>').val() + "', 'effDate': '" + $('#<%=txtEditEffDate.ClientID%>').val() + "'}",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {

                        if (_type === "SERVER") {

                            $("[id*=<%=cblSiteCount.ClientID%>] input").each(function () {
                                this.checked = false;
                            });

                            gSiteCountList = [];
                            $.each(JSON.parse(data.d), function (key, val) {
                                var dataItem = { label: "X" + val.SITECOUNT, labelValue: val.SITECOUNT, value: "0.00" };
                                gSiteCountList.push(dataItem);
                            });

                            var found = 0;
                            //set default checked
                            $("[id*=<%=cblSiteCount.ClientID%>] input").each(function () {
                                if (getObjects(gSiteCountList, 'labelValue', $(this).val()).length > 0) {
                                    this.checked = true;
                                    found++;
                                }
                            });

                        } // end if _type

                        

                        $.each(gSiteCountList, function (key, val) {

                            var savedValue = "";
                            if (JSON.parse(data.d).length > 0) {
                                $.each(JSON.parse(data.d), function (subKey, subVal) {  
                                    //alert("subVal.SITECOUNT, val.labelValue: " + subVal.SITECOUNT + ", " + val.labelValue)
                                    if ($.trim(subVal.SITECOUNT) === $.trim(val.labelValue)) {
                                        savedValue = subVal.TESTTIME;
                                        return false;
                                    }
                                });
                            }

                            //alert("savedValue: " + savedValue);

                            if (savedValue === null)
                                savedValue = "";

                            //if (val.labelValue === 1)
                            if ($.trim(val.labelValue) === "1")
                                val.value = $('#<%=txtEditSiteCount1TestTime.ClientID%>').val();
                            else
                                //val.value = "0.00";
                                val.value = savedValue;

                            if (_isEmpty) {
                                val.value = "";
                            }

                            var readOnlySC1 = "";

                            if ($.trim(val.labelValue) === "1") {
                                //readOnlySC1 = "readonly='readonly' ";
                            }

                            item = item + "<li style='display: inline-block; text-align:center; margin:5px;'>" +
                                "<div><label>" + val.label + "</label> " +
                                "<input type='text' class='form-control' value='" + val.value + "' style='width:60px; text-align:center;' " + readOnlySC1 + " /> " +
                                "</div></li>";

                        });

                        $('#ulSiteCountList').html("");
                        $('#ulSiteCountList').append(item);
                    },
                    error: function (a, b, c) {
                        console.log('error: ' + JSON.stringify(a));
                    }
                });
            }
        }

        function populateSiteCountLocal(_isEmpty) {

            gHideFirstItem = false;

            if (gSiteCountList.length > 0) {

                // alert(gSiteCountList.length);

                var item = "";

                $.each(gSiteCountList, function (key, val) {

                    if ($.trim(val.labelValue) === "1")
                        val.value = $('#<%=txtEditSiteCount1TestTime.ClientID%>').val();
                    else
                        val.value = "0.00";
                        //val.value = savedValue;

                    if (_isEmpty) {
                        val.value = "";
                    }

                    var readOnlySC1 = "";

                    if ($.trim(val.labelValue) === "1") {
                        //readOnlySC1 = "readonly='readonly' ";
                    }

                    item = item + "<li style='display: inline-block; text-align:center; margin:5px;'>" +
                        "<div><label>" + val.label + "</label> " +
                        "<input type='text' class='form-control' value='" + val.value + "' style='width:60px; text-align:center;' " + readOnlySC1 + " /> " +
                        "</div></li>";

                });

                $('#ulSiteCountList').html("");
                $('#ulSiteCountList').append(item);
            }
        }

        function getListing(_testProgID, _rev, _ver, _testerType, _progName, _progExec, _device, _temp, _maxDate) {

            // Call ajax to get distinct value of site count for the selected filters
            // once returned, loop and assing the site count to gSiteCountList then only call get listing function

            // clear the table
            $('#tblListing thead tr').html("");
            $('#tblListing tbody').html("");


            $.ajax({
                url: "TestTimeUpdateV2.aspx/GetSiteCountListByFilter",
                data: "{ 'testProgID': '" + _testProgID + "', 'rev': '" + _rev + "', 'testerType': '" + _testerType + "', 'progName': '" + _progName + "', 'programExec': '" + _progExec + "', 'device': '" + _device + "', 'temp': '" + _temp + "'}",
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
                        url: "TestTimeUpdateV2.aspx/GetListing",
                        data: "{ 'testProgID': '" + _testProgID + "', 'rev': '" + _rev + "', 'ver': '" + _ver + "', 'testerType': '" + _testerType + "', 'progName': '" + _progName + "', 'progExec': '" + _progExec + "', 'device': '" + _device + "', 'temp': '" + _temp + "', 'maxDate': '" + _maxDate + "', 'siteCountList': '" + JSON.stringify(gSiteCountList) + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {

                            if (JSON.parse(data.d).length > 0) {
                                for (var key in JSON.parse(data.d)[0]) {
                                    $('#tblListing thead tr').append("<td>" + key + "</td>");
                                }
                                var row = "";
                                var rowCount = 0;
                                $.each(JSON.parse(data.d), function (key, val) {
                                    //console.log(val);
                                    var rowColor = "transparent";
                                    if (rowCount % 2 === 0)
                                        rowColor = "#fff";

                                    row = row + "<tr style='cursor:pointer; background-color:" + rowColor + "' onclick='selectRow(this, \"" + val["Program ID"] + "\", \"" + val["Revision"] + "\", \"" + val["Tester Type"] + "\", \"" + val["Program Source"] + "\", \"" + val["Program Exec"] + "\", \"" + val["Device"] + "\", \"" + val["Temp"] + "\", \"" + val["Eff Date"] + "\", \"" + val["Overhead"] + "\")'>";
                                    // row = row + '<tr style="cursor:pointer; background-color:' + rowColor + '" onclick="selectRow2(this, ' + JSON.parse(val) + ')">';
                                    $.each(val, function (_, text) {
                                        row = row + "<td>" + ((text === null) ? "" : text) + "</td>";
                                    });
                                    row = row + "</tr>";

                                    rowCount++;
                                });
                                $('#tblListing tbody').append(row);

                                $('#<%=btnExport.ClientID%>').show('slow');
                                $('#note1').show('slow');

                            } else {
                                showPopupMessage("No data found!");
                                $('#<%=btnExport.ClientID%>').hide();
                                $('#note1').hide();
                            }

                            $("[id*=<%=cblSiteCount.ClientID%>] input").each(function () {
                                this.checked = false;
                            });

                            var found = 0;
                            //set default checked
                            $("[id*=<%=cblSiteCount.ClientID%>] input").each(function () {
                                //if ($(this).val() === "1" || $(this).val() === "2" || $(this).val() === "3" || $(this).val() === "4" || $(this).val() === "8")
                                //    this.checked = true;

                                ////if (gSiteCountList.length > 0) {
                                //    if (jQuery.inArray($(this).val(), gSiteCountList) >= 0) {
                                //        this.checked = true;
                                //        found++;
                                //    }

                                ////};

                                if (getObjects(gSiteCountList, 'labelValue', $(this).val()).length > 0) {
                                    this.checked = true;
                                    found++;
                                }

                            });

                            //alert('found: ' + found + ', gSiteCountList: ' + JSON.stringify(gSiteCountList));

                        }
                        //,
                        //beforeSend: function (request) {
                        //    HoldOn.open({ theme: "sk-rect" });
                        //}
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
                //, complete: function () {
                //    HoldOn.close();
                //},
                , error: function (a, b, c) {
                    console.log('error: ' + JSON.stringify(a));
                }
            });   
        }

        function selectRow(obj, _testProgID, _rev, _testerType, _progName, _progExec, _device, _temp, _effDate, _overhead) {
            $(obj).parent().children('tr').removeClass("row-selected");
            $(obj).closest('tr').addClass("row-selected");

            $('#<%=txtEditProgramID.ClientID%>').val(_testProgID);
            $('#<%=txtEditProgramID.ClientID%>').attr('readonly', 'readonly');
            $('#<%=txtEditRevision.ClientID%>').val(_rev);
            $('#<%=txtEditRevision.ClientID%>').attr('readonly', 'readonly');
            $('#<%=ddlTesterEdit.ClientID%>').val(_testerType);
            $('#<%=ddlTesterEdit.ClientID%>').attr('readonly', 'readonly');
            $('#<%=txtEditVersion.ClientID%>').val("0");
            $('#<%=txtEditVersion.ClientID%>').attr('readonly', 'readonly');

            $('#<%=txtEditProgName.ClientID%>').val(_progName);
            $('#<%=txtEditProgName.ClientID%>').attr('readonly', 'readonly');
            $('#<%=txtEditProgExec.ClientID%>').val(_progExec);
            $('#<%=txtEditProgExec.ClientID%>').attr('readonly', 'readonly');
            $('#<%=txtEditDevice.ClientID%>').val(_device);
            $('#<%=txtEditDevice.ClientID%>').attr('readonly', 'readonly');
            $('#<%=ddlTempEdit.ClientID%>').val(_temp);
            $('#<%=ddlTempEdit.ClientID%>').attr('readonly', 'readonly');
            $('#<%=txtEditEffDate.ClientID%>').val(_effDate);
            $('#<%=txtEditEffDate.ClientID%>').attr('readonly', 'readonly');
            $('#<%=txtEditOverhead.ClientID%>').val((_overhead === "null" || _overhead === null) ? "" : _overhead);

            $('#<%=txtEditSiteCount1TestTime.ClientID%>').val("");
            
            // call ajax and get the site count 1 test time
            getSiteCount1TestTime(_testProgID, _rev, _testerType, _progName, _progExec, _device, _temp, _effDate);

            $('#divSiteCountList').show('slow');
            $('#divEdit').show('slow');

            // hide button duplicate and delete for edit
            $('#<%=btnDuplicateTestTime.ClientID%>').show();
            $('#<%=btnDeleteTestTime.ClientID%>').show();
        }

        function resetEdit() {
            
            $('#<%=txtEditProgramID.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditProgramID.ClientID%>').val("");
            $('#<%=txtEditRevision.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditRevision.ClientID%>').val("");
            $('#<%=ddlTesterEdit.ClientID%>').removeAttr('readonly');
            $('#<%=ddlTesterEdit.ClientID%>').val("");
            $('#<%=txtEditVersion.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditVersion.ClientID%>').val("");

            $('#<%=txtEditProgName.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditProgName.ClientID%>').val("");
            $('#<%=txtEditProgExec.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditProgExec.ClientID%>').val("");
            $('#<%=txtEditDevice.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditDevice.ClientID%>').val("");
            $('#<%=ddlTempEdit.ClientID%>').removeAttr('readonly');
            $('#<%=ddlTempEdit.ClientID%>').val("");
            $('#<%=txtEditEffDate.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditEffDate.ClientID%>').val("");

            $('#<%=txtEditSiteCount1TestTime.ClientID%>').val("");

            $('#<%=txtEditOverhead.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditOverhead.ClientID%>').val("");
        }

        function resetEditRemainValue() {
            $('#<%=txtEditProgramID.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditRevision.ClientID%>').removeAttr('readonly');
            $('#<%=ddlTesterEdit.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditVersion.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditProgName.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditProgExec.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditDevice.ClientID%>').removeAttr('readonly');
            $('#<%=ddlTempEdit.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditEffDate.ClientID%>').removeAttr('readonly');
            $('#<%=txtEditOverhead.ClientID%>').removeAttr('readonly');
        }

        function loadProgramIDList() {

            $("#<%=txtProgramID.ClientID%>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "TestTimeUpdateV2.aspx/GetTestProgramIDList",
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

        function loadTesterTypeList() {

            <%--$("#<%=txtTester.ClientID%>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "TestTimeUpdateV2.aspx/GetTestTypeList",
                        data: "{ 'q': '" + $("#<%=txtTester.ClientID%>").val() + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {

                            //if (JSON.parse(data.d).length > 0) {
                            //    response($.map(JSON.parse(data.d), function (item) {
                            //        return {
                            //            label: item.TESTPROGMAINSOURCE,
                            //            value: item.TESTPROGMAINSOURCE
                            //        }
                            //    }));
                            //}
                        },
                        error: function (a, b, c) {
                            console.log('error: ' + JSON.stringify(a));
                        }
                    });
                },
                minLength: 2,
                select: function (event, ui) {
                }
            });--%>

        }

        function loadProgramNameList() {
            $("#<%=txtProgramName.ClientID%>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "TestTimeUpdateV2.aspx/GetTestProgramNameList",
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
                        url: "TestTimeUpdateV2.aspx/GetTestProgramExecList",
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
                        url: "TestTimeUpdateV2.aspx/GetDeviceList",
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

        function loadDeviceEditList() {
            // TODO
            $("#<%=txtEditDevice.ClientID%>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "TestTimeUpdateV2.aspx/GetDeviceList",
                        data: "{ 'q': '" + $("#<%=txtEditDevice.ClientID%>").val() + "'}",
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

        function loadRevision(_testProgID) {

            $("#<%=ddlRevision.ClientID%>").attr('disabled', true);

            $.ajax({
                url: "TestTimeUpdateV2.aspx/GetRevisionByProgID",
                data: "{ 'testProgID': '" + _testProgID + "'}",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    //console.log(JSON.parse(data.d).length);

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

        function getSiteCount1TestTime(_testProgID, _rev, _testerType, _progName, _programExec, _device, _temp, _effDate) {
            $.ajax({
                url: "TestTimeUpdateV2.aspx/GetSiteCount1TestTime",
                data: "{ 'testProgID': '" + _testProgID + "', 'rev': '" + _rev + "', 'testerType': '" + _testerType + "', 'progName': '" + _progName + "', 'programExec': '" + _programExec + "', 'device': '" + _device + "', 'temp': '" + _temp + "', 'effDate': '" + _effDate + "'}",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    if (JSON.parse(data.d).length > 0) {
                        var sc1TT = JSON.parse(data.d)[0].TESTTIME;
                        $('#<%=txtEditSiteCount1TestTime.ClientID%>').val(sc1TT);
                    }

                    // populate site count list
                    populateSiteCount(false, "SERVER");
                },
                error: function (a, b, c) {
                    console.log('error: ' + JSON.stringify(a));
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

    </script>

    <uc1:wucPopupInfo runat="server" ID="wucPopupInfo" />

</asp:Content>
