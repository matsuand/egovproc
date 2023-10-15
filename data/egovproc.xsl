<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:output method="html" encoding="UTF-8"/>

  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="Law">
    <html lang="ja">
    <head>
      <link rel="stylesheet" href="../../css/reset.css" />
      <link rel="stylesheet" href="../../css/common.css" />
    </head>
    <body>
    <xsl:apply-templates select="LawNum"/>
    <xsl:apply-templates select="LawBody"/>
    </body>
    </html>
  </xsl:template>

  <xsl:template match="LawNum">
    <div id="lawTitleNo" style="font-size: 1.067rem; font-weight: bold;">
      <xsl:value-of select="."/>
    </div>
  </xsl:template>

  <xsl:template match="LawBody">
    <xsl:apply-templates select="LawTitle"/>
    <xsl:apply-templates select="EnactStatement"/>
    <xsl:apply-templates select="TOC"/>
    <xsl:apply-templates select="MainProvision"/>
    <xsl:apply-templates select="SupplProvision"/>
  </xsl:template>

  <xsl:template match="LawTitle">
    <div id="lawTitle" style="margin-left: 3rem; font-size: 1.5rem; font-weight: bold; line-height: 1.25em;">
      <xsl:value-of select="."/>
    </div>
  </xsl:template>

  <xsl:template match="EnactStatement">
    <section id="EnactStatement" class="active EnactStatement"><div
      class="_div_EnactStatement" style=""><xsl:value-of select="."/></div></section>
  </xsl:template>

  <xsl:template match="MainProvision">
    <xsl:apply-templates select="Part"/>
    <xsl:apply-templates select="Chapter"/>
    <xsl:apply-templates select="Section"/>
    <xsl:apply-templates select="Article"/>
    <xsl:apply-templates select="Paragraph"/>
  </xsl:template>

  <xsl:template match="Part">
    <section id="Mp-Pa_1" class="active Part followingPart Part">
      <div style="margin-left: 2em; font-weight: bold;"
        class="_div_PartTitle PartTitle"><xsl:value-of select="PartTitle"/></div></section>
    <xsl:apply-templates select="Chapter"/>
  </xsl:template>

  <xsl:template match="Chapter">
    <xsl:apply-templates select="ChapterTitle"/>
    <xsl:apply-templates select="Section"/>
    <xsl:apply-templates select="Article"/>
  </xsl:template>

  <xsl:template match="ChapterTitle">
    <section id="Mp-Pa_1-Ch_1" class="active Chapter"><div style="margin-left: 3em; font-weight: bold;"
        class="ChapterTitle _div_ChapterTitle"><xsl:value-of select="."/></div></section>
  </xsl:template>

  <xsl:template match="Section">
    <xsl:apply-templates select="SectionTitle"/>
    <xsl:apply-templates select="Article"/>
  </xsl:template>

  <xsl:template match="SectionTitle">
   <section id="Mp-Pa_1-Ch_2-Se_1" class="Section"><div style="margin-left: 4em; font-weight: bold;"
       class="SectionTitle _div_SectionTitle"><xsl:value-of select="."/></div></section>
  </xsl:template>

  <xsl:template match="Article">
    <section id="Mp-At_1" class="active Article">
      <xsl:apply-templates select="ArticleCaption"/>
      <xsl:apply-templates select="ArticleTitle"/>
      <xsl:apply-templates select="Paragraph"/>
    </section>
  </xsl:template>

  <xsl:template match="ArticleCaption">
    <div style="margin-left: 1em; font-weight: bold;" class="_div_ArticleCaption"><xsl:value-of
      select="."/></div>
  </xsl:template>

  <xsl:template match="ArticleTitle">
    <xsl:choose>
      <xsl:when test="not(following-sibling::Paragraph)">
        <div style="margin-left: 1em; text-indent: -1em;" id="Mp-At_1-Pr_1" class="_div_ArticleTitle">
          <span style="font-weight: bold;"><xsl:value-of select="."/></span>
        </div>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Paragraph">
    <xsl:choose>
      <xsl:when test="@Num = '1'">
        <div style="margin-left: 1em; text-indent: -1em;" id="Mp-At_1-Pr_1" class="_div_ArticleTitle">
          <span style="font-weight: bold;"><xsl:value-of
            select="ancestor::Article/ArticleTitle"/></span>　
          <xsl:apply-templates select="ParagraphSentence"/>
          <xsl:apply-templates select="Item"/>
          <xsl:apply-templates select="TableStruct"/>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <div><span style="font-weight: bold;"><xsl:value-of select="ParagraphNum"/></span>　
          <xsl:apply-templates select="ParagraphSentence"/>
          <xsl:apply-templates select="Item"/>
          <xsl:apply-templates select="TableStruct"/>
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Paragraph_inner">
    <xsl:apply-templates select="ParagraphSentence"/>
    <xsl:apply-templates select="Item"/>
    <xsl:apply-templates select="TableStruct"/>
  </xsl:template>

  <xsl:template match="ParagraphSentence">
    <xsl:for-each select="Sentence"><xsl:value-of select="."/></xsl:for-each>
  </xsl:template>

  <xsl:template match="Item">
    <div style="margin-left: 2em; text-indent: -1em;" class="_div_ItemSentence"><span
      style="font-weight: bold;"><xsl:value-of select="ItemTitle"/></span>　<xsl:value-of select="ItemSentence"/>
      <xsl:apply-templates select="Subitem1"/>
    </div>
  </xsl:template>

  <xsl:template match="Subitem1">
    <div style="margin-left: 3em; text-indent: -1em;" class="_div_Subitem1Sentence"><span
      style="font-weight: bold;"><xsl:value-of select="Subitem1Title"/></span>　<xsl:value-of select="Subitem1Sentence"/></div>
  </xsl:template>

  <xsl:template match="TableStruct">
    <xsl:apply-templates select="Table"/>
  </xsl:template>

  <xsl:template match="Table">
    <table class="type1"><tbody>
      <xsl:apply-templates select="TableHeaderRow"/>
      <xsl:apply-templates select="TableRow"/>
    </tbody></table>
  </xsl:template>

  <xsl:template match="TableHeaderRow">
    <tr class="TableHeaderRow">
      <xsl:apply-templates select="TableHeaderColumn"/>
    </tr>
  </xsl:template>

  <xsl:template match="TableHeaderColumn">
    <th><div><xsl:value-of select="Sentence"/></div></th>
  </xsl:template>

  <xsl:template match="TableRow">
    <tr class="TableRow">
      <xsl:apply-templates select="TableColumn"/>
    </tr>
  </xsl:template>

  <xsl:template match="TableColumn">
    <td><div><xsl:value-of select="Sentence"/></div></td>
  </xsl:template>

  <xsl:template match="SupplProvision">
    <section id="326AC0000000160-Sp" class="active SupplProvision">
    <xsl:apply-templates select="SupplProvisionLabel"/>
    <xsl:apply-templates select="Chapter"/>
    <xsl:apply-templates select="Article"/>
    <xsl:apply-templates select="Paragraph"/>
    </section>
  </xsl:template>

  <xsl:template match="SupplProvisionLabel">
    <div style="" class="_div_SupplProvisionLabel SupplProvisionLabel"><xsl:value-of
      select="."/><xsl:value-of select="ancestor::SupplProvision/@AmendLawNum"/></div>
  </xsl:template>

  <xsl:template match="TOC">
    <section id="TOC" class="active TOC">
      <xsl:apply-templates select="TOCLabel"/>
    　<xsl:apply-templates select="TOCPart"/>
    　<xsl:apply-templates select="TOCChapter"/>
    　<xsl:apply-templates select="TOCSection"/>
    　<xsl:apply-templates select="TOCArticle"/>
    </section>
  </xsl:template>

  <xsl:template match="TOCLabel">
    <div class="_div_TOCLabel"><xsl:value-of select="."/></div>
  </xsl:template>

  <xsl:template match="TOCPart">
  </xsl:template>

  <xsl:template match="TOCChapter">
    <div class="_div_ChapterTitle" style="font-weight: bold;"><xsl:value-of
      select="ChapterTitle"/></div>
    <xsl:apply-templates select="TOCSection"/>
    <xsl:apply-templates select="TOCArticle"/>
  </xsl:template>

  <xsl:template match="TOCSection">
    <div class="_div_TOCChapter" style="margin-left: 1em;"><xsl:value-of
      select="SectionTitle"/></div>
    <xsl:apply-templates select="TOCArticle"/>
  </xsl:template>

  <xsl:template match="TOCArticle">
    <span style="font-weight: bold;"><xsl:value-of
      select="ArticleTitle"/></span><xsl:apply-templates
        select="ArticleCaption"/>
  </xsl:template>

</xsl:stylesheet>
