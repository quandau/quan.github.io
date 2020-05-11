﻿<%@ Page Language="C#" MasterPageFile="~/WebAdmin/MasterPage.master" AutoEventWireup="true" CodeFile="Producer.aspx.cs" Inherits="WebAdmin_Product_Producer" %>
<%@ Register Assembly="FUA" Namespace="Subgurim.Controles" TagPrefix="FUA" %>
<%@ Import Namespace="Khavi.Web.Assistant" %>

<asp:Content ID="ProducerContent" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="center-column">
	<div class="top-bar">
		<h1><b><span id="lblTitle1" runat="server">Thêm nhà sản xuất mới</span></b></h1>
	</div><br />
    <div class="table">
		<img src="<%=Globals.GetAdminImagesUrl()%>bg-th-left.gif" width="8" height="7" alt="" class="left" />
		<img src="<%=Globals.GetAdminImagesUrl()%>bg-th-right.gif" width="7" height="7" alt="" class="right" />
		<table class="listing form" cellpadding="0" cellspacing="0">
			<tr>
				<th class="full" colspan="2"><span id="lblTitle2" runat="server">Thêm nhà sản xuất mới</span></th>
			</tr>
			<tr class="bg">
				<td class="first"><strong>Tên nhà sản xuất</strong></td>
				<td class="last"><input id="txtProducerName" type="text" class="text" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProducerName"
                        ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
			</tr>
			<tr>
				<td class="first"><strong>Địa chỉ</strong></td>
				<td class="last"><input id="txtProducerAddress" type="text" class="text" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtProducerAddress"
                        ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
			</tr>
			<tr class="bg">
				<td class="first"><strong>Tên liên hệ</strong></td>
				<td class="last"><input id="txtContactName" type="text" class="text" runat="server" /></td>
			</tr>
			<tr>
				<td class="first"><strong>Điện thoại</strong></td>
				<td class="last"><input id="txtContactTel" type="text" class="text" runat="server" /></td>
			</tr>
			<tr class="bg">
				<td class="first"><strong>Email</strong></td>
				<td class="last"><input id="txtContactEmail" type="text" class="text" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtContactEmail"
                        ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtContactEmail"
                        ErrorMessage="*" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
			</tr>
			<tr>
				<td class="first"><strong>Logo</strong></td>
				<td class="last">
				    <%if (Globals.GetStringFromQueryString("Action") == "Edit") {%>
                    <img id="ImageProducer" alt="" src="<%=Globals.GetAdminImagesUrl()%>noimage.gif" runat="server" style="vertical-align:middle;" />
                    <%} %>
                    <FUA:FileUploaderAJAX ID="fileUploadImage" runat="server" /></td>
			</tr>
			<tr class="bg">
				<td class="first"><strong>Ghi chú</strong></td>
				<td class="last"><input id="txtNotes" type="text" class="text" runat="server" /></td>
			</tr>
			<tr>
				<td class="first"></td>
				<td class="last">
				    <asp:Button ID="btnSave" runat="server" Text="Lưu" CssClass="button" OnClick="btnSave_Click" />
				    <%if (Globals.GetStringFromQueryString("Action") == "Edit") {%>
				    <asp:Button ID="btnDelete" runat="server" Text="Xóa" CssClass="button" OnClick="btnDelete_Click" ToolTip="Xóa nhà sản xuất này" CausesValidation="False" />
				    <%} %>
				    <asp:Button ID="btnReset" runat="server" Text="Nhập lại" CssClass="button" OnClick="btnReset_Click" CausesValidation="False" />
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
    <div class="top-bar">
		<h1><b>Danh sách Nhà sản xuất</b></h1>
    </div>
    <div class="clearthis"></div>
    <div id="ProducerList">
        <asp:GridView ID="gridViewProducer" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="3" GridLines="Horizontal" Width="100%" 
             PageSize="30" OnPageIndexChanging="gridViewProducer_PageIndexChanging" OnRowDataBound="gridViewProducer_RowDataBound" OnRowDeleting="gridViewProducer_RowDeleting" OnRowEditing="gridViewProducer_RowEditing">
            <PagerSettings Mode="NumericFirstLast" />
            <RowStyle HorizontalAlign="Center" Height="40px" CssClass="bgRowOfGridView" />
            <HeaderStyle CssClass="headerGridView" />
            <Columns>
                <asp:TemplateField Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="lblProducerID" runat="server" Text='<%# Eval("ProducerID")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Hình">
                    <ItemTemplate>
                        <img id="imgProducer" alt="" class="imagetemplate" src="<%=Globals.GetUploadsUrl()%><%# Eval("ProducerImageURL")%>" />
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Tên nhà SX">
                    <ItemTemplate>
                        <asp:Label ID="lblProducerName" Text='<%# Eval("ProducerName")%>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Địa chỉ">
                    <ItemTemplate>
                        <asp:Label ID="lblProducerAddress" runat="server" Text='<%#Eval("ProducerAddress")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Tên liên hệ">
                    <ItemTemplate>
                        <asp:Label ID="lblContactName" runat="server" Text='<%#Eval("ContactName")%>'></asp:Label>
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

