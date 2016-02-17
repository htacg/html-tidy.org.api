<?xml version="1.0"?>
<!--
    For generating the `quickref.html` web page from output of
    `tidy -xml-config`, which is used on our websites and can
    be generated by end users.

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
     doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
     doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" />

<xsl:template match="/">
  <html lang="en" xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>HTML Tidy <xsl:value-of select="config/@version" /> Options Quick Reference</title>
	<xsl:call-template name="Stylesheet" />
  </head>

  <body>
    <h1 id="top">HTML Tidy <xsl:value-of select="config/@version" /> Options Quick Reference</h1>

    <h2>Option Groups</h2>
    <ul class="option_groups">
        <li><a href="#MarkupHeader">HTML, XHTML, XML</a></li>
        <li><a href="#DiagnosticsHeader">Diagnostics</a></li>
        <li><a href="#PrettyPrintHeader">Pretty Print</a></li>
        <li><a href="#EncodingHeader">Character Encoding</a></li>
        <li><a href="#MiscellaneousHeader">Miscellaneous</a></li>
    </ul>

    <h2>Option Index</h2>
    <xsl:call-template name="link-section" />

    <h2>Option Details</h2>
    <xsl:call-template name="detail-section" />

  </body>
  </html>
</xsl:template>


<!-- Named Templates: -->

<xsl:template name="link-section">
  <table summary="Options Quick Reference Index Section" class="index_table">
    <xsl:call-template name="links">
      <xsl:with-param name="class">markup</xsl:with-param>
      <xsl:with-param name="header">HTML, XHTML, XML</xsl:with-param>
      <xsl:with-param name="headerID">MarkupHeader</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="links">
      <xsl:with-param name="class">diagnostics</xsl:with-param>
      <xsl:with-param name="header">Diagnostics</xsl:with-param>
      <xsl:with-param name="headerID">DiagnosticsHeader</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="links">
      <xsl:with-param name="class">print</xsl:with-param>
      <xsl:with-param name="header">Pretty Print</xsl:with-param>
      <xsl:with-param name="headerID">PrettyPrintHeader</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="links">
      <xsl:with-param name="class">encoding</xsl:with-param>
      <xsl:with-param name="header">Character Encoding</xsl:with-param>
      <xsl:with-param name="headerID">EncodingHeader</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="links">
      <xsl:with-param name="class">misc</xsl:with-param>
      <xsl:with-param name="header">Miscellaneous</xsl:with-param>
      <xsl:with-param name="headerID">MiscellaneousHeader</xsl:with-param>
    </xsl:call-template>
  </table>
</xsl:template>


<xsl:template name="detail-section">
  <table summary="Options Quick Reference Detail Section" class="detail_table">
    <xsl:call-template name="reference">
      <xsl:with-param name="class">markup</xsl:with-param>
      <xsl:with-param name="header">HTML, XHTML, XML</xsl:with-param>
      <xsl:with-param name="headerID">MarkupReference</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="reference">
      <xsl:with-param name="class">diagnostics</xsl:with-param>
      <xsl:with-param name="header">Diagnostics</xsl:with-param>
      <xsl:with-param name="headerID">DiagnosticsReference</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="reference">
      <xsl:with-param name="class">print</xsl:with-param>
      <xsl:with-param name="header">Pretty Print</xsl:with-param>
      <xsl:with-param name="headerID">PrettyPrintReference</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="reference">
      <xsl:with-param name="class">encoding</xsl:with-param>
      <xsl:with-param name="header">Character Encoding</xsl:with-param>
      <xsl:with-param name="headerID">EncodingReference</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="reference">
      <xsl:with-param name="class">misc</xsl:with-param>
      <xsl:with-param name="header">Miscellaneous</xsl:with-param>
      <xsl:with-param name="headerID">MiscellaneousReference</xsl:with-param>
    </xsl:call-template>
  </table>
</xsl:template>


<xsl:template name="links">
  <xsl:param name="class"/>
  <xsl:param name="header"/>
  <xsl:param name="headerID"/>
  <thead>
    <tr class="header_category">
      <td colspan="3" id="{$headerID}">
        <xsl:value-of select="$header"/> Options
      </td>
    </tr>
    <xsl:call-template name="ClassHeaders" />
  </thead>
  <tbody>
    <xsl:for-each select="/config/option[@class=$class]">
      <xsl:sort select="name" order="ascending" />
      <tr>
        <td><a href="#{name}"><xsl:value-of select="name"/></a></td>
        <td><xsl:apply-templates select="type"/></td>
        <td><xsl:choose>
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
  </tbody>
</xsl:template>


