<!DOCTYPE html>
<html>
    <head>
        <title> Dashboard </title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="assets/css/admin.css">
    </head>
    <body>
        <cfif NOT structKeyExists(session, "userId")>
            <cflocation url="index.cfm">
        </cfif>

        <div class="header">
            <div class="welcome">Welcome, 
                <cfoutput> #session.username# </cfoutput>
            </div>
            <div class="actions">
                <a href="pagelist.cfm"> Pages </a>
                <a href="logout.cfm"> Logout</a>
            </div>
            <div style="clear:both;"></div>
        </div>

        <div class="container">
            <div class="card">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h3 class="mb-0">Page List</h3>

                    <button type="button" class="btn btn-info float-right" data-toggle="modal" data-target="#addPageModal">
                        Add Page
                    </button>
                </div>

                <cfset getPages = createObject("component", "dbOperations")>
                <cfset pageList = getPages.getPages()>

                <cfoutput>
                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Page Title</th>
                            <th>Description</th>
                            <th></th>
                        </tr>
                        <cfif pageList.recordCount GT 0>
                            <cfloop query="pageList">
                                <tr>
                                    <td>#pageList.pageId#</td>
                                    <td>#pageList.pageName#</td>
                                    <td>#Left(pageList.pageDescription, 50)#...</td>
                                    <td>
                                        <button 
                                            class="btn btn-sm btn-warning editBtn" 
                                            data-id="#pageList.pageId#" 
                                            data-title="#JSStringFormat(pageList.pageName)#"
                                            data-description="#JSStringFormat(pageList.pageDescription)#"
                                            data-toggle="modal" 
                                            data-target="##editPageModal">
                                            Edit
                                        </button>

                                        <button 
                                            class="btn btn-sm btn-danger deleteBtn" 
                                            data-id="#pageList.pageId#" 
                                            data-toggle="modal" 
                                            data-target="##deletePageModal">
                                            Delete
                                        </button>
                                    </td>
                                </tr>
                            </cfloop>
                        <cfelse>
                            <tr>
                                <td colspan="4" style="text-align:center; font-weight:bold;"> No Data Found </td>
                            </tr>
                        </cfif>
                    </table>
                </cfoutput>
            </div>
        </div>

        <div class="modal fade" id="addPageModal" tabindex="-1" role="dialog" aria-labelledby="addPageLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form method="post">
                        <div class="modal-header">
                        <h5 class="modal-title" id="addPageLabel">Add New Page</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        </div>

                        <div class="modal-body">
                            <div class="form-group">
                                <label>Title</label>
                                <input type="text" name="title" class="form-control" id="title" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" rows="5" id="description" required></textarea>
                            </div>
                        </div>

                        <div class="modal-footer">
                        <button type="submit" class="btn btn-success" id="savePageBtn">Save</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="modal fade" id="editPageModal" tabindex="-1" role="dialog" aria-labelledby="editPageLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                <form id="editPageForm">
                    <div class="modal-header">
                    <h5 class="modal-title" id="editPageLabel">Edit Page</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    </div>

                    <div class="modal-body">
                        <input type="hidden" id="edit_id" name="id">
                        <div class="form-group">
                            <label>Title</label>
                            <input type="text" id="edit_title" name="edit_title" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <textarea id="edit_description" name="edit_description" class="form-control" rows="5" required></textarea>
                        </div>
                    </div>

                    <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="updatePageBtn">Update</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    </div>
                </form>
                </div>
            </div>
        </div>

        <div class="modal fade" id="deletePageModal" tabindex="-1" role="dialog" aria-labelledby="deletePageLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deletePageLabel">Delete Page</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <p>Are you sure you want to delete this page?</p>
                    <input type="hidden" id="delete_id">
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Yes</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="assets/js/script.js"></script>
    </body>
</html>