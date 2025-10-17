
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Q8</title>
  <link rel="stylesheet" href="assets/style.css">
</head>
<body>

    <form action="" method="post" class="form-box">
        <input type="text" name="text1" id="text1">
        <input type="text" name="text2" id="text2">
        <input type="submit" name="submit" value="Submit">
    </form>

    <cfif NOT structKeyExists(session, "myStructure")>
        <cfset session.myStructure = structNew()>
    </cfif>

    <cfif structKeyExists(form, "submit")>
        <cfif len(trim(form.text1)) AND len(trim(form.text2))>
            <cfset session.myStructure[form.text1] = form.text2>
        </cfif>
    </cfif>

    <cfif structCount(session.myStructure)>
        <cfdump var="#session.myStructure#" label="Structure">
    </cfif>

</body>
</html>