<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Q9</title>
  <link rel="stylesheet" href="assets/style.css">
</head>
<body>

    <form action="" method="post" class="form-box">
        <input type="text" name="text1" id="text1" required="yes">
        <input type="text" name="text2" id="text2" required="yes">
        <input type="submit" name="submit" value="Submit">
    </form>

    <cfif NOT structKeyExists(session, "myStructure")>
        <cfset session.myStructure = structNew()>
    </cfif>

    <cfif structKeyExists(form, "submit")>
        <cfif len(trim(form.text1)) AND len(trim(form.text2))>
            <cfif structKeyExists(session.myStructure, form.text1)>
                <cfoutput> #form.text1# is already present. Cannot add again</cfoutput>
            <cfelse>
                <cfset session.myStructure[form.text1] = form.text2>
            </cfif>
        </cfif>
    </cfif>

    <cfif structCount(session.myStructure)>
        <cfdump var="#session.myStructure#" label="Structure">
    </cfif>

</body>
</html>