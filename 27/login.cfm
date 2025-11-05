<html>
<body>
    <h2>Login</h2>

    <cfif structKeyExists(variables, "errorMsg")>
        <p style="color:red;">#errorMsg#</p>
    </cfif>

    <form method="post" action="login.cfm">
        <label>Username:</label>
        <input type="text" name="username" required><br><br>

        <label>Password:</label>
        <input type="password" name="password" required><br><br>

        <input type="submit" name="submit" value="Login">
    </form>
</body>
</html>

<cfif structKeyExists(form, "submit")>
    <cfset validUsers = {
        "admin" = "12345",
        "user1"  = "abcd",
        "user2"  = "efgh"
    }>
    <cfif structKeyExists(validUsers, form.username) AND validUsers[form.username] EQ form.password>
        <cfset session.isLoggedIn = true>
        <cfset session.username = form.username>
        <cflocation url="welcome.cfm" addtoken="false">
    <cfelse>
        <cfset errorMsg = "Invalid username or password. Please try again.">
    </cfif>
</cfif>
