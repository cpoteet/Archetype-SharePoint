<%@Page language="C#" Inherits="Microsoft.SharePoint.Publishing.PublishingLayoutPage,Microsoft.SharePoint.Publishing,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document" %>
<%@Register Tagprefix="SharePointWebControls" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="PublishingWebControls" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="PublishingNavigation" Namespace="Microsoft.SharePoint.Publishing.Navigation" Assembly="Microsoft.SharePoint.Publishing, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@Register TagPrefix="OfficeWebControls" Namespace="Microsoft.Office.Server.WebControls.FieldTypes" Assembly="Microsoft.Office.Server.UserProfiles, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@Register Tagprefix="Taxonomy" Namespace="Microsoft.SharePoint.Taxonomy" Assembly="Microsoft.SharePoint.Taxonomy, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@Register Tagprefix="Publishing" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>

<asp:Content ContentPlaceholderID="PlaceHolderAdditionalPageHead" runat="server">
    <!-- Load styles necessary for layouts -->
	<SharePointWebControls:CssRegistration name="<% $SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/pagelayouts15.css %>" runat="server"/>

    <!-- Stylesheets only necessary for edit mode -->
	<PublishingWebControls:EditModePanel runat="server">
		<SharePointWebControls:CssRegistration name="<% $SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/editmode15.css %>"
			After="<% $SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/pagelayouts15.css %>" runat="server"/>
        <SharePointWebControls:CssRegistration name="<% $SPUrl:~sitecollection/_layouts/1033/styles/Themable/forms.css %>"
			After="<% $SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/editmode15.css %>" runat="server"/>
	</PublishingWebControls:EditModePanel>
</asp:Content>

<asp:Content ContentPlaceHolderId="LeftNavBottomZone" runat="server">
    <!-- Add zone underneath quick launch -->
    <WebPartPages:WebPartZone runat="server" Title="Quick Launch Zone" ID="QuickLaunchZone"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
</asp:Content>

<asp:Content ContentPlaceHolderId="PlaceHolderPageTitle" runat="server">
    <SharePointWebControls:FieldValue FieldName="Title" runat="server"/>
</asp:Content>


<asp:Content ContentPlaceHolderId="PlaceHolderMain" runat="server">
   
    <!-- FieldValue only pulls value and does not give editing experience in edit mode -->
    <h1><SharePointWebControls:FieldValue FieldName="Title" runat="server"/></h1>
    
    <PublishingWebControls:RichHtmlField FieldName="PublishingPageContent" runat="server" />

    <!-- Example zone layout using MS CSS API -->
    <div class="ms-table ms-fullWidth"> 

        <div class="cell-margin tableCol-50">
            <WebPartPages:WebPartZone runat="server" Title="Left Zone" ID="TwoColLeftZone"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
        </div>
        <div class="cell-margin tableCol-50">
            <WebPartPages:WebPartZone runat="server" Title="Right Zone" ID="TwoColRightZone"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
        </div>

    </div>
    
    <div class="ms-table ms-fullWidth">

        <div class="cell-margin ms-table ms-fullWidth">
            <WebPartPages:WebPartZone runat="server" Title="Bottom Zone" ID="TwoColBotZone"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
        </div>

    </div>

    <!-- Hide zones without web parts -->
    <SharePointWebControls:ScriptBlock runat="server">if(typeof(MSOLayout_MakeInvisibleIfEmpty) == "function") {MSOLayout_MakeInvisibleIfEmpty();}</SharePointWebControls:ScriptBlock>

</div>

<!-- Sample device channel panel usage; This means it will show its content when matching the channel -->
<Publishing:MobilePanel runat="server" IncludedChannels="Default">
    Show this when the default channel matches.
</Publishing:MobilePanel> 

<!-- Inline medatadata editing experience; only use column internal name not GUID -->
<PublishingWebControls:editmodepanel runat="server" id="layouteditmodepanel"> 

	<div class="page-layout-editmetadata">
	
        <h3>Page Metadata</h3>
        
        <SharePointWebControls:TextField FieldName="Title" runat="server" />
        <SharePointWebControls:UserField FieldName="PublishingContact" runat="server" />
        <Taxonomy:TaxonomyFieldControl FieldName="TaxKeyword" runat="server" />
	
	</div>
	
</PublishingWebControls:editmodepanel>

</asp:Content>