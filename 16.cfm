<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Q16</title>
</head>
<body>
    <cfoutput>
        <cfloop from="1" to="3" index="row">
            <cfloop from="0" to="2" index="col">
                <cfset number = row + (col * 3)>
                #number#&nbsp;&nbsp;&nbsp;
            </cfloop>
            <br>
        </cfloop>
    </cfoutput>
</body>
</html>