<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Q2</title>
  <link rel="stylesheet" href="assets/style.css">
</head>
<body>

<form action="" method="post" class="form-box">
  <input type="text" name="text" id="text" placeholder="Enter a number 1-5">
  <input type="submit" name="submit" value="Submit">
</form>

    <cfif structKeyExists(form, "submit")>
        <cfswitch expression="#form.text#">
            <cfcase value="1">
                <p>1 and 2 is OK</p>
            </cfcase>
            <cfcase value="2">
                <p>1 and 2 is OK</p>
            </cfcase>
            <cfcase value="3">
                <p>3  is fair</p>
            </cfcase>
            <cfcase value="4">
                <p>4 is good</p>
            </cfcase>
            <cfcase value="5">
                <p>5 is very good</p>
            </cfcase>
            <cfdefaultcase>
                <p>Please enter a number between 1 to 5</p>
            </cfdefaultcase>
        </cfswitch>
    </cfif>

</body>
</html>