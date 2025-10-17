<cfcomponent displayname="Multiply Component">

    <cffunction name="multiply" access="public" returntype="numeric" output="false">
        <cfargument name="args" type="array" required="true" />

        <cfset var result = 1 />

        <cfloop array="#arguments.args#" index="num">
            <cfset result *= num />
        </cfloop>

        <cfreturn result />
    </cffunction>

</cfcomponent>