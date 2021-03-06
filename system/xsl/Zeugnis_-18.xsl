<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0"
>

<xsl:output method="xml" version="1.0" indent="yes"/>
<xsl:template match="zeugnisse">

<office:document-content xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0" xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0" xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0" xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0" xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0" xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0" xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0" xmlns:ooo="http://openoffice.org/2004/office" xmlns:ooow="http://openoffice.org/2004/writer" xmlns:oooc="http://openoffice.org/2004/calc" xmlns:dom="http://www.w3.org/2001/xml-events" xmlns:xforms="http://www.w3.org/2002/xforms" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rpt="http://openoffice.org/2005/report" xmlns:of="urn:oasis:names:tc:opendocument:xmlns:of:1.2" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:grddl="http://www.w3.org/2003/g/data-view#" xmlns:officeooo="http://openoffice.org/2009/office" xmlns:tableooo="http://openoffice.org/2009/table" xmlns:drawooo="http://openoffice.org/2010/draw" xmlns:calcext="urn:org:documentfoundation:names:experimental:calc:xmlns:calcext:1.0" xmlns:loext="urn:org:documentfoundation:names:experimental:office:xmlns:loext:1.0" xmlns:field="urn:openoffice:names:experimental:ooo-ms-interop:xmlns:field:1.0" xmlns:formx="urn:openoffice:names:experimental:ooxml-odf-interop:xmlns:form:1.0" xmlns:css3t="http://www.w3.org/TR/css3-text/" office:version="1.2">
    <office:scripts/>
    <office:font-face-decls>
        <style:font-face style:name="Mangal2" svg:font-family="Mangal"/>
        <style:font-face style:name="Mangal" svg:font-family="Mangal" style:font-family-generic="roman"/>
        <style:font-face style:name="Liberation Serif" svg:font-family="&apos;Liberation Serif&apos;" style:font-family-generic="roman" style:font-pitch="variable"/>
        <style:font-face style:name="Arial" svg:font-family="Arial" style:font-adornments="Standard" style:font-family-generic="swiss" style:font-pitch="variable"/>
        <style:font-face style:name="Liberation Sans" svg:font-family="&apos;Liberation Sans&apos;" style:font-family-generic="swiss" style:font-pitch="variable"/>
        <style:font-face style:name="Liberation Sans1" svg:font-family="&apos;Liberation Sans&apos;" style:font-family-generic="system" style:font-pitch="variable"/>
        <style:font-face style:name="Mangal1" svg:font-family="Mangal" style:font-family-generic="system" style:font-pitch="variable"/>
        <style:font-face style:name="Microsoft YaHei" svg:font-family="&apos;Microsoft YaHei&apos;" style:font-family-generic="system" style:font-pitch="variable"/>
        <style:font-face style:name="SimSun" svg:font-family="SimSun" style:font-family-generic="system" style:font-pitch="variable"/>
        <style:font-face style:name="Tahoma" svg:font-family="Tahoma" style:font-family-generic="system" style:font-pitch="variable"/>
    </office:font-face-decls>
    <office:automatic-styles>
        <style:style style:name="Tabelle1" style:family="table">
            <style:table-properties style:width="16.401cm" fo:margin-top="0.199cm" fo:margin-bottom="0cm" table:align="margins"/>
        </style:style>
        <style:style style:name="Tabelle1.A" style:family="table-column">
            <style:table-column-properties style:column-width="10.437cm" style:rel-column-width="41702*"/>
        </style:style>
        <style:style style:name="Tabelle1.B" style:family="table-column">
            <style:table-column-properties style:column-width="1.988cm" style:rel-column-width="7944*"/>
        </style:style>
        <style:style style:name="Tabelle1.D" style:family="table-column">
            <style:table-column-properties style:column-width="1.988cm" style:rel-column-width="7945*"/>
        </style:style>
        <style:style style:name="Tabelle1.1" style:family="table-row">
            <style:table-row-properties style:min-row-height="0.75cm"/>
        </style:style>
        <style:style style:name="Tabelle1.A1" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:background-color="#afb8bc" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.079cm" fo:padding-bottom="0.079cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="0.05pt solid #000000" fo:border-bottom="0.05pt solid #000000">
                <style:background-image/>
            </style:table-cell-properties>
        </style:style>
        <style:style style:name="Tabelle1.D1" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:background-color="#afb8bc" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.079cm" fo:padding-bottom="0.079cm" fo:border="0.05pt solid #000000">
                <style:background-image/>
            </style:table-cell-properties>
        </style:style>
        <style:style style:name="Tabelle1.A2" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.B2" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.C2" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.D2" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.05pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.A3" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.B3" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.C3" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.D3" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.05pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.A4" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.B4" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.C4" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.D4" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.05pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.A5" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.B5" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.C5" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.D5" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.05pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.A6" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.B6" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.C6" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.D6" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.05pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.A7" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.B7" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.07cm" fo:padding-bottom="0.07cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.C7" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.079cm" fo:padding-bottom="0.079cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.D7" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.079cm" fo:padding-bottom="0.079cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.05pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.A8" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.079cm" fo:padding-bottom="0.079cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.B8" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.079cm" fo:padding-bottom="0.079cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.C8" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.079cm" fo:padding-bottom="0.079cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle1.D8" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding-left="0.101cm" fo:padding-right="0.101cm" fo:padding-top="0.079cm" fo:padding-bottom="0.079cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.05pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle2" style:family="table">
            <style:table-properties style:width="16.401cm" table:align="margins"/>
        </style:style>
        <style:style style:name="Tabelle2.A" style:family="table-column">
            <style:table-column-properties style:column-width="10.437cm" style:rel-column-width="41702*"/>
        </style:style>
        <style:style style:name="Tabelle2.B" style:family="table-column">
            <style:table-column-properties style:column-width="5.964cm" style:rel-column-width="23833*"/>
        </style:style>
        <style:style style:name="Tabelle2.1" style:family="table-row">
            <style:table-row-properties style:min-row-height="0.75cm"/>
        </style:style>
        <style:style style:name="Tabelle2.A1" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:background-color="#afb8bc" fo:padding="0.097cm" fo:border="0.05pt solid #000000">
                <style:background-image/>
            </style:table-cell-properties>
        </style:style>
        <style:style style:name="Tabelle2.A2" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding="0.097cm" fo:border-left="0.05pt solid #000000" fo:border-right="none" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle2.B2" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="middle" fo:padding="0.097cm" fo:border-left="0.05pt solid #000000" fo:border-right="0.05pt solid #000000" fo:border-top="none" fo:border-bottom="0.05pt solid #000000"/>
        </style:style>
        <style:style style:name="Tabelle3" style:family="table">
            <style:table-properties style:width="16.401cm" fo:margin-top="0cm" fo:margin-bottom="0cm" table:align="margins" style:may-break-between-rows="false"/>
        </style:style>
        <style:style style:name="Tabelle3.A" style:family="table-column">
            <style:table-column-properties style:column-width="5.001cm" style:rel-column-width="19981*"/>
        </style:style>
        <style:style style:name="Tabelle3.B" style:family="table-column">
            <style:table-column-properties style:column-width="3.9cm" style:rel-column-width="15583*"/>
        </style:style>
        <style:style style:name="Tabelle3.C" style:family="table-column">
            <style:table-column-properties style:column-width="7.5cm" style:rel-column-width="29971*"/>
        </style:style>
        <style:style style:name="Tabelle3.A1" style:family="table-cell">
            <style:table-cell-properties style:vertical-align="" fo:padding-left="0cm" fo:padding-right="0cm" fo:padding-top="0.101cm" fo:padding-bottom="0.101cm" fo:border-left="none" fo:border-right="none" fo:border-top="none" fo:border-bottom="1pt dotted #000000"/>
        </style:style>
        <style:style style:name="Tabelle3.B1" style:family="table-cell">
            <style:table-cell-properties fo:padding-left="0cm" fo:padding-right="0cm" fo:padding-top="0.101cm" fo:padding-bottom="0.101cm" fo:border="none"/>
        </style:style>
        <style:style style:name="Tabelle3.C1" style:family="table-cell">
            <style:table-cell-properties fo:padding-left="0cm" fo:padding-right="0cm" fo:padding-top="0.101cm" fo:padding-bottom="0.101cm" fo:border-left="none" fo:border-right="none" fo:border-top="none" fo:border-bottom="1pt dotted #000000"/>
        </style:style>
        <style:style style:name="Tabelle3.A2" style:family="table-cell">
            <style:table-cell-properties fo:padding-left="0cm" fo:padding-right="0cm" fo:padding-top="0.101cm" fo:padding-bottom="0.101cm" fo:border="none"/>
        </style:style>
        <style:style style:name="Tabelle3.B2" style:family="table-cell">
            <style:table-cell-properties fo:padding-left="0cm" fo:padding-right="0cm" fo:padding-top="0.101cm" fo:padding-bottom="0.101cm" fo:border="none"/>
        </style:style>
        <style:style style:name="Tabelle3.C2" style:family="table-cell">
            <style:table-cell-properties fo:padding-left="0cm" fo:padding-right="0cm" fo:padding-top="0.101cm" fo:padding-bottom="0.101cm" fo:border="none"/>
        </style:style>
        <style:style style:name="P1" style:family="paragraph" style:parent-style-name="Standard">
            <style:text-properties fo:font-size="9pt" officeooo:rsid="000de2a1" officeooo:paragraph-rsid="000de2a1" style:font-size-asian="9pt" style:font-size-complex="9pt"/>
        </style:style>
        <style:style style:name="P2" style:family="paragraph" style:parent-style-name="Standard">
            <style:paragraph-properties fo:text-align="end" style:justify-single-word="false"/>
            <style:text-properties fo:font-size="9pt" officeooo:rsid="000f65a0" officeooo:paragraph-rsid="000f65a0" style:font-size-asian="9pt" style:font-size-complex="9pt"/>
        </style:style>
        <style:style style:name="P3" style:family="paragraph" style:parent-style-name="Standard">
            <style:text-properties fo:font-size="9pt" officeooo:rsid="000f65a0" officeooo:paragraph-rsid="000f65a0" style:font-size-asian="9pt" style:font-size-complex="9pt"/>
        </style:style>
        <style:style style:name="P4" style:family="paragraph" style:parent-style-name="Standard">
            <style:paragraph-properties>
                <style:tab-stops>
                    <style:tab-stop style:position="4.498cm"/>
                </style:tab-stops>
            </style:paragraph-properties>
            <style:text-properties fo:font-size="9pt" officeooo:rsid="000f65a0" officeooo:paragraph-rsid="000f65a0" style:font-size-asian="9pt" style:font-size-complex="9pt"/>
        </style:style>
        <style:style style:name="P5" style:family="paragraph" style:parent-style-name="Standard">
            <style:text-properties fo:font-size="16pt" officeooo:rsid="000de2a1" officeooo:paragraph-rsid="000de2a1" style:font-size-asian="16pt" style:font-size-complex="16pt"/>
        </style:style>
        <style:style style:name="P6" style:family="paragraph" style:parent-style-name="Standard">
            <style:text-properties fo:font-size="16pt" fo:font-weight="bold" officeooo:rsid="000de2a1" officeooo:paragraph-rsid="000de2a1" style:font-size-asian="16pt" style:font-weight-asian="bold" style:font-size-complex="16pt" style:font-weight-complex="bold"/>
        </style:style>
        <style:style style:name="P7" style:family="paragraph" style:parent-style-name="Standard">
            <style:text-properties fo:font-size="6pt" officeooo:rsid="000f65a0" officeooo:paragraph-rsid="000f65a0" style:font-size-asian="5.25pt" style:font-size-complex="6pt"/>
        </style:style>
        <style:style style:name="P8" style:family="paragraph" style:parent-style-name="Table_20_Contents">
            <style:text-properties fo:font-size="9pt" officeooo:rsid="000f65a0" officeooo:paragraph-rsid="000f65a0" style:font-size-asian="9pt" style:font-size-complex="9pt"/>
        </style:style>
        <style:style style:name="P9" style:family="paragraph" style:parent-style-name="Table_20_Contents">
            <style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
            <style:text-properties fo:font-size="9pt" officeooo:rsid="000f65a0" officeooo:paragraph-rsid="000f65a0" style:font-size-asian="9pt" style:font-size-complex="9pt"/>
        </style:style>
        <style:style style:name="P10" style:family="paragraph" style:parent-style-name="Table_20_Contents">
            <style:paragraph-properties fo:text-align="start" style:justify-single-word="false"/>
            <style:text-properties fo:font-size="9pt" officeooo:rsid="000f65a0" officeooo:paragraph-rsid="000f65a0" style:font-size-asian="9pt" style:font-size-complex="9pt"/>
        </style:style>
        <style:style style:name="P11" style:family="paragraph" style:parent-style-name="Table_20_Contents">
            <style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
            <style:text-properties fo:font-size="9pt" officeooo:rsid="0010009a" officeooo:paragraph-rsid="0010009a" style:font-size-asian="9pt" style:font-size-complex="9pt"/>
        </style:style>
        <style:style style:name="P12" style:family="paragraph" style:parent-style-name="Table_20_Contents">
            <style:paragraph-properties fo:text-align="start" style:justify-single-word="false"/>
            <style:text-properties fo:font-size="9pt" officeooo:rsid="0010009a" officeooo:paragraph-rsid="0010009a" style:font-size-asian="9pt" style:font-size-complex="9pt"/>
        </style:style>
        <style:style style:name="P13" style:family="paragraph" style:parent-style-name="Table_20_Contents">
            <style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
            <style:text-properties fo:font-size="9pt" style:font-size-asian="9pt" style:font-size-complex="9pt"/>
        </style:style>
        <style:style style:name="P14" style:family="paragraph" style:parent-style-name="Table_20_Contents">
            <style:paragraph-properties fo:text-align="start" style:justify-single-word="false"/>
            <style:text-properties fo:font-size="9pt" fo:font-weight="bold" officeooo:rsid="000f65a0" officeooo:paragraph-rsid="000f65a0" style:font-size-asian="9pt" style:font-weight-asian="bold" style:font-size-complex="9pt" style:font-weight-complex="bold"/>
        </style:style>
        <style:style style:name="P15" style:family="paragraph" style:parent-style-name="Table_20_Contents">
            <style:paragraph-properties fo:text-align="center" style:justify-single-word="false"/>
            <style:text-properties fo:font-size="9pt" fo:font-weight="bold" officeooo:rsid="000f65a0" officeooo:paragraph-rsid="000f65a0" style:font-size-asian="9pt" style:font-weight-asian="bold" style:font-size-complex="9pt" style:font-weight-complex="bold"/>
        </style:style>
        <style:style style:name="P16" style:family="paragraph" style:parent-style-name="Table_20_Contents">
            <style:text-properties fo:font-size="9pt" style:font-size-complex="9pt"/>
        </style:style>
        <style:style style:name="P17" style:family="paragraph" style:parent-style-name="Table_20_Contents">
            <style:text-properties fo:font-size="9pt" officeooo:rsid="0013c612" officeooo:paragraph-rsid="0013c612" style:font-size-complex="9pt"/>
        </style:style>
        <style:style style:name="P18" style:family="paragraph" style:parent-style-name="Table_20_Contents">
            <style:paragraph-properties fo:background-color="#afb8bc">
                <style:background-image/>
            </style:paragraph-properties>
            <style:text-properties fo:font-size="9pt" fo:font-weight="bold" officeooo:rsid="000f65a0" officeooo:paragraph-rsid="000f65a0" style:font-size-asian="9pt" style:font-weight-asian="bold" style:font-size-complex="9pt" style:font-weight-complex="bold"/>
        </style:style>
        <style:style style:name="P19" style:family="paragraph" style:parent-style-name="Standard">
            <style:text-properties fo:font-size="9pt" officeooo:rsid="0013c612" officeooo:paragraph-rsid="0010009a" style:font-size-asian="7.84999990463257pt" style:font-size-complex="9pt"/>
        </style:style>
        <style:style style:name="P20" style:family="paragraph" style:parent-style-name="Standard">
            <style:text-properties fo:font-size="9pt" officeooo:rsid="000de2a1" officeooo:paragraph-rsid="000de2a1" style:font-size-asian="9pt" style:font-size-complex="9pt"/>
        </style:style>
        <style:style style:name="P21" style:family="paragraph" style:parent-style-name="Standard">
            <style:text-properties fo:font-size="9pt" officeooo:rsid="000f65a0" officeooo:paragraph-rsid="000f65a0" style:font-size-asian="9pt" style:font-size-complex="9pt"/>
        </style:style>
        <style:style style:name="P22" style:family="paragraph" style:parent-style-name="Standard">
            <style:paragraph-properties>
                <style:tab-stops>
                    <style:tab-stop style:position="1.499cm"/>
                </style:tab-stops>
            </style:paragraph-properties>
            <style:text-properties fo:font-size="6pt" officeooo:rsid="000f65a0" officeooo:paragraph-rsid="0024d69b" style:font-size-asian="6pt" style:font-size-complex="6pt"/>
        </style:style>
        <style:style style:name="P23" style:family="paragraph" style:parent-style-name="Standard">
            <style:paragraph-properties>
                <style:tab-stops>
                    <style:tab-stop style:position="1.499cm"/>
                </style:tab-stops>
            </style:paragraph-properties>
            <style:text-properties fo:font-size="6pt" officeooo:rsid="0010009a" officeooo:paragraph-rsid="0010009a" style:font-size-asian="6pt" style:font-size-complex="6pt"/>
        </style:style>
        <style:style style:name="P24" style:family="paragraph" style:parent-style-name="Standard">
            <style:text-properties fo:font-size="16pt" fo:font-weight="bold" officeooo:rsid="000de2a1" officeooo:paragraph-rsid="000de2a1" style:font-size-asian="16pt" style:font-weight-asian="bold" style:font-size-complex="16pt" style:font-weight-complex="bold"/>
        </style:style>
        <style:style style:name="P25" style:family="paragraph" style:parent-style-name="Standard">
            <style:text-properties fo:font-size="16pt" officeooo:rsid="000de2a1" officeooo:paragraph-rsid="000de2a1" style:font-size-asian="16pt" style:font-size-complex="16pt"/>
        </style:style>
        <style:style style:name="P26" style:family="paragraph" style:parent-style-name="Standard">
            <style:text-properties fo:font-size="2pt" officeooo:rsid="000f65a0" officeooo:paragraph-rsid="000f65a0" style:font-size-asian="1.75pt" style:font-size-complex="2pt"/>
        </style:style>
        <style:style style:name="P27" style:family="paragraph" style:parent-style-name="Standard">
            <style:text-properties fo:font-size="5pt" officeooo:rsid="000f65a0" officeooo:paragraph-rsid="000f65a0" style:font-size-asian="1.75pt" style:font-size-complex="2pt"/>
        </style:style>
        <style:style style:name="P28" style:family="paragraph" style:parent-style-name="Standard">
            <style:text-properties fo:font-size="12pt" officeooo:rsid="000f65a0" officeooo:paragraph-rsid="000f65a0" style:font-size-asian="12pt" style:font-size-complex="12pt"/>
        </style:style>
        <style:style style:name="T1" style:family="text">
            <style:text-properties fo:font-weight="bold" style:font-weight-asian="bold" style:font-weight-complex="bold"/>
        </style:style>
        <style:style style:name="T2" style:family="text">
            <style:text-properties officeooo:rsid="0024d69b"/>
        </style:style>
        <style:style style:name="T3" style:family="text">
            <style:text-properties officeooo:rsid="0027b377"/>
        </style:style>
        <style:style style:name="fr1" style:family="graphic" style:parent-style-name="Frame">
            <style:graphic-properties style:wrap="run-through" style:number-wrapped-paragraphs="no-limit" style:vertical-pos="from-top" style:vertical-rel="page-content" style:horizontal-pos="center" style:horizontal-rel="page-content" fo:padding="0cm" fo:border="none" style:shadow="none" draw:shadow-opacity="100%"/>
        </style:style>
        <style:style style:name="fr2" style:family="graphic" style:parent-style-name="Frame">
            <style:graphic-properties fo:margin-left="0cm" fo:margin-right="0cm" fo:margin-top="0cm" fo:margin-bottom="0cm" style:vertical-pos="top" style:vertical-rel="paragraph-content" style:horizontal-pos="left" style:horizontal-rel="paragraph" fo:padding="0cm" fo:border="none" style:shadow="none" draw:shadow-opacity="100%"/>
        </style:style>
        <style:style style:name="fr3" style:family="graphic" style:parent-style-name="Graphics">
            <style:graphic-properties style:run-through="foreground" style:wrap="run-through" style:number-wrapped-paragraphs="no-limit" style:vertical-pos="bottom" style:vertical-rel="page-content" style:horizontal-pos="from-left" style:horizontal-rel="page-content" style:mirror="none" fo:clip="rect(0cm, 0cm, 0cm, 0cm)" draw:luminance="0%" draw:contrast="0%" draw:red="0%" draw:green="0%" draw:blue="0%" draw:gamma="100%" draw:color-inversion="false" draw:image-opacity="100%" draw:color-mode="standard"/>
        </style:style>
    </office:automatic-styles>
	<office:body>
