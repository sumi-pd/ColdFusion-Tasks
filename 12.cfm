<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Q12</title>
  <link rel="stylesheet" href="assets/style.css">
</head>
<body>

<cfset outputResult = "">
<form action="" method="post" class="form-box">
    <label for="id">Enter ID (1 to 10):</label><br>
    <input type="number" name="userRow" id="userRow" min="1" max="10" required="yes"><br><br>
    <input type="submit" name="submit" value="Submit">
</form>

<cfif structKeyExists(form, "submit") AND structKeyExists(form, "userRow") AND isNumeric(form.userRow)>
    <cfset rowNumber = val(form.userRow)>
    <cfquery name="getUsers" datasource="cftest">
        SELECT firstname, lastname
        FROM names
    </cfquery>

    <cfoutput query="getUsers">
        #firstname# #lastname#<br>
    </cfoutput>
    <br>
    <cfif rowNumber LTE getUsers.recordCount AND rowNumber GTE 1>
        <cfset nthFirstName = getUsers["firstname"][rowNumber]>
        <cfoutput>Nth Row Firstname (Row #rowNumber#):#nthFirstName#</cfoutput>
    <cfelse>
        <cfoutput>Invalid row number. Only #getUsers.recordCount# records found.</cfoutput>
    </cfif>
</cfif>

</body>
</html>