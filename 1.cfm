<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Q1</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

    <form action="" method="post" class="form-box">
        <input type="text" name="text" id="text" placeholder="Enter a number 1-5"><br>
        <input type="submit" name="submit" value="Submit">
    </form>
    <cfif structKeyExists(form, "submit")>
        <cfif form.text eq "1" or form.text eq "2">
            <p>1 and 2 is OK</p>
        <cfelseif form.text eq "3">
            <p>3 is fair</p>
        <cfelseif form.text eq "4">
            <p>4 is good</p>
        <cfelseif form.text eq "5">
            <p>5 is very good</p>
        <cfelse>
            <p>Please enter a number between 1 to 5</p>
        </cfif>
    </cfif>

</body>
</html>