<xsl:template name="reference">
  <xsl:param name="class"/>
  <xsl:param name="header"/>
  <xsl:param name="headerID"/>

  <thead>
    <tr class="header_category">
      <td colspan="2" id="{$headerID}">
        <xsl:value-of select="$header"/> Options Reference
      </td>
    </tr>
  </thead>

  <xsl:for-each select="/config/option[@class=$class]">
    <xsl:sort select="name" order="ascending" />
    <thead>
      <tr class="header_option_name">
        <td colspan="2" id="{name}">
          <xsl:value-of select="name"/>
        </td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Type:</td>
        <td><xsl:value-of select="type"/></td>
      </tr>
      <tr>
        <td>Default:</td>
        <td>
          <xsl:choose>
            <xsl:when test="string-length(default) &gt; 0">
              <xsl:apply-templates select="default" />
            </xsl:when>
            <xsl:otherwise>
              -
            </xsl:otherwise>
          </xsl:choose>        
        </td>
      </tr>
      <tr>
        <td>Example</td>
        <td>
          <xsl:choose>
            <xsl:when test="string-length(example) &gt; 0">
              <xsl:apply-templates select="example"/>
            </xsl:when>
            <xsl:otherwise>
              -
            </xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr>
        <td>See also:</td>
        <td>
          <xsl:for-each select="seealso">
            <a href="#{.}"><xsl:apply-templates select="." /></a>
            <xsl:if test="position() != last()">
              <xsl:text>, </xsl:text>
            </xsl:if>
          </xsl:for-each>
        </td>
      </tr>
      <tr>
        <td></td>
        <td class="qdescription"><xsl:apply-templates select="description"/></td>
      </tr>
    </tbody>
  </xsl:for-each>
</xsl:template>

<xsl:template name="ClassHeaders">
      <tr class="header_column_labels" >
        <td>Option</td>
        <td>Type</td>
        <td>Default</td>
      </tr>
</xsl:template>

<xsl:template name="Stylesheet">
	<style type="text/css">
	
		/************************************** 
		  BASIC STYLES 
	     **************************************/
		body 
		{
		    margin: 3em;
		    padding: 0;
            font-family: Helvetica, sans-serif;
            font-size: 100%;
            color: black;
            background-color: cornsilk
		}
		
		a
		{
		    text-decoration: none;
		}

		a:hover
		{
		    text-decoration: underline;
		}

		a, 
		a:visited
		{
		    color: blue;
		}

		/************************************** 
		  MAKE BR FORMAT LIKE P 
	     **************************************/
		td.qdescription br
		{
		    content: " ";
		    display: block;
		    margin: 10px 0;
		}
		
		/************************************** 
		  OPTION GROUP INDEX 
	     **************************************/
		ul.option_groups
		{
		    list-style-type: square;
		}
		
		ul.option_groups li
		{
		    line-height: 150%;
		}
		
		/************************************** 
		  TABLES 
	     **************************************/
		table
		{
		    border-collapse: collapse;
		}
		
		td
		{
		    padding: 5px;
		}

		
		/* CATEGORY ROWS */
        tr.header_category
        {
            background-color: burlywood;
            line-height: 3.0em;
            font-size: 1.2em;
            font-weight: bold;
        }
        
        tr.header_category td,
        table.detail_table .section_thead tr td
        {
            padding-left: 1em;
        }
        
        /* INDEX HEADER ROW and DETAIL OPTION NAME */
        tr.header_column_labels,
        tr.header_option_name
        {
            background-color: antiquewhite;
        }

        tr.header_column_labels td
        {
            font-weight: bold;
            padding-left: 1.0em;
        }


        tr.header_option_name td
        {
            font-size: 1.1em;
            font-weight: bold;
            padding-left: 1.0em;
            line-height: 1.2em;
        }
        
        /* INDEX TABLE APPEARANCE */
        table.index_table tbody tr
        {
            line-height: 2em;
            border-bottom: 1px solid burlywood;
        }

        table.index_table tbody tr td:first-child
        {
            padding-left: 1em;
        }

        /* DETAILS TABLE DETAILS */
        table.detail_table tbody td:first-child
        {
            text-align: right;
            font-weight: bold;
            min-width: 6.0em;
        }
        
        code, var
        {
            color: darkgreen;
            font-size: 1.3em;
        }
        
        var
        {
        	font-weight: bold;
        }
		
	</style>
</xsl:template>


<!-- Regular Templates: -->
<xsl:template match="a | code | em | var | strong | br | p">
    <xsl:element name="{local-name(.)}">
        <xsl:copy-of select="@* | node()" />
    </xsl:element>
</xsl:template>

</xsl:stylesheet>