<xsl:apply-templates select="zeugnis"/>
	</office:body>
</office:document-content>
</xsl:template>

<xsl:template match="zeugnis">
        <office:text text:use-soft-page-breaks="true" xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0">
            <text:sequence-decls>
                <text:sequence-decl text:display-outline-level="0" text:name="Illustration"/>
                <text:sequence-decl text:display-outline-level="0" text:name="Table"/>
                <text:sequence-decl text:display-outline-level="0" text:name="Text"/>
                <text:sequence-decl text:display-outline-level="0" text:name="Drawing"/>
            </text:sequence-decls>
            <draw:frame draw:style-name="fr1" draw:name="Rahmen1" text:anchor-type="page" text:anchor-page-number="1" svg:y="21.001cm" draw:z-index="0">
                <draw:text-box fo:min-height="0.499cm" fo:min-width="2cm">
                    <table:table table:name="Tabelle3" table:style-name="Tabelle3">
                        <table:table-column table:style-name="Tabelle3.A"/>
                        <table:table-column table:style-name="Tabelle3.B"/>
                        <table:table-column table:style-name="Tabelle3.C"/>
                        <table:table-row>
                            <table:table-cell table:style-name="Tabelle3.A1" office:value-type="string">
                                <text:p text:style-name="P17">Wien, am <xsl:value-of select="ort_datum" /></text:p>
                            </table:table-cell>
                            <table:table-cell table:style-name="Tabelle3.B1" office:value-type="string">
                                <text:p text:style-name="P16"/>
                            </table:table-cell>
                            <table:table-cell table:style-name="Tabelle3.C1" office:value-type="string">
                                <text:p text:style-name="P16"/>
                            </table:table-cell>
                        </table:table-row>
                        <table:table-row>
                            <table:table-cell table:style-name="Tabelle3.A2" office:value-type="string">
                                <text:p text:style-name="P17">Ort, Datum</text:p>
                            </table:table-cell>
                            <table:table-cell table:style-name="Tabelle3.B2" office:value-type="string">
                                <text:p text:style-name="P16"/>
                            </table:table-cell>
                            <table:table-cell table:style-name="Tabelle3.C2" office:value-type="string">
                                <text:p text:style-name="P17"><xsl:value-of select="studiengangsleiter" /></text:p>
                                <text:p text:style-name="P17">Lehrgangsleitung</text:p>
                            </table:table-cell>
                        </table:table-row>
                    </table:table>
                </draw:text-box>
            </draw:frame>
            <draw:frame xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0" xmlns:xlink="http://www.w3.org/1999/xlink" draw:style-name="fr3" draw:name="Bild1" text:anchor-type="page" text:anchor-page-number="1" svg:x="5.2cm" svg:width="3.51cm" svg:height="3.51cm" draw:z-index="1">
                <draw:image xlink:href="Pictures/10000201000002290000022939997AEC.png" xlink:type="simple" xlink:show="embed" xlink:actuate="onLoad"/>
            </draw:frame>
            <text:p text:style-name="P6">ZEUGNIS</text:p>
            <text:p text:style-name="P6">
            	<xsl:choose>
					<xsl:when test="string-length(semester_bezeichnung)=0">
						<xsl:value-of select="stsem"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>Studienjahr 2014/15</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
            </text:p>
            <text:p text:style-name="P5"/>
            <text:p text:style-name="P28">Lehrgang zur Weiterbildung nach §9 FHStG idgF</text:p>
            <text:p text:style-name="P1">
                <draw:frame draw:style-name="fr2" draw:name="Rahmen2" text:anchor-type="paragraph" svg:width="8.999cm" draw:z-index="2">
                    <draw:text-box fo:min-height="0.499cm">
                        <text:p text:style-name="P6">Pre College Program</text:p>
                    </draw:text-box>
                </draw:frame>
            </text:p>
            <text:p text:style-name="P1"/>
            <text:p text:style-name="P1"/>
            <text:p text:style-name="P1"/>
            <text:p text:style-name="P1"/>
            <text:p text:style-name="P1"/>
            <text:p text:style-name="P2">Personenkennzeichen: <xsl:value-of select="matrikelnr" /></text:p>
            <text:p text:style-name="P2">Kennzahl des Lehrgangs: 0050018</text:p>
            <text:p text:style-name="P2"/>
            <text:p text:style-name="P3"/>
            <text:p text:style-name="P3"/>
            <text:p text:style-name="P3"/>
            <text:p text:style-name="P27"/>
            <text:p text:style-name="P4">Vorname/Familienname:<text:tab/>
                <text:span text:style-name="T1"><xsl:value-of select="name"/></text:span>
            </text:p>
            <text:p text:style-name="P27"/>
            <text:p text:style-name="P4">Geburtsdatum:<text:tab/><xsl:value-of select="gebdatum" /></text:p>
            <table:table table:name="Tabelle1" table:style-name="Tabelle1">
                <table:table-column table:style-name="Tabelle1.A"/>
                <table:table-column table:style-name="Tabelle1.B" table:number-columns-repeated="2"/>
                <table:table-column table:style-name="Tabelle1.D"/>
                <table:table-row table:style-name="Tabelle1.1">
                    <table:table-cell table:style-name="Tabelle1.A1" office:value-type="string">
                        <text:p text:style-name="P14">Lehrveranstaltung</text:p>
                    </table:table-cell>
                    <table:table-cell table:style-name="Tabelle1.A1" office:value-type="string">
                        <text:p text:style-name="P15">Note</text:p>
                    </table:table-cell>
                    <table:table-cell table:style-name="Tabelle1.A1" office:value-type="string">
                        <text:p text:style-name="P15">SWS</text:p>
                    </table:table-cell>
                    <table:table-cell table:style-name="Tabelle1.D1" office:value-type="string">
                        <text:p text:style-name="P15">ECTS-LP</text:p>
                    </table:table-cell>
                </table:table-row>
                <xsl:apply-templates select="unterrichtsfach"/>
                <table:table-row>
                    <table:table-cell table:style-name="Tabelle1.A7" office:value-type="string">
                        <text:p text:style-name="P10">Gesamt</text:p>
                    </table:table-cell>
                    <table:table-cell table:style-name="Tabelle1.B7" office:value-type="string">
                        <text:p text:style-name="P13">-</text:p>
                    </table:table-cell>
                    <table:table-cell table:style-name="Tabelle1.C7" office:value-type="string">
                        <text:p text:style-name="P13">-</text:p>
                    </table:table-cell>
                    <table:table-cell table:style-name="Tabelle1.D7" office:value-type="string">
                        <text:p text:style-name="P9"><xsl:value-of select="ects_gesamt"/></text:p>
                    </table:table-cell>
                </table:table-row>            
                <xsl:apply-templates select="fussnote"/> 
            </table:table>
            <text:p text:style-name="P26"/>
            <text:p text:style-name="P22">Notenstufen:<text:tab/>Sehr gut (1), Gut (2), Befriedigend (3), Genügend (4), Nicht genügend (5), mit Erfolg teilgenommen (met), nicht teilgenommen (nt), teilgenommen(tg),</text:p>
            <text:p text:style-name="P22">
                <text:tab/>angerechnet (ar), nicht beurteilt (nb), bestanden (b), erfolgreich absolviert (ea), nicht erfolgreich absolviert (nea)</text:p>
            <text:p text:style-name="P7"/>
            <xsl:if test="abschlusspruefung_typ">
	            <table:table table:name="Tabelle2" table:style-name="Tabelle2">
	                <table:table-column table:style-name="Tabelle2.A"/>
	                <table:table-column table:style-name="Tabelle2.B"/>
	                <table:table-row table:style-name="Tabelle2.1">
	                    <table:table-cell table:style-name="Tabelle2.A1" table:number-columns-spanned="2" office:value-type="string">
	                        <text:p text:style-name="P18">Kommissionelle Abschlussprüfung</text:p>
	                    </table:table-cell>
	                    <table:covered-table-cell/>
	                </table:table-row>
	                <table:table-row table:style-name="Tabelle2.1">
	                    <table:table-cell table:style-name="Tabelle2.A2" office:value-type="string">
	                        <xsl:if test="abschlusspruefung_typ='Bachelor'" >
								<text:p text:style-name="P8">Bachelorprüfung vom <xsl:value-of select="abschlusspruefung_datum" /></text:p>
							</xsl:if>
							<xsl:if test="abschlusspruefung_typ='Diplom'" >
								<text:p text:style-name="P8">Masterprüfung vom <xsl:value-of select="abschlusspruefung_datum" /></text:p>
							</xsl:if>
							
	                    </table:table-cell>
	                    <table:table-cell table:style-name="Tabelle2.B2" office:value-type="string">
	                        <text:p text:style-name="P8"><xsl:value-of select="abschlusspruefung_note" /></text:p>
	                    </table:table-cell>
	                </table:table-row>
	            </table:table>
	            <text:p text:style-name="P26"/>
	            <text:p text:style-name="P23">Notenstufen:<text:tab/>mit ausgezeichnetem Erfolg bestanden, mit gutem Erfolg bestanden, bestanden</text:p>
	            <text:p text:style-name="P19"/>
            </xsl:if>
        </office:text>
