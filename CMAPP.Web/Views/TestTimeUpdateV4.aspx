<%@ Page Title="Test Time Update V3" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TestTimeUpdateV4.aspx.vb" Inherits="CMAPP.Web.TestTimeUpdateV4" EnableEventValidation="false" %>
<%@ Register Src="~/Controls/wucPopupInfo.ascx" TagPrefix="uc1" TagName="wucPopupInfo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolKit" %>
<%@ Register Src="~/Controls/wucCMAPPEdit.ascx" TagPrefix="uc1" TagName="wucCMAPPEdit" %>


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

        .paging{
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
            color:#000000 !important;
        }

    </style>
    <%--<link href="/Content/jquery.dynatable.css" rel="stylesheet" />--%>
    <%--<link href="/Content/datatables.min.css" rel="stylesheet" />--%>

    <script src="/Scripts/table2excel.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-container" >

        <h3>Test Time Update (Version 3)</h3>

        <div class="" style=" padding-top:5px;">

            <div class="row" style="margin-left:1px; margin-right:1px;">
                <div class="col-lg-1 col-md-2">
                    <asp:Label Text="text" runat="server" AssociatedControlID="ddlTestSite">Test Site</asp:Label>
                    <asp:DropDownList ID="ddlTestSite" runat="server" CssClass="form-control" AppendDataBoundItems="true">
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
                    <ul style="list-style:none; margin:0; padding:0;">
                        <li style="display:inline-block; line-height: 55px;">
                                <div class="checkbox">
                                    <label class="btn btn-default">
                                        <asp:CheckBox ID="chkMaxDate" runat="server" Text=" Max Date" />
                                    </label>
                                </div>
  
                        </li>
                        <li style="display:inline-block; line-height: 55px;">
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
                    <asp:Button ID="btnEditMultiTestTime" runat="server" Text="Edit" CssClass="btn btn-warning" ForeColor="#ffffff" style="display:none;" />
                    <span id="note1" style="font-weight:bold;font-size:18px; color:red;">Please click on the record to edit</span>
                </div>
            </div>

        </div>

        <div class="row" style="margin-left:1px; margin-right:1px; clear:both;">

            <br />
            <div id="divTablePaging" class="col-md-12">
                <ul id="ulTablePaging" class="paging"></ul>
            </div>

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

    <!-- Modal -->
    <uc1:wucCMAPPEdit runat="server" id="wucCMAPPEdit" />

    <script type="text/javascript">

        // global variables
        var gSiteCountList = [];
        var gHideFirstItem = false;

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

        $('#divSiteCountList').hide();
        $('#<%=btnExport.ClientID%>').hide();
        $('#note1').hide();

        $(document).ready(function () {

            loadRevision();
            loadProgramIDList();
            loadProgramNameList();
            loadProgramExecList();
            loadDeviceList();

            //Auto upper case on typing
            $('#<%=txtProgramID.ClientID%>').keyup(function(){
                $(this).val($(this).val().toUpperCase());
            });
            $('#<%=txtProgramName.ClientID%>').keyup(function(){
                $(this).val($(this).val().toUpperCase());
            });
            $('#<%=txtProgramExec.ClientID%>').keyup(function(){
                $(this).val($(this).val().toUpperCase());
            });
            $('#<%=txtVersion.ClientID%>').keyup(function(){
                $(this).val($(this).val().toUpperCase());
            });
            $('#<%=txtDevice.ClientID%>').keyup(function(){
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
                        url: "TestTimeUpdateV3.aspx/GetMaxRevisionByFilterList",
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
                $("#tblListing").table2excel({
                    filename: "cmtesttime-export.xls"
                });
            });

            // Edit multiple click
            $('#<%=btnEditMultiTestTime.ClientID%>').on('click', function (e) {

                e.preventDefault();

                //

                //Show the modal
                $('#modalEditMulti').modal();

            });

            //convert to upper case
            $('.toUppercase').on('keyup', function (e) {
                $(this).val(($(this).val()).toUpperCase());
            });

        }); // end of document ready 

        function changePage(_page) {
            gCurrentPage = _page;
            displayReport(gData);
        } 

        function displayPaging() {

            $('#ulTablePaging').empty();

            gStartPaging = 1 + gNext;
            gCurrentPage = gStartPaging;

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

                    var rowID = val["Test Site"] + "_" + val["Program ID"] + "_" + val["Revision"] + "_" + val["Tester Type"] + "_" + val["Program Source"] + "_" + val["Program Exec"] + "_" + val["Device"] + "_" + val["Temp"];

                    //row = row + "<tr id='" + rowID + "' class='" + ((gSelectedRowID === rowID) ? "row-selected" : "") + "' style='cursor:pointer; background-color:" + rowColor + "' onclick='selectRow(this, \"" + val["Test Site"] + "\", \"" + val["Program ID"] + "\", \"" + val["Revision"] + "\", \"" + val["Tester Type"] + "\", \"" + val["Program Source"] + "\", \"" + val["Program Exec"] + "\", \"" + val["Device"] + "\", \"" + val["Temp"] + "\", \"" + val["Eff Date"] + "\", \"" + val["Overhead"] + "\")'>";
                    row = row + "<tr id='" + rowID + "' class='" + ((gSelectedRowID === rowID) ? "row-selected" : "") + "' style='cursor:pointer; background-color:" + rowColor + "'>";

                    // Add a checkbox
                    row = row + "<td><input type='checkbox' id='chk_" + rowID + "' onclick='selectRow(this);' /></td>";

                    $.each(val, function (_, text) {
                        row = row + "<td>" + ((text === null) ? "" : text) + "</td>";
                    });
                    row = row + "</tr>";

                }

                rowCount++;
            });
            $('#tblListing tbody').append(row);
        }

        function selectRow(obj) {

            if ($(obj).is(':checked')) {
                gTotalCheck++;
                $(obj).closest('tr').addClass("row-selected");
            } else {
                gTotalCheck--;
                $(obj).closest('tr').removeClass("row-selected");
            }

            showEditButton();
        }

        function showEditButton() {

            if (gTotalCheck > 0) {
                $('#<%=btnEditMultiTestTime.ClientID%>').show('slow');
            } else {
                $('#<%=btnEditMultiTestTime.ClientID%>').hide('slow');
            }
        }

        function loadProgramIDList() {

            $("#<%=txtProgramID.ClientID%>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "TestTimeUpdateV3.aspx/GetTestProgramIDList",
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
                        url: "TestTimeUpdateV3.aspx/GetTestProgramNameList",
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
                        url: "TestTimeUpdateV3.aspx/GetTestProgramExecList",
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
                        url: "TestTimeUpdateV3.aspx/GetDeviceList",
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
                url: "TestTimeUpdateV3.aspx/GetRevisionList",
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
                url: "TestTimeUpdateV4.aspx/GetSiteCountListByFilter",
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
                        url: "TestTimeUpdateV4.aspx/GetListing",
                        data: "{ 'testSite': '" + _testSite + "', 'testProgID': '" + _testProgID + "', 'rev': '" + _rev + "', 'ver': '" + _ver + "', 'testerType': '" + _testerType + "', 'progName': '" + _progName + "', 'progExec': '" + _progExec + "', 'device': '" + _device + "', 'temp': '" + _temp + "', 'maxDate': '" + _maxDate + "', 'siteCountList': '" + JSON.stringify(gSiteCountList) + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {

                            // gDataList = JSON.parse(data.d);
                            gNext = 0;
                            gCurrentPage = 1;
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

                                for (var key in JSON.parse(data.d)[0]) {
                                    $('#tblListing thead tr').append("<td>" + key + "</td>");
                                }

                                displayReport(gData);

                                $('#<%=btnExport.ClientID%>').show('slow');
                                $('#note1').show('slow');

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

    </script>

    <uc1:wucPopupInfo runat="server" ID="wucPopupInfo" />

</asp:Content>
