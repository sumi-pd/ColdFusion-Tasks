<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Q11</title>
</head>
<body>

    <cfscript>
        function multiply(required numeric a, required numeric b) {
            var result = a * b;
            for (i = 3; i <= arrayLen(arguments); i++) {
                result *= arguments[i];
            }
            return result;
        }
    </cfscript>

    <cfset res = multiply(1, 2)>
    <cfdump var="#res#">

    <cfset res = multiply(1, 2, 3)>
    <cfdump var="#res#">

    <cfset res = multiply(1, 2, 3, 4, 5)>
    <cfdump var="#res#">

</body>
</html>