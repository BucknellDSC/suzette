<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <xsl:output method="xml" encoding="utf-8" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
<!--    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>-->
    
<xsl:template match="tei:teiHeader">
    <teiHeader>
        <fileDesc>
            <titleStmt>
                <title type="main">Suzette: a Digital Edition</title>
                <respStmt>
                    <persName>John Westbrook</persName>
                    <orgName>Bucknell University</orgName>
                    <resp>Editor</resp>
                </respStmt>
                <respStmt>
                    <persName>Diane Jakacki</persName>
                    <orgName>Bucknell University</orgName>
                    <resp>Project Manager</resp>
                </respStmt>
                <respStmt>
                    <persName>Annie Girton</persName>
                    <orgName>Bucknell University</orgName>
                    <resp>Research Assistant and Encoder, 2018-2020</resp>
                </respStmt>
                <respStmt>
                    <persName>Sarah Haber</persName>
                    <orgName>Bucknell University</orgName>
                    <resp>Research Assistant and Encoder, 2020-Present</resp>
                </respStmt>
                <respStmt>
                    <persName>Rebecca Heintzelman</persName>
                    <orgName>Bucknell University</orgName>
                    <resp>Research Assistant and Encoder, 2020-Present</resp>
                </respStmt>
                <respStmt>
                    <persName>Juliya Harnood</persName>
                    <orgName>Bucknell University</orgName>
                    <resp>Research Assistant and Encoder, 2021-Present</resp>
                </respStmt>
            </titleStmt>
            <publicationStmt>
                <distributor>Bucknell University</distributor>
                <pubPlace>
                    <address>
                        <addrLine>One Dent Drive</addrLine>
                        <addrLine>Lewisburg, PA 17837</addrLine>
                    </address>
                </pubPlace>
                <availability>
                    <licence>Attribution-NonCommercial-ShareAlike 4.0 International</licence>
                </availability>
            </publicationStmt>
            <sourceDesc>
                <biblStruct>
                    <monogr>
                        <title>Suzette: Livre de Lecture Courante à l’Usage des Jeunes Filles. Morale—Leçon de choses, Economie Domestique – Ménage – Cuisine – Couture</title>
                        <author>Robert Halt</author>
                        <textLang>French</textLang>
                        <imprint>
                            <date>1889</date>
                            <distributor>Libraire Classique Paul Delaplane</distributor>
                            <pubPlace>Paris, France</pubPlace>
                        </imprint>
                    </monogr>
                </biblStruct>
            </sourceDesc>
        </fileDesc>
    </teiHeader>
        <xsl:apply-templates/>
    </xsl:template>





<!--<xsl:template match="tei:div[@type='chapter']">
        <xsl:apply-templates/>
</xsl:template>
    
    <xsl:template match="tei:div[@type='recit']">
            <xsl:apply-templates/>        
    </xsl:template>
    
    
    <xsl:template match="tei:div[@type='questionnaire']"/>

 
 <xsl:template match="tei:div[@type='exercices']"/>
        
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>-->
    

</xsl:stylesheet>
