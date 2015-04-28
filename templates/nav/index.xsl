<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="scripts.xsl"/>
  <xsl:include href="styles.xsl"/>

  <xsl:template match="data/menu-de-navegacao/nav" mode="menu-de-navegacao">
    <xsl:for-each select="current()">
      <xsl:copy-of select="current()"/>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>