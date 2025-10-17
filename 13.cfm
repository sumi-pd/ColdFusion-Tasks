<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Q13</title>
  <link rel="stylesheet" href="assets/style.css">
</head>
<body>

    <cfset textContent = "the quick brown fox jumps over the lazy dog">

    <form action="" method="post" class="form-box">
        <label for="keyword">Enter Keyword: </label>
        <input type="text" name="keyword" id="keyword">
        <input type="submit" value="Submit">
    </form>

    <cfif structKeyExists(form, "keyword") AND form.keyword neq "">
        <cfset keyword = form.keyword>
        <cfset count = 0>
        <cfset startPos = 1>
        
        <cfloop condition="startPos GT 0">
            <cfset startPos = REFindNoCase(keyword, textContent, startPos)>
            <cfif startPos GT 0>
                <cfset count = count + 1>
                <cfset startPos = startPos + 1>
            </cfif>
        </cfloop>
        
        <cfoutput>
            <p>Found the keyword "<strong>#keyword#</strong>" in #count# time(s) in the text: "#textContent#"</p>
        </cfoutput>
    </cfif>
</body>
</html>