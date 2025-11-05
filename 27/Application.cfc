<cfcomponent>
    <cfset this.name = "LoginApp">
    <cfset this.sessionManagement = true>
    <cfset this.sessionTimeout = createTimeSpan(0, 0, 30, 0)>

    <cffunction name="onRequestStart" access="public" returntype="boolean">
        <cfargument name="targetPage" type="string" required="true">
        <cfset var publicPages = "login.cfm,logout.cfm">

        <cfif NOT structKeyExists(session, "isLoggedIn") 
            OR session.isLoggedIn NEQ true>
            
            <cfif listFindNoCase(publicPages, listLast(arguments.targetPage, "/")) EQ 0>
                <cflocation url="login.cfm" addtoken="false">
                <cfreturn false>
            </cfif>
        </cfif>

        <cfreturn true>
    </cffunction>
</cfcomponent>