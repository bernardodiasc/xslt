<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="html"/>

  <xsl:include href="templates/navigation/index.xsl"/>

  <xsl:template match="/">
  <html lang="en">
    <head>
      <meta charset="UTF-8"/>
      <title>Avante | Estúdio de Tecnologia</title>
      <style>
        <xsl:call-template name="navigation-styles"/>
      </style>
    </head>
    <body>
      <xsl:apply-templates select="/data/module[@name='navigation' and @model='header']" mode="simple"/>
      <hr/>
      <xsl:apply-templates select="/data/module[@name='navigation' and @model='footer']" mode="complex"/>

      <script>
        <xsl:call-template name="navigation-scripts"/>
      </script>
    </body>
  </html>
  </xsl:template>

</xsl:stylesheet>