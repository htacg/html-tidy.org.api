<?xml version="1.0"?>
<!--
    For generating the `quickref_include.html` from output of
    `tidy -xml-config`, which is used in our Doxygen documentation
    project.

    (c) 2005 (W3C) MIT, ERCIM, Keio University
    See tidy.h for the copyright notice.

    Written by Charles Reitzel and Jelks Cabaniss

-->

<xsl:stylesheet version="1.0"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" indent="yes"
     encoding="UTF-8"
     omit-xml-declaration="yes"
     />

<xsl:template match="/">

    <a name="qtop"></a>
    <h2 id="top">Option Groups</h2>
    <ul>
        <li><a class="h3" href="#DisplayHeader">Document Display</a></li>
        <li><a class="h3" href="#DocumentIOHeader">Document In and Out</a></li>
        <li><a class="h3" href="#FileIOHeader">File Input-Output</a></li>
        <li><a class="h3" href="#DiagnosticsHeader">Diagnostics</a></li>
        <li><a class="h3" href="#EncodingHeader">Encoding</a></li>
        <li><a class="h3" href="#MarkupCleanupHeader">Cleanup</a></li>
        <li><a class="h3" href="#MarkupEntitiesHeader">Entities</a></li>
        <li><a class="h3" href="#MarkupRepairHeader">Repair</a></li>
        <li><a class="h3" href="#MarkupXFormHeader">Transformation</a></li>
        <li><a class="h3" href="#MarkupTeachHeader">Teaching Tidy</a></li>
        <li><a class="h3" href="#PrettyPrintHeader">Pretty Print</a></li>
    </ul>
    <xsl:call-template name="link-section" />

    <xsl:call-template name="detail-section" />

</xsl:template>


<!-- Named Templates: -->

<xsl:template name="link-section">
  <table summary="Options Quick Reference Index Section" border="0"
  cellpadding="3" cellspacing="0" class="quickref">
    <colgroup>
      <col width="33%" />
      <col width="33%" />
      <col width="33%" />
    </colgroup>
    <xsl:call-template name="links">
      <xsl:with-param name="class">TidyDisplay</xsl:with-param>
      <xsl:with-param name="header">Document Display</xsl:with-param>
      <xsl:with-param name="headerID">DisplayHeader</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="links">
      <xsl:with-param name="class">TidyDocumentIO</xsl:with-param>
      <xsl:with-param name="header">Document In and Out</xsl:with-param>
      <xsl:with-param name="headerID">DocumentIOHeader</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="links">
      <xsl:with-param name="class">TidyFileIO</xsl:with-param>
      <xsl:with-param name="header">File Input-Output</xsl:with-param>
      <xsl:with-param name="headerID">FileIOHeader</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="links">
      <xsl:with-param name="class">TidyDiagnostics</xsl:with-param>
      <xsl:with-param name="header">Diagnostics</xsl:with-param>
      <xsl:with-param name="headerID">DiagnosticsHeader</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="links">
      <xsl:with-param name="class">TidyEncoding</xsl:with-param>
      <xsl:with-param name="header">Encoding</xsl:with-param>
      <xsl:with-param name="headerID">EncodingHeader</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="links">
      <xsl:with-param name="class">TidyMarkupCleanup</xsl:with-param>
      <xsl:with-param name="header">Cleanup</xsl:with-param>
      <xsl:with-param name="headerID">MarkupCleanupHeader</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="links">
      <xsl:with-param name="class">TidyMarkupEntities</xsl:with-param>
      <xsl:with-param name="header">Entities</xsl:with-param>
      <xsl:with-param name="headerID">MarkupEntitiesHeader</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="links">
      <xsl:with-param name="class">TidyMarkupRepair</xsl:with-param>
      <xsl:with-param name="header">Repair</xsl:with-param>
      <xsl:with-param name="headerID">MarkupRepairHeader</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="links">
      <xsl:with-param name="class">TidyMarkupXForm</xsl:with-param>
      <xsl:with-param name="header">Transformation</xsl:with-param>
      <xsl:with-param name="headerID">MarkupXFormHeader</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="links">
      <xsl:with-param name="class">TidyMarkupTeach</xsl:with-param>
      <xsl:with-param name="header">Teaching Tidy</xsl:with-param>
      <xsl:with-param name="headerID">MarkupTeachHeader</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="links">
      <xsl:with-param name="class">TidyPrettyPrint</xsl:with-param>
      <xsl:with-param name="header">Pretty Print</xsl:with-param>
      <xsl:with-param name="headerID">PrettyPrintHeader</xsl:with-param>
    </xsl:call-template>
  </table>
