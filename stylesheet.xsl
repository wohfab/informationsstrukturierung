<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" indent="yes" />
<xsl:template match="/">

<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <script src="js/script.js"/>
    <title>Digitale Cocktailbar</title>
</head>

<body>
    <header>
        <h1>Die digitale Cocktailbar</h1>
        <small>Ein Projekt im Rahmen des Moduls
            <a href="https://ekvv.uni-bielefeld.de/sinfo/publ/modul/26802491" title="Modulbeschreibung - Informationsstrukturierung">
                <strong>23-TXT-BaCl4 - Informationsstrukturierung</strong>
            </a> an der Universität Bielefeld.</small>
        <div class="menu">
            <a href="#site-doc">Dokumentation</a>
            <a href="#site-cocktails">Cocktails</a>
            <a href="#site-test">Test</a>
        </div>
    </header>

    <div id="site-doc" class="site">
    <h2>Dokumentation</h2>
    <p>Dieses Projekt demonstriert die Informationsstrukturierung mithilfe der XSLT Transformation einer XML Datenbank.</p>
    </div>

    <div id="site-cocktails" class="site">
    <h2>Cocktails</h2>
    <ul id="cocktail-list" class="cocktail-list">
    <xsl:for-each select="//cocktail">
        <li class="single-cocktail">
            <div class="cocktail-info">
            <div class="cocktail-name"><xsl:value-of select="@name" /></div>
            <ul class="ingredient-list">
                <xsl:for-each select="zutaten/zutat">
                    <li class="single-ingredient">
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
            </div>
            <div class="cocktail-glass">
                <img class="glass-img">
                    <xsl:attribute name="src">img/glass-<xsl:value-of select="@glass" />.svg</xsl:attribute>/
                </img>
            </div>
        </li>
    </xsl:for-each>
    </ul>
    </div>

    <div id="site-test" class="site">
    <h2>Test</h2>
    <p>Pariatur magna amet tempor pariatur cillum do esse ex adipisicing ullamco est proident excepteur. Elit ex minim sit consequat sint commodo non laboris est incididunt. Nostrud aute enim esse cupidatat pariatur ipsum irure nisi. Tempor id adipisicing qui proident non in dolore consectetur aliquip do incididunt fugiat. In officia voluptate dolore fugiat ullamco labore incididunt do in consectetur. Lorem aliquip ut non ad irure officia minim.</p>
    </div>
</body>
</html>

</xsl:template>
</xsl:stylesheet>