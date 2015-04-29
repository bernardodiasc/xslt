<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="scripts.xsl"/>
<xsl:include href="styles.xsl"/>

<!--
Match: data/module[@name='navigation']
Mode: simple (just print the xml node matched as it is)
Usage: `<xsl:apply-templates select="/data/module[@name='navigation' and @model='model-name']" mode="simple"/>`
Sample XML:
```
<module name="navigation">
  <nav class="navigation header">
    <h2>Header Menu</h2>
    <ul>
      <li><a href="#about-us">About us</a> - Know more about us</li>
      <li><a href="#team">Team</a> - The team</li>
      <li><a href="#projects">Projects</a> - Projects we worked</li>
      <li><a href="#contacts">Contacts</a> - Contact us</li>
      <li><a href="#partners">Partners</a> - Meet our partners</li>
    </ul>
  </nav>
</module>
```
-->
<xsl:template match="data/module[@name='navigation']" mode="simple">
  <xsl:copy-of select="current()/*"/>
</xsl:template>



<!--
Match: data/module[@name='navigation']
Mode: complex (iterate xml nodes and build the markup)
Usage: `<xsl:apply-templates select="/data/module[@name='navigation' and @model='model-name']" mode="complex"/>`
Sample XML:
```
<module name="navigation">
  <heading>Navigation</heading>
  <list>
    <item data-title="Know more about us" data-url="#about-us">About us</item>
    <item data-title="The team" data-url="#team">Team</item>
    <item data-title="Projects we worked" data-url="#projects">Projects</item>
    <item data-title="Contact us" data-url="#contacts">Contacts</item>
    <item data-title="Meet our partners" data-url="#partners">Partners</item>
  </list>
</module>
```
-->
<xsl:template match="data/module[@name='navigation']" mode="complex">
  <xsl:variable name="model" select="@model"/>

  <xsl:for-each select="current()">
    <nav class="navigation {$model}">
      <h2><xsl:value-of select="heading"/></h2>
      <ul>
        <xsl:for-each select="list/item">
          <li><a href="{@data-url}"><xsl:value-of select="current()"/></a> - <xsl:value-of select="@data-title"/></li>
        </xsl:for-each>
      </ul>
    </nav>
  </xsl:for-each>
</xsl:template>


</xsl:stylesheet>
