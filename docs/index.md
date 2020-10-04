---
bibliography:
- bacl4.bib
---

**Universität Bielefeld**

Fakultät für Linguistik und Literaturwissenschaft

**Projektausarbeitung**

[23-TXT-BaCL4](https://ekvv.uni-bielefeld.de/sinfo/publ/modul/26802491)

**Die digitale Cocktailbar**\
ein Projekt zur Informationsstrukturierung

vorgelegt von

**[Fabian Wohlgemuth](https://www.fabianwohlgemuth.de)**

$\begin{aligned}
\text{Begutachtet von:}&\ \text{Prof. Dr. Jens Michaelis}\\
% \text{Zweitgutachterin:}&\ \text{Frau Prof. Dr. Barbara Job}
\end{aligned}$

Bielefeld, März 2020

Einleitung {#chap:einleitung}
==========

Grundlage
---------

Grundlage des vorliegenden Projektes sind das Modul `23-TXT-BaCL4` im
Nebenfach Texttechnologie und Computerlinguistik und das dazugehörige
Skript von Prof. Dr. Marcus Kracht [@kracht2018].

Im Rahmen der zwei Seminare *Informationsstrukturierung* &
*Informationsstrukturierung 2* wurde gelernt, wie eine Datenbank
mithilfe von `XML` angelegt und unter Zunahme eines `XML Schemas`
strukturiert werden kann. Über eine `XSL`, eine sogenannte
Stylesheet-Datei, kann aus der Datenbank eine `HTML` Datei erzeugt
werden. Dieser Prozess ist bekannt unter dem Namen `XSLT`; der
sogenannten *Transformation*. Diese kann über die `HTML` Datei noch eine
Vielzahl anderer Dateiformate erzeugen, denen wir uns jedoch in dieser
Ausarbeitung nicht widmen.

Projekteinführung
-----------------

Bei dem vorliegenden Projekt handelt es sich um die *digitale
Cocktailbar*; ein Rezepteverzeichnis für Cocktails. Eine Sammlung an
Cocktailrezepten wird in einer Datenbank gespeichert, aus der mithilfe
der oben genannten Transformations-Anwendung eine Website erzeugt wird,
die im Web-Browser angeschaut werden kann.

Nach dieser kurzen Einleitung folgt in Kapitel
[2](#chap:dateien){reference-type="ref" reference="chap:dateien"} eine
detaillierte Beschreibung der im Projekt vorhandenen Dateien und deren
Inhalten und Aufgaben.

Dateien {#chap:dateien}
=======

Die folgenden Dateien befinden sich in dem vorliegenden Projekt. In
diesem Kapitel werden die einzelnen Bestandteile und ihre Funktionen
innerhalb des Projektes detailliert besprochen.

Anmerkung: Die Dateien folgen nicht durchgehend den üblichen
Einrückungs-Standards. Dies ist absichtlich so und hat den Grund, dass
bei dem Anzeigen der Codeblöcke innerhalb der Dokumentations-Datei
ansonsten Leerzeichen am Zeilenanfang (`leading whitespace`) mit
angezeigt würden.

Die Datenbank - `datenbank.xml` {#section:datenbank}
-------------------------------

Die Datenbank ist das Herzstück des Projektes. Sie enthält alle Daten,
die später weiterverarbeitet werden sollen. Zunächst werden im
Kopfbereich der Datenbank-Datei die `XML` Version und das Text Encoding
angegeben. Anschließend folgt die Angabe, unter welchem Dateipfad sich
die Stylesheet `XSL` Datei für die spätere Transformation befindet.

``` {#code:datenbank-header .xml language="XML" linerange="1-2" caption="Datenbank - Header" label="code:datenbank-header"}
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="stylesheet.xsl"?>

<cocktailbar>

<cocktails>
  <cocktail id="negroni" name="Negroni" glass="whiskey">
  <cocktailZutaten>
    <cocktailZutat id="london-dry-gin" menge="30" />
    <cocktailZutat id="vermouth-sweet" menge="30" />
    <cocktailZutat id="campari" menge="30" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="gin-tonic" name="Gin &amp; Tonic" glass="long">
  <cocktailZutaten>
    <cocktailZutat id="london-dry-gin" menge="50" />
    <cocktailZutat id="tonic-water" menge="50" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="martini" name="Martini" glass="martini">
  <cocktailZutaten>
    <cocktailZutat id="london-dry-gin" menge="60" />
    <cocktailZutat id="vermouth-dry" menge="30" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="manhattan" name="Manhattan" glass="manhattan">
  <cocktailZutaten>
    <cocktailZutat id="whiskey-rye" menge="60" />
    <cocktailZutat id="vermouth-sweet" menge="30" />
    <cocktailZutat id="angostura-bitters" menge="2" einheit="Spritzer" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="daiquiri" name="Daiquiri" glass="daiquiri">
  <cocktailZutaten>
    <cocktailZutat id="rum-white" menge="60" />
    <cocktailZutat id="lime-juice" menge="30" />
    <cocktailZutat id="syrup-simple" menge="25" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="dark-n-stormy" name="Dark 'n' Stormy" glass="cocktail">
  <cocktailZutaten>
    <cocktailZutat id="rum-goslings-black-seal" menge="50" />
    <cocktailZutat id="beer-ginger" menge="150" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="margarita" name="Margarita" glass="daiquiri">
  <cocktailZutaten>
    <cocktailZutat id="tequila-silver" menge="60" />
    <cocktailZutat id="cointreau" menge="30" />
    <cocktailZutat id="lime-juice" menge="30" />
  </cocktailZutaten>
  </cocktail>

<cocktail id="tequila-sunrise" name="Tequila Sunrise" glass="long">
<cocktailZutaten>
  <cocktailZutat id="tequila-silver" menge="45" />
  <cocktailZutat id="orange-juice" menge="120" />
  <cocktailZutat id="grenadine" menge="1" einheit="Schuss" />
</cocktailZutaten>
</cocktail>

  <cocktail id="mai-tai" name="Mai Tai" glass="cocktail">
  <cocktailZutaten>
    <cocktailZutat id="rum-white" menge="40" />
    <cocktailZutat id="rum-dark" menge="20" />
    <cocktailZutat id="curacao-orange" menge="15" />
    <cocktailZutat id="syrup-orgeat" menge="15" />
    <cocktailZutat id="lime-juice" menge="10" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="long-island-icetea" name="Long Island Iced Tea" glass="long">
  <cocktailZutaten>
    <cocktailZutat id="tequila-silver" menge="15" />
    <cocktailZutat id="vodka" menge="15" />
    <cocktailZutat id="rum-white" menge="15" />
    <cocktailZutat id="triple-sec" menge="15" />
    <cocktailZutat id="gin" menge="15" />
    <cocktailZutat id="lemon-juice" menge="25" />
    <cocktailZutat id="syrup-gomme" menge="30" />
    <cocktailZutat id="cola" menge="1" einheit="Schuss" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="sex-on-the-beach" name="Sex on the Beach" glass="beach">
  <cocktailZutaten>
    <cocktailZutat id="vodka" menge="40" />
    <cocktailZutat id="peach-schnapps" menge="20" />
    <cocktailZutat id="orange-juice" menge="40" />
    <cocktailZutat id="cranberry-juice" menge="40" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="cuba-libre" name="Cuba Libre" glass="cocktail">
  <cocktailZutaten>
    <cocktailZutat id="cola" menge="120" />
    <cocktailZutat id="rum-dark" menge="50" />
    <cocktailZutat id="lime-juice" menge="10" />
  </cocktailZutaten>
  </cocktail>
</cocktails>
  
<zutaten>
  <zutat id="london-dry-gin" name="London Dry Gin" />
  <zutat id="gin" name="Gin" />
  <zutat id="vermouth-sweet" name="Sweet Vermouth" />
  <zutat id="vermouth-dry" name="Dry Vermouth" />
  <zutat id="campari" name="Campari" />
  <zutat id="syrup-gomme" name="Gomme Syrup" />
  <zutat id="syrup-orgeat" name="Orgeat Syrup" />
  <zutat id="peach-schnapps" name="Peach Schnapps" />
  <zutat id="curacao-orange" name="Orange Curacao" />
  <zutat id="grenadine" name="Grenadine" />
  <zutat id="triple-sec" name="Triple Sec" />
  <zutat id="rum-dark" name="Dark Rum" />
  <zutat id="vodka" name="Vodka" />
  <zutat id="cola" name="Cola" />
  <zutat id="tonic-water" name="Tonic Water" />
  <zutat id="angostura-bitters" name="Angostura Bitter" />
  <zutat id="whiskey-rye" name="Rye Whiskey" />
  <zutat id="rum-white" name="White Rum" />
  <zutat id="lime-juice" name="Lime Juice" />
  <zutat id="orange-juice" name="Orange Juice" />
  <zutat id="cranberry-juice" name="Cranberry Juice" />    
  <zutat id="lemon-juice" name="Lemon Juice" />
  <zutat id="syrup-simple" name="Simple Syrup" />
  <zutat id="rum-goslings-black-seal" name="Gosling's Black Seal Rum" />
  <zutat id="beer-ginger" name="Ginger Beer" />
  <zutat id="tequila-silver" name="Silver Tequila" />
  <zutat id="cointreau" name="Cointreau" />
</zutaten>

</cocktailbar>
```

Nach dem Header beginnt der Aufbau der eigentlichen Datenbank. Zunächst
öffnen wir die Datenbank mit dem `<cocktailbar>` Tag (siehe Codeblock
[\[code:datenbank-beginn\]](#code:datenbank-beginn){reference-type="ref"
reference="code:datenbank-beginn"}). Im Anschluss findet sich in der
Datenbank eine Liste der Cocktails, eingebettet in das `<cocktails>`
Tag.

Jeder einzelne Cocktail ist entsprechend in ein `<cocktail>` Tag
eingefasst. Hier sehen wir die erste komplexere Einheit der Datenbank.
Ein `cocktail` besteht aus drei Attributen, die sich im Start-Tag
angeben lassen und einer Anzahl von Zutaten, die sich im `zutaten` Tag
befinden.

Die Attribute sind die `id`, die jedem Cocktail einen eindeutigen
Identifizierer zuordnet, der `name`, der die Normalschreibweise des
Cocktail-Namens angibt und das `glass`, welches aus einer Liste
möglicher Glas-Formen auswählt, in der der Cocktail im Normalfall
zubereitet wird.

Jede Zutat hat mindestens zwei Attribute. Wie auch der Cocktail zuerst
eine `id`. Dann eine Mengenangabe im `menge` Attribut.

``` {#code:datenbank-beginn .xml startFrom="4" language="XML" linerange="4-14" caption="Datenbank - Beginn" label="code:datenbank-beginn"}
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="stylesheet.xsl"?>

<cocktailbar>

<cocktails>
  <cocktail id="negroni" name="Negroni" glass="whiskey">
  <cocktailZutaten>
    <cocktailZutat id="london-dry-gin" menge="30" />
    <cocktailZutat id="vermouth-sweet" menge="30" />
    <cocktailZutat id="campari" menge="30" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="gin-tonic" name="Gin &amp; Tonic" glass="long">
  <cocktailZutaten>
    <cocktailZutat id="london-dry-gin" menge="50" />
    <cocktailZutat id="tonic-water" menge="50" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="martini" name="Martini" glass="martini">
  <cocktailZutaten>
    <cocktailZutat id="london-dry-gin" menge="60" />
    <cocktailZutat id="vermouth-dry" menge="30" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="manhattan" name="Manhattan" glass="manhattan">
  <cocktailZutaten>
    <cocktailZutat id="whiskey-rye" menge="60" />
    <cocktailZutat id="vermouth-sweet" menge="30" />
    <cocktailZutat id="angostura-bitters" menge="2" einheit="Spritzer" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="daiquiri" name="Daiquiri" glass="daiquiri">
  <cocktailZutaten>
    <cocktailZutat id="rum-white" menge="60" />
    <cocktailZutat id="lime-juice" menge="30" />
    <cocktailZutat id="syrup-simple" menge="25" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="dark-n-stormy" name="Dark 'n' Stormy" glass="cocktail">
  <cocktailZutaten>
    <cocktailZutat id="rum-goslings-black-seal" menge="50" />
    <cocktailZutat id="beer-ginger" menge="150" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="margarita" name="Margarita" glass="daiquiri">
  <cocktailZutaten>
    <cocktailZutat id="tequila-silver" menge="60" />
    <cocktailZutat id="cointreau" menge="30" />
    <cocktailZutat id="lime-juice" menge="30" />
  </cocktailZutaten>
  </cocktail>

<cocktail id="tequila-sunrise" name="Tequila Sunrise" glass="long">
<cocktailZutaten>
  <cocktailZutat id="tequila-silver" menge="45" />
  <cocktailZutat id="orange-juice" menge="120" />
  <cocktailZutat id="grenadine" menge="1" einheit="Schuss" />
</cocktailZutaten>
</cocktail>

  <cocktail id="mai-tai" name="Mai Tai" glass="cocktail">
  <cocktailZutaten>
    <cocktailZutat id="rum-white" menge="40" />
    <cocktailZutat id="rum-dark" menge="20" />
    <cocktailZutat id="curacao-orange" menge="15" />
    <cocktailZutat id="syrup-orgeat" menge="15" />
    <cocktailZutat id="lime-juice" menge="10" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="long-island-icetea" name="Long Island Iced Tea" glass="long">
  <cocktailZutaten>
    <cocktailZutat id="tequila-silver" menge="15" />
    <cocktailZutat id="vodka" menge="15" />
    <cocktailZutat id="rum-white" menge="15" />
    <cocktailZutat id="triple-sec" menge="15" />
    <cocktailZutat id="gin" menge="15" />
    <cocktailZutat id="lemon-juice" menge="25" />
    <cocktailZutat id="syrup-gomme" menge="30" />
    <cocktailZutat id="cola" menge="1" einheit="Schuss" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="sex-on-the-beach" name="Sex on the Beach" glass="beach">
  <cocktailZutaten>
    <cocktailZutat id="vodka" menge="40" />
    <cocktailZutat id="peach-schnapps" menge="20" />
    <cocktailZutat id="orange-juice" menge="40" />
    <cocktailZutat id="cranberry-juice" menge="40" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="cuba-libre" name="Cuba Libre" glass="cocktail">
  <cocktailZutaten>
    <cocktailZutat id="cola" menge="120" />
    <cocktailZutat id="rum-dark" menge="50" />
    <cocktailZutat id="lime-juice" menge="10" />
  </cocktailZutaten>
  </cocktail>
</cocktails>
  
<zutaten>
  <zutat id="london-dry-gin" name="London Dry Gin" />
  <zutat id="gin" name="Gin" />
  <zutat id="vermouth-sweet" name="Sweet Vermouth" />
  <zutat id="vermouth-dry" name="Dry Vermouth" />
  <zutat id="campari" name="Campari" />
  <zutat id="syrup-gomme" name="Gomme Syrup" />
  <zutat id="syrup-orgeat" name="Orgeat Syrup" />
  <zutat id="peach-schnapps" name="Peach Schnapps" />
  <zutat id="curacao-orange" name="Orange Curacao" />
  <zutat id="grenadine" name="Grenadine" />
  <zutat id="triple-sec" name="Triple Sec" />
  <zutat id="rum-dark" name="Dark Rum" />
  <zutat id="vodka" name="Vodka" />
  <zutat id="cola" name="Cola" />
  <zutat id="tonic-water" name="Tonic Water" />
  <zutat id="angostura-bitters" name="Angostura Bitter" />
  <zutat id="whiskey-rye" name="Rye Whiskey" />
  <zutat id="rum-white" name="White Rum" />
  <zutat id="lime-juice" name="Lime Juice" />
  <zutat id="orange-juice" name="Orange Juice" />
  <zutat id="cranberry-juice" name="Cranberry Juice" />    
  <zutat id="lemon-juice" name="Lemon Juice" />
  <zutat id="syrup-simple" name="Simple Syrup" />
  <zutat id="rum-goslings-black-seal" name="Gosling's Black Seal Rum" />
  <zutat id="beer-ginger" name="Ginger Beer" />
  <zutat id="tequila-silver" name="Silver Tequila" />
  <zutat id="cointreau" name="Cointreau" />
</zutaten>

</cocktailbar>
```

Standardmäßig wird die `menge` der Zutat in `ml` angegeben. Wenn eine
andere Mengeneinheit gewünscht ist, kann diese durch ein entsprechendes
drittes Attribut der Zutat hinzugefügt werden. Ein Beispiel ist in Zeile
64 im folgenden Codeblock
[\[code:abweichende-mengeneinheit\]](#code:abweichende-mengeneinheit){reference-type="ref"
reference="code:abweichende-mengeneinheit"} zu sehen.

``` {#code:abweichende-mengeneinheit .xml startFrom="60" language="XML" linerange="60-66" caption="Abweichende Mengeneinheit" label="code:abweichende-mengeneinheit"}
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="stylesheet.xsl"?>

<cocktailbar>

<cocktails>
  <cocktail id="negroni" name="Negroni" glass="whiskey">
  <cocktailZutaten>
    <cocktailZutat id="london-dry-gin" menge="30" />
    <cocktailZutat id="vermouth-sweet" menge="30" />
    <cocktailZutat id="campari" menge="30" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="gin-tonic" name="Gin &amp; Tonic" glass="long">
  <cocktailZutaten>
    <cocktailZutat id="london-dry-gin" menge="50" />
    <cocktailZutat id="tonic-water" menge="50" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="martini" name="Martini" glass="martini">
  <cocktailZutaten>
    <cocktailZutat id="london-dry-gin" menge="60" />
    <cocktailZutat id="vermouth-dry" menge="30" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="manhattan" name="Manhattan" glass="manhattan">
  <cocktailZutaten>
    <cocktailZutat id="whiskey-rye" menge="60" />
    <cocktailZutat id="vermouth-sweet" menge="30" />
    <cocktailZutat id="angostura-bitters" menge="2" einheit="Spritzer" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="daiquiri" name="Daiquiri" glass="daiquiri">
  <cocktailZutaten>
    <cocktailZutat id="rum-white" menge="60" />
    <cocktailZutat id="lime-juice" menge="30" />
    <cocktailZutat id="syrup-simple" menge="25" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="dark-n-stormy" name="Dark 'n' Stormy" glass="cocktail">
  <cocktailZutaten>
    <cocktailZutat id="rum-goslings-black-seal" menge="50" />
    <cocktailZutat id="beer-ginger" menge="150" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="margarita" name="Margarita" glass="daiquiri">
  <cocktailZutaten>
    <cocktailZutat id="tequila-silver" menge="60" />
    <cocktailZutat id="cointreau" menge="30" />
    <cocktailZutat id="lime-juice" menge="30" />
  </cocktailZutaten>
  </cocktail>

<cocktail id="tequila-sunrise" name="Tequila Sunrise" glass="long">
<cocktailZutaten>
  <cocktailZutat id="tequila-silver" menge="45" />
  <cocktailZutat id="orange-juice" menge="120" />
  <cocktailZutat id="grenadine" menge="1" einheit="Schuss" />
</cocktailZutaten>
</cocktail>

  <cocktail id="mai-tai" name="Mai Tai" glass="cocktail">
  <cocktailZutaten>
    <cocktailZutat id="rum-white" menge="40" />
    <cocktailZutat id="rum-dark" menge="20" />
    <cocktailZutat id="curacao-orange" menge="15" />
    <cocktailZutat id="syrup-orgeat" menge="15" />
    <cocktailZutat id="lime-juice" menge="10" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="long-island-icetea" name="Long Island Iced Tea" glass="long">
  <cocktailZutaten>
    <cocktailZutat id="tequila-silver" menge="15" />
    <cocktailZutat id="vodka" menge="15" />
    <cocktailZutat id="rum-white" menge="15" />
    <cocktailZutat id="triple-sec" menge="15" />
    <cocktailZutat id="gin" menge="15" />
    <cocktailZutat id="lemon-juice" menge="25" />
    <cocktailZutat id="syrup-gomme" menge="30" />
    <cocktailZutat id="cola" menge="1" einheit="Schuss" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="sex-on-the-beach" name="Sex on the Beach" glass="beach">
  <cocktailZutaten>
    <cocktailZutat id="vodka" menge="40" />
    <cocktailZutat id="peach-schnapps" menge="20" />
    <cocktailZutat id="orange-juice" menge="40" />
    <cocktailZutat id="cranberry-juice" menge="40" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="cuba-libre" name="Cuba Libre" glass="cocktail">
  <cocktailZutaten>
    <cocktailZutat id="cola" menge="120" />
    <cocktailZutat id="rum-dark" menge="50" />
    <cocktailZutat id="lime-juice" menge="10" />
  </cocktailZutaten>
  </cocktail>
</cocktails>
  
<zutaten>
  <zutat id="london-dry-gin" name="London Dry Gin" />
  <zutat id="gin" name="Gin" />
  <zutat id="vermouth-sweet" name="Sweet Vermouth" />
  <zutat id="vermouth-dry" name="Dry Vermouth" />
  <zutat id="campari" name="Campari" />
  <zutat id="syrup-gomme" name="Gomme Syrup" />
  <zutat id="syrup-orgeat" name="Orgeat Syrup" />
  <zutat id="peach-schnapps" name="Peach Schnapps" />
  <zutat id="curacao-orange" name="Orange Curacao" />
  <zutat id="grenadine" name="Grenadine" />
  <zutat id="triple-sec" name="Triple Sec" />
  <zutat id="rum-dark" name="Dark Rum" />
  <zutat id="vodka" name="Vodka" />
  <zutat id="cola" name="Cola" />
  <zutat id="tonic-water" name="Tonic Water" />
  <zutat id="angostura-bitters" name="Angostura Bitter" />
  <zutat id="whiskey-rye" name="Rye Whiskey" />
  <zutat id="rum-white" name="White Rum" />
  <zutat id="lime-juice" name="Lime Juice" />
  <zutat id="orange-juice" name="Orange Juice" />
  <zutat id="cranberry-juice" name="Cranberry Juice" />    
  <zutat id="lemon-juice" name="Lemon Juice" />
  <zutat id="syrup-simple" name="Simple Syrup" />
  <zutat id="rum-goslings-black-seal" name="Gosling's Black Seal Rum" />
  <zutat id="beer-ginger" name="Ginger Beer" />
  <zutat id="tequila-silver" name="Silver Tequila" />
  <zutat id="cointreau" name="Cointreau" />
</zutaten>

</cocktailbar>
```

Im Anschluss an die Cocktail-Liste befindet sich die Zutaten-Liste. Jede
Zutat besitzt hier zwei Attribute. Wie die Cocktails auch jeweils eine
`id` und das Attribut `name`, welches die Normalschreibweise der Zutat
enthält. Zuletzt wird die Datenbank mit `</cocktailbar>` geschlossen.

``` {#code:zutatenliste .xml startFrom="109" language="XML" linerange="109-137" caption="Zutatenliste" label="code:zutatenliste"}
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="stylesheet.xsl"?>

<cocktailbar>

<cocktails>
  <cocktail id="negroni" name="Negroni" glass="whiskey">
  <cocktailZutaten>
    <cocktailZutat id="london-dry-gin" menge="30" />
    <cocktailZutat id="vermouth-sweet" menge="30" />
    <cocktailZutat id="campari" menge="30" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="gin-tonic" name="Gin &amp; Tonic" glass="long">
  <cocktailZutaten>
    <cocktailZutat id="london-dry-gin" menge="50" />
    <cocktailZutat id="tonic-water" menge="50" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="martini" name="Martini" glass="martini">
  <cocktailZutaten>
    <cocktailZutat id="london-dry-gin" menge="60" />
    <cocktailZutat id="vermouth-dry" menge="30" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="manhattan" name="Manhattan" glass="manhattan">
  <cocktailZutaten>
    <cocktailZutat id="whiskey-rye" menge="60" />
    <cocktailZutat id="vermouth-sweet" menge="30" />
    <cocktailZutat id="angostura-bitters" menge="2" einheit="Spritzer" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="daiquiri" name="Daiquiri" glass="daiquiri">
  <cocktailZutaten>
    <cocktailZutat id="rum-white" menge="60" />
    <cocktailZutat id="lime-juice" menge="30" />
    <cocktailZutat id="syrup-simple" menge="25" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="dark-n-stormy" name="Dark 'n' Stormy" glass="cocktail">
  <cocktailZutaten>
    <cocktailZutat id="rum-goslings-black-seal" menge="50" />
    <cocktailZutat id="beer-ginger" menge="150" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="margarita" name="Margarita" glass="daiquiri">
  <cocktailZutaten>
    <cocktailZutat id="tequila-silver" menge="60" />
    <cocktailZutat id="cointreau" menge="30" />
    <cocktailZutat id="lime-juice" menge="30" />
  </cocktailZutaten>
  </cocktail>

<cocktail id="tequila-sunrise" name="Tequila Sunrise" glass="long">
<cocktailZutaten>
  <cocktailZutat id="tequila-silver" menge="45" />
  <cocktailZutat id="orange-juice" menge="120" />
  <cocktailZutat id="grenadine" menge="1" einheit="Schuss" />
</cocktailZutaten>
</cocktail>

  <cocktail id="mai-tai" name="Mai Tai" glass="cocktail">
  <cocktailZutaten>
    <cocktailZutat id="rum-white" menge="40" />
    <cocktailZutat id="rum-dark" menge="20" />
    <cocktailZutat id="curacao-orange" menge="15" />
    <cocktailZutat id="syrup-orgeat" menge="15" />
    <cocktailZutat id="lime-juice" menge="10" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="long-island-icetea" name="Long Island Iced Tea" glass="long">
  <cocktailZutaten>
    <cocktailZutat id="tequila-silver" menge="15" />
    <cocktailZutat id="vodka" menge="15" />
    <cocktailZutat id="rum-white" menge="15" />
    <cocktailZutat id="triple-sec" menge="15" />
    <cocktailZutat id="gin" menge="15" />
    <cocktailZutat id="lemon-juice" menge="25" />
    <cocktailZutat id="syrup-gomme" menge="30" />
    <cocktailZutat id="cola" menge="1" einheit="Schuss" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="sex-on-the-beach" name="Sex on the Beach" glass="beach">
  <cocktailZutaten>
    <cocktailZutat id="vodka" menge="40" />
    <cocktailZutat id="peach-schnapps" menge="20" />
    <cocktailZutat id="orange-juice" menge="40" />
    <cocktailZutat id="cranberry-juice" menge="40" />
  </cocktailZutaten>
  </cocktail>

  <cocktail id="cuba-libre" name="Cuba Libre" glass="cocktail">
  <cocktailZutaten>
    <cocktailZutat id="cola" menge="120" />
    <cocktailZutat id="rum-dark" menge="50" />
    <cocktailZutat id="lime-juice" menge="10" />
  </cocktailZutaten>
  </cocktail>
</cocktails>
  
<zutaten>
  <zutat id="london-dry-gin" name="London Dry Gin" />
  <zutat id="gin" name="Gin" />
  <zutat id="vermouth-sweet" name="Sweet Vermouth" />
  <zutat id="vermouth-dry" name="Dry Vermouth" />
  <zutat id="campari" name="Campari" />
  <zutat id="syrup-gomme" name="Gomme Syrup" />
  <zutat id="syrup-orgeat" name="Orgeat Syrup" />
  <zutat id="peach-schnapps" name="Peach Schnapps" />
  <zutat id="curacao-orange" name="Orange Curacao" />
  <zutat id="grenadine" name="Grenadine" />
  <zutat id="triple-sec" name="Triple Sec" />
  <zutat id="rum-dark" name="Dark Rum" />
  <zutat id="vodka" name="Vodka" />
  <zutat id="cola" name="Cola" />
  <zutat id="tonic-water" name="Tonic Water" />
  <zutat id="angostura-bitters" name="Angostura Bitter" />
  <zutat id="whiskey-rye" name="Rye Whiskey" />
  <zutat id="rum-white" name="White Rum" />
  <zutat id="lime-juice" name="Lime Juice" />
  <zutat id="orange-juice" name="Orange Juice" />
  <zutat id="cranberry-juice" name="Cranberry Juice" />    
  <zutat id="lemon-juice" name="Lemon Juice" />
  <zutat id="syrup-simple" name="Simple Syrup" />
  <zutat id="rum-goslings-black-seal" name="Gosling's Black Seal Rum" />
  <zutat id="beer-ginger" name="Ginger Beer" />
  <zutat id="tequila-silver" name="Silver Tequila" />
  <zutat id="cointreau" name="Cointreau" />
</zutaten>

</cocktailbar>
```

Das Schema - `schema.xsd` {#section:schema}
-------------------------

Die Schema-Datei stellt sicher, dass die Datenbank in
[2.1](#section:datenbank){reference-type="ref"
reference="section:datenbank"} dem angegebenen Schema folgt. Gegen die
Schema-Datei lässt sich die Datenbank validieren. Es kann also geprüft
werden, ob die Datenbank richtig formatiert ist. Auf diese Weise können
Fehler in der Datenbank vor der Transformation erkannt werden.

Wie die Datenbank, beginnt auch das Schema mit einem Header (siehe
[\[code:schema-header\]](#code:schema-header){reference-type="ref"
reference="code:schema-header"}).

``` {#code:schema-header .xml startFrom="1" language="XML" linerange="1-2" caption="Schema - Header" label="code:schema-header"}
<?xml version="1.0"?>
<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">

<xs:element name="cocktailbar">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktails"/>
      <xs:element ref="zutaten"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktails">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktail" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="zutaten">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="zutat" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktail">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktailZutaten"/>
    </xs:sequence>
    <xs:attribute type="xs:string" name="id" use="required"/>
    <xs:attribute type="xs:string" name="name" use="required"/>
    <xs:attribute type="xs:string" name="glass" use="required"/>
  </xs:complexType>
  <xs:unique name="cocktail-id">
    <xs:selector xpath="cocktail"/>
    <xs:field xpath="@id"/>
  </xs:unique>
</xs:element>

<xs:element name="zutat">
  <xs:complexType>
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute type="xs:string" name="id" use="required"/>
        <xs:attribute type="xs:string" name="name" use="required"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
  <xs:unique name="zutat-id">
    <xs:selector xpath="zutat"/>
    <xs:field xpath="@id"/>
  </xs:unique>
</xs:element>

<xs:element name="cocktailZutaten">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktailZutat" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktailZutat">
  <xs:complexType>
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute type="xs:string" name="id" use="required"/>
        <xs:attribute type="xs:int" name="menge" use="required"/>
        <xs:attribute type="xs:string" name="einheit" use="optional"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
</xs:element>

</xs:schema>
```

Im Anschluss definieren wir im Schema die gesamte `cocktailbar` als
Sequenz, die zum einen die `cocktails` und zum anderen die Liste der
`zutaten` enthält.

``` {#code:schema-cocktailbar .xml startFrom="4" language="XML" linerange="4-11" caption="Schema - Cocktailbar" label="code:schema-cocktailbar"}
<?xml version="1.0"?>
<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">

<xs:element name="cocktailbar">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktails"/>
      <xs:element ref="zutaten"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktails">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktail" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="zutaten">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="zutat" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktail">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktailZutaten"/>
    </xs:sequence>
    <xs:attribute type="xs:string" name="id" use="required"/>
    <xs:attribute type="xs:string" name="name" use="required"/>
    <xs:attribute type="xs:string" name="glass" use="required"/>
  </xs:complexType>
  <xs:unique name="cocktail-id">
    <xs:selector xpath="cocktail"/>
    <xs:field xpath="@id"/>
  </xs:unique>
</xs:element>

<xs:element name="zutat">
  <xs:complexType>
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute type="xs:string" name="id" use="required"/>
        <xs:attribute type="xs:string" name="name" use="required"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
  <xs:unique name="zutat-id">
    <xs:selector xpath="zutat"/>
    <xs:field xpath="@id"/>
  </xs:unique>
</xs:element>

<xs:element name="cocktailZutaten">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktailZutat" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktailZutat">
  <xs:complexType>
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute type="xs:string" name="id" use="required"/>
        <xs:attribute type="xs:int" name="menge" use="required"/>
        <xs:attribute type="xs:string" name="einheit" use="optional"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
</xs:element>

</xs:schema>
```

Sowohl die `cocktails` als auch die `zutaten` bestehen aus einem
einzigen Element. Dies ist der einzelne `cocktail` und die einzelne
`zutat`. Beide Elemente können beliebig oft vorkommen `maxOccurs`,
müssen jedoch mindestens einmal vorhanden sein `minOccurs`.

``` {#code:schema-cocktails-zutaten .xml startFrom="13" language="XML" linerange="13-27" caption="Schema - Cocktails \\& Zutaten" label="code:schema-cocktails-zutaten"}
<?xml version="1.0"?>
<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">

<xs:element name="cocktailbar">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktails"/>
      <xs:element ref="zutaten"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktails">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktail" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="zutaten">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="zutat" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktail">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktailZutaten"/>
    </xs:sequence>
    <xs:attribute type="xs:string" name="id" use="required"/>
    <xs:attribute type="xs:string" name="name" use="required"/>
    <xs:attribute type="xs:string" name="glass" use="required"/>
  </xs:complexType>
  <xs:unique name="cocktail-id">
    <xs:selector xpath="cocktail"/>
    <xs:field xpath="@id"/>
  </xs:unique>
</xs:element>

<xs:element name="zutat">
  <xs:complexType>
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute type="xs:string" name="id" use="required"/>
        <xs:attribute type="xs:string" name="name" use="required"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
  <xs:unique name="zutat-id">
    <xs:selector xpath="zutat"/>
    <xs:field xpath="@id"/>
  </xs:unique>
</xs:element>

<xs:element name="cocktailZutaten">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktailZutat" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktailZutat">
  <xs:complexType>
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute type="xs:string" name="id" use="required"/>
        <xs:attribute type="xs:int" name="menge" use="required"/>
        <xs:attribute type="xs:string" name="einheit" use="optional"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
</xs:element>

</xs:schema>
```

Anschließend definieren wir, was einen einzelnen `cocktail` ausmacht. Er
besteht aus einer Reihe an Zutaten, die wir über `cocktailZutaten`
definieren und drei Attribute. Die Attribute sind `id`, `name` und
`glass`. Alle drei Attribute sind notwendig (`required`).

Die `id` wird zusätzlich über den `xs:unique`-Eintrag spezifiziert,
sodass jede `id` nur einmalig vergeben werden kann. Dies ist besonders
wichtig, da wir im späteren Verlauf auf einzelne Cocktails verweisen
möchten. Wäre die Möglichkeit gegeben, dass mehrere Cocktails dieselbe
`id` besäßen, könnten wir nicht eindeutig auf einen spezifischen
Cocktail referieren.

``` {#code:schema-cocktail .xml startFrom="29" language="XML" linerange="29-42" caption="Schema - Cocktail" label="code:schema-cocktail"}
<?xml version="1.0"?>
<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">

<xs:element name="cocktailbar">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktails"/>
      <xs:element ref="zutaten"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktails">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktail" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="zutaten">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="zutat" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktail">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktailZutaten"/>
    </xs:sequence>
    <xs:attribute type="xs:string" name="id" use="required"/>
    <xs:attribute type="xs:string" name="name" use="required"/>
    <xs:attribute type="xs:string" name="glass" use="required"/>
  </xs:complexType>
  <xs:unique name="cocktail-id">
    <xs:selector xpath="cocktail"/>
    <xs:field xpath="@id"/>
  </xs:unique>
</xs:element>

<xs:element name="zutat">
  <xs:complexType>
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute type="xs:string" name="id" use="required"/>
        <xs:attribute type="xs:string" name="name" use="required"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
  <xs:unique name="zutat-id">
    <xs:selector xpath="zutat"/>
    <xs:field xpath="@id"/>
  </xs:unique>
</xs:element>

<xs:element name="cocktailZutaten">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktailZutat" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktailZutat">
  <xs:complexType>
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute type="xs:string" name="id" use="required"/>
        <xs:attribute type="xs:int" name="menge" use="required"/>
        <xs:attribute type="xs:string" name="einheit" use="optional"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
</xs:element>

</xs:schema>
```

Selbige Definition nehmen wir nun für die einzelne `zutat` vor. Einziger
Unterschied ist der, dass die `zutat` ein Attribut weniger hat. Es fehlt
das `glass`-Attribut, welches beim `cocktail` dafür zuständig ist,
festzulegen, welches Glas für den Cocktail genutzt werden soll.

``` {#code:schema-zutat .xml startFrom="44" language="XML" linerange="44-57" caption="Schema - Zutat" label="code:schema-zutat"}
<?xml version="1.0"?>
<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">

<xs:element name="cocktailbar">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktails"/>
      <xs:element ref="zutaten"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktails">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktail" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="zutaten">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="zutat" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktail">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktailZutaten"/>
    </xs:sequence>
    <xs:attribute type="xs:string" name="id" use="required"/>
    <xs:attribute type="xs:string" name="name" use="required"/>
    <xs:attribute type="xs:string" name="glass" use="required"/>
  </xs:complexType>
  <xs:unique name="cocktail-id">
    <xs:selector xpath="cocktail"/>
    <xs:field xpath="@id"/>
  </xs:unique>
</xs:element>

<xs:element name="zutat">
  <xs:complexType>
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute type="xs:string" name="id" use="required"/>
        <xs:attribute type="xs:string" name="name" use="required"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
  <xs:unique name="zutat-id">
    <xs:selector xpath="zutat"/>
    <xs:field xpath="@id"/>
  </xs:unique>
</xs:element>

<xs:element name="cocktailZutaten">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktailZutat" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktailZutat">
  <xs:complexType>
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute type="xs:string" name="id" use="required"/>
        <xs:attribute type="xs:int" name="menge" use="required"/>
        <xs:attribute type="xs:string" name="einheit" use="optional"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
</xs:element>

</xs:schema>
```

Auf der zweitkleinsten Ebene widmen wir uns nun den Zutaten, die in
einem Cocktail zufinden sind (`cocktailZutaten`). Die
Cocktail-Zutatenliste besteht aus beliebig vielen jedoch mindestens
einer `cocktailZutat`.

``` {#code:schema-cocktailzutaten .xml startFrom="59" language="XML" linerange="59-65" caption="Schema - Cocktailzutaten" label="code:schema-cocktailzutaten"}
<?xml version="1.0"?>
<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">

<xs:element name="cocktailbar">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktails"/>
      <xs:element ref="zutaten"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktails">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktail" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="zutaten">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="zutat" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktail">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktailZutaten"/>
    </xs:sequence>
    <xs:attribute type="xs:string" name="id" use="required"/>
    <xs:attribute type="xs:string" name="name" use="required"/>
    <xs:attribute type="xs:string" name="glass" use="required"/>
  </xs:complexType>
  <xs:unique name="cocktail-id">
    <xs:selector xpath="cocktail"/>
    <xs:field xpath="@id"/>
  </xs:unique>
</xs:element>

<xs:element name="zutat">
  <xs:complexType>
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute type="xs:string" name="id" use="required"/>
        <xs:attribute type="xs:string" name="name" use="required"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
  <xs:unique name="zutat-id">
    <xs:selector xpath="zutat"/>
    <xs:field xpath="@id"/>
  </xs:unique>
</xs:element>

<xs:element name="cocktailZutaten">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktailZutat" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktailZutat">
  <xs:complexType>
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute type="xs:string" name="id" use="required"/>
        <xs:attribute type="xs:int" name="menge" use="required"/>
        <xs:attribute type="xs:string" name="einheit" use="optional"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
</xs:element>

</xs:schema>
```

Die kleineste Ebene ist die einzelne `cocktailZutat`. Diese besteht aus
maximal drei Attributen. Diese sind wieder eine `id` und zusätzlich eine
Mengenangabe und eine Angabe zur Mengeneinheit. `id` und `menge` sind
Pflichtangaben. Die Angabe der `einheit` ist `optional`. Warum dies so
ist, klärt sich in Kapitel
[2.3](#section:stylesheet){reference-type="ref"
reference="section:stylesheet"}.

Bis zu diesem Punkt waren allen Attribute vom Typ `xs:string`; also
simple Zeichenketten. Nun haben wir eine Abweichung, da die `menge` vom
Typ `xs:int` ist.

``` {#code:schema-cocktailzutat .xml startFrom="67" language="XML" linerange="67-77" caption="Schema - Cocktailzutat" label="code:schema-cocktailzutat"}
<?xml version="1.0"?>
<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">

<xs:element name="cocktailbar">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktails"/>
      <xs:element ref="zutaten"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktails">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktail" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="zutaten">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="zutat" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktail">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktailZutaten"/>
    </xs:sequence>
    <xs:attribute type="xs:string" name="id" use="required"/>
    <xs:attribute type="xs:string" name="name" use="required"/>
    <xs:attribute type="xs:string" name="glass" use="required"/>
  </xs:complexType>
  <xs:unique name="cocktail-id">
    <xs:selector xpath="cocktail"/>
    <xs:field xpath="@id"/>
  </xs:unique>
</xs:element>

<xs:element name="zutat">
  <xs:complexType>
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute type="xs:string" name="id" use="required"/>
        <xs:attribute type="xs:string" name="name" use="required"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
  <xs:unique name="zutat-id">
    <xs:selector xpath="zutat"/>
    <xs:field xpath="@id"/>
  </xs:unique>
</xs:element>

<xs:element name="cocktailZutaten">
  <xs:complexType>
    <xs:sequence>
      <xs:element ref="cocktailZutat" maxOccurs="unbounded" minOccurs="1"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

<xs:element name="cocktailZutat">
  <xs:complexType>
    <xs:simpleContent>
      <xs:extension base="xs:string">
        <xs:attribute type="xs:string" name="id" use="required"/>
        <xs:attribute type="xs:int" name="menge" use="required"/>
        <xs:attribute type="xs:string" name="einheit" use="optional"/>
      </xs:extension>
    </xs:simpleContent>
  </xs:complexType>
</xs:element>

</xs:schema>
```

Nachdem alle in der Datenbank genutzten Elemente im Schema definiert
wurden, wird die Schema-Datei mit `</xs:schema>` geschlossen. Im
nächsten Abschnitt widmen wir uns dem Stylesheet.

Das Stylesheet - `stylesheet.xsl` {#section:stylesheet}
---------------------------------

Bei dem Stylesheet handelt es sich um die Datei, die aus der Datenbank
mithilfe von XSL Transformation eine neue Datei erzeugen kann; in
unserem Fall eine `HTML`-Datei. Sie beinhaltet `XSL`-Code und
`HTML`-Blöcke.

Würden wir nur `HTML` nutzen, so müssten wir unsere Datenbank direkt in
die Ausgabe-Datei schreiben (*hard-coden*). Durch Nutzung der XSL
Transformation können wir die Semantik (Stylesheet) unserer Datei
unabhängig vom Inhalt (Datenbank - Abschnitt
[2.1](#section:datenbank){reference-type="ref"
reference="section:datenbank"}) gestalten und so zu einem späteren
Zeitpunkt die Datenbank um Einträge erweitern, ohne die Stylesheet-Datei
bearbeiten zu müssen.

Erneut starten wir mit dem Kopfbereich. Hier werden die `XML`-Version
und ein Link zum `XML Namespace` angegeben. Darauf folgt die Angabe,
dass der `output` unserer Transformation in `HTML` geschehen soll.
Zuletzt wird über `xsl:template match` festgelegt, welches Element der
Datenbank als Start-Element für spätere Angaben genutzt werden soll. In
diesem Fall nutzen wir das Wurzelelement `/`. Würden wir mit einer
umfangreicheren Datenbank und einer komplexeren Ausgabe-Datei arbeiten
wollen, könnte es hier sinnvoll sein, einen kleineren Bereich der
Datenbank anzusprechen, um eine bessere Übersicht zu garantieren.

``` {#code:stylesheet-header .xslt startFrom="1" language="XSLT" linerange="1-4" caption="Stylesheet - Header" label="code:stylesheet-header"}
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" />
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
  </div>
</header>

<div id="site-doc" class="site">
  <h2>Dokumentation</h2>
  <p>Dieses Projekt demonstriert die Informationsstrukturierung mithilfe  der XSLT Transformation einer XML Datenbank.</p>
  <p>Die Dokumentation befindet sich unter <code><a href="./dokumentation.pdf">.  dokumentation.pdf</a></code>.</p>
</div>

<div id="site-cocktails" class="site">
  <h2>Cocktails</h2>
  <ul id="cocktail-list" class="cocktail-list">
<xsl:for-each select="//cocktail">
  <li class="single-cocktail">
<div class="cocktail-info">
<div class="cocktail-name"><xsl:value-of select="@name" /></div>
<ul class="ingredient-list">
  <xsl:for-each select="cocktailZutaten/cocktailZutat">
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
</body>
</html>

</xsl:template>
</xsl:stylesheet>
```

Im nächsten Codeblock beginnen wir, `HTML`-Code in unser Stylesheet
einzubauen. Zunächst setzen wir mit `<!DOCTYPE html>` fest, dass wir im
weiteren Verlauf HTML 5 nutzen möchten. Anschließend öffnen wir die
`<html>`- und `<head>`-Tags.

Zwischen `<head>...</head>` stehen Meta-Informationen, die später nicht
auf der Website selber angezeigt werden sollen. Dazu gehört die Angabe
zum Encoding `charset="UTF-8"`, sodass wir unter anderem keine Probelem
mit Umlauten bekommen, und der Seiten-Titel , der später im Web-Browser
im Tab als Titel angezeigt wird.

Außerdem werden hier zusätziche Dateien verlinkt, die wir zur grafischen
Anpassung unserer Website benötigen. Zum einen ist dies `main.css`, die
`CSS`-Datei, die die Gestaltung festlegt und zum anderen ist dies die
Datei `script.js`, in der Javascript-Skripte gespeichert werden können,
um die Funktionalität etwaiger Animationen zu gewährleisten. (Anmerkung:
Letztere Datei wird zur Zeit nicht genutzt - befindet sich für den Fall
der Projekt-Erweiterung aber weiterhin im Projektordner).

Die zwei `meta`-Einträge dienen der Responsivität der
Website-Darstellung. Damit wird gewährleistet, dass unsere Ausgabedatei
nicht auf ein fixes Format festgelegt ist sondern auf allen Bildschirmen
grafisch ansprechend angezeigt werden kann. Wie dies genau passiert,
wird im Abschnitt [2.4](#section:css){reference-type="ref"
reference="section:css"} ausgeführt.

``` {#code:stylesheet-head .xslt startFrom="6" language="XSLT" linerange="6-15" caption="Stylesheet - Head" label="code:stylesheet-head"}
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" />
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
  </div>
</header>

<div id="site-doc" class="site">
  <h2>Dokumentation</h2>
  <p>Dieses Projekt demonstriert die Informationsstrukturierung mithilfe  der XSLT Transformation einer XML Datenbank.</p>
  <p>Die Dokumentation befindet sich unter <code><a href="./dokumentation.pdf">.  dokumentation.pdf</a></code>.</p>
</div>

<div id="site-cocktails" class="site">
  <h2>Cocktails</h2>
  <ul id="cocktail-list" class="cocktail-list">
<xsl:for-each select="//cocktail">
  <li class="single-cocktail">
<div class="cocktail-info">
<div class="cocktail-name"><xsl:value-of select="@name" /></div>
<ul class="ingredient-list">
  <xsl:for-each select="cocktailZutaten/cocktailZutat">
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
</body>
</html>

</xsl:template>
</xsl:stylesheet>
```

Nachdem der `<head>`-Bereich geschlossen wurde, öffnen wir den `<body>`;
also den Bereich, der am Ende im Web-Browser dargestellt wird. Der
`<body>` unterteilt sich im vorliegenden Projekt in drei Teile. Den
`<header>` und zwei `<div>`-Elemente, die jeweils eine \"Seite\"
repräsentieren. Dazu mehr in den Codeblöcken
[\[code:stylesheet-body-site-doku\]](#code:stylesheet-body-site-doku){reference-type="ref"
reference="code:stylesheet-body-site-doku"} ff.

Der `<header>` beinhaltet die Seitenüberschrift `<h1>`, den Untertitel
`<small>` und die Menüleiste `<div class=”menu”>`. Das Menü verlinkt
jeweils zu den Seiten `Dokumentation` und `Cocktails`.

``` {#code:stylesheet-body-header .xslt startFrom="18" language="XSLT" linerange="18-28" caption="Stylesheet - Body - Header" label="code:stylesheet-body-header"}
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" />
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
  </div>
</header>

<div id="site-doc" class="site">
  <h2>Dokumentation</h2>
  <p>Dieses Projekt demonstriert die Informationsstrukturierung mithilfe  der XSLT Transformation einer XML Datenbank.</p>
  <p>Die Dokumentation befindet sich unter <code><a href="./dokumentation.pdf">.  dokumentation.pdf</a></code>.</p>
</div>

<div id="site-cocktails" class="site">
  <h2>Cocktails</h2>
  <ul id="cocktail-list" class="cocktail-list">
<xsl:for-each select="//cocktail">
  <li class="single-cocktail">
<div class="cocktail-info">
<div class="cocktail-name"><xsl:value-of select="@name" /></div>
<ul class="ingredient-list">
  <xsl:for-each select="cocktailZutaten/cocktailZutat">
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
</body>
</html>

</xsl:template>
</xsl:stylesheet>
```

Die Seite `Dokumentation` beinhaltet lediglich einen kurzen
Einführungstext und den Link zu dieser Dokumentation.

``` {#code:stylesheet-body-site-doku .xslt startFrom="30" language="XSLT" linerange="30-34" caption="Stylesheet - Body - Seite - Dokumentation" label="code:stylesheet-body-site-doku"}
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" />
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
  </div>
</header>

<div id="site-doc" class="site">
  <h2>Dokumentation</h2>
  <p>Dieses Projekt demonstriert die Informationsstrukturierung mithilfe  der XSLT Transformation einer XML Datenbank.</p>
  <p>Die Dokumentation befindet sich unter <code><a href="./dokumentation.pdf">.  dokumentation.pdf</a></code>.</p>
</div>

<div id="site-cocktails" class="site">
  <h2>Cocktails</h2>
  <ul id="cocktail-list" class="cocktail-list">
<xsl:for-each select="//cocktail">
  <li class="single-cocktail">
<div class="cocktail-info">
<div class="cocktail-name"><xsl:value-of select="@name" /></div>
<ul class="ingredient-list">
  <xsl:for-each select="cocktailZutaten/cocktailZutat">
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
</body>
</html>

</xsl:template>
</xsl:stylesheet>
```

Die Seite `Cocktails` enthält nun die gesamte Logik, die aus der
Datenbank unsere Ausgabedatei erzeugen kann. Entsprechend werde ich
diesen Abschnitt in kleinere Teile aufteilen.

Wir starten mit einem `<div>`-Tag, welches eine `id` enthält, um die
Seite über die Menüleiste ansteuern zu können. Nach der Überschrift
`<h2>` folgt der Kern der Cocktail-Liste. Bei diesem handelt es sich um
eine ungeordnete Liste `<ul>`. Die `id` und `class` werden später beim
Styling der Website genutzt. (Siehe )

[\[code:stylesheet-body-site-cocktails-liste\]]{#code:stylesheet-body-site-cocktails-liste
label="code:stylesheet-body-site-cocktails-liste"}

``` {#code:stylesheet-body-site-cocktails-start .xslt startFrom="36" language="XSLT" linerange="36-38" label="code:stylesheet-body-site-cocktails-start"}
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" />
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
  </div>
</header>

<div id="site-doc" class="site">
  <h2>Dokumentation</h2>
  <p>Dieses Projekt demonstriert die Informationsstrukturierung mithilfe  der XSLT Transformation einer XML Datenbank.</p>
  <p>Die Dokumentation befindet sich unter <code><a href="./dokumentation.pdf">.  dokumentation.pdf</a></code>.</p>
</div>

<div id="site-cocktails" class="site">
  <h2>Cocktails</h2>
  <ul id="cocktail-list" class="cocktail-list">
<xsl:for-each select="//cocktail">
  <li class="single-cocktail">
<div class="cocktail-info">
<div class="cocktail-name"><xsl:value-of select="@name" /></div>
<ul class="ingredient-list">
  <xsl:for-each select="cocktailZutaten/cocktailZutat">
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
</body>
</html>

</xsl:template>
</xsl:stylesheet>
```

$\vdots$

``` {#code:stylesheet-body-site-cocktails-end .xslt startFrom="78" language="XSLT" linerange="78-79" label="code:stylesheet-body-site-cocktails-end"}
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" />
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
  </div>
</header>

<div id="site-doc" class="site">
  <h2>Dokumentation</h2>
  <p>Dieses Projekt demonstriert die Informationsstrukturierung mithilfe  der XSLT Transformation einer XML Datenbank.</p>
  <p>Die Dokumentation befindet sich unter <code><a href="./dokumentation.pdf">.  dokumentation.pdf</a></code>.</p>
</div>

<div id="site-cocktails" class="site">
  <h2>Cocktails</h2>
  <ul id="cocktail-list" class="cocktail-list">
<xsl:for-each select="//cocktail">
  <li class="single-cocktail">
<div class="cocktail-info">
<div class="cocktail-name"><xsl:value-of select="@name" /></div>
<ul class="ingredient-list">
  <xsl:for-each select="cocktailZutaten/cocktailZutat">
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
</body>
</html>

</xsl:template>
</xsl:stylesheet>
```

Nun wird für jeden Cocktail aus der Datenbank (`for-each` \...
`cocktail`) ein Listen-Eintrag `li` angelegt.

[\[code:stylesheet-body-site-cocktails-for-each\]]{#code:stylesheet-body-site-cocktails-for-each
label="code:stylesheet-body-site-cocktails-for-each"}

``` {#code:stylesheet-body-site-cocktails-start .xslt startFrom="39" language="XSLT" linerange="39-40" label="code:stylesheet-body-site-cocktails-start"}
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" />
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
  </div>
</header>

<div id="site-doc" class="site">
  <h2>Dokumentation</h2>
  <p>Dieses Projekt demonstriert die Informationsstrukturierung mithilfe  der XSLT Transformation einer XML Datenbank.</p>
  <p>Die Dokumentation befindet sich unter <code><a href="./dokumentation.pdf">.  dokumentation.pdf</a></code>.</p>
</div>

<div id="site-cocktails" class="site">
  <h2>Cocktails</h2>
  <ul id="cocktail-list" class="cocktail-list">
<xsl:for-each select="//cocktail">
  <li class="single-cocktail">
<div class="cocktail-info">
<div class="cocktail-name"><xsl:value-of select="@name" /></div>
<ul class="ingredient-list">
  <xsl:for-each select="cocktailZutaten/cocktailZutat">
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
</body>
</html>

</xsl:template>
</xsl:stylesheet>
```

$\vdots$

``` {#code:stylesheet-body-site-cocktails-for-each .xslt startFrom="76" language="XSLT" linerange="76-77" label="code:stylesheet-body-site-cocktails-for-each"}
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" />
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
  </div>
</header>

<div id="site-doc" class="site">
  <h2>Dokumentation</h2>
  <p>Dieses Projekt demonstriert die Informationsstrukturierung mithilfe  der XSLT Transformation einer XML Datenbank.</p>
  <p>Die Dokumentation befindet sich unter <code><a href="./dokumentation.pdf">.  dokumentation.pdf</a></code>.</p>
</div>

<div id="site-cocktails" class="site">
  <h2>Cocktails</h2>
  <ul id="cocktail-list" class="cocktail-list">
<xsl:for-each select="//cocktail">
  <li class="single-cocktail">
<div class="cocktail-info">
<div class="cocktail-name"><xsl:value-of select="@name" /></div>
<ul class="ingredient-list">
  <xsl:for-each select="cocktailZutaten/cocktailZutat">
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
</body>
</html>

</xsl:template>
</xsl:stylesheet>
```

Jeder dieser Einträge in der Liste besteht nun aus mehreren Teilen.
Zuerst wird der `name` des Cocktails aus der Datenbank entnommen und als
Überschrift verwendet. Dies ist zu sehen in Zeile 42. Von jedem Cocktail
(siehe vorheriger Codeblock) wird das Attribut `name` gewählt (`select`
\... `@name`). Wir betten den Namen in `<div>`-Tags ein und vergeben die
Klasse `cocktail-name`, um später die Gestaltung anpassen zu können.

``` {#code:stylesheet-body-site-cocktails-namew .xslt startFrom="41" language="XSLT" linerange="41-42" caption="Stylesheet - Body - Seite - Cocktails - Name" label="code:stylesheet-body-site-cocktails-namew"}
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" />
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
  </div>
</header>

<div id="site-doc" class="site">
  <h2>Dokumentation</h2>
  <p>Dieses Projekt demonstriert die Informationsstrukturierung mithilfe  der XSLT Transformation einer XML Datenbank.</p>
  <p>Die Dokumentation befindet sich unter <code><a href="./dokumentation.pdf">.  dokumentation.pdf</a></code>.</p>
</div>

<div id="site-cocktails" class="site">
  <h2>Cocktails</h2>
  <ul id="cocktail-list" class="cocktail-list">
<xsl:for-each select="//cocktail">
  <li class="single-cocktail">
<div class="cocktail-info">
<div class="cocktail-name"><xsl:value-of select="@name" /></div>
<ul class="ingredient-list">
  <xsl:for-each select="cocktailZutaten/cocktailZutat">
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
</body>
</html>

</xsl:template>
</xsl:stylesheet>
```

Bei dem nächsten Abschnitt handelt es sich wieder um eine
`for`-Schleife. Dieses mal iterieren wir über die Zutaten in der
Zutatenliste eines jeden Cocktails. Wir befinden uns also in einer
Schleife innerhalb einer Schleife. Für jede Zutat innerhalb des
aktuellen Cocktails, wird nun in der ungeordneten Liste
`ingredient-list` ein Listen-Eintrag `li` erstellt.

[\[code:stylesheet-body-site-cocktails-for-each\]]{#code:stylesheet-body-site-cocktails-for-each
label="code:stylesheet-body-site-cocktails-for-each"}

``` {#code:stylesheet-body-site-cocktails-info-start .xslt startFrom="43" language="XSLT" linerange="43-45" label="code:stylesheet-body-site-cocktails-info-start"}
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" />
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
  </div>
</header>

<div id="site-doc" class="site">
  <h2>Dokumentation</h2>
  <p>Dieses Projekt demonstriert die Informationsstrukturierung mithilfe  der XSLT Transformation einer XML Datenbank.</p>
  <p>Die Dokumentation befindet sich unter <code><a href="./dokumentation.pdf">.  dokumentation.pdf</a></code>.</p>
</div>

<div id="site-cocktails" class="site">
  <h2>Cocktails</h2>
  <ul id="cocktail-list" class="cocktail-list">
<xsl:for-each select="//cocktail">
  <li class="single-cocktail">
<div class="cocktail-info">
<div class="cocktail-name"><xsl:value-of select="@name" /></div>
<ul class="ingredient-list">
  <xsl:for-each select="cocktailZutaten/cocktailZutat">
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
</body>
</html>

</xsl:template>
</xsl:stylesheet>
```

$\vdots$

``` {#code:stylesheet-body-site-cocktails-info-end .xslt startFrom="76" language="XSLT" linerange="67-69" label="code:stylesheet-body-site-cocktails-info-end"}
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" />
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
  </div>
</header>

<div id="site-doc" class="site">
  <h2>Dokumentation</h2>
  <p>Dieses Projekt demonstriert die Informationsstrukturierung mithilfe  der XSLT Transformation einer XML Datenbank.</p>
  <p>Die Dokumentation befindet sich unter <code><a href="./dokumentation.pdf">.  dokumentation.pdf</a></code>.</p>
</div>

<div id="site-cocktails" class="site">
  <h2>Cocktails</h2>
  <ul id="cocktail-list" class="cocktail-list">
<xsl:for-each select="//cocktail">
  <li class="single-cocktail">
<div class="cocktail-info">
<div class="cocktail-name"><xsl:value-of select="@name" /></div>
<ul class="ingredient-list">
  <xsl:for-each select="cocktailZutaten/cocktailZutat">
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
</body>
</html>

</xsl:template>
</xsl:stylesheet>
```

Im folgenden Codeblock nutzen wir eine Variable `xsl:variable`, um die
`id` der aktuellen Zutat zwischenzuspeichern. Diese `id` wird dann
innerhalb einer `for`-Schleife, die über alle Zutaten aus der Datenbank
iteriert, dafür genutzt, um abzufragen, ob die gespeicherte `id` mit der
`id` der abgefragten Zutat übereinstimmt (`if test`). Ist dies der Fall,
wird der vollständige Name der Zutat `@name` ausgegeben.

``` {#code:stylesheet-body-site-cocktails-zutat .xslt startFrom="46" language="XSLT" linerange="46-51" caption="Stylesheet - Body - Seite - Cocktails - Zutat" label="code:stylesheet-body-site-cocktails-zutat"}
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" />
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
  </div>
</header>

<div id="site-doc" class="site">
  <h2>Dokumentation</h2>
  <p>Dieses Projekt demonstriert die Informationsstrukturierung mithilfe  der XSLT Transformation einer XML Datenbank.</p>
  <p>Die Dokumentation befindet sich unter <code><a href="./dokumentation.pdf">.  dokumentation.pdf</a></code>.</p>
</div>

<div id="site-cocktails" class="site">
  <h2>Cocktails</h2>
  <ul id="cocktail-list" class="cocktail-list">
<xsl:for-each select="//cocktail">
  <li class="single-cocktail">
<div class="cocktail-info">
<div class="cocktail-name"><xsl:value-of select="@name" /></div>
<ul class="ingredient-list">
  <xsl:for-each select="cocktailZutaten/cocktailZutat">
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
</body>
</html>

</xsl:template>
</xsl:stylesheet>
```

Nun suchen wir die Menge der ausgewählten Zutat. Hier ergibt sich eine
weitere Besonderheit. Wie in Codeblock
[\[code:schema-cocktailzutat\]](#code:schema-cocktailzutat){reference-type="ref"
reference="code:schema-cocktailzutat"} angegeben war, handelt es sich
bei der Mengeneinheit um ein optionales Attribut. Der folgende Codeblock
zeigt ein verschachteltes `choose X when Y; otherwise Z` Element. Ist
keine Mengeineinheit über das `menge`-Attribut in der Zutat angegeben,
wird auf die festgelegte Einheit `ml` zurückgegriffen. Ansonsten wird
über das Attribut `einheit` die entsprechende Einheit aus dem Attribut
extrahiert und dargestellt.

Auf diese Weise konnten wir in der Datenbank die Mengeneinheit `ml`
auslassen. Da dies die übliche Einheit ist, sparen wir uns somit
repetitives Eingeben.

``` {#code:stylesheet-body-site-cocktails-mengeneinheit .xslt startFrom="52" language="XSLT" linerange="52-66" caption="Stylesheet - Body - Seite - Cocktails - Zutat - Menge \\& Einheit" label="code:stylesheet-body-site-cocktails-mengeneinheit"}
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" />
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
  </div>
</header>

<div id="site-doc" class="site">
  <h2>Dokumentation</h2>
  <p>Dieses Projekt demonstriert die Informationsstrukturierung mithilfe  der XSLT Transformation einer XML Datenbank.</p>
  <p>Die Dokumentation befindet sich unter <code><a href="./dokumentation.pdf">.  dokumentation.pdf</a></code>.</p>
</div>

<div id="site-cocktails" class="site">
  <h2>Cocktails</h2>
  <ul id="cocktail-list" class="cocktail-list">
<xsl:for-each select="//cocktail">
  <li class="single-cocktail">
<div class="cocktail-info">
<div class="cocktail-name"><xsl:value-of select="@name" /></div>
<ul class="ingredient-list">
  <xsl:for-each select="cocktailZutaten/cocktailZutat">
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
</body>
</html>

</xsl:template>
</xsl:stylesheet>
```

Zuletzt stellen wir das Cocktail-Glas dar. Hierzu betten wir in
`<img>`-Tags das jeweils passende Bild ein, welches sich im
Bilder-Ordner befindet. Hierzu nutzen wir das Attribut `glass` des
derzeit in der Schleife aktiven Glases.

Bei den Bildern handelt es sich um `.svg`-Dateien, um die Dateigröße
möglichst gering zu halten. Außerdem sind `.svg`-Dateien Vektorgrafiken,
die den Vorteil haben, sich beliebig skalieren zu lassen. So kann auch
eine sehr kleine Datei auf einem sehr großen Bildschirm scharf
dargestellt werden.

``` {#code:stylesheet-body-site-cocktails-glas .xslt startFrom="71" language="XSLT" linerange="71-75" caption="Stylesheet - Body - Seite - Cocktails - Glas" label="code:stylesheet-body-site-cocktails-glas"}
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" />
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
  </div>
</header>

<div id="site-doc" class="site">
  <h2>Dokumentation</h2>
  <p>Dieses Projekt demonstriert die Informationsstrukturierung mithilfe  der XSLT Transformation einer XML Datenbank.</p>
  <p>Die Dokumentation befindet sich unter <code><a href="./dokumentation.pdf">.  dokumentation.pdf</a></code>.</p>
</div>

<div id="site-cocktails" class="site">
  <h2>Cocktails</h2>
  <ul id="cocktail-list" class="cocktail-list">
<xsl:for-each select="//cocktail">
  <li class="single-cocktail">
<div class="cocktail-info">
<div class="cocktail-name"><xsl:value-of select="@name" /></div>
<ul class="ingredient-list">
  <xsl:for-each select="cocktailZutaten/cocktailZutat">
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
</body>
</html>

</xsl:template>
</xsl:stylesheet>
```

Cascading Stylesheet - `css/main.css` {#section:css}
-------------------------------------

Die `.css`-Datei, das sogenannte `Cascading StyleSheet`, wird genutzt,
um Elemente der `HTML`-Seite grafisch anzupassen. Über diese Datei
lassen sich unter anderem Schriftarten, -größen, -farben und weitere
Parameter, wie Seitenränder und Zeilenabstände, anpassen.

Im Folgenden werde ich die relevanten Abschnitte der Datei beschreiben.

Zuerst werden externe Schriftarten importiert. Diese sind lizenzfrei
zugänglich über [`fonts.google.com`](https://fonts.google.com).

``` {#code:css-font .html startFrom="1" language="HTML" linerange="1-1" caption="CSS - Schriftart" label="code:css-font"}
@import url('https://fonts.googleapis.com/css?family=Inconsolata|Oswald|Raleway');

:root {
    --font-sec: 'Raleway', sans-serif;
    --font-prim: 'Oswald', sans-serif;
    --font-mono: 'Inconsolata', monospace;
    --c-white: #FEFEFE;
    --c-gray-l: #EEE;
    --c-gray: #555;
    --c-gray-d: #333;
}

div.site:not(:target) {
    display: none;
}
div.site:target {
    display: block;
}

body {
    font-family: var(--font-prim);
    padding: 2rem;
    background-color: var(--c-white);
    color: var(--c-gray-d);
    font-size: 16px;
}

h1 {
    margin: 1rem 0;
    font-family: 'Raleway', sans-serif;
}

small, p {
    font-family: var(--font-mono);
}
small.menge {
    padding-left: .4rem;
}

.menu {
    margin-top: 1rem;
}

.menu > a {
    padding: 0 1rem;
    background-color: var(--c-gray-l);
    color: var(--c-gray-d);
    margin-right: 1rem;
    text-decoration: none;
    text-transform: uppercase;
}

.menu > a:hover, .menu > a.active {
    background-color: var(--c-gray-d);
    color: var(--c-gray-l);
}

ul {
    list-style: none;
    margin: 0;
    padding: 0;
}
.cocktail-list {
    display: grid;
    grid-template-columns: repeat(1, 1fr);
    grid-gap: 1rem;
}
.single-cocktail {
    border: 3px solid var(--c-gray-l);
    display: grid;
    grid-column-gap: 1rem;
    grid-template-columns: repeat(12, 1fr);
    padding: 1rem;
}
@media only screen and (min-width: 600px) {
    .cocktail-list {
        grid-template-columns: repeat(2, 1fr);
    }
}
@media only screen and (min-width: 1200px) {
    .cocktail-list {
        grid-template-columns: repeat(3, 1fr);
    }
}
@media only screen and (min-width: 1800px) {
    .cocktail-list {
        grid-template-columns: repeat(4, 1fr);
    }
}

.cocktail-info {
    grid-column: 1/8;
}
.cocktail-name {
    font-family: var(--font-sec);
    font-size: 1.5rem;
    margin-bottom: 0.3rem;
    padding-bottom: 0.3rem;
    border-bottom: 10px solid var(--c-gray);
}
.ingredient-list {
}
.cocktail-glass {
    /*background-color: var(--c-gray-l);*/
    grid-column: 8/13;
    align-self: end;
    
}
.cocktail-glass img {
    width: 80%;
    padding: 0.5rem;
    float: right;
}

.cocktail-glass:hover {
	-webkit-animation-name: wiggle;
	-webkit-animation-duration: 0.9s;
	-webkit-transform-origin:50% 50%;
	-webkit-animation-iteration-count: 1;
    -webkit-animation-timing-function: linear;
}
@-webkit-keyframes wiggle {
	0% { -webkit-transform: translate(2px, 1px) rotate(0deg); }
	10% { -webkit-transform: translate(-1px, -2px) rotate(-1deg); }
	20% { -webkit-transform: translate(-3px, 0px) rotate(1deg); }
	30% { -webkit-transform: translate(0px, 2px) rotate(0deg); }
	40% { -webkit-transform: translate(1px, -1px) rotate(3deg); }
	50% { -webkit-transform: translate(-1px, 2px) rotate(-3deg); }
	60% { -webkit-transform: translate(-3px, 1px) rotate(0deg); }
	70% { -webkit-transform: translate(2px, 1px) rotate(-1deg); }
	80% { -webkit-transform: translate(-1px, -1px) rotate(1deg); }
	90% { -webkit-transform: translate(2px, 2px) rotate(0deg); }
	100% { -webkit-transform: translate(1px, -2px) rotate(-1deg); }
}
```

Anschließend definieren wir einige Variablen, um Schriftarten und Farben
im späteren Verlauf der Datei wiederverwenden zu können.

``` {#code:css-variables .html startFrom="3" language="HTML" linerange="3-11" caption="CSS - Variablen" label="code:css-variables"}
@import url('https://fonts.googleapis.com/css?family=Inconsolata|Oswald|Raleway');

:root {
    --font-sec: 'Raleway', sans-serif;
    --font-prim: 'Oswald', sans-serif;
    --font-mono: 'Inconsolata', monospace;
    --c-white: #FEFEFE;
    --c-gray-l: #EEE;
    --c-gray: #555;
    --c-gray-d: #333;
}

div.site:not(:target) {
    display: none;
}
div.site:target {
    display: block;
}

body {
    font-family: var(--font-prim);
    padding: 2rem;
    background-color: var(--c-white);
    color: var(--c-gray-d);
    font-size: 16px;
}

h1 {
    margin: 1rem 0;
    font-family: 'Raleway', sans-serif;
}

small, p {
    font-family: var(--font-mono);
}
small.menge {
    padding-left: .4rem;
}

.menu {
    margin-top: 1rem;
}

.menu > a {
    padding: 0 1rem;
    background-color: var(--c-gray-l);
    color: var(--c-gray-d);
    margin-right: 1rem;
    text-decoration: none;
    text-transform: uppercase;
}

.menu > a:hover, .menu > a.active {
    background-color: var(--c-gray-d);
    color: var(--c-gray-l);
}

ul {
    list-style: none;
    margin: 0;
    padding: 0;
}
.cocktail-list {
    display: grid;
    grid-template-columns: repeat(1, 1fr);
    grid-gap: 1rem;
}
.single-cocktail {
    border: 3px solid var(--c-gray-l);
    display: grid;
    grid-column-gap: 1rem;
    grid-template-columns: repeat(12, 1fr);
    padding: 1rem;
}
@media only screen and (min-width: 600px) {
    .cocktail-list {
        grid-template-columns: repeat(2, 1fr);
    }
}
@media only screen and (min-width: 1200px) {
    .cocktail-list {
        grid-template-columns: repeat(3, 1fr);
    }
}
@media only screen and (min-width: 1800px) {
    .cocktail-list {
        grid-template-columns: repeat(4, 1fr);
    }
}

.cocktail-info {
    grid-column: 1/8;
}
.cocktail-name {
    font-family: var(--font-sec);
    font-size: 1.5rem;
    margin-bottom: 0.3rem;
    padding-bottom: 0.3rem;
    border-bottom: 10px solid var(--c-gray);
}
.ingredient-list {
}
.cocktail-glass {
    /*background-color: var(--c-gray-l);*/
    grid-column: 8/13;
    align-self: end;
    
}
.cocktail-glass img {
    width: 80%;
    padding: 0.5rem;
    float: right;
}

.cocktail-glass:hover {
	-webkit-animation-name: wiggle;
	-webkit-animation-duration: 0.9s;
	-webkit-transform-origin:50% 50%;
	-webkit-animation-iteration-count: 1;
    -webkit-animation-timing-function: linear;
}
@-webkit-keyframes wiggle {
	0% { -webkit-transform: translate(2px, 1px) rotate(0deg); }
	10% { -webkit-transform: translate(-1px, -2px) rotate(-1deg); }
	20% { -webkit-transform: translate(-3px, 0px) rotate(1deg); }
	30% { -webkit-transform: translate(0px, 2px) rotate(0deg); }
	40% { -webkit-transform: translate(1px, -1px) rotate(3deg); }
	50% { -webkit-transform: translate(-1px, 2px) rotate(-3deg); }
	60% { -webkit-transform: translate(-3px, 1px) rotate(0deg); }
	70% { -webkit-transform: translate(2px, 1px) rotate(-1deg); }
	80% { -webkit-transform: translate(-1px, -1px) rotate(1deg); }
	90% { -webkit-transform: translate(2px, 2px) rotate(0deg); }
	100% { -webkit-transform: translate(1px, -2px) rotate(-1deg); }
}
```

Die nächsten Zeilen sind entscheidend für die Menüführung der Website.
Wenn der Codeblock nicht vorhanden wäre, würde die einzelnen \"Seiten\"
(Dokumentation, Cocktails) untereinander angezeigt. Durch das Ansteuern
der Pseudoklasse `:target`, die die aktuell aktive Seite definiert,
können wir alle anderen Seiten aus- und nur die aktive Seite einblenden.

``` {#code:css-tabs .html startFrom="13" language="HTML" linerange="13-18" caption="CSS - Tabs" label="code:css-tabs"}
@import url('https://fonts.googleapis.com/css?family=Inconsolata|Oswald|Raleway');

:root {
    --font-sec: 'Raleway', sans-serif;
    --font-prim: 'Oswald', sans-serif;
    --font-mono: 'Inconsolata', monospace;
    --c-white: #FEFEFE;
    --c-gray-l: #EEE;
    --c-gray: #555;
    --c-gray-d: #333;
}

div.site:not(:target) {
    display: none;
}
div.site:target {
    display: block;
}

body {
    font-family: var(--font-prim);
    padding: 2rem;
    background-color: var(--c-white);
    color: var(--c-gray-d);
    font-size: 16px;
}

h1 {
    margin: 1rem 0;
    font-family: 'Raleway', sans-serif;
}

small, p {
    font-family: var(--font-mono);
}
small.menge {
    padding-left: .4rem;
}

.menu {
    margin-top: 1rem;
}

.menu > a {
    padding: 0 1rem;
    background-color: var(--c-gray-l);
    color: var(--c-gray-d);
    margin-right: 1rem;
    text-decoration: none;
    text-transform: uppercase;
}

.menu > a:hover, .menu > a.active {
    background-color: var(--c-gray-d);
    color: var(--c-gray-l);
}

ul {
    list-style: none;
    margin: 0;
    padding: 0;
}
.cocktail-list {
    display: grid;
    grid-template-columns: repeat(1, 1fr);
    grid-gap: 1rem;
}
.single-cocktail {
    border: 3px solid var(--c-gray-l);
    display: grid;
    grid-column-gap: 1rem;
    grid-template-columns: repeat(12, 1fr);
    padding: 1rem;
}
@media only screen and (min-width: 600px) {
    .cocktail-list {
        grid-template-columns: repeat(2, 1fr);
    }
}
@media only screen and (min-width: 1200px) {
    .cocktail-list {
        grid-template-columns: repeat(3, 1fr);
    }
}
@media only screen and (min-width: 1800px) {
    .cocktail-list {
        grid-template-columns: repeat(4, 1fr);
    }
}

.cocktail-info {
    grid-column: 1/8;
}
.cocktail-name {
    font-family: var(--font-sec);
    font-size: 1.5rem;
    margin-bottom: 0.3rem;
    padding-bottom: 0.3rem;
    border-bottom: 10px solid var(--c-gray);
}
.ingredient-list {
}
.cocktail-glass {
    /*background-color: var(--c-gray-l);*/
    grid-column: 8/13;
    align-self: end;
    
}
.cocktail-glass img {
    width: 80%;
    padding: 0.5rem;
    float: right;
}

.cocktail-glass:hover {
	-webkit-animation-name: wiggle;
	-webkit-animation-duration: 0.9s;
	-webkit-transform-origin:50% 50%;
	-webkit-animation-iteration-count: 1;
    -webkit-animation-timing-function: linear;
}
@-webkit-keyframes wiggle {
	0% { -webkit-transform: translate(2px, 1px) rotate(0deg); }
	10% { -webkit-transform: translate(-1px, -2px) rotate(-1deg); }
	20% { -webkit-transform: translate(-3px, 0px) rotate(1deg); }
	30% { -webkit-transform: translate(0px, 2px) rotate(0deg); }
	40% { -webkit-transform: translate(1px, -1px) rotate(3deg); }
	50% { -webkit-transform: translate(-1px, 2px) rotate(-3deg); }
	60% { -webkit-transform: translate(-3px, 1px) rotate(0deg); }
	70% { -webkit-transform: translate(2px, 1px) rotate(-1deg); }
	80% { -webkit-transform: translate(-1px, -1px) rotate(1deg); }
	90% { -webkit-transform: translate(2px, 2px) rotate(0deg); }
	100% { -webkit-transform: translate(1px, -2px) rotate(-1deg); }
}
```

In einer `CSS`-Datei können auf verschiedene Arten die einzelnen
Seiten-Elemente angesteuert werden. Im nächsten Codeblock ist die
Variante dargestellt, die ein Element über den Element-Typ ansteuert.
Dies geschieht, indem der rein Name des Tags angegeben wird. Hier:
`body`.

Über Attribut-Wert-Paare können nun die Eigenschaften der vorher
ausgewählten Elemente geändert werden. Die Angaben `var(–XYZ)` verweisen
hier auf die in Codeblock
[\[code:css-variables\]](#code:css-variables){reference-type="ref"
reference="code:css-variables"} angelegten Variablen. Auf diese Art kann
über das Ändern des Variablen-Werts die gesamte Seite angepasst werden.

``` {#code:css-body .html startFrom="20" language="HTML" linerange="20-26" caption="CSS - Body" label="code:css-body"}
@import url('https://fonts.googleapis.com/css?family=Inconsolata|Oswald|Raleway');

:root {
    --font-sec: 'Raleway', sans-serif;
    --font-prim: 'Oswald', sans-serif;
    --font-mono: 'Inconsolata', monospace;
    --c-white: #FEFEFE;
    --c-gray-l: #EEE;
    --c-gray: #555;
    --c-gray-d: #333;
}

div.site:not(:target) {
    display: none;
}
div.site:target {
    display: block;
}

body {
    font-family: var(--font-prim);
    padding: 2rem;
    background-color: var(--c-white);
    color: var(--c-gray-d);
    font-size: 16px;
}

h1 {
    margin: 1rem 0;
    font-family: 'Raleway', sans-serif;
}

small, p {
    font-family: var(--font-mono);
}
small.menge {
    padding-left: .4rem;
}

.menu {
    margin-top: 1rem;
}

.menu > a {
    padding: 0 1rem;
    background-color: var(--c-gray-l);
    color: var(--c-gray-d);
    margin-right: 1rem;
    text-decoration: none;
    text-transform: uppercase;
}

.menu > a:hover, .menu > a.active {
    background-color: var(--c-gray-d);
    color: var(--c-gray-l);
}

ul {
    list-style: none;
    margin: 0;
    padding: 0;
}
.cocktail-list {
    display: grid;
    grid-template-columns: repeat(1, 1fr);
    grid-gap: 1rem;
}
.single-cocktail {
    border: 3px solid var(--c-gray-l);
    display: grid;
    grid-column-gap: 1rem;
    grid-template-columns: repeat(12, 1fr);
    padding: 1rem;
}
@media only screen and (min-width: 600px) {
    .cocktail-list {
        grid-template-columns: repeat(2, 1fr);
    }
}
@media only screen and (min-width: 1200px) {
    .cocktail-list {
        grid-template-columns: repeat(3, 1fr);
    }
}
@media only screen and (min-width: 1800px) {
    .cocktail-list {
        grid-template-columns: repeat(4, 1fr);
    }
}

.cocktail-info {
    grid-column: 1/8;
}
.cocktail-name {
    font-family: var(--font-sec);
    font-size: 1.5rem;
    margin-bottom: 0.3rem;
    padding-bottom: 0.3rem;
    border-bottom: 10px solid var(--c-gray);
}
.ingredient-list {
}
.cocktail-glass {
    /*background-color: var(--c-gray-l);*/
    grid-column: 8/13;
    align-self: end;
    
}
.cocktail-glass img {
    width: 80%;
    padding: 0.5rem;
    float: right;
}

.cocktail-glass:hover {
	-webkit-animation-name: wiggle;
	-webkit-animation-duration: 0.9s;
	-webkit-transform-origin:50% 50%;
	-webkit-animation-iteration-count: 1;
    -webkit-animation-timing-function: linear;
}
@-webkit-keyframes wiggle {
	0% { -webkit-transform: translate(2px, 1px) rotate(0deg); }
	10% { -webkit-transform: translate(-1px, -2px) rotate(-1deg); }
	20% { -webkit-transform: translate(-3px, 0px) rotate(1deg); }
	30% { -webkit-transform: translate(0px, 2px) rotate(0deg); }
	40% { -webkit-transform: translate(1px, -1px) rotate(3deg); }
	50% { -webkit-transform: translate(-1px, 2px) rotate(-3deg); }
	60% { -webkit-transform: translate(-3px, 1px) rotate(0deg); }
	70% { -webkit-transform: translate(2px, 1px) rotate(-1deg); }
	80% { -webkit-transform: translate(-1px, -1px) rotate(1deg); }
	90% { -webkit-transform: translate(2px, 2px) rotate(0deg); }
	100% { -webkit-transform: translate(1px, -2px) rotate(-1deg); }
}
```

Eine andere Art des Ansteuerns ist, die `CSS`-Klassen der Elemente zu
nutzen. Wie in Abschnitt [2.3](#section:stylesheet){reference-type="ref"
reference="section:stylesheet"} bereits mehrfach erwähnt, wurden
einzelnen Elementen Klassen zugeordnet. Diese können in der `CSS`-Datei
über das Voranstellen eines Punktes angesteuert werden. Hier: `.menu`.

Außerdem können genauere Verschachtelungen von Elementen mithilfe der
Schreibweise `X > Y` angesteuert werden. Im vorliegenden Beispiel werden
alle Verweise (Anchor) `a` grafisch verändert; jedoch nur, wenn sie sich
unterhalb eines Elementes mit der Klasse `menu` befinden.

``` {#code:css-menulinks .html startFrom="44" language="HTML" linerange="44-51" caption="CSS - Menü-Links" label="code:css-menulinks"}
@import url('https://fonts.googleapis.com/css?family=Inconsolata|Oswald|Raleway');

:root {
    --font-sec: 'Raleway', sans-serif;
    --font-prim: 'Oswald', sans-serif;
    --font-mono: 'Inconsolata', monospace;
    --c-white: #FEFEFE;
    --c-gray-l: #EEE;
    --c-gray: #555;
    --c-gray-d: #333;
}

div.site:not(:target) {
    display: none;
}
div.site:target {
    display: block;
}

body {
    font-family: var(--font-prim);
    padding: 2rem;
    background-color: var(--c-white);
    color: var(--c-gray-d);
    font-size: 16px;
}

h1 {
    margin: 1rem 0;
    font-family: 'Raleway', sans-serif;
}

small, p {
    font-family: var(--font-mono);
}
small.menge {
    padding-left: .4rem;
}

.menu {
    margin-top: 1rem;
}

.menu > a {
    padding: 0 1rem;
    background-color: var(--c-gray-l);
    color: var(--c-gray-d);
    margin-right: 1rem;
    text-decoration: none;
    text-transform: uppercase;
}

.menu > a:hover, .menu > a.active {
    background-color: var(--c-gray-d);
    color: var(--c-gray-l);
}

ul {
    list-style: none;
    margin: 0;
    padding: 0;
}
.cocktail-list {
    display: grid;
    grid-template-columns: repeat(1, 1fr);
    grid-gap: 1rem;
}
.single-cocktail {
    border: 3px solid var(--c-gray-l);
    display: grid;
    grid-column-gap: 1rem;
    grid-template-columns: repeat(12, 1fr);
    padding: 1rem;
}
@media only screen and (min-width: 600px) {
    .cocktail-list {
        grid-template-columns: repeat(2, 1fr);
    }
}
@media only screen and (min-width: 1200px) {
    .cocktail-list {
        grid-template-columns: repeat(3, 1fr);
    }
}
@media only screen and (min-width: 1800px) {
    .cocktail-list {
        grid-template-columns: repeat(4, 1fr);
    }
}

.cocktail-info {
    grid-column: 1/8;
}
.cocktail-name {
    font-family: var(--font-sec);
    font-size: 1.5rem;
    margin-bottom: 0.3rem;
    padding-bottom: 0.3rem;
    border-bottom: 10px solid var(--c-gray);
}
.ingredient-list {
}
.cocktail-glass {
    /*background-color: var(--c-gray-l);*/
    grid-column: 8/13;
    align-self: end;
    
}
.cocktail-glass img {
    width: 80%;
    padding: 0.5rem;
    float: right;
}

.cocktail-glass:hover {
	-webkit-animation-name: wiggle;
	-webkit-animation-duration: 0.9s;
	-webkit-transform-origin:50% 50%;
	-webkit-animation-iteration-count: 1;
    -webkit-animation-timing-function: linear;
}
@-webkit-keyframes wiggle {
	0% { -webkit-transform: translate(2px, 1px) rotate(0deg); }
	10% { -webkit-transform: translate(-1px, -2px) rotate(-1deg); }
	20% { -webkit-transform: translate(-3px, 0px) rotate(1deg); }
	30% { -webkit-transform: translate(0px, 2px) rotate(0deg); }
	40% { -webkit-transform: translate(1px, -1px) rotate(3deg); }
	50% { -webkit-transform: translate(-1px, 2px) rotate(-3deg); }
	60% { -webkit-transform: translate(-3px, 1px) rotate(0deg); }
	70% { -webkit-transform: translate(2px, 1px) rotate(-1deg); }
	80% { -webkit-transform: translate(-1px, -1px) rotate(1deg); }
	90% { -webkit-transform: translate(2px, 2px) rotate(0deg); }
	100% { -webkit-transform: translate(1px, -2px) rotate(-1deg); }
}
```

Die folgenden Codeblöcke zeigen stellen die Responsivität der Website
sicher. Dabei wird das moderne `CSS-Grid` genutzt. Im ersten Teil werden
die Elemente der Klasse `cocktail-list` bearbeitet. Die interessante
Einheit befindet sich in Zeile 65. Das Attribut-Wert-Paar
`grid-template-columns: repeat(1, 1fr)` gibt an, dass ein
Ein-Spalten-Raster genutzt wird, in dem jede Spalte (also eine) den
selben Platz einnimmt (`repeat(1, 1fr)`). `fr` steht hier für
*Fraction*; zu deutsch *Teil*.

Ab Zeile 75 beginnen nun die sogenannten `media-queries`. Der
Web-Browser nutzt die Informationen über die Fenster-Größe aus, um für
unterschiedliche Fenster-Größen andere Angaben zu machen.

Im vorliegenden Beispiel nutzen wir drei sogenannte `break-points`, also
Größen, an denen sich die Darstellung der Website verändert. Hier
handelt es sich um die Größen `600px-1199px`, `1200px-1799px` und
`\geq1800px`. Die Größe `<600px` ist implizit durch die ersten Zeilen
abdegeckt.

Respektive erhöhen wir hier die Zahlen der Spalten in unserem Raster von
einer Spalte auf vier Spalten im größten Raster. Auf diese Weise können
wir Bildschirme aller Größen unterstützen.

``` {.html startFrom="63" language="HTML" linerange="63-67"}
@import url('https://fonts.googleapis.com/css?family=Inconsolata|Oswald|Raleway');

:root {
    --font-sec: 'Raleway', sans-serif;
    --font-prim: 'Oswald', sans-serif;
    --font-mono: 'Inconsolata', monospace;
    --c-white: #FEFEFE;
    --c-gray-l: #EEE;
    --c-gray: #555;
    --c-gray-d: #333;
}

div.site:not(:target) {
    display: none;
}
div.site:target {
    display: block;
}

body {
    font-family: var(--font-prim);
    padding: 2rem;
    background-color: var(--c-white);
    color: var(--c-gray-d);
    font-size: 16px;
}

h1 {
    margin: 1rem 0;
    font-family: 'Raleway', sans-serif;
}

small, p {
    font-family: var(--font-mono);
}
small.menge {
    padding-left: .4rem;
}

.menu {
    margin-top: 1rem;
}

.menu > a {
    padding: 0 1rem;
    background-color: var(--c-gray-l);
    color: var(--c-gray-d);
    margin-right: 1rem;
    text-decoration: none;
    text-transform: uppercase;
}

.menu > a:hover, .menu > a.active {
    background-color: var(--c-gray-d);
    color: var(--c-gray-l);
}

ul {
    list-style: none;
    margin: 0;
    padding: 0;
}
.cocktail-list {
    display: grid;
    grid-template-columns: repeat(1, 1fr);
    grid-gap: 1rem;
}
.single-cocktail {
    border: 3px solid var(--c-gray-l);
    display: grid;
    grid-column-gap: 1rem;
    grid-template-columns: repeat(12, 1fr);
    padding: 1rem;
}
@media only screen and (min-width: 600px) {
    .cocktail-list {
        grid-template-columns: repeat(2, 1fr);
    }
}
@media only screen and (min-width: 1200px) {
    .cocktail-list {
        grid-template-columns: repeat(3, 1fr);
    }
}
@media only screen and (min-width: 1800px) {
    .cocktail-list {
        grid-template-columns: repeat(4, 1fr);
    }
}

.cocktail-info {
    grid-column: 1/8;
}
.cocktail-name {
    font-family: var(--font-sec);
    font-size: 1.5rem;
    margin-bottom: 0.3rem;
    padding-bottom: 0.3rem;
    border-bottom: 10px solid var(--c-gray);
}
.ingredient-list {
}
.cocktail-glass {
    /*background-color: var(--c-gray-l);*/
    grid-column: 8/13;
    align-self: end;
    
}
.cocktail-glass img {
    width: 80%;
    padding: 0.5rem;
    float: right;
}

.cocktail-glass:hover {
	-webkit-animation-name: wiggle;
	-webkit-animation-duration: 0.9s;
	-webkit-transform-origin:50% 50%;
	-webkit-animation-iteration-count: 1;
    -webkit-animation-timing-function: linear;
}
@-webkit-keyframes wiggle {
	0% { -webkit-transform: translate(2px, 1px) rotate(0deg); }
	10% { -webkit-transform: translate(-1px, -2px) rotate(-1deg); }
	20% { -webkit-transform: translate(-3px, 0px) rotate(1deg); }
	30% { -webkit-transform: translate(0px, 2px) rotate(0deg); }
	40% { -webkit-transform: translate(1px, -1px) rotate(3deg); }
	50% { -webkit-transform: translate(-1px, 2px) rotate(-3deg); }
	60% { -webkit-transform: translate(-3px, 1px) rotate(0deg); }
	70% { -webkit-transform: translate(2px, 1px) rotate(-1deg); }
	80% { -webkit-transform: translate(-1px, -1px) rotate(1deg); }
	90% { -webkit-transform: translate(2px, 2px) rotate(0deg); }
	100% { -webkit-transform: translate(1px, -2px) rotate(-1deg); }
}
```

$\vdots$

``` {#code:css-media-queries .html startFrom="75" language="HTML" linerange="75-89" caption="CSS - Media-Queries" label="code:css-media-queries"}
@import url('https://fonts.googleapis.com/css?family=Inconsolata|Oswald|Raleway');

:root {
    --font-sec: 'Raleway', sans-serif;
    --font-prim: 'Oswald', sans-serif;
    --font-mono: 'Inconsolata', monospace;
    --c-white: #FEFEFE;
    --c-gray-l: #EEE;
    --c-gray: #555;
    --c-gray-d: #333;
}

div.site:not(:target) {
    display: none;
}
div.site:target {
    display: block;
}

body {
    font-family: var(--font-prim);
    padding: 2rem;
    background-color: var(--c-white);
    color: var(--c-gray-d);
    font-size: 16px;
}

h1 {
    margin: 1rem 0;
    font-family: 'Raleway', sans-serif;
}

small, p {
    font-family: var(--font-mono);
}
small.menge {
    padding-left: .4rem;
}

.menu {
    margin-top: 1rem;
}

.menu > a {
    padding: 0 1rem;
    background-color: var(--c-gray-l);
    color: var(--c-gray-d);
    margin-right: 1rem;
    text-decoration: none;
    text-transform: uppercase;
}

.menu > a:hover, .menu > a.active {
    background-color: var(--c-gray-d);
    color: var(--c-gray-l);
}

ul {
    list-style: none;
    margin: 0;
    padding: 0;
}
.cocktail-list {
    display: grid;
    grid-template-columns: repeat(1, 1fr);
    grid-gap: 1rem;
}
.single-cocktail {
    border: 3px solid var(--c-gray-l);
    display: grid;
    grid-column-gap: 1rem;
    grid-template-columns: repeat(12, 1fr);
    padding: 1rem;
}
@media only screen and (min-width: 600px) {
    .cocktail-list {
        grid-template-columns: repeat(2, 1fr);
    }
}
@media only screen and (min-width: 1200px) {
    .cocktail-list {
        grid-template-columns: repeat(3, 1fr);
    }
}
@media only screen and (min-width: 1800px) {
    .cocktail-list {
        grid-template-columns: repeat(4, 1fr);
    }
}

.cocktail-info {
    grid-column: 1/8;
}
.cocktail-name {
    font-family: var(--font-sec);
    font-size: 1.5rem;
    margin-bottom: 0.3rem;
    padding-bottom: 0.3rem;
    border-bottom: 10px solid var(--c-gray);
}
.ingredient-list {
}
.cocktail-glass {
    /*background-color: var(--c-gray-l);*/
    grid-column: 8/13;
    align-self: end;
    
}
.cocktail-glass img {
    width: 80%;
    padding: 0.5rem;
    float: right;
}

.cocktail-glass:hover {
	-webkit-animation-name: wiggle;
	-webkit-animation-duration: 0.9s;
	-webkit-transform-origin:50% 50%;
	-webkit-animation-iteration-count: 1;
    -webkit-animation-timing-function: linear;
}
@-webkit-keyframes wiggle {
	0% { -webkit-transform: translate(2px, 1px) rotate(0deg); }
	10% { -webkit-transform: translate(-1px, -2px) rotate(-1deg); }
	20% { -webkit-transform: translate(-3px, 0px) rotate(1deg); }
	30% { -webkit-transform: translate(0px, 2px) rotate(0deg); }
	40% { -webkit-transform: translate(1px, -1px) rotate(3deg); }
	50% { -webkit-transform: translate(-1px, 2px) rotate(-3deg); }
	60% { -webkit-transform: translate(-3px, 1px) rotate(0deg); }
	70% { -webkit-transform: translate(2px, 1px) rotate(-1deg); }
	80% { -webkit-transform: translate(-1px, -1px) rotate(1deg); }
	90% { -webkit-transform: translate(2px, 2px) rotate(0deg); }
	100% { -webkit-transform: translate(1px, -2px) rotate(-1deg); }
}
```

Zum Ende der Datei definieren wir die Bewegungs-Animation der
Glas-Bilder, die aktiviert wird, wenn der Mauszeiger über einem Bild
verharrt (`:hover`).

``` {#code:css-menulinks .html startFrom="115" language="HTML" linerange="115-121" caption="CSS - Menü-Links" label="code:css-menulinks"}
@import url('https://fonts.googleapis.com/css?family=Inconsolata|Oswald|Raleway');

:root {
    --font-sec: 'Raleway', sans-serif;
    --font-prim: 'Oswald', sans-serif;
    --font-mono: 'Inconsolata', monospace;
    --c-white: #FEFEFE;
    --c-gray-l: #EEE;
    --c-gray: #555;
    --c-gray-d: #333;
}

div.site:not(:target) {
    display: none;
}
div.site:target {
    display: block;
}

body {
    font-family: var(--font-prim);
    padding: 2rem;
    background-color: var(--c-white);
    color: var(--c-gray-d);
    font-size: 16px;
}

h1 {
    margin: 1rem 0;
    font-family: 'Raleway', sans-serif;
}

small, p {
    font-family: var(--font-mono);
}
small.menge {
    padding-left: .4rem;
}

.menu {
    margin-top: 1rem;
}

.menu > a {
    padding: 0 1rem;
    background-color: var(--c-gray-l);
    color: var(--c-gray-d);
    margin-right: 1rem;
    text-decoration: none;
    text-transform: uppercase;
}

.menu > a:hover, .menu > a.active {
    background-color: var(--c-gray-d);
    color: var(--c-gray-l);
}

ul {
    list-style: none;
    margin: 0;
    padding: 0;
}
.cocktail-list {
    display: grid;
    grid-template-columns: repeat(1, 1fr);
    grid-gap: 1rem;
}
.single-cocktail {
    border: 3px solid var(--c-gray-l);
    display: grid;
    grid-column-gap: 1rem;
    grid-template-columns: repeat(12, 1fr);
    padding: 1rem;
}
@media only screen and (min-width: 600px) {
    .cocktail-list {
        grid-template-columns: repeat(2, 1fr);
    }
}
@media only screen and (min-width: 1200px) {
    .cocktail-list {
        grid-template-columns: repeat(3, 1fr);
    }
}
@media only screen and (min-width: 1800px) {
    .cocktail-list {
        grid-template-columns: repeat(4, 1fr);
    }
}

.cocktail-info {
    grid-column: 1/8;
}
.cocktail-name {
    font-family: var(--font-sec);
    font-size: 1.5rem;
    margin-bottom: 0.3rem;
    padding-bottom: 0.3rem;
    border-bottom: 10px solid var(--c-gray);
}
.ingredient-list {
}
.cocktail-glass {
    /*background-color: var(--c-gray-l);*/
    grid-column: 8/13;
    align-self: end;
    
}
.cocktail-glass img {
    width: 80%;
    padding: 0.5rem;
    float: right;
}

.cocktail-glass:hover {
	-webkit-animation-name: wiggle;
	-webkit-animation-duration: 0.9s;
	-webkit-transform-origin:50% 50%;
	-webkit-animation-iteration-count: 1;
    -webkit-animation-timing-function: linear;
}
@-webkit-keyframes wiggle {
	0% { -webkit-transform: translate(2px, 1px) rotate(0deg); }
	10% { -webkit-transform: translate(-1px, -2px) rotate(-1deg); }
	20% { -webkit-transform: translate(-3px, 0px) rotate(1deg); }
	30% { -webkit-transform: translate(0px, 2px) rotate(0deg); }
	40% { -webkit-transform: translate(1px, -1px) rotate(3deg); }
	50% { -webkit-transform: translate(-1px, 2px) rotate(-3deg); }
	60% { -webkit-transform: translate(-3px, 1px) rotate(0deg); }
	70% { -webkit-transform: translate(2px, 1px) rotate(-1deg); }
	80% { -webkit-transform: translate(-1px, -1px) rotate(1deg); }
	90% { -webkit-transform: translate(2px, 2px) rotate(0deg); }
	100% { -webkit-transform: translate(1px, -2px) rotate(-1deg); }
}
```

Weitere Dateien {#section:weiteredateien}
---------------

Abzüglich der bisher beschriebenen Dateien bleiben uns noch ein paar
Dateien übrig, wie aus dem nachfolgenden reduzierten Datei-Baum
erkennbar wird.

Wie in Kapitel [2.2](#section:schema){reference-type="ref"
reference="section:schema"} (Codeblock
[\[code:stylesheet-head\]](#code:stylesheet-head){reference-type="ref"
reference="code:stylesheet-head"}) bereits erwähnt, handelt es sich bei
`js/script.js` derzeit um eine leere Datei. Sie ist dafür gedacht, um
`javascript`-Skripte in die Website einzubinden und so zum Beispiel
komplexere Animationen zu ermöglichen.

Im Ordner `/img` befinden sich die `.svg`-Dateien der Cocktail-Gläser,
die in Codeblock
[\[code:stylesheet-body-site-cocktails-glas\]](#code:stylesheet-body-site-cocktails-glas){reference-type="ref"
reference="code:stylesheet-body-site-cocktails-glas"} genutzt werden.

`index.html` ist die Website-Datei, die durch die `XSL` Transformation
der Datenbank und des Stylesheets generiert wird. Sie ist die
Ausgabe-Datei, in der die generierte Cocktail-Liste dargestellt wird.

Bei der Datei `dokumentation.pdf` handelt es sich um diese
Dokumentation. Sie wird aus den Dateien in `/docs` generiert.

Schluss-Erklärung und Ausblick {#chap:Schluss-Erklärung und Ausblick}
==============================

Wie in [2.5](#section:weiteredateien){reference-type="ref"
reference="section:weiteredateien"} beschrieben, wird aus der Datenbank
`datenbank.xml` und dem Stylesheet `stylesheet.xsl` mithilfe der `XSL`
Transformation die Datei `index.html` generiert.

Die Transformation lässt sich beispielsweise mit dem Programm `xsltproc`
([Dokumentation unter
xmlsoft.org/XSLT/xsltproc.html](http://xmlsoft.org/XSLT/xsltproc.html))
über die Kommandozeile vornehmen.

Befindet man sich mit der Kommandozeile im Wurzelverzeichnis dieses
Projektes, ist der Transformations-Befehl wiefolgt:

``` {.bash language="bash" caption="\\texttt{XSL} Transformation"}
xsltproc -o index.html stylesheet.xsl datenbank.xml
```

Zum Abschluss dieses Projektes möchte ich einen Ausblick geben über
mögliche Erweiterungen dieses Projektes.

Die Erweiterung der Datenbank um weitere Cocktails liegt auf der Hand.
Zur Veranschaulichung der eingebauten Funktionalitäten befinden sich
momentan zwölf Cocktail-Einträge und die dafür nötigen Zutaten in der
Datenbank. Über eine Automatisierung ließen sich entsprechend auch
größere Mengen an Cocktail-Rezepten in der Datenbank einpflegen.

Eine Rechnung, die man in einem weiteren Projekt einbauen könnte, wäre
ein Alkohol-Messer. Wenn man die Zutaten-Einträge in der Datenbank um
den Wert des Alkohol-Gehaltes erweitert, so ließe sich aus der
Gesamtmenge der Flüssigkeit innerhalb eines Cocktails und den
entsprechenden Alkohol-Werten der Gesamt-Alkohol eines Cocktails
errechnen.
