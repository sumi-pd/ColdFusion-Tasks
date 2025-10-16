<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Q3</title>
  <link rel="stylesheet" href="assets/style.css">
</head>
<body>

    <form action="" method="post" class="form-box">
        <label>Enter numbers:</label>
        <input type="text" name="text" id="text" placeholder="Eg: 3,8,9,11,12">
        <input type="submit" name="submit" value="Submit">
    </form>

    <cfif structKeyExists(form, "submit")>
        <cfset text = form.text>
        <cfset numberArray = ListToArray(text, ",")>
        <cfloop array="#numberArray#" index="item">
            <cfset num = trim(item)>
            <cfif not isNumeric(num)>
                <cfcontinue>
            </cfif>
            <cfif num MOD 3 NEQ 0>
                <cfcontinue>
            </cfif>
            <cfoutput>#num#,</cfoutput>
        </cfloop>
    </cfif>

</body>
</html>