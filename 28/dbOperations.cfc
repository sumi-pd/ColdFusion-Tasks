<cfcomponent output="false">
    <cffunction name="checkLoginDeails" access="public" returntype="struct" output="false">
        <cfargument  name="username" type="string" required="true">
        <cfargument  name="password" type="string" required="true">

        <cfset result = {}>

        <cfquery name="checkLogin" datasource="myMSSQLDB">
            SELECT userId, role
            FROM userDetails
            WHERE username = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">
            AND pwd = <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">
        </cfquery>

        <cfif checkLogin.recordCount>
            <cfset result = {
                status = "success",
                userId = checkLogin.userId,
                role = checkLogin.role
            }>
        <cfelse>
            <cfset result = {
                status = "error",
                message = "User not found"
            }>
        </cfif>
        <cfreturn result>
    </cffunction>

    <cffunction  name="getPages" access="public" returntype="any" output="false">
        <cfquery name="getPages" datasource="myMSSQLDB">
            SELECT pageId, pageName, pageDescription
            FROM page
        </cfquery>

        <cfreturn getPages>
    </cffunction >

    <cffunction name="savePages" output="false" access="remote" returntype="string" httpmethod="post" returnFormat="json">
        <cfargument name="title" type="string" required="true">
        <cfargument name="description" type="string" required="true">

        <cfquery datasource="myMSSQLDB" name="insertPage">
            INSERT INTO page (pageName, pageDescription)
            VALUES (
                <cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar">,
                <cfqueryparam value="#arguments.description#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>

        <cfreturn "Page added successfully">
    </cffunction>

    <cffunction name="updatePages" output="false" access="remote" returntype="string" httpmethod="post" returnFormat="json">
        <cfargument name="title" type="string" required="true">
        <cfargument name="description" type="string" required="true">
        <cfargument name="id" type="numeric" required="true">

        <cfquery datasource="myMSSQLDB" name="updatePage">
            UPDATE page
            SET pageName = <cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar">,
                pageDescription = <cfqueryparam value="#arguments.description#" cfsqltype="cf_sql_varchar">
            WHERE pageId = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfreturn "Page Updated successfully">
    </cffunction>

    <cffunction name="deletePage" output="false" access="remote" returntype="string" httpmethod="post" returnFormat="json">
        <cfargument name="id" type="numeric" required="true">

        <cfquery datasource="myMSSQLDB" name="deletePage">
            DELETE FROM page
            WHERE pageId = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfreturn "Page Deleted successfully">
    </cffunction>

    <cffunction  name="selectPage" access="public" returntype="any" output="false">
        <cfargument name="title" type="string" required="true">

        <cfquery name="selectPage" datasource="myMSSQLDB">
            SELECT pageName, pageDescription
            FROM page
            WHERE pageName = <cfqueryparam value="#arguments.title#" cfsqltype="cf_sql_varchar">
        </cfquery>

        <cfreturn selectPage>
    </cffunction >
</cfcomponent>