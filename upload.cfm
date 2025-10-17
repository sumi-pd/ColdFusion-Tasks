<cfset uploadDir = "uploads/"> 
<cfset thumbnailDir = "thumbnails/">

<cfscript>
    datasource = "cftest";                    
    uploadBasePath = expandPath("./uploads/");   
    thumbBasePath  = expandPath("./thumbnails/");
    maxSizeBytes = 1 * 1024 * 1024;              
    allowedExts = ["jpg","png","gif"];
    allowedMIMEs = ["image/jpg","image/png","image/gif"];

    if (! directoryExists(uploadBasePath)) directoryCreate(uploadBasePath);
    if (! directoryExists(thumbBasePath)) directoryCreate(thumbBasePath);

    imageName = trim(form.imageName);
    description = trim(form.description);

    if (len(imageName) == 0) cfthrow(type="Validation", message="Image name is required.");
    if (! structKeyExists(form, "imageFile") and ! structKeyExists(cgi, "CONTENT_LENGTH")) 
        cfthrow(type="Validation", message="No file uploaded.");
</cfscript>

<cffile action="upload"
        fileField="imageFile"
        destination="#uploadBasePath#"
        nameConflict="makeUnique"
        result="uploadResult" />

<cfscript>
    clientName = uploadResult.clientFileName;
    serverName = uploadResult.serverFile;
    serverPath = uploadResult.serverDirectory & "/" & serverName;
    fileExt = lcase(listLast(serverName, "."));
    contentType = uploadResult.contentType;
    fileSize = uploadResult.fileSize;

    if (fileSize > maxSizeBytes) {
        if (fileExists(serverPath)) fileDelete(serverPath);
        cfthrow(type="Validation", message="Uploaded file is larger than 1 MB. Please upload a smaller file.");
    }

    if (arrayFindNoCase(allowedExts, fileExt) == 0) {
        if (fileExists(serverPath)) fileDelete(serverPath);
        cfthrow(type="Validation", message="Invalid file type. Only jpg, png, gif allowed.");
    }

    uniquePrefix = createUUID();
    dbOriginalFilename = uniquePrefix & "_" & serverName;
    dbThumbFilename    = uniquePrefix & "_thumb." & fileExt;
    originalFinalPath = uploadBasePath & dbOriginalFilename;
    thumbFinalPath    = thumbBasePath & dbThumbFilename;
    fileMove(serverPath, originalFinalPath);

    try {
        img = imageRead(originalFinalPath);
        imageScaleToFit(img, 20, 20);
        thumbImg = imageNew("", 20, 20, "rgb", "white");
        x = int((20 - imageGetWidth(img)) / 2);
        y = int((20 - imageGetHeight(img)) / 2);
        imagePaste(thumbImg, img, x, y);
        imageWrite(thumbImg, thumbFinalPath);
    } catch(any e) {
        if (fileExists(originalFinalPath)) fileDelete(originalFinalPath);
        if (fileExists(thumbFinalPath)) fileDelete(thumbFinalPath);
        rethrow(e);
    }

    relativeOriginal = "uploads/" & dbOriginalFilename;
    relativeThumb    = "thumbnails/" & dbThumbFilename;
</cfscript>
<cftry>
    <cfquery datasource="cftest" name="qInsert">
        INSERT INTO images (name, description, path, thumbnail)
        VALUES (
            <cfqueryparam value="#imageName#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#description#" cfsqltype="cf_sql_clob">,
            <cfqueryparam value="#relativeOriginal#" cfsqltype="cf_sql_varchar">,
            <cfqueryparam value="#relativeThumb#" cfsqltype="cf_sql_varchar">
        )
    </cfquery>
    
    <cfcatch type="any">
        <cfif fileExists(originalFinalPath)> <cfset fileDelete(originalFinalPath)> </cfif>
        <cfif fileExists(thumbFinalPath)> <cfset fileDelete(thumbFinalPath)> </cfif>
        <cfthrow type="DatabaseError" message="DB Insert Failed: #cfcatch.message#">
    </cfcatch>

</cftry>
<cfscript>
    location(url="list.cfm", addToken="false");
</cfscript>


