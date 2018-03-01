<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" indent="yes" />
<xsl:template match="/">

<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"></link>
    <title>Digitale Cocktailbar</title>
</head>

<body>
    <h1>Die digitale Cocktailbar</h1>
    <small>Ein Projekt im Rahmen des Moduls
        <a href="https://ekvv.uni-bielefeld.de/sinfo/publ/modul/26802491" title="Modulbeschreibung - Informationsstrukturierung">
            <strong>23-TXT-BaCl4 - Informationsstrukturierung</strong>
        </a> an der Universität Bielefeld.</small>
    <h2>Cocktails</h2>
    <ul>
    <xsl:for-each select="//cocktail">
        <li>
            <xsl:value-of select="@name"/>
            <ul>
                <xsl:for-each select="zutaten/zutat">
                    <li>
                        <xsl:variable name="zutat_id" select="@id" />
                        <xsl:for-each select="//zutat">
                            <xsl:if test="$zutat_id=@id">
                                <xsl:value-of select="@name" />
                            </xsl:if>
                        </xsl:for-each>
                        <xsl:choose>
                            <xsl:when test="@menge">
                            <small class="menge"><xsl:value-of select="@menge" />
                            <xsl:choose>
                                <xsl:when test="@einheit">
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="@einheit"/>
                                </xsl:when>
                                <xsl:otherwise>
                                <xsl:text> ml</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                            </small></xsl:when>
                            <xsl:otherwise></xsl:otherwise>
                        </xsl:choose>
                    </li>
                </xsl:for-each>
            </ul>
        </li>
    </xsl:for-each>
    </ul>
</body>
</html>

</xsl:template>
</xsl:stylesheet>