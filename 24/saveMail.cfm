<cfparam name="form.first_name" default="">
<cfparam name="form.email" default="">

<cfif form.first_name NEQ "" AND form.email NEQ "">
    <cfquery datasource="cftest" name="insertSub">
        INSERT INTO profiles (first_name, email)
        VALUES (
            <cfqueryparam value="#form.first_name#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar">
        )
    </cfquery>

    <cfoutput>
        <p style="color:green;">Subscription successful! Thank you, #form.first_name#.</p>
        <a href="24.cfm">Go Back</a>
    </cfoutput>
<cfelse>
    <cfoutput>
        <p style="color:red;">Please fill in all fields.</p>
        <a href="24.cfm">Go Back</a>
    </cfoutput>
</cfif>