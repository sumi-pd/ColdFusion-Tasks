<!DOCTYPE html>
<html>
<head>
    <title>Q17</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>

<h2>Enter a Number</h2>
<form method="post" onsubmit="return validateForm();" class="form-box">
    <input type="text" name="userNumber" id="numberInput" />
    <input type="submit" value="Submit" />
</form>

<cfif structKeyExists(form, "userNumber") and isNumeric(form.userNumber)>
    <h3>Output:</h3>
    <cfset maxNumber = int(form.userNumber)>
    <cfoutput>
        <p>
        <cfloop from="1" to="#maxNumber#" index="i">
            <span class="#i mod 2 eq 0 ? 'even' : 'odd'#">#i#</span>
            &nbsp;&nbsp;
        </cfloop>
        </p>
    </cfoutput>
</cfif>

<script>
    function validateForm() {
        var input = document.getElementById("numberInput").value;
        if (isNaN(input) || input.trim() === "") {
            alert("Please enter a valid numeric value.");
            return false;
        }
        return true;
    }
</script>
</body>
</html>