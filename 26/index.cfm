<form enctype="multipart/form-data" method="post">
    <p>Select a .txt file to upload:</p>
    <input type="file" name="uploadFile" accept=".txt">
    <input type="submit" name="submit" value="Upload & Process">
</form>

<cfif structKeyExists(form, "submit")>
    <cfif len(form.uploadFile)>
        <cfset uploadDir = expandPath("./uploads/")>
        <cfif NOT directoryExists(uploadDir)>
            <cfdirectory action="create" directory="#uploadDir#">
        </cfif>

        <cffile 
            action="upload"
            destination="#uploadDir#"
            filefield="uploadFile"
            nameconflict="makeunique"
            accept="text/plain"
            result="fileInfo">
        <cffile 
            action="read" 
            file="#fileInfo.serverDirectory#/#fileInfo.serverFile#"
            variable="fileContent">

        <cfset tagObj = createObject("component", "tagCloud").init()>
        <cfset result = tagObj.saveWords(fileContent)>

        <cfoutput>
            <p><strong>Message:</strong> #result.message#</p>
        </cfoutput>
    <cfelse>
        <p>Please select a file before submitting.</p>
    </cfif>
</cfif>

