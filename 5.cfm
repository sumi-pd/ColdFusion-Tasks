<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Q5</title>
  <link rel="stylesheet" href="assets/style.css">
</head>
<body>

<form action="" method="post" class="form-box">
    <label for="userDob">Enter user DOB:</label> 
    <input type="date" name="userDob" id="userDob"><br>
    <label for="userDob">Enter mother DOB:</label> 
    <input type="date" name="momDob" id="momDob"><br>
    <input type="submit" name="submit" value="Calculate">
</form>

<cfif structKeyExists(form, "submit")>
    <cfset userDob = form.userDob>
    <cfset momDob = form.momDob>
    <cfset currentDate = Now()>

    <cfset userAge = dateDiff("yyyy", userDob, currentDate)>
    <cfset momAgeAtBirth = dateDiff("yyyy", momDob, userDob)>

    <cfset userBirthdayThisYear = createDate(year(currentDate), month(userDob), day(userDob))>
    <cfif userBirthdayThisYear LT currentDate>
        <cfset userNextBirthday = createDate(year(currentDate)+1, month(userDob), day(userDob))>
    <cfelse>
        <cfset userNextBirthday = userBirthdayThisYear>
    </cfif>
    <cfset daysToUserBirthday = dateDiff("d", currentDate, userNextBirthday)>

    <cfset momBirthdayThisYear = createDate(year(currentDate), month(momDob), day(momDob))>
    <cfif momBirthdayThisYear LT currentDate>
        <cfset momNextBirthday = createDate(year(currentDate)+1, month(momDob), day(momDob))>
    <cfelse>
        <cfset momNextBirthday = momBirthdayThisYear>
    </cfif>
    <cfset daysToMomBirthday = dateDiff("d", currentDate, momNextBirthday)>

   
    <cfoutput>
        <p>User's Age: <strong>#userAge#</strong> years</p>
        <p>Age his mother delivered him: <strong>#momAgeAtBirth#</strong> years</p>
        <p>Days Remaining for user's Next Birthday: <strong>#daysToUserBirthday#</strong> days</p>
        <p>Days Remaining for Mother's Next Birthday: <strong>#daysToMomBirthday#</strong> days</p>
    </cfoutput>

</cfif>
</body>
</html>