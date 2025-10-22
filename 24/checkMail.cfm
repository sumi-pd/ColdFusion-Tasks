<cfsetting showdebugoutput="no">
<cfsetting enablecfoutputonly="yes">

<cfparam name="form.email" default="">

<cfquery name="checkEmail" datasource="cftest">
    SELECT email 
    FROM profiles 
    WHERE TRIM(email) = <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar">
</cfquery>

<cfoutput>
    <cfif checkEmail.recordCount GT 0>
        exists
    <cfelse>
        notfound
    </cfif>
</cfoutput>