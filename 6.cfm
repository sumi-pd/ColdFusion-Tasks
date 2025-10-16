<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Q6</title>
  <link rel="stylesheet" href="assets/style.css">
</head>
<body>

<form action="" method="post" class="form-box">
    <input type="text" name="text1" id="text1">
    <input type="text" name="text2" id="text2">
    <input type="submit" name="submit" value="Submit">
</form>

<cfif structKeyExists(form, "submit")>
    <cfset myStructure = structNew()>
    <cfset myStructure[form.text1] = form.text2>
    <cfdump var="#myStructure#">
</cfif>
</body>
</html>
