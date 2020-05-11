﻿<%@ Page Language="C#" MasterPageFile="~/WebAdmin/MasterPage.master" AutoEventWireup="true" CodeFile="District.aspx.cs" Inherits="WebAdmin_Others_District" %>
<%@ Import Namespace="Khavi.Web.Assistant" %>
<asp:Content ID="DistrictContent" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="center-column">
	<div class="top-bar">
		<h1><b><span id="lblTitle1" runat="server">Thêm Quận/Huyện mới</span></b></h1>
	</div><br />
    <div class="table">
		<img src="<%=Globals.GetAdminImagesUrl()%>bg-th-left.gif" width="8" height="7" alt="" class="left" />
		<img src="<%=Globals.GetAdminImagesUrl()%>bg-th-right.gif" width="7" height="7" alt="" class="right" />
		<table class="listing form" cellpadding="0" cellspacing="0">
			<tr>
				<th class="full" colspan="2"><span id="lblTitle2" runat="server">Thêm Quận/Huyện mới</span></th>
			</tr>
			<tr><td style="text-align:right;" colspan="2"><b><asp:HyperLink ID="linkAdd" Text="Thêm Quận/Huyện mới" Visible="false" runat="server"></asp:HyperLink></b></td></tr>
			<tr class="bg">
				<td class="first"><strong>Tỉnh/Thành phố</strong></td>
				<td class="last">
				    <asp:DropDownList ID="ddlProvince" Width="145px" runat="server"></asp:DropDownList>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddlProvince"
                        ErrorMessage="*" Operator="GreaterThan" SetFocusOnError="True" Type="Integer"
                        ValueToCompare="0"></asp:CompareValidator></td>
			</tr>
			<tr class="bg">
				<td class="first"><strong>Tên</strong></td>
				<td class="last"><input id="txtName" type="text" class="text" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                        ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
			</tr>
			<tr>
				<td class="first"></td>
				<td class="last">
				    <asp:Button ID="btnSave" runat="server" Text="Lưu" CssClass="button" OnClick="btnSave_Click" />
				    <%if (Globals.GetStringFromQueryString("Action") == "Edit") {%>
				    <asp:Button ID="btnDelete" runat="server" Text="Xóa" CssClass="button" OnClick="btnDelete_Click" ToolTip="Xóa Quận/Huyện này" CausesValidation="False" />
				    <%} %>
                </td>
			</tr>
            <tr>
                <td class="first">
                </td>
                <td class="last">
                    <asp:Label ID="lblMessage" runat="server" BackColor="#FFFFC0" Font-Bold="True" Font-Size="15px"
                        ForeColor="Red" Text="Label" Visible="False"></asp:Label></td>
            </tr>
		</table>
  </div>
    <div class="clearthis"></div>
    <div id="AdList" class="top-bar">
		<h1><b>Danh sách Quận/Huyện</b></h1>
		<div>Xem theo tỉnh/thành:  <asp:DropDownList ID="ddlProvince2" Width="145px" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvince2_SelectedIndexChanged"></asp:DropDownList></div>
    </div>
    <div class="clearthis"></div>
    <div>
        <asp:GridView ID="gridViewItem" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="3" GridLines="Horizontal" Width="100%" 
             PageSize="30" OnPageIndexChanging="gridViewItem_PageIndexChanging" OnRowDataBound="gridViewItem_RowDataBound" OnRowDeleting="gridViewItem_RowDeleting" OnRowEditing="gridViewItem_RowEditing">
            <PagerSettings Mode="NumericFirstLast" />
            <RowStyle HorizontalAlign="Center" Height="40px" CssClass="bgRowOfGridView" />
            <HeaderStyle CssClass="headerGridView" />
            <Columns>
                <asp:TemplateField Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="lblDistrictID" runat="server" Text='<%# Eval("DistrictID")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Tên hiển thị">
                    <ItemTemplate>
                        <asp:Label ID="lblName" Text='<%# Eval("DistrictName")%>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:CommandField HeaderText="Sửa" ButtonType="Image" EditImageUrl="~/WebAdmin/images/EDIT.GIF" ShowEditButton="True">
                    <HeaderStyle CssClass="headerGridView" />
                </asp:CommandField>
                
                <asp:CommandField HeaderText="Xóa" ButtonType="Image" DeleteImageUrl="~/WebAdmin/images/DELETE.GIF" ShowDeleteButton="True">
                    <HeaderStyle CssClass="headerGridView" />
                </asp:CommandField>
            </Columns>
            <EmptyDataTemplate>
                <table style="width:300px; text-align:center;" border="1">
                    <tr>
                        <td style="height:60px; background-color:#ffffcc" align="center">
                            <div id="EmptyData"><asp:Label ID="lblNoData" Text="Không có dữ liệu..." runat="server"></asp:Label></div>
                        </td>   
                    </tr>
                </table>
            </EmptyDataTemplate>
        </asp:GridView>
    </div>
</div>
</asp:Content>

