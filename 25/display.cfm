<cfset tagCloud = new tagCloud()>
<cfset result = tagCloud.getWordStats("cftest")>
<cfset minFont = 12>
<cfset maxFont = 36>
<cfset counts = []>
<cfloop query="result">
    <cfset arrayAppend(counts, result.count)>
</cfloop>

<cfset minCount = arrayMin(counts)>
<cfset maxCount = arrayMax(counts)>

<cfloop query="result">
    <cfset count = result.count>
    <cfif maxCount EQ minCount>
        <cfset fontSize = (minFont + maxFont) / 2>
    <cfelse>
        <cfset fontSize = minFont + ((count - minCount) / (maxCount - minCount)) * (maxFont - minFont)>
    </cfif>
    <cfset color = "rgb(" & randRange(0,255) & "," & randRange(0,255) & "," & randRange(0,255) & ")">
    <cfoutput>
        <span style="font-size:#fontSize#px; color:#color#; margin: 5px; display: inline-block;">#result.word#</span>
    </cfoutput>
</cfloop>

