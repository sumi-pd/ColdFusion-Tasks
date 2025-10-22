
<form method="post" action="index.cfm">
    <label>Enter Paragraph:</label><br>
    <textarea name="paragraph" rows="5" cols="50"></textarea><br><br>
    <input type="submit" name="submit" value="Save Words">
</form>

<cfif structKeyExists(form, "submit")>
    <cfset tagCloud = new tagCloud()>
    <cfset wordsStruct = tagCloud.processText(form.paragraph)>
    <cfloop collection="#wordsStruct#" item="word">
        <cfquery datasource="cftest">
            INSERT INTO words (word)
            VALUES (<cfqueryparam value="#trim(word)#" cfsqltype="cf_sql_varchar">)
        </cfquery>
    </cfloop>

    <cfoutput>
        <p>Words saved successfully!</p>
    </cfoutput>
</cfif>

