<!DOCTYPE html>
<html>
<head>
    <title>Q24</title>
</head>
<body>

<h2>Subscribe Form</h2>

<form action="saveMail.cfm" method="post">
    <label>First Name:</label><br>
    <input type="text" name="first_name" id="first_name" required><br><br>

    <label>Email ID:</label><br>
    <input type="email" name="email" id="email" required>
    <button type="button" onclick="checkMail()">Check</button><br><br>

    <input type="submit" id="submitBtn" value="Subscribe" disabled>
</form>
<script>
        // Function to check if email already exists
        function checkMail() {
            var email = document.getElementById("email").value.trim();
            if (email === "") {
                alert("Please enter an email address.");
                return;
            }

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "checkMail.cfm", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var response = xhr.responseText.trim();
                    if (response === "exists") {
                        alert("Mail ID is already there.");
                        document.getElementById("submitBtn").disabled = true;
                    } else {
                        alert("Mail ID is available!");
                        document.getElementById("submitBtn").disabled = false;
                    }
                }
            };
            xhr.send("email=" + encodeURIComponent(email));
        }
    </script>
</body>
</html>
