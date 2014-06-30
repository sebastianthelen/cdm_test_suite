<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
	<xsl:output method="text" encoding="UTF-8" indent="yes"/>
	
	<xsl:template match="/">
			<xsl:value-of select="count(//*[local-name(.)='result'])"/>
	</xsl:template>
	

</xsl:stylesheet>