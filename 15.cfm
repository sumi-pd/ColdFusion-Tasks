<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Q15</title>
</head>
<body>

    <cfset numbers1 = [1, 2]>
    <cfset numbers2 = [1, 2, 3]>
    <cfset numbers3 = [1, 2, 3, 4]>

    <cfset argsStruct1 = { args = numbers1 }>

    <cfinvoke component="multiply" method="multiply" argumentCollection="#argsStruct1#" returnVariable="result1" />

    <cfobject component="multiply" name="multiplyObj" />
    <cfset result2 = multiplyObj.multiply(args = numbers2) />

    <cfset multiplyInstance = createObject("component", "multiply")>
    <cfset result3 = multiplyInstance.multiply(args = numbers3) />


    <cfoutput>
        <h3>Using cfinvoke (1, 2): #result1#</h3>
        <h3>Using cfobject (1, 2, 3): #result2#</h3>
        <h3>Using createObject (1, 2, 3, 4): #result3#</h3>
    </cfoutput>

</body>
</html>