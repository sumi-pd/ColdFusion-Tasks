$(document).ready(function() {
    $("#savePageBtn").click(function() {
        var title = $("#title").val();
        var description = $("#description").val();

        if (title.trim() === "" || description.trim() === "") {
            alert("Please fill all fields");
            return;
        }

        $.ajax({
            url: "dbOperations.cfc?method=savePages",
            type: "POST",
            data: {
                title: title,
                description: description
            },
            success: function(response) {
                alert(response);
                $('#addPageModal').modal('hide');
                location.reload();
            },
            error: function() {
                alert("Error saving page");
            }
        });
    });

    $(".editBtn").click(function() {
        var id = $(this).data("id");
        var title = $(this).data("title");
        var description = $(this).data("description");

        $("#edit_id").val(id);
        $("#edit_title").val(title);
        $("#edit_description").val(description);
    });

    $("#updatePageBtn").click(function() {
        var title = $("#edit_title").val();
        var description = $("#edit_description").val();
        var id = $("#edit_id").val();

        if (title.trim() === "" || description.trim() === "") {
            alert("Please fill all fields");
            return;
        }

        $.ajax({
            url: "dbOperations.cfc?method=updatePages",
            type: "POST",
            data: {
                id: id,
                title: title,
                description: description
            },
            success: function(response) {
                alert(response);
                $('#editPageModal').modal('hide');
                location.reload();
            },
            error: function() {
                alert("Error saving page");
            }
        });
    });

    $(".deleteBtn").click(function() {
        $("#delete_id").val($(this).data("id"));
    });

    $("#confirmDeleteBtn").click(function() {
        $.ajax({
            url: "dbOperations.cfc?method=deletePage",
            type: "POST",
            data: { id: $("#delete_id").val() },
            success: function(response) {
                alert(response);
                $("#deletePageModal").modal("hide");
                location.reload();
            }
        });
    });
});