<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
xmlns:fo="http://www.w3.org/1999/XSL/Format"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
version="1.0"
xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0"
xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0"
xmlns:xlink="http://www.w3.org/1999/xlink"
xmlns:dc="http://purl.org/dc/elements/1.1/"
xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0"
xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0"
xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0"
xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0"
>

<xsl:output method="xml" version="1.0" indent="yes"/>
<xsl:template match="ausbildungsvertraege">

<office:document-content xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0" xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0" xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0" xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0" xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0" xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0" xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0" xmlns:ooo="http://openoffice.org/2004/office" xmlns:ooow="http://openoffice.org/2004/writer" xmlns:oooc="http://openoffice.org/2004/calc" xmlns:dom="http://www.w3.org/2001/xml-events" xmlns:xforms="http://www.w3.org/2002/xforms" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rpt="http://openoffice.org/2005/report" xmlns:of="urn:oasis:names:tc:opendocument:xmlns:of:1.2" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:grddl="http://www.w3.org/2003/g/data-view#" xmlns:tableooo="http://openoffice.org/2009/table" xmlns:field="urn:openoffice:names:experimental:ooo-ms-interop:xmlns:field:1.0" xmlns:formx="urn:openoffice:names:experimental:ooxml-odf-interop:xmlns:form:1.0" xmlns:css3t="http://www.w3.org/TR/css3-text/" office:version="1.2">
	<office:scripts/>
	<office:font-face-decls>
		<style:font-face style:name="Wingdings" svg:font-family="Wingdings" style:font-pitch="variable" style:font-charset="x-symbol"/>
		<style:font-face style:name="Symbol" svg:font-family="Symbol" style:font-family-generic="roman" style:font-pitch="variable" style:font-charset="x-symbol"/>
		<style:font-face style:name="Lohit Hindi1" svg:font-family="&apos;Lohit Hindi&apos;"/>
		<style:font-face style:name="Courier New" svg:font-family="&apos;Courier New&apos;" style:font-family-generic="modern"/>
		<style:font-face style:name="Lucida Grande" svg:font-family="&apos;Lucida Grande&apos;, &apos;Times New Roman&apos;" style:font-family-generic="roman"/>
		<style:font-face style:name="Optima" svg:font-family="Optima, &apos;Times New Roman&apos;" style:font-family-generic="roman"/>
		<style:font-face style:name="ヒラギノ角ゴ Pro W3" svg:font-family="&apos;ヒラギノ角ゴ Pro W3&apos;" style:font-family-generic="roman"/>
		<style:font-face style:name="Courier New1" svg:font-family="&apos;Courier New&apos;" style:font-family-generic="modern" style:font-pitch="fixed"/>
		<style:font-face style:name="Times New Roman" svg:font-family="&apos;Times New Roman&apos;" style:font-family-generic="roman" style:font-pitch="variable"/>
		<style:font-face style:name="Arial" svg:font-family="Arial" style:font-family-generic="swiss" style:font-pitch="variable"/>
		<style:font-face style:name="Arial1" svg:font-family="Arial" style:font-adornments="Fett" style:font-family-generic="swiss" style:font-pitch="variable"/>
		<style:font-face style:name="Arial2" svg:font-family="Arial" style:font-adornments="Standard" style:font-family-generic="swiss" style:font-pitch="variable"/>
		<style:font-face style:name="Tahoma" svg:font-family="Tahoma" style:font-family-generic="swiss" style:font-pitch="variable"/>
		<style:font-face style:name="Droid Sans" svg:font-family="&apos;Droid Sans&apos;" style:font-family-generic="system" style:font-pitch="variable"/>
		<style:font-face style:name="Lohit Hindi" svg:font-family="&apos;Lohit Hindi&apos;" style:font-family-generic="system" style:font-pitch="variable"/>
		<style:font-face style:name="Helvetica" svg:font-family="Helvetica" style:font-family-generic="swiss" style:font-pitch="variable"/>
	</office:font-face-decls>
	<office:automatic-styles>
	<style:style style:name="Tabelle1" style:family="table">
		<style:table-properties style:width="15.252cm" table:align="left" style:writing-mode="lr-tb"/>
	</style:style>
	<style:style style:name="Tabelle1.A" style:family="table-column">
		<style:table-column-properties style:column-width="7.001cm"/>
	</style:style>
	<style:style style:name="Tabelle1.B" style:family="table-column">
		<style:table-column-properties style:column-width="1.251cm"/>
	</style:style>
	<style:style style:name="Tabelle1.1" style:family="table-row">
		<style:table-row-properties fo:keep-together="auto"/>
	</style:style>
	<style:style style:name="Tabelle1.A1" style:family="table-cell">
		<style:table-cell-properties style:vertical-align="top" fo:padding="0cm" fo:border-left="none" fo:border-right="none" fo:border-top="0.5pt dotted #000000" fo:border-bottom="0.5pt dotted #000000" style:writing-mode="lr-tb"/>
	</style:style>
	<style:style style:name="Tabelle1.B1" style:family="table-cell">
		<style:table-cell-properties style:vertical-align="top" fo:padding="0cm" fo:border="none" style:writing-mode="lr-tb"/>
	</style:style>
	<style:style style:name="Tabelle1.A2" style:family="table-cell">
		<style:table-cell-properties style:vertical-align="top" fo:padding="0cm" fo:border-left="none" fo:border-right="none" fo:border-top="0.5pt dotted #000000" fo:border-bottom="none" style:writing-mode="lr-tb"/>
	</style:style>
	<style:style style:name="P1" style:family="paragraph" style:parent-style-name="Standard">
		<style:paragraph-properties fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false">
		<style:tab-stops>
			<style:tab-stop style:position="0cm"/>
			<style:tab-stop style:position="5.251cm"/>
		</style:tab-stops>
		</style:paragraph-properties>
	</style:style>
	<style:style style:name="P2" style:family="paragraph" style:parent-style-name="Standard">
		<style:paragraph-properties fo:line-height="130%"/>
		<style:text-properties fo:font-size="8pt" style:font-size-asian="8pt" style:font-name-complex="Arial" style:font-size-complex="8pt"/>
	</style:style>
	<style:style style:name="P3" style:family="paragraph" style:parent-style-name="Standard">
		<style:paragraph-properties fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false">
		<style:tab-stops>
			<style:tab-stop style:position="1.251cm"/>
		</style:tab-stops>
		</style:paragraph-properties>
		<style:text-properties fo:font-size="8pt" style:font-size-asian="8pt" style:font-name-complex="Arial" style:font-size-complex="8pt"/>
	</style:style>
	<style:style style:name="P4" style:family="paragraph" style:parent-style-name="Standard">
		<style:paragraph-properties fo:line-height="130%"/>
		<style:text-properties fo:font-size="10pt" style:font-size-asian="10pt" style:font-name-complex="Arial"/>
	</style:style>
	<style:style style:name="P5" style:family="paragraph" style:parent-style-name="Standard">
		<style:paragraph-properties fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false"/>
		<style:text-properties fo:font-size="10pt" style:font-size-asian="10pt" style:font-name-complex="Arial"/>
	</style:style>
	<style:style style:name="P6" style:family="paragraph" style:parent-style-name="Standard">
		<style:paragraph-properties fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false">
		<style:tab-stops>
			<style:tab-stop style:position="5.251cm"/>
		</style:tab-stops>
		</style:paragraph-properties>
		<style:text-properties fo:font-size="10pt" style:font-size-asian="10pt" style:font-name-complex="Arial"/>
	</style:style>
	<style:style style:name="P7" style:family="paragraph" style:parent-style-name="Standard">
		<style:paragraph-properties fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false">
		<style:tab-stops>
			<style:tab-stop style:position="0cm"/>
			<style:tab-stop style:position="5.251cm"/>
		</style:tab-stops>
		</style:paragraph-properties>
		<style:text-properties fo:font-size="10pt" style:font-size-asian="10pt" style:font-name-complex="Arial"/>
	</style:style>
	<style:style style:name="P8" style:family="paragraph" style:parent-style-name="Standard">
		<style:paragraph-properties fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false">
		<style:tab-stops>
			<style:tab-stop style:position="1.251cm"/>
		</style:tab-stops>
		</style:paragraph-properties>
		<style:text-properties fo:font-size="10pt" style:font-size-asian="10pt" style:font-name-complex="Arial"/>
	</style:style>
	<style:style style:name="P9" style:family="paragraph" style:parent-style-name="Standard">
		<style:paragraph-properties fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false"/>
		<style:text-properties fo:font-size="10pt" fo:background-color="#ffff00" style:font-size-asian="10pt" style:language-asian="zxx" style:country-asian="none" style:font-name-complex="Arial" style:language-complex="zxx" style:country-complex="none"/>
	</style:style>
	<style:style style:name="P10" style:family="paragraph" style:parent-style-name="Standard">
		<style:text-properties fo:language="de" fo:country="AT"/>
	</style:style>
	<style:style style:name="P11" style:family="paragraph" style:parent-style-name="Standard">
		<style:paragraph-properties fo:line-height="130%"/>
		<style:text-properties fo:font-size="7pt" style:font-size-asian="7pt" style:font-name-complex="Arial" style:font-size-complex="7pt"/>
	</style:style>
	<style:style style:name="P12" style:family="paragraph" style:parent-style-name="Standard">
		<style:paragraph-properties fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false"/>
		<style:text-properties fo:font-size="7pt" style:font-size-asian="7pt" style:font-name-complex="Arial" style:font-size-complex="7pt"/>
	</style:style>
	<style:style style:name="P13" style:family="paragraph" style:parent-style-name="Standard">
		<style:paragraph-properties fo:line-height="130%"/>
		<style:text-properties fo:font-size="9pt" style:font-size-asian="9pt" style:font-name-complex="Arial" style:font-size-complex="9pt"/>
	</style:style>
	<style:style style:name="P14" style:family="paragraph" style:parent-style-name="Standard">
		<style:paragraph-properties fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false"/>
		<style:text-properties fo:font-size="9pt" style:font-size-asian="9pt" style:font-name-complex="Arial" style:font-size-complex="9pt"/>
	</style:style>
	<style:style style:name="P15" style:family="paragraph" style:parent-style-name="Standard">
		<style:paragraph-properties fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false" fo:break-before="page"/>
		<style:text-properties fo:font-size="8pt" style:font-size-asian="8pt" style:font-name-complex="Arial" style:font-size-complex="8pt"/>
	</style:style>
	<style:style style:name="P16" style:family="paragraph" style:parent-style-name="Standard">
		<style:paragraph-properties fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false" fo:break-before="page">
		<style:tab-stops>
			<style:tab-stop style:position="1.251cm"/>
		</style:tab-stops>
		</style:paragraph-properties>
		<style:text-properties fo:font-size="8pt" style:font-size-asian="8pt" style:font-name-complex="Arial" style:font-size-complex="8pt"/>
	</style:style>
	<style:style style:name="P17" style:family="paragraph" style:parent-style-name="Standard">
		<style:paragraph-properties fo:margin-left="0cm" fo:margin-right="-0.252cm" fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false" fo:text-indent="0cm" style:auto-text-indent="false">
		<style:tab-stops>
			<style:tab-stop style:position="1.251cm"/>
		</style:tab-stops>
		</style:paragraph-properties>
		<style:text-properties fo:font-size="10pt" fo:background-color="#ffff00" style:font-size-asian="10pt" style:font-name-complex="Arial"/>
	</style:style>
	<style:style style:name="P18" style:family="paragraph" style:parent-style-name="Standard">
		<style:paragraph-properties fo:margin-left="0cm" fo:margin-right="-0.252cm" fo:line-height="130%" fo:text-indent="0cm" style:auto-text-indent="false">
		<style:tab-stops>
			<style:tab-stop style:position="1.251cm"/>
		</style:tab-stops>
		</style:paragraph-properties>
		<style:text-properties fo:font-size="10pt" style:font-size-asian="10pt" style:font-name-complex="Arial"/>
	</style:style>
	<style:style style:name="P19" style:family="paragraph" style:parent-style-name="Standard">
		<style:paragraph-properties fo:margin-left="0cm" fo:margin-right="-0.25cm" fo:margin-top="0.106cm" fo:margin-bottom="0cm" fo:line-height="130%" fo:text-indent="0cm" style:auto-text-indent="false">
		<style:tab-stops>
			<style:tab-stop style:position="1.251cm"/>
		</style:tab-stops>
		</style:paragraph-properties>
		<style:text-properties fo:font-size="9pt" style:font-size-asian="9pt" style:font-name-complex="Arial" style:font-size-complex="9pt"/>
	</style:style>
	<style:style style:name="P20" style:family="paragraph" style:parent-style-name="Standard">
		<style:paragraph-properties fo:margin-left="0cm" fo:margin-right="-0.25cm" fo:margin-top="0.106cm" fo:margin-bottom="0cm" fo:line-height="130%" fo:text-indent="0cm" style:auto-text-indent="false">
		<style:tab-stops>
			<style:tab-stop style:position="1.251cm"/>
			<style:tab-stop style:position="14.503cm" style:type="right"/>
		</style:tab-stops>
		</style:paragraph-properties>
		<style:text-properties fo:font-size="9pt" style:font-size-asian="9pt" style:font-name-complex="Arial" style:font-size-complex="9pt"/>
	</style:style>
	<style:style style:name="P21" style:family="paragraph" style:parent-style-name="Standard">
		<style:paragraph-properties fo:margin-left="0cm" fo:margin-right="-0.25cm" fo:margin-top="0.106cm" fo:margin-bottom="0cm" fo:line-height="130%" fo:text-indent="0cm" style:auto-text-indent="false" style:snap-to-layout-grid="false">
		<style:tab-stops>
			<style:tab-stop style:position="1.251cm"/>
			<style:tab-stop style:position="14.503cm" style:type="right"/>
		</style:tab-stops>
		</style:paragraph-properties>
		<style:text-properties fo:font-size="9pt" style:font-size-asian="9pt" style:font-name-complex="Arial" style:font-size-complex="9pt"/>
	</style:style>
	<style:style style:name="P22" style:family="paragraph" style:parent-style-name="Heading_20_1" style:master-page-name="First_20_Page">
		<style:paragraph-properties style:page-number="1"/>
		<style:text-properties style:language-complex="zxx" style:country-complex="none"/>
	</style:style>
	<style:style style:name="P23" style:family="paragraph" style:parent-style-name="Heading_20_2">
		<style:paragraph-properties fo:margin-left="0cm" fo:margin-right="0cm" fo:text-align="justify" style:justify-single-word="false" fo:text-indent="-0.635cm" style:auto-text-indent="false">
		<style:tab-stops>
			<style:tab-stop style:position="0.751cm"/>
		</style:tab-stops>
		</style:paragraph-properties>
		<style:text-properties fo:font-style="normal" style:font-style-asian="normal"/>
	</style:style>
	<style:style style:name="P24" style:family="paragraph" style:parent-style-name="Heading_20_2">
		<style:paragraph-properties fo:margin-left="0cm" fo:margin-right="0cm" fo:text-align="justify" style:justify-single-word="false" fo:text-indent="-0.635cm" style:auto-text-indent="false">
		<style:tab-stops>
			<style:tab-stop style:position="0.751cm"/>
		</style:tab-stops>
		</style:paragraph-properties>
		<style:text-properties fo:language="de" fo:country="AT" fo:font-style="normal" style:language-asian="ar" style:country-asian="SA" style:font-style-asian="normal"/>
	</style:style>
	<style:style style:name="P25" style:family="paragraph" style:parent-style-name="Heading_20_2">
		<style:paragraph-properties fo:margin-left="0cm" fo:margin-right="0cm" fo:text-align="justify" style:justify-single-word="false" fo:text-indent="-0.635cm" style:auto-text-indent="false">
		<style:tab-stops>
			<style:tab-stop style:position="0.751cm"/>
		</style:tab-stops>
		</style:paragraph-properties>
		<style:text-properties fo:background-color="#ffff00"/>
	</style:style>
	<style:style style:name="P26" style:family="paragraph" style:parent-style-name="Heading_20_2">
		<style:paragraph-properties fo:margin-left="0cm" fo:margin-right="0cm" fo:margin-top="0.071cm" fo:margin-bottom="0.212cm" fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false" fo:text-indent="-0.635cm" style:auto-text-indent="false">
		<style:tab-stops>
			<style:tab-stop style:position="0.751cm"/>
		</style:tab-stops>
		</style:paragraph-properties>
		<style:text-properties fo:language="de" fo:country="AT" fo:font-style="normal" style:language-asian="ar" style:country-asian="SA" style:font-style-asian="normal"/>
	</style:style>
	<style:style style:name="P27" style:family="paragraph" style:parent-style-name="Heading_20_3">
		<style:paragraph-properties fo:margin-top="0cm" fo:margin-bottom="0.106cm" fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false"/>
		<style:text-properties fo:font-size="10pt" fo:language="de" fo:country="AT" style:font-size-asian="10pt" style:language-asian="ar" style:country-asian="SA"/>
	</style:style>
	<style:style style:name="P28" style:family="paragraph" style:parent-style-name="Heading_20_3">
		<style:paragraph-properties fo:margin-top="0cm" fo:margin-bottom="0cm" fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false"/>
		<style:text-properties fo:font-size="10pt" fo:language="de" fo:country="AT" style:font-size-asian="10pt" style:language-asian="ar" style:country-asian="SA"/>
	</style:style>
	<style:style style:name="P29" style:family="paragraph" style:parent-style-name="Heading_20_4">
		<style:paragraph-properties fo:margin-top="0.212cm" fo:margin-bottom="0.071cm" fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false"/>
		<style:text-properties style:font-name="Arial" fo:font-size="10pt" fo:language="de" fo:country="AT" fo:font-weight="normal" style:font-size-asian="10pt" style:language-asian="ar" style:country-asian="SA" style:font-weight-asian="normal" style:font-name-complex="Arial"/>
	</style:style>
	<style:style style:name="P30" style:family="paragraph" style:parent-style-name="Heading_20_4">
		<style:paragraph-properties fo:margin-top="0.353cm" fo:margin-bottom="0.071cm" fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false"/>
		<style:text-properties style:font-name="Arial" fo:font-size="10pt" fo:font-weight="normal" style:font-size-asian="10pt" style:language-asian="ar" style:country-asian="SA" style:font-weight-asian="normal" style:font-name-complex="Arial"/>
	</style:style>
	<style:style style:name="P31" style:family="paragraph" style:parent-style-name="Heading_20_4">
		<style:paragraph-properties fo:margin-top="0.353cm" fo:margin-bottom="0.071cm" fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false"/>
		<style:text-properties style:font-name="Arial" fo:font-size="10pt" fo:language="de" fo:country="AT" fo:font-weight="normal" style:font-size-asian="10pt" style:language-asian="ar" style:country-asian="SA" style:font-weight-asian="normal" style:font-name-complex="Arial"/>
	</style:style>
	<style:style style:name="P32" style:family="paragraph" style:parent-style-name="Heading_20_4">
		<style:paragraph-properties fo:margin-top="0.353cm" fo:margin-bottom="0.071cm" fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false"/>
		<style:text-properties style:font-name="Arial" fo:font-size="10pt" fo:language="en" fo:country="US" fo:font-weight="normal" style:font-size-asian="10pt" style:language-asian="ar" style:country-asian="SA" style:font-weight-asian="normal" style:font-name-complex="Arial"/>
	</style:style>
	<style:style style:name="P33" style:family="paragraph" style:parent-style-name="Footer">
		<style:text-properties fo:font-size="8pt" style:font-size-asian="8pt" style:font-size-complex="8pt"/>
	</style:style>
	<style:style style:name="P34" style:family="paragraph" style:parent-style-name="Header">
		<style:text-properties fo:language="de" fo:country="AT" style:language-asian="none" style:country-asian="none"/>
	</style:style>
	<style:style style:name="P35" style:family="paragraph" style:parent-style-name="Textkörper_20_2">
		<style:paragraph-properties fo:line-height="130%"/>
		<style:text-properties style:font-name="Arial" fo:font-size="10pt" style:font-size-asian="10pt" style:font-name-complex="Arial"/>
	</style:style>
	<style:style style:name="P36" style:family="paragraph" style:parent-style-name="Textkörper_20_3">
		<style:paragraph-properties fo:line-height="130%" fo:orphans="0" fo:widows="0"/>
		<style:text-properties fo:font-size="10pt" style:font-size-asian="10pt" style:font-name-complex="Arial"/>
	</style:style>
	<style:style style:name="P37" style:family="paragraph" style:parent-style-name="Formatvorlage_20_Aufzählung_20_1">
		<style:paragraph-properties fo:text-align="justify" style:justify-single-word="false"/>
	</style:style>
	<style:style style:name="P38" style:family="paragraph" style:parent-style-name="Formatvorlage_20_Aufzählung_20_1">
		<style:paragraph-properties fo:text-align="justify" style:justify-single-word="false"/>
		<style:text-properties fo:font-size="8pt" style:font-size-asian="8pt" style:font-name-complex="Arial" style:font-size-complex="8pt"/>
	</style:style>
	<style:style style:name="P39" style:family="paragraph" style:parent-style-name="Formatvorlage_20_Aufzählung_20_1">
		<style:paragraph-properties fo:text-align="justify" style:justify-single-word="false"/>
		<style:text-properties fo:font-size="8pt" fo:language="de" fo:country="AT" style:font-size-asian="8pt" style:font-name-complex="Arial" style:font-size-complex="8pt"/>
	</style:style>
	<style:style style:name="P40" style:family="paragraph" style:parent-style-name="Formatvorlage_20_Aufzählung_20_1">
		<style:paragraph-properties fo:text-align="justify" style:justify-single-word="false"/>
		<style:text-properties style:language-complex="zxx" style:country-complex="none"/>
	</style:style>
	<style:style style:name="P41" style:family="paragraph" style:parent-style-name="Standard1">
		<style:paragraph-properties fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false">
		<style:tab-stops>
			<style:tab-stop style:position="1.251cm"/>
			<style:tab-stop style:position="2.501cm"/>
			<style:tab-stop style:position="3.752cm"/>
			<style:tab-stop style:position="5.002cm"/>
			<style:tab-stop style:position="6.253cm"/>
			<style:tab-stop style:position="7.504cm"/>
			<style:tab-stop style:position="8.754cm"/>
			<style:tab-stop style:position="10.005cm"/>
			<style:tab-stop style:position="11.255cm"/>
			<style:tab-stop style:position="12.506cm"/>
			<style:tab-stop style:position="13.757cm"/>
			<style:tab-stop style:position="15.007cm"/>
		</style:tab-stops>
		</style:paragraph-properties>
		<style:text-properties fo:color="#000000" style:font-name="Arial" fo:font-size="10pt" style:font-size-asian="10pt" style:font-name-complex="Arial"/>
	</style:style>
	<style:style style:name="P42" style:family="paragraph">
			<style:paragraph-properties fo:line-height="130%" fo:text-align="start"/>
			<style:text-properties style:text-line-through-style="none" style:text-line-through-type="none" style:font-pitch="variable" fo:font-size="9pt" style:font-size-asian="9pt" fo:font-style="normal" style:text-underline-style="none" fo:font-weight="normal"/>
	</style:style>
	 <style:style style:name="P43" style:family="paragraph" style:parent-style-name="Heading_20_2">
		<style:paragraph-properties fo:margin-left="0cm" fo:margin-right="0cm" fo:margin-top="0.071cm" fo:margin-bottom="0.212cm" fo:line-height="130%" fo:text-align="justify" style:justify-single-word="false" fo:text-indent="-0.635cm" style:auto-text-indent="false">
		<style:tab-stops>
			<style:tab-stop style:position="0.751cm"/>
		</style:tab-stops>
		</style:paragraph-properties>
		<style:text-properties fo:language="de" fo:country="AT" fo:font-style="normal" style:language-asian="ar" style:country-asian="SA" style:font-style-asian="normal"/>
	</style:style>
	<style:style style:name="P44" style:family="paragraph">
			<style:paragraph-properties fo:line-height="130%" fo:text-align="start"/>
			<style:text-properties style:text-line-through-style="none" style:text-line-through-type="none" style:font-pitch="variable" fo:font-size="9pt" style:font-size-asian="9pt" fo:font-style="normal" style:text-underline-style="none" fo:font-weight="bold"/>
	</style:style>
	<style:style style:name="P45" style:family="paragraph">
			<style:paragraph-properties fo:line-height="130%" fo:text-align="start"/>
			<style:text-properties style:text-line-through-style="none" style:text-line-through-type="none" style:font-pitch="variable" fo:font-size="9pt" style:font-size-asian="9pt" fo:font-style="normal" style:text-underline-style="none" fo:font-weight="bold"/>
	</style:style>
	<style:style style:name="P46" style:family="paragraph">
		<style:paragraph-properties fo:line-height="130%"/>
		<style:text-properties fo:color="#ff3333" fo:font-size="16pt" style:font-size-asian="16pt" style:font-name-complex="Arial" style:font-size-complex="16pt"/>
	</style:style>
	<style:style style:name="P140" style:family="paragraph">
			<style:paragraph-properties fo:text-align="start"/>
			<style:text-properties style:text-line-through-style="none" style:text-line-through-type="none" style:font-name="Helvetica" fo:font-size="10pt" fo:font-style="normal" style:text-underline-style="none" fo:font-weight="bold"/>
	</style:style>
	<style:style style:name="P141" style:family="paragraph">
			<style:paragraph-properties fo:text-align="center"/>
			<style:text-properties style:text-line-through-style="none" style:text-line-through-type="none" style:font-name="Helvetica" fo:font-size="10pt" fo:font-style="normal" style:text-underline-style="none" fo:font-weight="normal"/>
	</style:style>
	<style:style style:name="P142" style:family="paragraph">
			<style:paragraph-properties fo:text-align="start"/>
			<style:text-properties style:text-line-through-style="none" style:text-line-through-type="none" style:font-name="Helvetica" fo:font-size="10pt" fo:font-style="normal" style:text-underline-style="none" fo:font-weight="normal"/>
	</style:style>
	<style:style style:name="T1" style:family="text">
		<style:text-properties fo:font-weight="bold" style:font-weight-asian="bold"/>
	</style:style>
	<style:style style:name="T2" style:family="text">
		<style:text-properties fo:font-weight="bold" fo:background-color="#ffff00" style:font-weight-asian="bold"/>
	</style:style>
	<style:style style:name="T3" style:family="text">
		<style:text-properties fo:font-size="9pt" style:font-name-asian="Arial" style:font-size-asian="9pt" style:font-size-complex="9pt"/>
	</style:style>
	<style:style style:name="T4" style:family="text">
		<style:text-properties style:font-name-asian="Arial"/>
	</style:style>
	<style:style style:name="T5" style:family="text">
		<style:text-properties fo:font-size="8pt" style:font-size-asian="8pt" style:font-name-complex="Arial"/>
	</style:style>
	<style:style style:name="T6" style:family="text">
		<style:text-properties fo:font-size="8pt" style:font-size-asian="8pt" style:font-size-complex="8pt"/>
	</style:style>
	<style:style style:name="T7" style:family="text">
		<style:text-properties fo:font-size="8pt" fo:background-color="#ffff00" style:font-size-asian="8pt" style:font-size-complex="8pt"/>
	</style:style>
	<style:style style:name="T8" style:family="text">
		<style:text-properties fo:font-size="8pt" fo:font-weight="bold" fo:background-color="#ffff00" style:font-size-asian="8pt" style:font-weight-asian="bold" style:font-size-complex="8pt"/>
	</style:style>
	<style:style style:name="T9" style:family="text">
		<style:text-properties style:font-name-complex="Arial"/>
	</style:style>
	<style:style style:name="T10" style:family="text">
		<style:text-properties fo:font-size="10pt" style:font-size-asian="10pt" style:font-name-complex="Arial"/>
	</style:style>
	<style:style style:name="T11" style:family="text">
		<style:text-properties fo:background-color="#ffff00"/>
	</style:style>
	<style:style style:name="T12" style:family="text">
		<style:text-properties style:language-complex="zxx" style:country-complex="none"/>
	</style:style>
	<style:style style:name="T13" style:family="text">
		<style:text-properties fo:font-style="normal" style:font-style-asian="normal"/>
	</style:style>
	<style:style style:name="T14" style:family="text"/>
	<style:style style:name="fr1" style:family="graphic" style:parent-style-name="Graphics">
		<style:graphic-properties fo:margin-left="0.319cm" fo:margin-right="0.319cm" style:run-through="background" style:wrap="run-through" style:number-wrapped-paragraphs="no-limit" style:vertical-pos="from-top" style:vertical-rel="paragraph" style:horizontal-pos="from-left" style:horizontal-rel="paragraph" fo:padding="0.026cm" fo:border="none" style:mirror="none" fo:clip="rect(0cm, 0cm, 0cm, 0cm)" draw:luminance="0%" draw:contrast="0%" draw:red="0%" draw:green="0%" draw:blue="0%" draw:gamma="100%" draw:color-inversion="false" draw:image-opacity="100%" draw:color-mode="standard"/>
	</style:style>
	<style:style style:name="gr2" style:family="graphic">
			<style:graphic-properties fo:border="none" style:wrap="run-through" style:number-wrapped-paragraphs="no-limit" style:vertical-pos="from-top" style:horizontal-pos="from-left" style:horizontal-rel="paragraph" draw:wrap-influence-on-position="once-concurrent" style:flow-with-text="false"/>
	</style:style>
	<style:style style:name="gr3" style:family="graphic">
			<style:graphic-properties fo:border="none" style:wrap="run-through" style:number-wrapped-paragraphs="no-limit" style:vertical-pos="middle" style:vertical-rel="line" style:horizontal-pos="from-left" style:horizontal-rel="paragraph" draw:wrap-influence-on-position="once-concurrent" style:flow-with-text="false"/>
	</style:style>
	<style:style style:name="gr4" style:family="graphic">
			<style:graphic-properties draw:textarea-vertical-align="top" fo:border="none" style:wrap="run-through" style:number-wrapped-paragraphs="no-limit" style:vertical-pos="middle" style:vertical-rel="line" style:horizontal-pos="from-left" style:horizontal-rel="paragraph" draw:wrap-influence-on-position="once-concurrent" style:flow-with-text="false"/>
	</style:style>
	</office:automatic-styles>
	<office:body>
