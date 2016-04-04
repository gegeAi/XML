<?xml version="1.0" encoding="UTF-8"?>


<!-- New document created with EditiX at Mon Apr 04 15:28:46 CEST 2016 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>
	
	<xsl:template match="/">
	<html>
		<head>
			<title>
			<xsl:value-of select="//titre"/>
			<xsl:text>, de </xsl:text>
			<xsl:value-of select="//infos/auteur"/>
			</title>
		</head>
		<body>
			
			
<xsl:apply-templates/>
		</body>
	</html>
	</xsl:template>
	
	<xsl:template  name = "titre" match="//titre">
		<h1 style="text-align:center; color:blue;">
		<xsl:apply-templates/>
		</h1>
	</xsl:template>
	
	<xsl:template name = "auteur" match="//infos/auteur">
		<h2 style="text-align:center; font-style: italic; color:black">
		<xsl:apply-templates/>
		</h2>
		<br/>
	</xsl:template>
	
	<xsl:template name = "infos" match="//infos">
			
<xsl:apply-templates select="//titre"/>
			
<xsl:apply-templates select="//infos/auteur"/>
		<blockquote style="color:darkgreen" > 
			<xsl:text>But du TP du </xsl:text>
			<xsl:apply-templates select="//infos/date"/>
			<xsl:text> : </xsl:text>
			<xsl:apply-templates select="//infos/but"/>
			<br/>
			<xsl:text>Auteurs : </xsl:text>
			<xsl:apply-templates select="//infos/mise_en_forme_par/*[position()=1]"/>
			<xsl:text> et </xsl:text>
			<xsl:apply-templates select="//infos/mise_en_forme_par/*[position()=2]"/>
			<xsl:text> ( </xsl:text>
			<xsl:apply-templates select="//infos/mise_en_forme_par/*[position()=2]/@NoBinome"/>
			<xsl:text> ) </xsl:text>
			<br/>
			<xsl:text>Email du responsable : </xsl:text>
			<xsl:apply-templates select="//infos/email"/>
		</blockquote>
	</xsl:template>
	
	<xsl:template match="image">
		<div align="center">
		<img>
			<xsl:attribute name="src">
				<xsl:value-of select="@chemin"/>
			</xsl:attribute>
		</img>
		</div>
	</xsl:template>
	
	<xsl:template match="//paragr">
		<p >
			<div>
				<xsl:apply-templates select="phrase[attribute::langue='fr']"/>
			</div>
			<div style="font-style:italic; color:brown" >
				<xsl:apply-templates select="phrase[attribute::langue='hu']"/>
			</div>
		</p>
	</xsl:template>
	<xsl:template match="//paragr[attribute::type='dialogue']">
		<table border="3" width="400" align="right" >
		<xsl:for-each select="phrase[@langue='hu']">
			<tr>
				<td >
					<img src="images/{@locuteur}.png"/>
				</td>
							
				<td  style="font-style:italic; color:brown">
					<xsl:apply-templates/>
				</td>
			
				
			</tr>
		</xsl:for-each>
		</table>
		<table border="3" width="400 ">
		<xsl:for-each select="phrase[@langue='fr']">
			<tr>
				<td >
					<img src="images/{@locuteur}.png"/>
				</td>
							
				<td >
					<xsl:apply-templates/>
				</td>
			
				
			</tr>
		</xsl:for-each>
		</table>
	</xsl:template>
	
		
	
</xsl:stylesheet>


