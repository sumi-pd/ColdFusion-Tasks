<cfscript>
    jsonString = '[{"Name":"saravanan","Age":27,"LOCATION":"dubai"},{"Name":"Ram","Age":26,"LOCATION":"Kovilpatti"}]';
    peopleArray = deserializeJSON(jsonString);
</cfscript>
<table border="1" cellpadding="5" cellspacing="0">
    <thead>
        <tr>
            <th>Name</th>
            <th>Age</th>
            <th>Location</th>
        </tr>
    </thead>
    <tbody>
        <cfloop array="#peopleArray#" index="person">
            <cfoutput>
                <tr>
                    <td>#person.Name#</td>
                    <td>#person.Age#</td>
                    <td>#person.LOCATION#</td>
                </tr>
            </cfoutput>
        </cfloop>
    </tbody>
</table>