</xsl:template>
<xsl:template match="unterrichtsfach">
<table:table-row>
    <table:table-cell table:style-name="Tabelle1.A7" office:value-type="string">
    	<xsl:choose>
			<xsl:when test="bisio_von">
                        <text:p text:style-name="P12">Auslandsaufenthalt: <xsl:value-of select="bisio_von"/>-<xsl:value-of select="bisio_bis"/>, <xsl:value-of select="bisio_ort"/>, <xsl:value-of select="bisio_universitaet"/></text:p>
                        <text:p text:style-name="P12">Die im Ausland absolvierten Lehrveranstaltungen werden für das <xsl:value-of select="../semester"/>. Semester des Studiums an der Fachhochschule Technikum Wien angerechnet (Details siehe Transcript of Records der Gasthochschule).</text:p>
			</xsl:when>
			<xsl:otherwise>
				<text:p text:style-name="P10"><xsl:value-of select="bezeichnung"/></text:p>
			</xsl:otherwise>
		</xsl:choose>
    </table:table-cell>
    <table:table-cell table:style-name="Tabelle1.B2" office:value-type="string">
        <text:p text:style-name="P9">
        <xsl:if test="note=''">
			<xsl:text>-</xsl:text>
		</xsl:if>
		<xsl:value-of select="note"/>
        </text:p>
    </table:table-cell>
    <table:table-cell table:style-name="Tabelle1.C2" office:value-type="string">
        <text:p text:style-name="P9">
	        <xsl:if test="sws=''">
				<xsl:text>-</xsl:text>
			</xsl:if>
			<xsl:value-of select="sws"/>
		</text:p>
    </table:table-cell>
    <table:table-cell table:style-name="Tabelle1.D2" office:value-type="string">
        <text:p text:style-name="P9">
	        <xsl:if test="ects=''">
				<xsl:text>-</xsl:text>
			</xsl:if>
			<xsl:value-of select="ects"/>
		</text:p>
    </table:table-cell>
