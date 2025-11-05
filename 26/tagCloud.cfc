<cfcomponent output="false">

    <cffunction name="init" access="public" returntype="any" output="false">
        <cfreturn this>
    </cffunction>

    <cffunction name="saveWords" access="public" returntype="struct" output="false">
        <cfargument name="text" type="string" required="true">

        <cfset var result = {status=false, message=""}>
        <cfset var words = []>
        <cfset var word = "">
        <cfset words = listToArray(reReplace(arguments.text, "[^A-Za-z0-9 ]", "", "all"), " ")>

        <cftry>
            <cfloop array="#words#" index="word">
                <cfif len(trim(word))>
                    <cfquery datasource="cftest">
                        INSERT INTO words (word)
                        VALUES (<cfqueryparam cfsqltype="cf_sql_varchar" value="#lcase(trim(word))#">)
                    </cfquery>
                </cfif>
            </cfloop>
            <cfset result.message = "Words successfully saved.">
        <cfcatch type="database">
            <cfset result.message = "Database error: #cfcatch.message#">
        </cfcatch>
        </cftry>

        <cfreturn result>
    </cffunction>

</cfcomponent>