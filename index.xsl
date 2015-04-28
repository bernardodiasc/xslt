<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="html"/>

  <xsl:include href="templates/nav/index.xsl"/>

  <xsl:template match="/">
  <html lang="en">
    <head>
      <meta charset="UTF-8"/>
      <title>Avante | Estúdio de Tecnologia</title>
      <style>
        <xsl:call-template name="nav-styles"/>
      </style>
    </head>
    <body>
      <xsl:apply-templates select="/data/menu-de-navegacao/nav[@class='header']" mode="menu-de-navegacao"/>
      <hr/>
      <xsl:apply-templates select="/data/menu-de-navegacao/nav[@class='footer']" mode="menu-de-navegacao"/>

      <script>
      </script>
    </body>
  </html>
  </xsl:template>

</xsl:stylesheet>