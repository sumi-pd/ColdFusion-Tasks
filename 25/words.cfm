<cfset tagCloud = new tagCloud()>
<cfset result = tagCloud.getWordStats("cftest")>

<cfoutput query="result">
    - #word# (#count#)<br>
</cfoutput>