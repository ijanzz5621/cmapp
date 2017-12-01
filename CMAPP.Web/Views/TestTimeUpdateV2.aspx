<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TestTimeUpdateV2.aspx.vb" Inherits="CMAPP.Web.TestTimeUpdateV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <input id="autocomplete" class="form-control" />

    <script type="text/javascript">

        $(document).ready(function () {

            ShowCurrentTime();

            $("#autocomplete").autocomplete({
                source: function(request, response) {
                    $.ajax({
                        url: "TestTimeUpdateV2.aspx/GetTestProgramIDList",
                        data: "{ 'q': '" + $('#autocomplete').val() + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {

                            console.log(JSON.parse(data.d).length);

                            if (JSON.parse(data.d).length > 0) {
                                response($.map(JSON.parse(data.d), function (item) {
                                    //console.log(item);
                                    return {
                                        label: item.TESTPROGID,
                                        value: item.TESTPROGID
                                    }
                                }));
                            }
                        },
                        error: function(a, b, c) {
                            console.log('error: ' + JSON.stringify(a));
                        }
                    });
                },

                minLength: 4
            });



        });

    </script>

</asp:Content>
