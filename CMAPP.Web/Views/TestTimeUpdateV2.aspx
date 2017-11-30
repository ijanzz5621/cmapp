<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TestTimeUpdateV2.aspx.vb" Inherits="CMAPP.Web.TestTimeUpdateV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <input id="autocomplete" class="form-control" />

    <br />
    <input id="seed_one" type="text" name="seed_one"  class="form-control"/>

    <script type="text/javascript">

        var data = ["Boston Celtics", "Chicago Bulls", "Miami Heat", "Orlando Magic", "Atlanta Hawks", "Philadelphia Sixers", "New York Knicks", "Indiana Pacers", "Charlotte Bobcats", "Milwaukee Bucks", "Detroit Pistons", "New Jersey Nets", "Toronto Raptors", "Washington Wizards", "Cleveland Cavaliers"];
        $("#seed_one").autocomplete({ source: data });

        $(document).ready(function () {

            ShowCurrentTime();

            $("#autocomplete").autocomplete({
                source: function(request, response) {
                    $.ajax({
                        url: "TestTimeUpdateV2.aspx/GetTestProgramIDList",
                        data: "{ 'q': 'test'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function(data) {
                            //response($.map(data.d, function(item) {
                            //    return {
                            //        label: item.ScreeningValue,
                            //        value: item.ScreeningPropertyID
                            //    }
                            //}))
                        },
                        error: function(a, b, c) {
                        
                        }
                    });
                },
                //source: data,
                minLength: 2
            });



        });

        function ShowCurrentTime() {
            alert('ShowCurrentTime');
            $.ajax({
                type: "POST",
                url: "TestTimeUpdateV2.aspx/GetCurrentTime",
                data: '{name: "' + $("#autocomplete").val() + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess
                //, failure: function (response) {
                //    alert(response.d);
                //}
            });
        }
        function OnSuccess(response) {
            alert(response.d);
        }
    </script>

</asp:Content>
