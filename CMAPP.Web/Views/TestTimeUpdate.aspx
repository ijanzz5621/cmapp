<%@ Page Title="Test Time Update" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TestTimeUpdate.aspx.vb" Inherits="CMAPP.Web.TestTimeUpdate" %>
<%@ Register Src="~/Controls/wucPopupInfo.ascx" TagPrefix="uc1" TagName="wucPopupInfo" %>
<%@ Register Src="~/Controls/wucTestTime.ascx" TagPrefix="uc1" TagName="wucTestTime" %>


<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">

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
    </style>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3>Test Time Update</h3>

    <div class="page-container">

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

        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="gvListing" runat="server" CssClass="table table-responsive table-bordered" 
                    ShowHeaderWhenEmpty="True"
                    HeaderStyle-BackColor="#1e1e1e" HeaderStyle-ForeColor="#ffffff"
                    AlternatingRowStyle-BackColor="#fafafa"
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

    
    <div class="footer">

        <div>
            <asp:Button ID="btnNewProject" runat="server" Text="New Project" CssClass="btn" Width="120px" BackColor="#ff0000" ForeColor="#ffffff" OnClick="btnNewProject_Click" />
            <asp:Button ID="btnNewProgID" runat="server" Text="New Prog ID" CssClass="btn" Width="120px" BackColor="#ff0000" ForeColor="#ffffff" />
            <asp:Button ID="btnNextRev" runat="server" Text="Next Revision" CssClass="btn" Width="120px" BackColor="#ff0000" ForeColor="#ffffff" />
            <asp:Button ID="btnEditTestTime" runat="server" Text="Edit Test Time" CssClass="btn" Width="120px" BackColor="#ff0000" ForeColor="#ffffff" />
            <asp:Button ID="btnEditAll" runat="server" Text="Edit All" CssClass="btn" Width="120px" BackColor="#ff0000" ForeColor="#ffffff" />
            <asp:Button ID="btnSaveRev" runat="server" Text="Save Revision" CssClass="btn" Width="120px" BackColor="#ff0000" ForeColor="#ffffff" />
        </div>

    </div>

    
    

    <script>

        $(document).ready(function () {

            //alert('page loaded!');

        });

    </script>

    <uc1:wucTestTime runat="server" ID="wucTestTime" />
    <uc1:wucPopupInfo runat="server" ID="wucPopupInfo" />

</asp:Content>
