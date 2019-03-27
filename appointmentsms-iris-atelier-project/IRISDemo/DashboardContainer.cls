Include %DeepSee
Class IRISDemo.DashboardContainer Extends %DeepSee.UserLibrary.Container [ Not ProcedureBlock ]
{

/// Items Exported From Folder Manager.
XData Contents [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<items><folder xmlns="http://www.intersystems.com/deepsee/library" name="Dashboards">
</folder>
<dashboard xmlns="http://www.intersystems.com/deepsee/library" name="Appointments" folderName="Dashboards" title="Appointments" description="" keywords="" owner="" shared="true" public="true" locked="false" resource="" timeCreated="2019-03-25T21:08:46.636Z" createdBy="SuperUser" category="" bookCover="" scheme="" worklistCount="0" snapTo="true" snapGrid="true" gridRows="10" gridCols="10" canResize="true" canModify="true" showTitleBar="true" titleBarOpacity="" titleBarColor="" selectedTitleBarOpacity="" selectedTitleBarColor="" titleBarTextColor="" selectedTitleBarTextColor="" titleBarFont="" companyName="" companyLogo="" companyStyle="" backgroundColor="white" backgroundImage="none" backgroundRepeat="no-repeat" backgroundSize="100% 100%" backgroundOpacity="1" widgetBorders="1px solid #F0F0F0" widgetBordersSwitch="edit" widgetBordersColor="#F0F0F0" widgetBordersStyle="solid" widgetBordersWidth="1" widgetBordersToggle="true">
  <widget name="Widget1" type="pivot" subtype="barChart" subtypeClass="barChart" title="Revenue by Specialty" dataSource="Pivot/Appt by Specialty.pivot" dataLink="" drillDownDataSource="" width="200" height="200" sidebarContent="" showSidebar="false" sidebarWidth="" maximized="false" homeRowL="0" homeColL="0" colSpanL="4" rowSpanL="3" showToolbar="true" showToolbarBottomBorder="true" showToolbarOnlyWhenMaximized="false" colorToolbar="#F0F0F0" opacityToolbar="1" backgroundColor="#F0F0F0" opacity="1" theme="" dataColorList="">
    <control name="" action="applyFilter" target="*" targetProperty="[Specialty].[H1].[Specialty]" location="click" type="auto" controlClass="" label="Specialty" title="" value="" text="" readOnly="false" valueList="" displayList="" activeWhen="">
      <valueRequired>false</valueRequired>
    </control>
    <dataProperty name="" label="Revenue" width="" align="" subtype="" style="" display="" format="" showAs="" valueColumn="true" summary="" summaryValue="" dataValue="Bill" targetValue="" thresholdLower="" thresholdUpper="" rangeLower="" rangeUpper="" baseValue="" override=""></dataProperty>
    <dataProperty name="" label="Num of Appointments" width="" align="" subtype="" style="" display="" format="" showAs="" valueColumn="false" summary="" summaryValue="" dataValue="Count" targetValue="" thresholdLower="" thresholdUpper="" rangeLower="" rangeUpper="" baseValue="" override=""></dataProperty>
    <property name="legendPos">none</property>
    <property name="showDimensions">0</property>
    <override name="barChart">{legendVisible:'false',seriesColorsOverride:'rgb(71,89,104)',xAxis:{title:'Revenue',_type:'axis'},yAxisList:[{_type:'axis'}],chartPivot:true,_type:'barChart'}</override>
    <override name="legend">{hidden:true,legendLabels:'Bill',legendPosition:'right',_type:'chartLegend'}</override>
  </widget>
  <widget name="Widget2" type="pivot" subtype="columnChart" subtypeClass="barChart" title="Revenue by City" dataSource="Pivot/Appt by City.pivot" dataLink="" drillDownDataSource="" width="200" height="200" sidebarContent="" showSidebar="false" sidebarWidth="" maximized="false" homeRowL="0" homeColL="4" colSpanL="6" rowSpanL="3" showToolbar="true" showToolbarBottomBorder="true" showToolbarOnlyWhenMaximized="false" colorToolbar="#F0F0F0" opacityToolbar="1" backgroundColor="#F0F0F0" opacity="1" theme="" dataColorList="">
    <control name="" action="applyFilter" target="*" targetProperty="[City].[H1].[City]" location="click" type="auto" controlClass="" label="City" title="" value="" text="" readOnly="false" valueList="" displayList="" activeWhen="">
      <valueRequired>false</valueRequired>
    </control>
    <property name="legendPos">none</property>
    <override name="barChart">{legendVisible:'false',seriesColorsOverride:'rgb(56,145,234)',xAxis:{_type:'axis'},yAxisList:[{_type:'axis'}],_type:'barChart'}</override>
    <override name="legend">{hidden:true,legendLabels:'Bill',legendPosition:'right',_type:'chartLegend'}</override>
  </widget>
  <widget name="Widget3" type="pivot" subtype="barChart" subtypeClass="barChart" title="Appointments by Specialty" dataSource="Pivot/Appt Counts by Specialty.pivot" dataLink="" drillDownDataSource="" width="200" height="200" sidebarContent="" showSidebar="false" sidebarWidth="" maximized="false" homeRowL="3" homeColL="0" colSpanL="4" rowSpanL="3" showToolbar="true" showToolbarBottomBorder="true" showToolbarOnlyWhenMaximized="false" colorToolbar="#F0F0F0" opacityToolbar="1" backgroundColor="#F0F0F0" opacity="1" theme="" dataColorList="">
    <property name="legendPos">none</property>
    <override name="barChart">{legendVisible:'false',seriesColorsOverride:'rgb(71,89,104)',xAxis:{_type:'axis'},yAxisList:[{_type:'axis'}],chartPivot:true,_type:'barChart'}</override>
    <override name="legend">{hidden:true,legendLabels:'Count',legendPosition:'right',_type:'chartLegend'}</override>
  </widget>
  <widget name="Widget5" type="pivot" subtype="pivot" subtypeClass="lineChart" title="" dataSource="Pivot/Appt by Date.pivot" dataLink="" drillDownDataSource="" width="200" height="200" sidebarContent="" showSidebar="false" sidebarWidth="" maximized="false" homeRowL="6" homeColL="0" colSpanL="10" rowSpanL="4" showToolbar="true" showToolbarBottomBorder="true" showToolbarOnlyWhenMaximized="false" colorToolbar="#F0F0F0" opacityToolbar="1" backgroundColor="#F0F0F0" opacity="1" theme="" dataColorList="">
    <control name="" action="showListing" target="" targetProperty="Listing" location="widget" type="auto" controlClass="" label="" title="" value="" text="" readOnly="false" valueList="" displayList="" activeWhen="itemSelected">
      <valueRequired>false</valueRequired>
    </control>
    <property name="drillDown">1</property>
    <property name="excel">1</property>
  </widget>
  <widget name="Widget7" type="pivot" subtype="columnChart" subtypeClass="barChart" title="Appointment by City" dataSource="Pivot/Appt Counts by City.pivot" dataLink="" drillDownDataSource="" width="200" height="200" sidebarContent="" showSidebar="false" sidebarWidth="" maximized="false" homeRowL="3" homeColL="4" colSpanL="6" rowSpanL="3" showToolbar="true" showToolbarBottomBorder="true" showToolbarOnlyWhenMaximized="false" colorToolbar="#F0F0F0" opacityToolbar="1" backgroundColor="#F0F0F0" opacity="1" theme="" dataColorList="">
    <property name="legendPos">none</property>
    <override name="barChart">{legendVisible:'false',seriesColorsOverride:'rgb(56,145,234)',xAxis:{_type:'axis'},yAxisList:[{_type:'axis'}],_type:'barChart'}</override>
    <override name="legend">{hidden:true,legendLabels:'Count',legendPosition:'right',_type:'chartLegend'}</override>
  </widget>
</dashboard>
<folder xmlns="http://www.intersystems.com/deepsee/library" name="Pivot">
</folder>
<pivot xmlns="http://www.intersystems.com/deepsee/library" name="Appt Counts by City" folderName="Pivot" title="" description="" keywords="" owner="" shared="true" public="false" locked="false" resource="" timeCreated="2019-03-25T21:31:42.987Z" createdBy="SuperUser" category="" bookCover="" mdx="" cellWidth="120" columnHeaderStyle="" rowHeaderStyle="" cellStyle="" rowLabelSpan="true" columnLabelSpan="true" cellHeight="22" showEmptyRows="false" showEmptyColumns="false" cubeName="APPOINTMENT" caption="" listing="" listingRows="" showStatus="true" pageSize="100" colorScale="" rowTotals="false" columnTotals="false" rowTotalAgg="sum" columnTotalAgg="sum" rowTotalSource="page" showZebra="false" showRowCaption="true" printTitle="" printSubtitle="" printSubtitleOn="" showUser="" printPageSize="" printOrientation="1" printMarginTop="" printMarginLeft="" printMarginRight="" printMarginBottom="" printLabelWidth="" printCellWidth="" autoExecute="true" previewMode="false" manualMode="false" userMDX="" chartMarginTop="" chartMarginLeft="" chartMarginRight="" chartMarginBottom="" maxRows="" borderLeftCell="" borderRightCell="" borderTopCell="" borderBottomCell="" borderLeftCol="" borderRightCol="" borderTopCol="" borderBottomCol="" borderLeftRow="" borderRightRow="" borderTopRow="" borderBottomRow="" fontFamilyCell="" fontSizeCell="" fontFamilyCol="" fontSizeCol="" fontFamilyRow="" fontSizeRow="" showFilters="" showListingFilters="" showDate="" listingFontSize="" showZebraStripes="" filterTableStyle="" filterTableCaptionStyle="" filterTableItemStyle="" nowDisplayFormat="" measureLocation="columns" hideMeasures="1" backgroundImage="" backgroundOpacity=".12">
  <rowAxisOptions spec="" key="" value="" text="" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
  </rowAxisOptions>
  <columnAxisOptions spec="" key="" value="" text="" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
  </columnAxisOptions>
  <rowLevel spec="[City].[H1].[City].Members" key="" value="" text="City" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
  </rowLevel>
  <sqlRestriction></sqlRestriction>
  <measure spec="[Measures].[%COUNT]" key="" value="" text="Count" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
  </measure>
</pivot>
<pivot xmlns="http://www.intersystems.com/deepsee/library" name="Appt Counts by Specialty" folderName="Pivot" title="" description="" keywords="" owner="" shared="true" public="false" locked="false" resource="" timeCreated="2019-03-25T21:32:05.915Z" createdBy="SuperUser" category="" bookCover="" mdx="" cellWidth="120" columnHeaderStyle="" rowHeaderStyle="" cellStyle="" rowLabelSpan="true" columnLabelSpan="true" cellHeight="22" showEmptyRows="false" showEmptyColumns="false" cubeName="APPOINTMENT" caption="" listing="" listingRows="" showStatus="true" pageSize="100" colorScale="" rowTotals="false" columnTotals="false" rowTotalAgg="sum" columnTotalAgg="sum" rowTotalSource="page" showZebra="false" showRowCaption="true" printTitle="" printSubtitle="" printSubtitleOn="" showUser="" printPageSize="" printOrientation="1" printMarginTop="" printMarginLeft="" printMarginRight="" printMarginBottom="" printLabelWidth="" printCellWidth="" autoExecute="true" previewMode="false" manualMode="false" userMDX="" chartMarginTop="" chartMarginLeft="" chartMarginRight="" chartMarginBottom="" maxRows="" borderLeftCell="" borderRightCell="" borderTopCell="" borderBottomCell="" borderLeftCol="" borderRightCol="" borderTopCol="" borderBottomCol="" borderLeftRow="" borderRightRow="" borderTopRow="" borderBottomRow="" fontFamilyCell="" fontSizeCell="" fontFamilyCol="" fontSizeCol="" fontFamilyRow="" fontSizeRow="" showFilters="" showListingFilters="" showDate="" listingFontSize="" showZebraStripes="" filterTableStyle="" filterTableCaptionStyle="" filterTableItemStyle="" nowDisplayFormat="" measureLocation="columns" hideMeasures="1" backgroundImage="" backgroundOpacity=".12">
  <rowAxisOptions spec="" key="" value="" text="" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
  </rowAxisOptions>
  <columnAxisOptions spec="" key="" value="" text="" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
  </columnAxisOptions>
  <rowLevel spec="[Specialty].[H1].[Specialty].Members" key="" value="" text="Specialty" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
  </rowLevel>
  <sqlRestriction></sqlRestriction>
  <measure spec="[Measures].[%COUNT]" key="" value="" text="Count" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
  </measure>
</pivot>
<pivot xmlns="http://www.intersystems.com/deepsee/library" name="Appt by City" folderName="Pivot" title="" description="" keywords="" owner="" shared="true" public="false" locked="false" resource="" timeCreated="2019-03-25T21:04:35.522Z" createdBy="SuperUser" category="" bookCover="" mdx="" cellWidth="120" columnHeaderStyle="" rowHeaderStyle="" cellStyle="" rowLabelSpan="true" columnLabelSpan="true" cellHeight="22" showEmptyRows="false" showEmptyColumns="false" cubeName="APPOINTMENT" caption="" listing="" listingRows="" showStatus="true" pageSize="100" colorScale="" rowTotals="false" columnTotals="false" rowTotalAgg="sum" columnTotalAgg="sum" rowTotalSource="page" showZebra="false" showRowCaption="true" printTitle="" printSubtitle="" printSubtitleOn="" showUser="" printPageSize="" printOrientation="1" printMarginTop="" printMarginLeft="" printMarginRight="" printMarginBottom="" printLabelWidth="" printCellWidth="" autoExecute="true" previewMode="false" manualMode="false" userMDX="" chartMarginTop="" chartMarginLeft="" chartMarginRight="" chartMarginBottom="" maxRows="" borderLeftCell="" borderRightCell="" borderTopCell="" borderBottomCell="" borderLeftCol="" borderRightCol="" borderTopCol="" borderBottomCol="" borderLeftRow="" borderRightRow="" borderTopRow="" borderBottomRow="" fontFamilyCell="" fontSizeCell="" fontFamilyCol="" fontSizeCol="" fontFamilyRow="" fontSizeRow="" showFilters="" showListingFilters="" showDate="" listingFontSize="" showZebraStripes="" filterTableStyle="" filterTableCaptionStyle="" filterTableItemStyle="" nowDisplayFormat="" measureLocation="columns" hideMeasures="1" backgroundImage="" backgroundOpacity=".12">
  <rowAxisOptions spec="" key="" value="" text="" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
  </rowAxisOptions>
  <columnAxisOptions spec="" key="" value="" text="" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
  </columnAxisOptions>
  <rowLevel spec="[City].[H1].[City].Members" key="" value="" text="City" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
  </rowLevel>
  <sqlRestriction></sqlRestriction>
  <measure spec="[Measures].[Bill]" key="" value="" text="Bill" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
  </measure>
</pivot>
<pivot xmlns="http://www.intersystems.com/deepsee/library" name="Appt by Date" folderName="Pivot" title="" description="" keywords="" owner="" shared="true" public="false" locked="false" resource="" timeCreated="2019-03-25T21:05:17.837Z" createdBy="SuperUser" category="" bookCover="" mdx="" cellWidth="120" columnHeaderStyle="" rowHeaderStyle="" cellStyle="" rowLabelSpan="true" columnLabelSpan="true" cellHeight="22" showEmptyRows="false" showEmptyColumns="false" cubeName="APPOINTMENT" caption="" listing="" listingRows="" showStatus="true" pageSize="100" colorScale="" rowTotals="false" columnTotals="false" rowTotalAgg="sum" columnTotalAgg="sum" rowTotalSource="page" showZebra="false" showRowCaption="true" printTitle="" printSubtitle="" printSubtitleOn="" showUser="" printPageSize="" printOrientation="1" printMarginTop="" printMarginLeft="" printMarginRight="" printMarginBottom="" printLabelWidth="" printCellWidth="" autoExecute="true" previewMode="false" manualMode="false" userMDX="" chartMarginTop="" chartMarginLeft="" chartMarginRight="" chartMarginBottom="" maxRows="" borderLeftCell="" borderRightCell="" borderTopCell="" borderBottomCell="" borderLeftCol="" borderRightCol="" borderTopCol="" borderBottomCol="" borderLeftRow="" borderRightRow="" borderTopRow="" borderBottomRow="" fontFamilyCell="" fontSizeCell="" fontFamilyCol="" fontSizeCol="" fontFamilyRow="" fontSizeRow="" showFilters="" showListingFilters="" showDate="" listingFontSize="" showZebraStripes="" filterTableStyle="" filterTableCaptionStyle="" filterTableItemStyle="" nowDisplayFormat="" measureLocation="columns" hideMeasures="1" backgroundImage="" backgroundOpacity=".12">
  <rowAxisOptions spec="" key="" value="" text="" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
  </rowAxisOptions>
  <columnAxisOptions spec="" key="" value="" text="" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
  </columnAxisOptions>
  <rowLevel spec="[StartDateTime].[H1].[Appointment Month].Members" key="" value="" text="AppointmentMonth" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
  </rowLevel>
  <sqlRestriction></sqlRestriction>
  <measure spec="[Measures].[%COUNT]" key="" value="" text="Count" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
  </measure>
</pivot>
<pivot xmlns="http://www.intersystems.com/deepsee/library" name="Appt by Specialty" folderName="Pivot" title="" description="" keywords="" owner="" shared="true" public="false" locked="false" resource="" timeCreated="2019-03-25T21:04:57.434Z" createdBy="SuperUser" category="" bookCover="" mdx="" cellWidth="120" columnHeaderStyle="" rowHeaderStyle="" cellStyle="" rowLabelSpan="true" columnLabelSpan="true" cellHeight="22" showEmptyRows="false" showEmptyColumns="false" cubeName="APPOINTMENT" caption="" listing="" listingRows="" showStatus="true" pageSize="100" colorScale="" rowTotals="false" columnTotals="false" rowTotalAgg="sum" columnTotalAgg="sum" rowTotalSource="page" showZebra="false" showRowCaption="true" printTitle="" printSubtitle="" printSubtitleOn="" showUser="" printPageSize="" printOrientation="1" printMarginTop="" printMarginLeft="" printMarginRight="" printMarginBottom="" printLabelWidth="" printCellWidth="" autoExecute="true" previewMode="false" manualMode="false" userMDX="" chartMarginTop="" chartMarginLeft="" chartMarginRight="" chartMarginBottom="" maxRows="" borderLeftCell="" borderRightCell="" borderTopCell="" borderBottomCell="" borderLeftCol="" borderRightCol="" borderTopCol="" borderBottomCol="" borderLeftRow="" borderRightRow="" borderTopRow="" borderBottomRow="" fontFamilyCell="" fontSizeCell="" fontFamilyCol="" fontSizeCol="" fontFamilyRow="" fontSizeRow="" showFilters="" showListingFilters="" showDate="" listingFontSize="" showZebraStripes="" filterTableStyle="" filterTableCaptionStyle="" filterTableItemStyle="" nowDisplayFormat="" measureLocation="columns" hideMeasures="1" backgroundImage="" backgroundOpacity=".12">
  <rowAxisOptions spec="" key="" value="" text="" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
  </rowAxisOptions>
  <columnAxisOptions spec="" key="" value="" text="" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
  </columnAxisOptions>
  <rowLevel spec="[Specialty].[H1].[Specialty].Members" key="" value="" text="Specialty" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
  </rowLevel>
  <sqlRestriction></sqlRestriction>
  <measure spec="[Measures].[Bill]" key="" value="" text="Bill" headEnabled="false" headCount="" filterEnabled="false" filterExpression="" orderEnabled="false" orderExpression="" orderDirection="BDESC" aggEnabled="false" aggFunction="" aggFunctionParm="" levelCaption="" levelFormat="" levelSummary="" levelType="" drillLevel="0" advanced="false" levelStyle="" levelHeaderStyle="" suppress8020="false" drilldownSpec="" enabled="true">
  </measure>
</pivot>
</items>
}

}
