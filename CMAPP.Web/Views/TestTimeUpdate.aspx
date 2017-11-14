<%@ Page Title="Test Time Update" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TestTimeUpdate.aspx.vb" Inherits="CMAPP.Web.TestTimeUpdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3>Test Time Update</h3>

    <%--<table class="table table-bordered table-responsive table-striped">
        <thead>
            <tr>
                <td>Test Program ID</td>
                <td>Rev</td>
                <td>Tester Type</td>
                <td>Program Name</td>
                <td>Program Exec</td>
                <td>Device</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
    </table>--%>

    <div class="row">
        <div class="col-lg-1 col-md-2">
            <asp:Label Text="text" runat="server" AssociatedControlID="txtProgramID">Program ID</asp:Label>
            <asp:TextBox runat="server" CssClass="form-control" ID="txtProgramID" />
        </div>
        <div class="col-lg-1 col-md-2">
            <asp:Label Text="text" runat="server" AssociatedControlID="txtRevision">Revision</asp:Label>
            <asp:TextBox runat="server" CssClass="form-control" ID="txtRevision" />
        </div>
        <div class="col-lg-1 col-md-2">
            <asp:Label Text="text" runat="server" AssociatedControlID="txtVersion">Version</asp:Label>
            <asp:TextBox runat="server" CssClass="form-control" ID="txtVersion" />
        </div>
        <div class="col-lg-2 col-md-3">
            <asp:Label Text="text" runat="server" AssociatedControlID="txtProgramName">Program Name</asp:Label>
            <asp:TextBox runat="server" CssClass="form-control" ID="txtProgramName" />
        </div>
        <div class="col-lg-2 col-md-3">
            <asp:Label Text="text" runat="server" AssociatedControlID="txtProgramExec">Program Exec</asp:Label>
            <asp:TextBox runat="server" CssClass="form-control" ID="txtProgramExec" />
        </div>
        <div class="col-lg-2 col-md-3">
            <asp:Label Text="text" runat="server" AssociatedControlID="txtDevice">Device</asp:Label>
            <asp:TextBox runat="server" CssClass="form-control" ID="txtDevice" />
        </div>
        <div class="col-lg-1 col-md-2">
            <asp:Label Text="text" runat="server" AssociatedControlID="txtTemp">Temp</asp:Label>
            <asp:TextBox runat="server" CssClass="form-control" ID="txtTemp" />
        </div>
        <div class="col-md-3" style="vertical-align:bottom; line-height:70px;">
            <asp:Button Text="Search" runat="server" ID="btnSearch" CssClass="btn btn-info" />
            &nbsp;
            <asp:Button Text="Excel" runat="server" ID="btnExport" CssClass="btn btn-success" />
            &nbsp;
            <asp:Button Text="Delete" runat="server" ID="btnDelete" CssClass="btn btn-danger" />
        </div>
    </div>

    <%--<hr style="padding:0; margin:0;" />--%>

    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gvListing" runat="server" CssClass="table table-responsive table-bordered table-striped" ShowHeaderWhenEmpty="True">
                <Columns>
                    <asp:BoundField DataField="TestProgID" HeaderText="Test Prog ID" />
                    <asp:BoundField DataField="Rev" HeaderText="Rev" />
                    <asp:BoundField DataField="TesterType" HeaderText="Tester Type" />
                    <asp:BoundField DataField="Prog_Name" HeaderText="Program Name" />
                    <asp:BoundField DataField="Prog_Exec" HeaderText="Program Exec" />
                    <asp:BoundField DataField="Device" HeaderText="Device" />
                    <asp:BoundField DataField="Temp" HeaderText="Temp" />
                    <asp:BoundField DataField="EffDate" HeaderText="Effective Date" />
                    <asp:BoundField DataField="Overhead" HeaderText="Overhead (%)" />
                    <asp:BoundField DataField="x1" HeaderText="x1(s)" />
                    <asp:BoundField DataField="x2" HeaderText="x2(s)" />
                    <asp:BoundField DataField="x3" HeaderText="x3(s)" />
                    <asp:BoundField DataField="x4" HeaderText="x4(s)" />
                    <asp:BoundField DataField="x8" HeaderText="x8(s)" />
                </Columns>

            </asp:GridView>
        </div>
    </div>

    <script>

        $(document).ready(function () {

            //alert('page loaded!');

        });

    </script>

</asp:Content>