<xsl:apply-templates select="ausbildungsvertrag"/>
	</office:body>
</office:document-content>
</xsl:template>

<xsl:template match="ausbildungsvertrag">
	<office:text 
		text:use-soft-page-breaks="true" 
		xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" 
		xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" 
		xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" 
		xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" 
		xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" 
		xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0">
		<text:tracked-changes text:track-changes="true"/>
		<text:sequence-decls>
		<text:sequence-decl text:display-outline-level="0" text:name="Illustration"/>
		<text:sequence-decl text:display-outline-level="0" text:name="Table"/>
		<text:sequence-decl text:display-outline-level="0" text:name="Text"/>
		<text:sequence-decl text:display-outline-level="0" text:name="Drawing"/>
		</text:sequence-decls>
		<text:h text:style-name="P22" text:outline-level="1" text:is-list-header="true">Ausbildungsvertrag</text:h>
				<!-- Ueberprueft ob benoetigte Datenfelder leer sind -->
				<xsl:if test="student_maxsemester = ''"><text:p text:style-name="P46">Ausbildungsdauer konnte nicht berechnet werden</text:p></xsl:if>
				<xsl:if test="lgartcode='1' and akadgrad = ''"><text:p text:style-name="P46">Kein Akademischer Grad für diesen Lehrgang hinterlegt</text:p></xsl:if>
				<xsl:if test="lgartcode='2' and akadgrad = ''"><text:p text:style-name="P46">Kein Akademischer Grad für diesen Lehrgang hinterlegt</text:p></xsl:if>
				
		<text:p text:style-name="P2"/>
		<text:p text:style-name="P4">Dieser Vertrag regelt das Rechtsverhältnis zwischen dem </text:p>
		<text:p text:style-name="P4"><text:span text:style-name="T1">Verein Fachhochschule Technikum Wien,</text:span> 1060 Wien, Mariahilfer Straße 37-39 (kurz „Erhalter“ genannt) einerseits <text:span text:style-name="T1">und</text:span></text:p>
		<text:p text:style-name="P2"/>
		<text:p text:style-name="P6">Familienname: <text:tab/><xsl:value-of select="nachname"/></text:p>
		<text:p text:style-name="P6">Vorname: <text:tab/><xsl:value-of select="vorname"/></text:p>
		<text:p text:style-name="P6">Akademische/r Titel: <text:tab/>
		<xsl:choose>
			<xsl:when test="titelpre!='' or titelpost!=''">
			<xsl:value-of select="titelpre"/><xsl:value-of select="titelpost"/>
			</xsl:when>
			<xsl:otherwise>-</xsl:otherwise>
		</xsl:choose>
		</text:p>
		<text:p text:style-name="P6">Adresse: <text:tab/><xsl:value-of select="strasse"/>; <xsl:value-of select="plz"/></text:p>
		<text:p text:style-name="P7">Geburtsdatum: <text:tab/><text:database-display text:table-name="" text:table-type="table" text:column-name="Geb.datum"><xsl:value-of select="gebdatum"/></text:database-display></text:p>
		<text:p text:style-name="P1">
		<text:span text:style-name="T10"><text:span text:style-name="T10">Sozialversicherungsnummer:</text:span>
		<text:span text:style-name="Footnote_20_Symbol">
			<text:span text:style-name="T10">
			<text:note text:id="ftn1" text:note-class="footnote">
			 <text:note-citation text:label="1">1</text:note-citation>
				<text:note-body>
				<text:p text:style-name="Standard">
					<text:span text:style-name="T4">
					<text:s/>
					</text:span>
					<text:span text:style-name="T5">Gemäß § 3 Absatz 1 des Bildungsdokumentationsgesetzes und der Bildungsdokumentationsverordnung-Fachhochschulen <text:s/>hat der Erhalter die Sozialversicherungsnummer zu erfassen und gemäß § 7 Absatz 2 im Wege der Agentur für Qualitätssicherung und Akkreditierung Austria an das zuständige Bundesministerium und die Bundesanstalt Statistik Österreich zu übermitteln.</text:span>
				</text:p>
				<text:p text:style-name="P10"/>
				</text:note-body>
			</text:note>
			</text:span>
		</text:span><text:tab/><xsl:value-of select="svnr"/></text:span>
		</text:p>
		<text:p text:style-name="P11"/>
		<text:p text:style-name="P4">(kurz „ao. Studentin“ bzw. „ao. Student“ genannt) andererseits, im Rahmen des Lehrgangs zur Weiterbildung nach §9 FHStG idgF</text:p>
		<text:p text:style-name="P11"/>
		<xsl:variable select="studiengang" name="studiengang"/>
		<text:p text:style-name="P4">
				<text:span text:style-name="T1"><xsl:value-of select="studiengang"/>, Lehrgangsnummer <xsl:value-of select="studiengang_kz"/>,
				</text:span>
		</text:p>
		<text:p text:style-name="P11"/>
		<text:p text:style-name="P4"> in der Organisationsform eines
			<xsl:choose>
				<xsl:when test="orgform = 'BB'" >
					<text:span text:style-name="T1">berufsbegleitenden</text:span> Lehrgangs zur Weiterbildung.
				</xsl:when>
				<xsl:when test="orgform = 'VZ'" >
					<text:span text:style-name="T1">Vollzeit</text:span>-Lehrgangs zur Weiterbildung.
				</xsl:when>
				<xsl:otherwise>
					Lehrgangs zur Weiterbildung.
				</xsl:otherwise>
			</xsl:choose>
		</text:p>
		<text:p text:style-name="P4">Dieser Lehrgang wird von der Technikum Wien GmbH organisiert und gemeinsam mit der Fachhochschule Technikum Wien durchgeführt. Es gelten die AGB der Technikum Wien GmbH, diese sind unter https://academy.technikum-wien.at/agb jederzeit abrufbar.
		</text:p>
		<text:p text:style-name="P13"/>
		<text:list xml:id="list305698312" text:continue-numbering="false" text:style-name="WW8Num7">
		<text:list-item>
			<text:list>
			<text:list-item>
				<text:p text:style-name="P26">Ausbildungsort</text:p>
			</text:list-item>
			</text:list>
		</text:list-item>
		</text:list>
		<text:p text:style-name="P5">Studienort sind die Räumlichkeiten der FH Technikum Wien, 1200 Wien, Höchstädtplatz. Bei Bedarf kann der Erhalter einen anderen Studienort in Wien festlegen, außerhochschulische Aktivitäten (z.B.: Exkursionen) können auch außerhalb von Wien stattfinden.</text:p>
		<text:p text:style-name="P14"/>
		<text:list xml:id="list932404618" text:continue-numbering="true" text:style-name="WW8Num7">
		<text:list-item>
			<text:list>
			<text:list-item>
				<text:p text:style-name="P26">Vertragsgrundlage</text:p>
			</text:list-item>
			</text:list>
		</text:list-item>
		</text:list>
		<text:p text:style-name="P5">Die Ausbildung erfolgt auf der Grundlage des Fachhochschul-Studiengesetzes, BGBl. Nr. 340/1993 idgF und des Hochschul-Qualitätssicherungsgesetzes, BGBl. I Nr. 74/2011 idgF und der Satzung der Fachhochschule Technikum Wien idgF.</text:p>
		<text:p text:style-name="P14"/>
		<text:list xml:id="list636990326" text:continue-numbering="true" text:style-name="WW8Num7">
		<text:list-item>
			<text:list>
			<text:list-item>
				<text:p text:style-name="P26">Ausbildungsdauer</text:p>
			</text:list-item>
			</text:list>
		</text:list-item>
		</text:list>
		<text:p text:style-name="P5">Die Ausbildungsdauer beträgt <xsl:value-of select="student_maxsemester"/> Semester.</text:p>
		<text:p text:style-name="P5"/>
		<text:p text:style-name="P5">Die ao. Studentin bzw. der ao. Student hat das Recht, eine Anerkennung nachgewiesener Kenntnisse beim Lehrgang zu beantragen. Eine solche Anerkennung setzt voraus, dass die erworbenen Kenntnisse mit dem Inhalt und dem Umfang der Lehrveranstaltung gleichwertig sind und bewirkt die Anrechnung der entsprechenden Lehrveranstaltung.</text:p>
		<text:p text:style-name="P14"/>
		<text:list xml:id="list107841840" text:continue-numbering="true" text:style-name="WW8Num7">
		<text:list-item>
			<text:list>
			<text:list-item>
				<text:p text:style-name="P43">Ausbildungsabschluss</text:p>
			</text:list-item>
			</text:list>
		</text:list-item>
		</text:list>
		<xsl:choose>
			<xsl:when test="lgartcode='1'">
				<text:p text:style-name="P5">Nach Abschluss aller vorgeschriebenen Prüfungen wird der akademische Grad &quot;<xsl:value-of select="akadgrad"/>&quot; verliehen.</text:p>
			</xsl:when>
			<xsl:when test="lgartcode='2'">
				<text:p text:style-name="P5">Nach Abschluss aller vorgeschriebenen Prüfungen wird der Titel &quot;<xsl:value-of select="akadgrad"/>&quot; verliehen.</text:p>
			</xsl:when>
			<xsl:otherwise>
				<text:p text:style-name="P5">Nach Abschluss aller vorgeschriebenen Prüfungen wird ein Zertifizierungsdiplom der Technikum Wien Academy verliehen.</text:p>
			</xsl:otherwise>
		</xsl:choose>

		<text:p text:style-name="P36"/>
		<text:list xml:id="list890989597" text:continue-numbering="true" text:style-name="WW8Num7">
		<text:list-item>
			<text:list>
			<text:list-item>
				<text:p text:style-name="P26">Rechte und Pflichten des Erhalters</text:p>
			</text:list-item>
			</text:list>
		</text:list-item>
		</text:list>
		<text:p text:style-name="P27">5.1 Rechte</text:p>
		<text:p text:style-name="P5">Der Erhalter führt eine periodische Überprüfung des Studiums im Hinblick auf Relevanz und Aktualität durch und ist im Einvernehmen mit dem FH-Kollegium berechtigt, daraus Änderungen des Lehrgangs zur Weiterbildung abzuleiten.</text:p>
		<text:p text:style-name="P5"/>
		<text:p text:style-name="P5">Der Erhalter ist berechtigt, die Daten der/des ao. Studierenden an den FH Technikum Wien Alumni Club zu übermitteln. Der Alumni Club ist der AbsolventInnenverein der FH Technikum Wien. Er hat zum Ziel, AbsolventInnen, Studierende und Lehrende miteinander zu vernetzen sowie AbsolventInnen laufend über Aktivitäten an der FH Technikum Wien zu informieren. Einer Zusendung von Informationen durch den Alumni Club kann jederzeit widersprochen werden.</text:p>
		<text:list xml:id="list1539722475" text:style-name="WW8Num4">
		<text:list-header>
			<text:p text:style-name="P39"/>
		</text:list-header>
		</text:list>
		<text:p text:style-name="P27">5.2 Pflichten</text:p>
		<text:list xml:id="list1245891399" text:continue-numbering="true" text:style-name="WW8Num4">
		<text:list-item>
			<text:p text:style-name="P40">Der Erhalter verpflichtet sich zur ordnungsgemäßen Planung und Durchführung des Lehrgangs. Der Erhalter ist verpflichtet, allfällige Änderungen des Lehrgangs zeitgerecht bekannt zu geben.</text:p>
		</text:list-item>
		<text:list-item>
			<text:p text:style-name="P40">Der Erhalter verpflichtet sich, jedenfalls folgende Dokumente zur Verfügung zu stellen: Studierendenausweis, Diploma Supplement, Urkunde über die Verleihung des akademischen Grades, Studienerfolgsbestätigung, Inskriptionsbestätigung.</text:p>
		</text:list-item>
		<text:list-item>
			<text:p text:style-name="P40">Der Erhalter verpflichtet sich zur sorgfaltsgemäßen Verwendung der personenbezogenen Daten der ao. Studierenden. Die Daten werden nur im Rahmen der gesetzlichen und vertraglichen Verpflichtungen sowie des Studienbetriebes verwendet und nicht an nicht berechtigte Dritte weitergegeben.</text:p>
		</text:list-item>
		</text:list>
		<text:p text:style-name="P38"/>
		<text:list xml:id="list1403787711" text:continue-list="list890989597" text:style-name="WW8Num7">
		<text:list-item>
			<text:list>
			<text:list-item>
				<text:p text:style-name="P26">Rechte und Pflichten der ao. Studierenden</text:p>
			</text:list-item>
			</text:list>
		</text:list-item>
		</text:list>
		<text:p text:style-name="P27">6.1 Rechte</text:p>
		<text:p text:style-name="P5">Die ao. Studentin bzw. der ao. Student hat das Recht auf einen Studienbetrieb gemäß den im Lehrgang zur Weiterbildung idgf und in der Satzung der FH Technikum Wien idgF festgelegten Bedingungen.</text:p>
		<text:p text:style-name="P5"/>
		<text:p text:style-name="P28">6.2 Pflichten</text:p>
		<text:p text:style-name="P29"><text:span text:style-name="T10">6.2.1 Einhaltung studienrelevanter Bestimmungen</text:span></text:p>
		<text:p text:style-name="P5">
			Die ao. Studentin bzw. der ao. Student ist verpflichtet, insbesondere folgende Bestimmungen einzuhalten:
		</text:p>
		<text:list xml:id="listausbver621" text:continue-numbering="true" text:style-name="WW8Num4">
		<text:list-item>
			<text:p text:style-name="P40">Studienordnung und Prüfungsordnung für Lehrgänge idgF</text:p>
		</text:list-item>
		<text:list-item>
			<text:p text:style-name="P40">Hausordnung idgF</text:p>
		</text:list-item>
		<text:list-item>
			<text:p text:style-name="P40">Brandschutzordnung idgF</text:p>
		</text:list-item>
		<text:list-item>
			<text:p text:style-name="P40">Bibliotheksordnung idgF</text:p>
		</text:list-item>
		<text:list-item>
			<text:p text:style-name="P40">Die für den jeweiligen Lehrgang geltende/n Laborordnung/en idgF</text:p>
		</text:list-item>
		</text:list>
		<text:p text:style-name="P29">
		Diese Dokumente sind öffentlich zugänglich unter www.technikum-wien.at.</text:p>
		<text:p text:style-name="P29">
		Darüber hinaus sind die AGB der Technikum Wien GmbH Bestandteil dieses Vertrages (https://academy.technikum-wien.at/agb).
		</text:p>
		<text:p text:style-name="P29"><text:span text:style-name="T10">6.2.2 Lehrgangskosten inkl. Studierendenbeitrag ("ÖH-Beitrag")</text:span>
		</text:p>
		<text:p text:style-name="P5">Voraussetzung für die Geltung dieses Ausbildungsvertrages und für die Teilnahme am Lehrgang ist die erfolgte vollständige Bezahlung der Lehrgangskosten zu den jeweiligen Zahlungsterminen. Bezüglich der Möglichkeiten (teilweiser) Rückerstattungen gelten die AGB der Technikum Wien GmbH für Lehrgänge zur Weiterbildung.
		Gemäß § 4 Abs. 10 FHStG sind ao. Studierende an Fachhochschulen Mitglieder der Österreichischen HochschülerInnenschaft (ÖH). Der/Die ao. Studierende hat semesterweise einen ÖH-Beitrag an den Erhalter zu entrichten, der diesen an die ÖH abführt. Die Entrichtung des Betrags ist Voraussetzung für die Zulassung zum Studium bzw. für dessen Fortsetzung.
	</text:p>

		<text:p text:style-name="P32">6.2.3 Beibringung persönlicher Daten</text:p>
		<text:p text:style-name="P35">Die ao. Studentin bzw. der ao. Student ist verpflichtet, persönliche Daten beizubringen, die auf Grund eines Gesetzes, einer Verordnung oder eines Bescheides vom Erhalter erfasst werden müssen oder zur Erfüllung des Ausbildungsvertrages bzw für den Studienbetrieb unerlässlich sind.</text:p>
		<text:p text:style-name="P32">6.2.4 Aktualisierung eigener Daten und Bezug von Informationen</text:p>
		<text:p text:style-name="P35">Die ao. Studentin bzw. der ao. Student hat unaufgefordert dafür zu sorgen, dass die von ihr/ihm beigebrachten Daten aktuell sind. Änderungen sind der Lehrgangsassistenz unverzüglich schriftlich mitzuteilen. Darüber hinaus trifft sie/ihn die Pflicht, sich von studienbezogenen Informationen, die ihr/ihm an die vom Erhalter zur Verfügung gestellte Emailadresse zugestellt werden, in geeigneter Weise Kenntnis zu verschaffen.</text:p>
		<text:p text:style-name="P32">6.2.5 Verwertungsrechte</text:p>
		<text:p text:style-name="P35">Sofern nicht im Einzelfall andere Regelungen zwischen dem Erhalter und der ao. Studentin oder dem ao. Studenten getroffen wurden, ist die ao. Studentin oder der ao. Student verpflichtet, dem Erhalter die Rechte an Forschungs- und Entwicklungsergebnissen auf dessen schriftliche Anfrage hin anzubieten.</text:p>
		<text:p text:style-name="P32">6.2.6 Aufzeichnungen und Mitschnitte</text:p>
		<text:p text:style-name="P35">Es ist der/dem ao. Studierenden ausdrücklich untersagt, Lehrveranstaltungen als Ganzes oder nur Teile davon aufzuzeichnen und/oder mitzuschneiden (z.B. durch Film- und/oder Tonaufnahmen oder sonstige hierfür geeignete audiovisuelle Mittel). Darüber hinaus ist jede Form der öffentlichen Zurverfügungstellung (drahtlos oder drahtgebunden) der vorgenannten Aufnahmen z.B. in sozialen Netzwerken wie Facebook, WhatsAPP, LinkedIn, Xing etc, aber auch auf Youtube, Instagram usw. oder durch sonstige für diese Zwecke geeignete Kommunikationsmittel untersagt. Diese Regelungen gelten sinngemäß auch für Skripten, sonstige Lernbehelfe und Prüfungsangaben.</text:p>
		<text:p text:style-name="P35">Ausgenommen hiervon ist eine Aufzeichnung zu ausschließlichen Lern-, Studien- und Forschungszwecken und zum privaten Gebrauch, sofern hierfür der/die Vortragende vorab ausdrücklich seine/ihre schriftliche Zustimmung erteilt hat.</text:p>
		<text:p text:style-name="P31">6.2.7 Geheimhaltungspflicht</text:p>
		<text:p text:style-name="P5">Die ao. Studentin bzw. der ao. Student ist zur Geheimhaltung von Forschungs- und Entwicklungsaktivitäten und -ergebnissen gegenüber Dritten verpflichtet. </text:p>
		<text:p text:style-name="P31">6.2.8 Schadensmeldung</text:p>
		<text:p text:style-name="P5">Im Falle des Eintretens eines Schadens am Inventar der Fachhochschule ist der/die ao. Studierende verpflichtet, diesen innerhalb von drei Tagen dem Lehrgangssekretariat zu melden. Allfällige Haftungsansprüche bleiben hiervon unberührt.</text:p>
		<text:p text:style-name="P31">6.2.9 Rückgabeverpflichtung bei Studienende</text:p>
		<text:p text:style-name="P5">Die ao. Studentin bzw. der ao. Student ist verpflichtet, bei einer Beendigung des Lehrgangs unverzüglich alle zur Verfügung gestellten Gerätschaften, Bücher, Schlüssel und sonstige Materialien zurückzugeben.</text:p>

		<text:p text:style-name="P38"/>
		<text:list xml:id="list866389060" text:continue-list="list1403787711" text:style-name="WW8Num7">
		<text:list-item>
			<text:list>
			<text:list-item>
				<text:p text:style-name="P26">Beendigung des Vertrages</text:p>
			</text:list-item>
			</text:list>
		</text:list-item>
		</text:list>
		<text:p text:style-name="P27">7.1 Auflösung im beiderseitigen Einvernehmen</text:p>
		<text:p text:style-name="P8">Im beiderseitigen Einvernehmen ist die Auflösung des Ausbildungsvertrages jederzeit ohne Angabe von Gründen möglich. Die einvernehmliche Auflösung bedarf der Schriftform.</text:p>
		<text:p text:style-name="P3"/>
		<text:p text:style-name="P27">7.2 Kündigung durch die ao. Studentin bzw. den ao. Studenten</text:p>
		<text:p text:style-name="P8">Die ao. Studentin bzw. der ao. Student kann den Ausbildungsvertrag schriftlich jeweils zum Ende eines Semesters kündigen. Die Verpflichtung zur vollständigen Leistung der Lehrgangskosten wird von einer Kündigung durch die ao. Studentin bzw. den ao. Studenten nicht berührt.</text:p>
		<text:p text:style-name="P3"/>
		<text:p text:style-name="P27">7.3 Automatische Beendigung des Vertrages</text:p>
		<text:p text:style-name="P8">Der Ausbildungsvertrag erlischt mit dem Abschluss des Lehrgangs. Der Vertrag endet automatisch durch die negative Beurteilung der letztmöglichen Prüfungswiederholung, in diesem Fall bleibt die Verpflichtung zur vollständigen Leistung der Lehrgangskosten unberührt.</text:p>
		<text:p text:style-name="P3"/>
		<text:p text:style-name="P27">7.4 Ausschluss durch den Erhalter</text:p>
		<text:p text:style-name="P5">Der Erhalter kann die ao. Studentin bzw. den ao. Studenten aus wichtigem Grund mit sofortiger Wirkung vom weiteren Studium ausschließen, und zwar beispielsweise wegen</text:p>
		<text:list xml:id="list1474649563" text:continue-list="list1358297633" text:style-name="WW8Num4">
		<text:list-item>
			<text:p text:style-name="P40">nicht genügender Leistung im Sinne der Prüfungsordnung;</text:p>
		</text:list-item>
		<text:list-item>
			<text:p text:style-name="P40">mehrmaligem unentschuldigten Verletzen der Anwesenheitspflicht ;</text:p>
		</text:list-item>
		<text:list-item>
			<text:p text:style-name="P40">wiederholtem Nichteinhalten von Prüfungsterminen und Abgabeterminen für Seminararbeiten, Projektarbeiten etc.;</text:p>
		</text:list-item>
		<text:list-item>
			<text:p text:style-name="P40">schwerwiegender bzw. wiederholter Verstöße gegen die Hausordnung;</text:p>
		</text:list-item>
		<text:list-item>
			<text:p text:style-name="P40">persönlichem Verhalten, das zu einer Beeinträchtigung des Images und/oder Betriebes des Lehrgangs, der Fachhochschule bzw. des Erhalters oder von Personen führt, die für die Fachhochschule bzw. den Erhalter tätig sind;</text:p>
		</text:list-item>
		<text:list-item>
			<text:p text:style-name="P40">Weigerung zur Beibringung von Daten (siehe Pkt. 6.2.3)</text:p>
		</text:list-item>
		<text:list-item>
			<text:p text:style-name="P40">Verletzung der Verpflichtung, dem Erhalter die Rechte an Forschungs- und Entwicklungsergebnissen anzubieten (siehe Pkt. 6.2.5);</text:p>
		</text:list-item>
		<text:list-item>
			<text:p text:style-name="P40">Verletzung der Geheimhaltungspflicht (siehe Pkt. 6.2.7); </text:p>
		</text:list-item>
		<text:list-item>
			<text:p text:style-name="P40">strafgerichtlicher Verurteilung (wobei die Art des Deliktes und der Grad der Schuld berücksichtigt werden);</text:p>
		</text:list-item>
		<text:list-item>
			<text:p text:style-name="P40">Nichterfüllung finanzieller Verpflichtungen trotz Mahnung;</text:p>
		</text:list-item>
		<text:list-item>
			<text:p text:style-name="P40">Plagiieren im Rahmen wissenschaftlicher Arbeiten</text:p>
		</text:list-item>
		</text:list>
		<text:p text:style-name="P12"/>
		<text:p text:style-name="P5">Der Ausschluss kann mündlich erklärt werden. Mit Ausspruch des Ausschlusses endet der Ausbildungsvertrag, es sei denn, es wird ausdrücklich auf einen anderen Endtermin hingewiesen. Eine schriftliche Bestätigung des Ausschlusses wird innerhalb von zwei Wochen nach dessen Ausspruch per Post an die bekannt gegebene Adresse abgeschickt oder auf andere geeignete Weise übermittelt.</text:p>
		<text:p text:style-name="P5">Gleichzeitig mit dem Ausspruch des Ausschlusses kann auch ein Hausverbot verhängt werden. Die Verpflichtung zur vollständigen Leistung der Lehrgangskosten wird von einem Ausschluss nicht berührt.</text:p>
		<text:p text:style-name="P5"/>

		<text:list xml:id="list422793909" text:continue-list="list866389060" text:style-name="WW8Num7">
		<text:list-item>
			<text:list>
			<text:list-item>
				<text:p text:style-name="P26">
				Ergänzende Vereinbarungen
				</text:p>
			</text:list-item>
			</text:list>
		</text:list-item>
		</text:list>
		<text:p text:style-name="P5">
		Ao. Studierende des Programms sind verpflichtet, eine EDV-Ausstattung zu beschaffen und zu unterhalten, die es ermöglicht, an den Fernlehrelementen teilzunehmen. Die gesamten Kosten der Anschaffung und des Betriebs (inkl. Kosten für Internet und e-mail) trägt der ao. Student bzw. die ao. Studentin.
		</text:p>
		<text:p text:style-name="P5"/>

		<text:list xml:id="list398292235" text:continue-list="list866389060" text:style-name="WW8Num7">
		<text:list-item>
			<text:list>
			<text:list-item>
				<text:p text:style-name="P26"><text:soft-page-break/>Unwirksamkeit von Vertragsbestimmungen </text:p>
			</text:list-item>
			</text:list>
		</text:list-item>
		</text:list>
		<text:p text:style-name="P5">Sollten einzelne Bestimmungen dieses Vertrages unwirksam oder nichtig sein oder werden, so berührt dies die Gültigkeit der übrigen Bestimmungen dieses Vertrages nicht.</text:p>
		<text:p text:style-name="P5"/>

		<text:list xml:id="list118967672" text:continue-list="list866389060" text:style-name="WW8Num7">
		<text:list-item>
			<text:list>
			<text:list-item>
				<text:p text:style-name="P26">Ausfertigungen, Gebühren, Gerichtsstand, geltendes Recht</text:p>
			</text:list-item>
			</text:list>
		</text:list-item>
		</text:list>
		<text:p text:style-name="P5">Die Ausfertigung dieses Vertrages erfolgt in zweifacher Ausführung. Ein Original verbleibt im zuständigen Administrationsbüro des Lehrgangs. Eine Ausfertigung wird der ao. Studentin bzw. dem ao. Studenten übergeben.</text:p>
		<text:p text:style-name="P5">Für Streitigkeiten aus diesem Vertrag gilt österreichisches Recht als vereinbart, allfällige Klagen sind beim sachlich zuständigen Gericht in Wien einzubringen.</text:p>
		<text:p text:style-name="P5">Der Ausbildungsvertrag ist gebührenfrei.</text:p>
		<text:p text:style-name="P5"/>
		<text:p text:style-name="P5"/>
		<text:p text:style-name="P18"><text:tab/><text:tab/><text:tab/><text:tab/><text:tab/><text:tab/><text:s text:c="8"/>Wien, <xsl:value-of select="datum_aktuell"/></text:p>
		<table:table table:name="Tabelle1" table:style-name="Tabelle1">
		<table:table-column table:style-name="Tabelle1.A"/>
		<table:table-column table:style-name="Tabelle1.B"/>
		<table:table-column table:style-name="Tabelle1.A"/>
		<table:table-row table:style-name="Tabelle1.1">
			<table:table-cell table:style-name="Tabelle1.A1" office:value-type="string">
			<text:p text:style-name="P19">Ort, Datum</text:p>
			</table:table-cell>
			<table:table-cell table:style-name="Tabelle1.B1" office:value-type="string">
			<text:p text:style-name="P21"/>
			</table:table-cell>
			<table:table-cell table:style-name="Tabelle1.A1" office:value-type="string">
			<text:p text:style-name="P19">Ort, Datum</text:p>
			<text:p text:style-name="P19"/>
			<text:p text:style-name="P19"/>
			<text:p text:style-name="P19"/>
			</table:table-cell>
		</table:table-row>
		<table:table-row table:style-name="Tabelle1.1">
			<table:table-cell table:style-name="Tabelle1.A2" office:value-type="string">
			<text:p text:style-name="P20">Die ao. Studentin/der ao. Student<text:line-break/>ggf. gesetzliche VertreterInnen</text:p>
			</table:table-cell>
			<table:table-cell table:style-name="Tabelle1.B1" office:value-type="string">
			<text:p text:style-name="P21"/>
			</table:table-cell>
			<table:table-cell table:style-name="Tabelle1.A2" office:value-type="string">
			<text:p text:style-name="P19">Für die FH Technikum Wien</text:p>
			</table:table-cell>
		</table:table-row>
		</table:table>
		<text:p text:style-name="P18"/>
	</office:text>
</xsl:template>
</xsl:stylesheet>
