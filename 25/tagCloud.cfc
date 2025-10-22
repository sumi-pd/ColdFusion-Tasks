<cfcomponent displayname="TagCloud">

    <cffunction name="init" access="public" returntype="any">
        <cfreturn this>
    </cffunction>

    <cffunction name="processText" access="public" returntype="struct">
        <cfargument name="text" type="string" required="true">
        <cfset var wordStruct = {}>
        <cfset var cleanedText = rereplace(arguments.text, "[^\w\s]", "", "all")>
        <cfset var words = listToArray(cleanedText, " ")>
        <cfloop array="#words#" index="w">
            <cfif len(trim(w))>
                <cfset wordStruct[trim(w)] = structKeyExists(wordStruct, trim(w)) ? wordStruct[trim(w)] + 1 : 1>
            </cfif>
        </cfloop>
        <cfreturn wordStruct>
    </cffunction>

    <cffunction name="getWordStats" access="public" returntype="query">
        <cfargument name="datasource" type="string" required="true">
        <cfquery name="getWords" datasource="#arguments.datasource#">
            SELECT LOWER(TRIM(word)) AS word
            FROM words
        </cfquery>
        <cfset var wordCounts = {}>

        <cfloop query="getWords">
            <cfset var w = getWords.word>
            <cfif len(w) GTE 3 AND NOT REFind("^[0-9]+$", w)>
                <cfset wordCounts[w] = structKeyExists(wordCounts, w) ? wordCounts[w] + 1 : 1>
            </cfif>
        </cfloop>

        <cfset var wordArray = []>
        <cfloop collection="#wordCounts#" item="k">
            <cfset arrayAppend(wordArray, {
                word = k,
                count = wordCounts[k],
                length = len(k)
            })>
        </cfloop>

        <cfset arraySort(wordArray, function(a, b) {
            if (a.count NEQ b.count) return (b.count - a.count);
            if (a.length NEQ b.length) return (b.length - a.length);
            return compare(a.word, b.word);
        })>

        <cfset var result = queryNew("word,count,length", "varchar,Integer,Integer")>
        <cfloop array="#wordArray#" index="row">
            <cfset queryAddRow(result)>
            <cfset querySetCell(result, "word", row.word)>
            <cfset querySetCell(result, "count", row.count)>
            <cfset querySetCell(result, "length", row.length)>
        </cfloop>

        <cfreturn result>
    </cffunction>

</cfcomponent>