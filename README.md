# XSLT Demonstration

Preview: [http://bernardodiasc.github.io/xslt/](http://bernardodiasc.github.io/xslt/) (check the source code - its a xml, soon chrome will drop this feature)

## Templates

Currently only have the `navigation` component, with 2 modes, called `simple` and `complex`.

The mode `simple` will print the matched xml nodes as it is. Since HTML is compatible with XML.

The mode `complex` will iterate the matched xml nodes and will build the markup with an alternative markup structure.

### Navigation mode simple

- Match: `data/module[@name='navigation']`
- Mode: simple 
- Usage:

```xml
<xsl:apply-templates select="/data/module[@name='navigation' and @model='model-name']" mode="simple"/>`
```

- Sample XML:

```xml
<module name="navigation" model="model-name">
  <nav>
    <h2>Navigation</h2>
    <ul>
      <li><a href="#about-us">About us</a></li>
      <li><a href="#team">Team</a></li>
      <li><a href="#projects">Projects</a></li>
      <li><a href="#contacts">Contacts</a></li>
      <li><a href="#partners">Partners</a></li>
    </ul>
  </nav>
</module>
```

- XSLT Template:

```xml
<xsl:template match="data/module[@name='navigation']" mode="simple">
  <xsl:copy-of select="current()/*"/>
</xsl:template>
```

### Navigation mode complex

- Match: `data/module[@name='navigation']`
- Mode: complex
- Usage:

```xml
<xsl:apply-templates select="/data/module[@name='navigation' and @model='model-name']" mode="complex"/>
```

- Sample XML:

```xml
<module name="navigation" model="model-name">
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

- XSLT Template:

```xml
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
```


