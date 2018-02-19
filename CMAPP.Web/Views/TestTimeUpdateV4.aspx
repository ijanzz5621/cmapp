<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TestTimeUpdateV4.aspx.vb" Inherits="CMAPP.Web.TestTimeUpdateV4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div style="background-color: #e0e0e0; min-height:150px; position: fixed; top:50px; margin: 0 !important; padding: 0; width:100%; padding-top:15px; padding-bottom:15px;">
        
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
            
            <div class="col-lg-4 col-md-8">
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

    </div>

    <div style="padding-top: 200px; width:100%; min-height:1400px;">
        test 123
    </div>

</asp:Content>
