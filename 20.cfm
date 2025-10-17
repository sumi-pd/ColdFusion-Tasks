<!DOCTYPE html>
<html>
<head>
    <title>Q20</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>

<cfset captchaText = "">
    <cfif NOT structKeyExists(session, "generatedCaptcha")>
        <cfset session.generatedCaptcha = "">
    </cfif>

    <cfif structKeyExists(form, "submitBtn")>
        <cfset email = trim(form.email)>
        <cfset enteredCaptcha = trim(form.captchaInput)>
        <cfset errors = []>

        <cfif NOT isValid("email", email)>
            <cfset arrayAppend(errors, "Invalid email address.")>
        </cfif>

        <cfif NOT len(enteredCaptcha)>
            <cfset arrayAppend(errors, "Captcha cannot be empty.")>
        <cfelseif enteredCaptcha NEQ session.generatedCaptcha>
            <cfset arrayAppend(errors, "Captcha entered is incorrect.")>
        </cfif>

        <cfif arrayLen(errors) EQ 0>
            <cfoutput>
                <p style="color: green;">Email Address successfully subscribe our newsletter</p>
            </cfoutput>
            <cfset session.generatedCaptcha = "">
        <cfelse>
            <cfoutput>
                <ul style="color: red;">
                    <cfloop array="#errors#" index="err">
                        <li>#err#</li>
                    </cfloop>
                </ul>
            </cfoutput>
        </cfif>
    </cfif>

<cfif NOT len(session.generatedCaptcha)>
    <cfset session.generatedCaptcha = lCase(hash(createUUID(), "MD5"))>
    <cfset session.generatedCaptcha = left(session.generatedCaptcha, 6)>
</cfif>

<form method="post" class="form-box">
    <label>Email:</label><br>
    <input type="text" name="email" value="<cfif structKeyExists(form, 'email')><cfoutput>#form.email#</cfoutput></cfif>"><br><br>

    <label>Enter Captcha:</label><br>
    <input type="text" name="captchaInput"><br><br>

    <cfimage action="captcha"
             width="200"
             height="50"
             text="#session.generatedCaptcha#"
             difficulty="medium"
             fontSize="24"
             />
    <br><br>
    <input type="submit" name="submitBtn" value="Subscribe">
</form>

</body>
</html>