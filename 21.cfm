<!DOCTYPE html>
<html>
<head>
    <title>Q21</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>

<cfif structKeyExists(form, "submitBtn")>
    <cftry>
        <cfset uploadDir = expandPath("./uploads/")>
        <cfset uploadedFile = "">

        <cfif structKeyExists(form, "greetingImage") AND len(form.greetingImage)>
            <cffile 
                action="upload"
                filefield="greetingImage"
                destination="#uploadDir#"
                nameConflict="makeunique"
                result="uploadResult">
            <cfset uploadedFile = uploadResult.serverDirectory & "/" & uploadResult.serverFile>
        </cfif>

        <cfmail 
            to="#form.email#"
            from="test@example.com"
            subject="Happy Birthday #form.name#!"
            type="html"
            server="smtp.gmail.com"
            port="587"
            username="test@gmail.com"
            password="test"
            useTLS="true"
            >
            <cfmailparam 
                file="#uploadedFile#" 
                disposition="attachment" 
                type="image/jpeg">

            <p>Dear #form.name#,</p>
            <p>#form.message#</p>
            <p>Have a wonderful birthday!</p>
        </cfmail>

        <cfoutput>
            <p style="color:green;">
                Birthday greeting has been sent successfully to <strong>#form.email#</strong>!
            </p>
        </cfoutput>

        <cfcatch type="any">
            <p style="color:red;">Error: #cfcatch.message#</p>
        </cfcatch>
    </cftry>
</cfif>

<form method="post" enctype="multipart/form-data" class="form-box">
    <label>Birthday Baby Name:</label><br>
    <input type="text" name="name" required><br><br>

    <label>His Email ID:</label><br>
    <input type="text" name="email" required><br><br>

    <label>Birthday Wishes:</label><br>
    <textarea name="message" rows="5" cols="40" required></textarea><br><br>

    <label>Greeting Image:</label><br>
    <input type="file" name="greetingImage" accept="image/*"><br><br>

    <input type="submit" name="submitBtn" value="Send Wishes">
</form>

</body>
</html>
