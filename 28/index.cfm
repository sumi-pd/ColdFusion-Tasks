<!DOCTYPE html>
<html>
    <head>
        <title> Login Page</title>
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    </head>
    <body>
        <div class="login-container">
            <h2>Login</h2>
            <form action="" method="POST" name="formSubmit" class="formClass">
                <input type="text" placeholder="Username" name="username" required>
                <input type="password" placeholder="Password" name="password" required>
                <button type="submit" name="submit">Login</button>
            </form>
        </div>

        <p class="formClass">
            <cfif structKeyExists(form, "submit")>
            <cfset username = trim(form.username)>
            <cfset password = trim(form.password)>

            <cfset loginCheck = createObject("component", "dbOperations")>
            <cfset userDetails = loginCheck.checkLoginDeails( username = username , password = password)>

            <cfif userDetails.status EQ "success">
                <cfset session.userId = userDetails.userId>
                <cfset session.username = username>
                <cfset session.role = userDetails.role>

                <cfif session.role === 'admin' OR session.role === 'editor'>
                    <cflocation url="admin.cfm">
                <cfelse>
                    <cflocation url="user.cfm">
                </cfif>
            <cfelse>
                <cfoutput>
                    <p style="color:red;">#userDetails.message#</p>
                </cfoutput>
            </cfif>
        </cfif>
        </p>
    </body>
</html>