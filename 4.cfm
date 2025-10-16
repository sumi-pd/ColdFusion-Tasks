<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Q4</title>
</head>
<body>
    <cfscript>
        currentDate = Now();
        today = DateFormat(currentDate, "dd-mm-yyyy");
        currentMonth = Month(currentDate);
        currentMonthWord = MonthAsString(currentMonth);

        dayNumber = dayOfWeek(currentDate);
        daysToSubtract = (dayNumber + 1) % 7;
        lastFriday = dateAdd("d", -daysToSubtract, currentDate);

        currentYear = year(currentDate);
        currentMonth = month(currentDate);
        if (currentMonth == 12) {
            nextMonth = 1;
            nextYear = currentYear + 1;
        } else {
            nextMonth = currentMonth + 1;
            nextYear = currentYear;
        }
        firstOfNextMonth = createDate(nextYear, nextMonth, 1);
        lastDayOfMonth = dateAdd("d", -1, firstOfNextMonth);
        
        writeOutput("Today's date: " & today & "</br>" &
                    "Month in numeric: " & currentMonth & "</br>" &
                    "Month in word: " & currentMonthWord & "</br>" &
                    "Last Friday date: " & DateFormat(lastFriday, "dd-mm-yyyy") & "</br>" &
                    "Last day of this month is: " & dateFormat(lastDayOfMonth, "dd-mm-yyyy"));

        //last 5 days
        for(i=1; i<=5; i=i+1) {
            previosDate = dateAdd("d", -i, currentDate);
            dayName = dateFormat(previosDate, "dddd")
            formattedPreviousDate = dateFormat(previosDate, "dd-mm-yyyy");
            switch (dayName) {
                case "Sunday":
                    style = "color:red;";
                    break;
                case "Monday":
                    style = "color:green;";
                    break;
                case "Tuesday":
                    style = "color:orange;";
                    break;
                case "Wednesday":
                    style = "color:yellow;";
                    break;
                case "Thursday":
                    style = "color:black; font-weight:bold;";
                    break;
                case "Friday":
                    style = "color:blue;";
                    break;
                case "Saturday":
                    style = "color:red; font-weight:bold;";
                    break;
                default:
                    style = "color:black;";
            }
            writeOutput('<div style="#style#">' & formattedPreviousDate & ' - ' & dayName & '</div>');
        }
    </cfscript>

</body>
</html>