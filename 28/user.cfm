<!DOCTYPE html>
<html>
    <head>
        <title> User </title>
        <link rel="stylesheet" type="text/css" href="assets/css/admin.css">
    </head>
    <body>
        <cfif NOT structKeyExists(session, "userId")>
            <cflocation url="index.cfm">
        </cfif>

        <cfparam name="url.page" default="Home">

        <cfset getPages = createObject("component", "dbOperations")>
        <cfset pageList = getPages.getPages()>

        <div class="header">
            <div class="welcome">Welcome, 
                <cfoutput> #session.username# </cfoutput>
            </div>
            <div class="actions">
                <cfoutput>
                    <cfloop query="pageList">
                        <a href="user.cfm?page=#URLEncodedFormat(pageList.pageName)#" > #pageList.pageName# </a>
                    </cfloop>
                </cfoutput>

                <a href="logout.cfm"> Logout</a>
            </div>
            <div style="clear:both;"></div>
        </div>

        <cfset pageDetails = getPages.selectPage(title = url.page)>

        <div class="container">
            <div class="card">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h3 class="mb-0"><cfoutput> #url.page# </cfoutput></h3>
                    <cfoutput>#pageDetails.pageDescription#
                    </cfoutput>
                </div>

            </div>
        </div>


        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="assets/js/script.js"></script>
    </body>
</html>