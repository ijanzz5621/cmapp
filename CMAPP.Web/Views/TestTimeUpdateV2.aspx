<%@ Page Title="Test Time Update V2" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TestTimeUpdateV2.aspx.vb" Inherits="CMAPP.Web.TestTimeUpdateV2" EnableEventValidation="false" %>
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
            padding-left: 5px;
            padding-right: 5px;
        }


    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h3>Test Time Update (Version 2)</h3>

    <div class="page-container">

        <div class="row" style="margin-left:1px;">
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
                                <asp:CheckBox ID="chkMaxRev" runat="server" Text=" Max Revision" />
                            </label>
                        </div>  
                        
                    </li>
                </ul>
            </div>
        </div>

        <div class="row" style="margin-left:1px; margin-right:1px;">

            <div class="col-md-12 col-lg-12">

                <div style="width:100%; overflow-x:scroll">
                    <asp:CheckBoxList ID="cblSiteCount" runat="server" RepeatDirection="Horizontal" style="overflow: auto;">
                    </asp:CheckBoxList>
                </div>

            </div>

        </div>

        <div class="row" style="margin-left:1px;">
            <div class="col-md-6" style="vertical-align:bottom; line-height:45px;">
                    <asp:Button Text="Search" runat="server" ID="btnSearch" CssClass="btn btn-info" OnClick="btnSearch_Click" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnNewProgID" runat="server" Text="New Prog ID" CssClass="btn btn-success" ForeColor="#ffffff" />
                    &nbsp;
                    <asp:Button ID="btnEditTestTime" runat="server" Text="Edit Test Time" CssClass="btn btn-warning" ForeColor="#ffffff" />
            </div>
        </div>

        <div class="row" style="margin-left:1px; margin-right:1px;">

            <div class="col-md-12 col-lg-12">

                <div>
                    
                    <table id="tblListing" class="table table-bordered table-responsive">
                    </table>

                </div>

            </div>

        </div>

    </div>

    <script type="text/javascript">

        $(document).ready(function () {

            loadProgramIDList();
            loadProgramNameList();
            loadProgramExecList();
            loadDeviceList();

            $('#<%=txtProgramID.ClientID%>').on('blur', function (e) {
                loadRevision($("#<%=txtProgramID.ClientID%>").val());
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
                }

            });

            $('#<%=btnSearch.ClientID%>').on('click', function (e) {
                e.preventDefault();
                //alert('Searching...');

                getListing($("#<%=txtProgramID.ClientID%>").val(), $("#<%=ddlRevision.ClientID%>").val(), $('#<%=txtVersion.ClientID%>').val(), $("#<%=txtProgramName.ClientID%>").val(), $("#<%=txtProgramExec.ClientID%>").val(), $("#<%=txtDevice.ClientID%>").val(), $("#<%=ddlTemp.ClientID%>").val(), $("#<%=chkMaxRev.ClientID%>").val());

            });

        });

        function getListing(_testProgID, _rev, _ver, _progName, _progExec, _device, _temp, _maxDate) {

            var _siteCountList = "";
            $("[id*=<%=cblSiteCount.ClientID%>] input:checked").each(function () {
                //if (selectedValues == "") {
                //    selectedValues = "Selected Values:\r\n\r\n";
                //}
                _siteCountList += (_siteCountList === "") ? $(this).val() : "," + $(this).val();
            });
            if (_siteCountList != "") {
                alert(_siteCountList);
            } else {
                alert("No item has been selected.");
            }

            $.ajax({
                url: "TestTimeUpdateV2.aspx/GetListing",
                data: "{ 'testProgID': '" + _testProgID + "', 'rev': '" + _rev + "', 'ver': '" + _ver + "', 'progName': '" + _progName + "', 'progExec': '" + _progExec + "', 'device': '" + _device + "', 'temp': '" + _temp + "', 'maxDate': '" + _maxDate + "', 'siteCountList': '" + _siteCountList + "'}",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    //alert(data.d);

                    // clear the table
                    $('#tblListing').html("");

                    if (JSON.parse(data.d).length > 0) {

                        // build the table header
                        // loop the header

                        $('#tblListing').append("<thead><tr>");

                        for (var key in JSON.parse(data.d)[0]) {
                            $('#tblListing').append("<td>" + key + "</td>");
                        }
                        $('#tblListing').append("</tr></thead>");

                        //$('#tblListing').append("<tbody>");
                        //$.each(JSON.parse(data.d), function (key, val) {

                        //    $('#tblListing').append("<tr><td>" + val + "</td></tr>");

                        //});
                        //$('#tblListing').append("</tbody>");

                        

                    }

                },
                error: function (a, b, c) {
                    console.log('error: ' + JSON.stringify(a));
                }
            });
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

                            console.log(JSON.parse(data.d).length);

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
                 minLength: 4,
                 select: function (event, ui) {
                 }
             });

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

                            console.log(JSON.parse(data.d).length);

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
                minLength: 4,
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

                            console.log(JSON.parse(data.d).length);

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
                minLength: 4,
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

                            console.log(JSON.parse(data.d).length);

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
                minLength: 4,
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

                    console.log(JSON.parse(data.d).length);

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

    </script>

</asp:Content>