</xsl:template>


<xsl:template name="detail-section">
  <table summary="Tidy Options Quick Reference Detail Section" border="0"
    cellpadding="3" cellspacing="0">
    <xsl:call-template name="reference">
      <xsl:with-param name="class">TidyDisplay</xsl:with-param>
      <xsl:with-param name="header">Document Display</xsl:with-param>
      <xsl:with-param name="headerID">DisplayReference</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="reference">
      <xsl:with-param name="class">TidyDocumentIO</xsl:with-param>
      <xsl:with-param name="header">Document In and Out</xsl:with-param>
      <xsl:with-param name="headerID">DocumentIOReference</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="reference">
      <xsl:with-param name="class">TidyFileIO</xsl:with-param>
      <xsl:with-param name="header">File Input-Output</xsl:with-param>
      <xsl:with-param name="headerID">FileIOReference</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="reference">
      <xsl:with-param name="class">TidyDiagnostics</xsl:with-param>
      <xsl:with-param name="header">Diagnostics</xsl:with-param>
      <xsl:with-param name="headerID">DiagnosticsReference</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="reference">
      <xsl:with-param name="class">TidyEncoding</xsl:with-param>
      <xsl:with-param name="header">Encoding</xsl:with-param>
      <xsl:with-param name="headerID">EncodingReference</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="reference">
      <xsl:with-param name="class">TidyMarkupCleanup</xsl:with-param>
      <xsl:with-param name="header">Cleanup</xsl:with-param>
      <xsl:with-param name="headerID">MarkupCleanupReference</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="reference">
      <xsl:with-param name="class">TidyMarkupEntities</xsl:with-param>
      <xsl:with-param name="header">Entities</xsl:with-param>
      <xsl:with-param name="headerID">MarkupEntitiesReference</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="reference">
      <xsl:with-param name="class">TidyMarkupRepair</xsl:with-param>
      <xsl:with-param name="header">Repair</xsl:with-param>
      <xsl:with-param name="headerID">MarkupRepairReference</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="reference">
      <xsl:with-param name="class">TidyMarkupXForm</xsl:with-param>
      <xsl:with-param name="header">Transformation</xsl:with-param>
      <xsl:with-param name="headerID">MarkupXFormReference</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="reference">
      <xsl:with-param name="class">TidyMarkupTeach</xsl:with-param>
      <xsl:with-param name="header">Teaching Tidy</xsl:with-param>
      <xsl:with-param name="headerID">MarkupTeachReference</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="reference">
      <xsl:with-param name="class">TidyPrettyPrint</xsl:with-param>
      <xsl:with-param name="header">Pretty Print</xsl:with-param>
      <xsl:with-param name="headerID">PrettyPrintReference</xsl:with-param>
    </xsl:call-template>
  </table>
</xsl:template>


