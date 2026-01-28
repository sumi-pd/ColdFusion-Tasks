<!DOCTYPE html>
<html>
    <head>
        <title>Logout</title>
    </head>
    <body>
        <cfset structClear(session)>
        <cflocation url="index.cfm">
    </body>
</html>