<cfcomponent displayname="EmploymentFormHandler" >

  <cfset uploadBasePath = expandPath("./uploads/")>

  <cfif NOT directoryExists(uploadBasePath)>
      <cfdirectory action="create" directory="#uploadBasePath#">
  </cfif>

  <cfif structKeyExists(form, "resume") AND len(form.resume)>
      <cffile 
          action="upload" 
          destination="#uploadBasePath#" 
          filefield="resume" 
          nameconflict="makeunique">
      <cfset arguments.resume = cffile.serverFile>
  </cfif>

  <cffunction name="saveFormData" access="remote" returntype="void" output="false">
    <cfargument name="firstName" type="string" required="true">
    <cfargument name="lastName" type="string" required="true">
    <cfargument name="email" type="string" required="true">
    <cfargument name="phone" type="string" required="true">
    <cfargument name="position" type="string" required="true">
    <cfargument name="relocate" type="string" required="true">
    <cfargument name="startDate" type="string" required="true">
    <cfargument name="portfolio" type="string" required="false">
    <cfargument name="resume" type="string" required="false">
    <cfargument name="salaryDollars" type="string" required="true">
    <cfargument name="salaryCents" type="string" required="true">
    
    <cfquery datasource="cftest" name="insertFormData">
      INSERT INTO employment_applications
        (first_name, last_name, email, phone, position, relocate, start_date, portfolio, resume, salary_dollars, salary_cents)
      VALUES
        (<cfqueryparam value="#arguments.firstName#" cfsqltype="cf_sql_varchar">,
         <cfqueryparam value="#arguments.lastName#" cfsqltype="cf_sql_varchar">,
         <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">,
         <cfqueryparam value="#arguments.phone#" cfsqltype="cf_sql_varchar">,
         <cfqueryparam value="#arguments.position#" cfsqltype="cf_sql_varchar">,
         <cfqueryparam value="#arguments.relocate#" cfsqltype="cf_sql_varchar">,
         <cfqueryparam value="#arguments.startDate#" cfsqltype="cf_sql_date">,
         <cfqueryparam value="#arguments.portfolio#" cfsqltype="cf_sql_varchar">,
         <cfqueryparam value="#arguments.resume#" cfsqltype="cf_sql_varchar">,
         <cfqueryparam value="#arguments.salaryDollars#" cfsqltype="cf_sql_numeric">,
         <cfqueryparam value="#arguments.salaryCents#" cfsqltype="cf_sql_numeric">)
    </cfquery>
    
    <cfreturn "Form submitted successfully!">
  </cffunction>

</cfcomponent>
