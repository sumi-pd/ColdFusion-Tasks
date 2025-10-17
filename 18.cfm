<cfscript>
    myQuery = QueryNew("ID,Name,email", "Integer,Varchar,Varchar");

    QueryAddRow(myQuery);
    QuerySetCell(myQuery, "ID", 1);
    QuerySetCell(myQuery, "Name", "Rachel");
    QuerySetCell(myQuery, "email", "rech@example.com");

    QueryAddRow(myQuery);
    QuerySetCell(myQuery, "ID", 2);
    QuerySetCell(myQuery, "Name", "Ross");
    QuerySetCell(myQuery, "email", "ross@example.com");

    QueryAddRow(myQuery);
    QuerySetCell(myQuery, "ID", 3);
    QuerySetCell(myQuery, "Name", "Monica");
    QuerySetCell(myQuery, "email", "monica@example.com");
</cfscript>

<cfoutput query="myQuery">
    #ID# - #Name# - #email#<br>
</cfoutput>