</table:table-row>
</xsl:template>
<xsl:template match="fussnote">
<table:table-row>
    <table:table-cell table:style-name="Tabelle1.A8" office:value-type="string">
    	<xsl:choose>
			<xsl:when test="themenbereich!=''">
				<text:p text:style-name="P10"><xsl:value-of select="fussnotenzeichen"/>
		        	<xsl:text> </xsl:text><text:span text:style-name="T1">Themenbereich:</text:span>
		        	<xsl:text> </xsl:text><xsl:value-of select="themenbereich"/>
		        </text:p>
		        <text:p text:style-name="P10">
		        	<xsl:text> </xsl:text><text:span text:style-name="T1"><xsl:value-of select="titel_bezeichnung"/>:</text:span>
       				<xsl:text> </xsl:text><xsl:value-of select="titel"/>
	        	</text:p>
			</xsl:when>
			<xsl:otherwise>
				<text:p text:style-name="P10"><xsl:value-of select="fussnotenzeichen"/>
		        	<xsl:text> </xsl:text><text:span text:style-name="T1"><xsl:value-of select="titel_bezeichnung"/>:</text:span>
      				 <xsl:text> </xsl:text><xsl:value-of select="titel"/>
        		</text:p>
        	</xsl:otherwise>
		</xsl:choose>
    </table:table-cell>
    <table:table-cell table:style-name="Tabelle1.B8" office:value-type="string">
        <text:p text:style-name="P13">
        	<xsl:if test="../projektarbeit_note_anzeige='true'">
				<xsl:value-of select="note"/>
			</xsl:if>
		</text:p>
    </table:table-cell>
    <table:table-cell table:style-name="Tabelle1.C8" office:value-type="string">
        <text:p text:style-name="P13">
        	<xsl:value-of select="sws"/>
        </text:p>
    </table:table-cell>
    <table:table-cell table:style-name="Tabelle1.D8" office:value-type="string">
        <text:p text:style-name="P13">
        	<xsl:value-of select="ects"/>
        </text:p>
    </table:table-cell>
</table:table-row>
</xsl:template>
</xsl:stylesheet>