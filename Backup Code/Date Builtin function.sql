USE BUILTINFUNCTION

/*1. DATEADD:
    - Explanation: This function adds a specified time interval to a given date.
    - Syntax: DATEADD(datepart, number, date)
    - Example: To add 5 days to the current date, you can use the following code:*/
        
		SELECT GETDATE()
       
        SELECT DATEADD(day, 12, '2023-08-01') AS NewDate;
        
     
        

/*2. DATEDIFF:
    - Explanation: This function calculates the difference between two dates in a specified unit.
    - Syntax: DATEDIFF(datepart, startdate, enddate)
    - Example: To calculate the number of days between two dates, you can use the following code:*/
        
          SELECT GETDATE()

        SELECT DATEDIFF(YEAR, '2022-08-01 12:23:45',GETDATE()) AS DayDifference;
        
         
        

/*3. DAY:
    - Explanation: This function returns the day part of a given date.
    - Syntax: DAY(date)
    - Example: To retrieve the day of the month for a specific date, you can use the following code:*/
        13, 08, 2023
          
        SELECT DAY(GETDATE()) AS DayOfMonth;

        SELECT CONCAT_WS('-','2023','08','13')
		SELECT CONCAT_WS('-',YEAR(GETDATE()),MONTH(GETDATE()),DAY(GETDATE())) AS DATETODAY
        
       

/*4. GETDATE:
    - Explanation: This function returns the current system date and time.
    - Syntax: GETDATE()
    - Example: To retrieve the current date and time, you can use the following code:*/
        
          
        SELECT GETDATE() AS CurrentDateTime;
        
         
        

/*5. MONTH:
    - Explanation: This function returns the month part of a given date.
    - Syntax: MONTH(date)
    - Example: To retrieve the month of a specific date, you can use the following code:*/
        
          
        SELECT MONTH('2023-06-17') AS MonthOfYear;
        
         
        

/*6. YEAR:
    - Explanation: This function returns the year part of a given date.
    - Syntax: YEAR(date)
    - Example: To retrieve the year of a specific date, you can use the following code:*/
        
          
        SELECT YEAR('2023-06-17') AS Year;
        
         
        

/*7. DATENAME:
    - Explanation: This function returns a specified part of a given date as a character string.
    - Syntax: DATENAME(datepart, date)
    - Example: To retrieve the month name of a specific date, you can use the following code:*/
        
         
SELECT DATENAME(MONTH,GETDATE())  AS DATENAME
         
        

/*8. DATEPART:
    - Explanation: This function returns an integer representing a specified part of a given date.
    - Syntax: DATEPART(datepart, date)
    - Example: To retrieve the day of the week as an integer for a specific date, you can use the following code:
        */
         SELECT DATEPART(WEEK,CONCAT_WS('-',YEAR(GETDATE()),MONTH(GETDATE())+4,DAY(GETDATE())))

		          SELECT DATEPART(WEEK,CONCAT_WS('-',YEAR(GETDATE()),'12',DAY(GETDATE())+ 16))

		SELECT  CONCAT_WS('-',YEAR(GETDATE()),'12',DAY(GETDATE()))

		   
        SELECT DATEPART(weekday, '2023-06-17') AS DayOfWeek;
        
         
        

/*9. GETUTCDATE:
    - Explanation: This function returns the current UTC date and time.
    - Syntax: GETUTCDATE()
    - Example: To retrieve the current UTC date and time, you can use the following code:
        */
         
        SELECT GETUTCDATE() AS CurrentUTCDateTime;
        
        
