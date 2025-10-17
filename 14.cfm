<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Q14</title>
  <link rel="stylesheet" href="assets/style.css">
</head>
<body>
  <h2>Upload Image</h2>
  <form action="upload.cfm" method="post" enctype="multipart/form-data" class="form-box">
      <label>Image name:<br>
        <input type="text" name="imageName" required maxlength="255">
      </label>
      <br><br>

    <label>Description:<br>
      <textarea name="description" rows="5" cols="50"></textarea>
    </label>
    <br><br>

    <label>Select image (jpg, png, gif) — max 1 MB:<br>
      <input type="file" name="imageFile" accept=".jpg,.png,.gif,image/*" required>
    </label>
    <br><br>

    <input type="submit" value="Upload">
  </form>

  <p><a href="list.cfm">Go to list page</a></p>
</body>
</html>
