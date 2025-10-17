<cfscript>
  datasource = "cftest";
</cfscript>

<cfquery name="qImages" datasource="#datasource#">
  SELECT id, name, description, path, thumbnail
  FROM images
  ORDER BY id DESC
</cfquery>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Images List</title>
</head>
<body>
    <h2>Images</h2>
    <p><a href="14.cfm">Upload new image</a></p>

    <table border="1">
        <tr>
          <th>Thumbnail</th>
          <th>Name</th>
        </tr>
        <cfoutput query="qImages">
          <tr>
            <td>
              <cfif len(trim(thumbnail))>
                <img src="#thumbnail#" alt="thumb" width="20" height="20">
              <cfelse>
                (no thumb)
              </cfif>
            </td>
            <td>
              <a href="details.cfm?id=#id#">#encodeForHTML(name)#</a>
            </td>
          </tr>
        </cfoutput>
    </table>
</body>
</html>
