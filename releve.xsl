<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Releve</title>
            </head>
            <body>
                <h1>Relve banqaire: <xsl:value-of select="/releve/@RIB"/></h1>
                <h2>Relve banqaire: <xsl:value-of select="/releve/dateReleve"/></h2>
                <h2>Relve banqaire: <xsl:value-of select="/releve/solde"/></h2>
                <table border="1" width="70%">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Montant</th>
                            <th>Type</th>
                            <th>description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="/releve/operations/operation">
                          <tr>
                              <td><xsl:value-of select="@date"/></td>
                              <td><xsl:value-of select="@montant"/></td>
                              <td><xsl:value-of select="@type"/></td>
                              <td><xsl:value-of select="@desciption"/></td>
                          </tr>
                        </xsl:for-each>
                        <tr>
                            <td colspan="2">Le total des montans des cartes : :</td>
                            <td><xsl:value-of select="sum(releve/operations/operation/@montant)"/></td>
                        </tr>  
                        <tr>
                            <td colspan="2">Le total des montans de CREDIT :</td>
                            <td><xsl:value-of select="sum(releve/operations/operation[@type='CREDIT']/@montant)"/></td>
                        </tr>  
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>