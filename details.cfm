<cfscript>
  datasource = "cftest";

  if (structKeyExists(url, "id") and len(trim(url.id)) > 0) {
      id = trim(url.id);
  } else {
      cfthrow(type="InvalidArgument", message="Invalid or missing image id.");
  }
</cfscript>

<cfquery name="qDetail" datasource="#datasource#">
  SELECT id, name, description, path, thumbnail
  FROM images
  WHERE id = <cfqueryparam value="#id#" cfsqltype="cf_sql_varchar">::uuid
</cfquery>

<cfoutput query="qDetail">
  <h2>#encodeForHTML(name)#</h2>
  <p><strong>Description:</strong><br>#replace(encodeForHTML(description), chr(10), "<br>", "all")#</p>
  <p><strong>Original Image:</strong><br>
    <img src="#path#" alt="#encodeForHTML(name)#" style="max-width:800px; max-height:800px;">
  </p>
</cfoutput>