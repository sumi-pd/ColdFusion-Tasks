<!DOCTYPE html>
<html>
    <head>
        <title> Login Page</title>
        <link rel="stylesheet" type="text/css" href="assets/css/admin.css">
    </head>
    <body>
        <cfif NOT structKeyExists(session, "userId")>
            <cflocation url="index.cfm">
        </cfif>

        <div class="header">
            <div class="welcome">Welcome, 
                <cfoutput> #session.username# </cfoutput>
            </div>
            <div class="actions">
                <a href="pagelist.cfm"> Pages </a>
                <a href="logout.cfm"> Logout</a>
            </div>
            <div style="clear:both;"></div>
        </div>

        <div class="container">
            <div class="card">
                <cfset formattedRole = REReplace(session.role, "^(.)", "\U\1")>
                <h2><cfoutput> #formattedRole# </cfoutput> Dashboard</h2>
                <p>You can manage pages.</p>
            </div>
        </div>
    </body>
</html>