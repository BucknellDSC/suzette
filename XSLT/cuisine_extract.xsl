<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:jc="http://james.blushingbunny.net/ns.html"
    exclude-result-prefixes="xs xd tei jc"
    version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <xsl:text>"Chapter", "Section", "Type", "Subtype", "Key", "Object"</xsl:text>
        <xsl:apply-templates select="//text//div[@type='chapitre']"/>
    </xsl:template>
    
    <xsl:template match="div[@type='chapitre']">
        <xsl:variable name="chapter-n" select="@n"/>
        <xsl:apply-templates select=".//div[@type='récit' or @type='questionnaire' or @type='exercices']">
            <xsl:with-param name="chapter-n" select="$chapter-n"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="div[@type='récit' or @type='questionnaire']">
        <xsl:param name="chapter-n"/>
        <xsl:call-template name="process-div">
            <xsl:with-param name="chapter-n" select="$chapter-n"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="div[@type='exercices']">
        <xsl:param name="chapter-n"/>
        <xsl:apply-templates select="div">
            <xsl:with-param name="chapter-n" select="$chapter-n"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="div[@type='exercices']//div">
        <xsl:param name="chapter-n"/>
        <xsl:call-template name="process-div">
            <xsl:with-param name="chapter-n" select="$chapter-n"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="process-div">
        <xsl:param name="chapter-n"/>
        <xsl:variable name="divType" select="@type"/>
        <xsl:for-each select=".//objectName">
            <xsl:sort select="name()"/>
            <xsl:sort select="."/>
            <xsl:sort select="@type"/>
            <xsl:sort select="@subtype"/>
            <xsl:sort select="@key"/>
            <xsl:value-of select="jc:createCSV(., $divType, $chapter-n)"/>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:function name="jc:createCSV" as="xs:string">
        <xsl:param as="node()" name="node"/>
        <xsl:param as="xs:string" name="divType"/>
        <xsl:param as="xs:string" name="chapter-n"/>
        
        <xsl:variable name="sep">
            <xsl:text>", "</xsl:text>
        </xsl:variable>
        
        <xsl:variable name="terminal">
            <xsl:text>"</xsl:text>
        </xsl:variable>
        
        <xsl:variable name="elementContent">
            <xsl:value-of select="jc:csvEscapeDoubleQuotes($node)" />
        </xsl:variable>
        <xsl:variable name="type">
            <xsl:value-of select="jc:csvEscapeDoubleQuotes($node/@type)" />
        </xsl:variable>
        <xsl:variable name="subtype">
            <xsl:value-of select="jc:csvEscapeDoubleQuotes($node/@subtype)"/>
        </xsl:variable>
        <xsl:variable name="key">
            <xsl:value-of select="jc:csvEscapeDoubleQuotes($node/@key)"/>
        </xsl:variable>
        
        <xsl:variable name="output">
            <xsl:value-of select="$terminal"/>
            <xsl:value-of select="jc:csvEscapeDoubleQuotes($chapter-n), jc:csvEscapeDoubleQuotes($divType), $type, $subtype, $key, $elementContent" separator="{$sep}"/>
            <xsl:value-of select="$terminal"/>
        </xsl:variable>
        
        <xsl:value-of select="concat('&#xA;',normalize-space($output))"/>
    </xsl:function>
    
    <xsl:function name="jc:csvEscapeDoubleQuotes" as="xs:string">
        <xsl:param name="string"/>
        <xsl:value-of select="replace($string, '&quot;', '&quot;&quot;')"/>
    </xsl:function>
</xsl:stylesheet>