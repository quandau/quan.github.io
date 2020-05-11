<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Ads.ascx.cs" Inherits="CMS_Display_Utilities_Advertisement_Ads" %>
<%@ Import Namespace="Khavi.Web.Assistant" %>
<%@ Import Namespace="Khavi.Provider" %>

<div class="vbox <%=ControlCssClass%> <%=this.ID%>">
    <div class="vbox-top">
        <div class="vbox-top-left">
            <div class="vbox-top-right">
                <div class="vbox-top-center"><h3><%=Subject%></h3></div>
            </div>
        </div>
    </div>
    <div class="vbox-middle">
        <div id="divContent" class="content" runat="server"></div>
    </div>
    <div class="vbox-bottom">
        <div class="vbox-bottom-left">
            <div class="vbox-bottom-right">
                <div class="vbox-bottom-center"></div>
            </div>
        </div>
    </div>
</div>