<xsl:template name="links">
  <xsl:param name="class"/>
  <xsl:param name="header"/>
  <xsl:param name="headerID"/>
  <tr valign="bottom">
    <td class="h3" colspan="2" id="{$headerID}">
      <xsl:value-of select="$header"/> Options</td>
    <td valign="top" class="h3top"><a href="#qtop" class="h3topa">Top</a></td>
  </tr>
  <xsl:call-template name="ClassHeaders" />
  <xsl:for-each select="/config/option[@class=$class]">
    <xsl:sort select="name" order="ascending" />
    <tr>
      <td class="qrow"><a href="#{name}"><xsl:value-of select="name"/></a></td>
      <td class="qrow"><xsl:apply-templates select="type"/></td>
      <td class="qrow"><xsl:choose>
            <xsl:when test="string-length(default) &gt; 0 ">
              <xsl:apply-templates select="default" />
            </xsl:when>
            <xsl:otherwise>
              <strong>-</strong>
            </xsl:otherwise>
        </xsl:choose>
      </td>
    </tr>
  </xsl:for-each>
  <tr valign="bottom">
    <td colspan="3">&#160;</td>
  </tr>
</xsl:template>


<xsl:template name="reference">
  <xsl:param name="class"/>
  <xsl:param name="header"/>
  <xsl:param name="headerID"/>

  <tr>
    <td colspan="3">&#160;</td>
  </tr>
  <tr valign="bottom">
    <td valign="top" colspan="3" class="h2" id="{$headerID}">
       <h2 class="qh2"><xsl:value-of select="$header"/></h2> 
    </td>
  </tr>
  

  <xsl:for-each select="/config/option[@class=$class]">
    <xsl:sort select="name" order="ascending" />
    <tr>
      <td  valign="top" id="{name}" colspan="2" class="qoptiontitletd">
        <h4 class="qoptiontitle"><xsl:value-of select="name"/></h4>
      </td>
      <td class="tabletitlelink" valign="top" align="right">
          <a href="#qtop">Top</a>
      </td>
    </tr>
    <tr>
        <td valign="top" class="qlabel">Type:</td>
        <td  class="qvalu"><xsl:value-of select="type"/></td>
    </tr>
    <tr>
        <td valign="top" class="qlabel">Default:</td>
        <td class="qvalu">
            <xsl:choose>
              <xsl:when test="string-length(default) &gt; 0">
                <xsl:apply-templates select="default" />
              </xsl:when>
              <xsl:otherwise>-</xsl:otherwise>
            </xsl:choose>
        </td>
    </tr>
    <tr>
        <td valign="top" class="qlabel">Example:</td>
        <td class="qvalu">
            <xsl:choose>
              <xsl:when test="string-length(example) &gt; 0">
                <xsl:apply-templates select="example"/>
              </xsl:when>
              <xsl:otherwise>-</xsl:otherwise>
            </xsl:choose>
      </td>
    </tr>
   
    <xsl:choose>
        <xsl:when test="seealso">
        <tr>
            <td valign="top" class="qlabel">See Also:</td>
            <td  valign="top" class="qvalu">
                <xsl:for-each select="seealso">
                  <a href="#{.}"><xsl:apply-templates select="." /></a>
                  <xsl:if test="position() != last()">, </xsl:if>
                </xsl:for-each>
            </td>
        </tr>
        </xsl:when>
    </xsl:choose>
     
    <tr>
        <td></td>
        <td colspan="1" class="qdescription"><xsl:copy-of select="description/node()"/></td>
    </tr>


    
    <tr>
      <td>&#160;</td>
    </tr>
  </xsl:for-each>
</xsl:template>

<xsl:template name="ClassHeaders">
      <tr>
        <td class="tabletitle">Option</td>
        <td class="tabletitle">Type</td>
        <td class="tabletitle">Default</td>
      </tr>
</xsl:template>

<xsl:template name="Stylesheet">
	<style type="text/css">
	/* no style */
	</style>
</xsl:template>


<!-- Regular Templates: -->
<xsl:template match="a | code | em | var | strong | br">
    <xsl:element name="{local-name(.)}">
        <xsl:copy-of select="@* | node()" />
    </xsl:element>
</xsl:template>

</xsl:stylesheet>
