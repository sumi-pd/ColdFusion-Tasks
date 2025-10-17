<!DOCTYPE html>
<html>
<head>
    <title>Q19</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>

    <form method="post" class="form-box">
        <input type="submit" name="submitBtn" value="Click" />
    </form>

    <cfscript>
        currentCount = 0;
        if (structKeyExists(form, "submitBtn")) {
            if (structKeyExists(cookie, "VisitsCounter")) {
                currentCount = cookie.VisitsCounter + 1;
            } else {
                currentCount = 1;
            }
            cookie.VisitsCounter = currentCount;
        }
        else if (structKeyExists(cookie, "VisitsCounter")) {
            currentCount = cookie.VisitsCounter;
        }
    </cfscript>

    <cfif currentCount GT 0>
        <cfoutput>
            <p>You have submitted this form <strong>#currentCount#</strong> times.</p>
        </cfoutput>
    </cfif>

</body>
</html>