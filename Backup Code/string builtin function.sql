USE BUILTINFUNCTION
/*Substring: This function is used to extract a portion of a string based on a starting 
			position and a length. The syntax is: SUBSTRING(input_string, start_position, length).
Example:*/

 SELECT SUBSTRING('SHABANA PERWEEN', 2,7)

SELECT SUBSTRING('Hello World', 7, 5); --would return 'World'.

/*Reverse: This function is used to reverse the characters in a string.
			The syntax is: REVERSE(input_string).
Example:*/

SELECT rEvErse('SHABANA PERWEEN')--would return 'olleH'.

/*Replace: This function is used to replace all occurrences of a specified string 
with another string within a given string. The syntax is: REPLACE(input_string, old_value, new_value).
Example:*/
hey bro . hey man 
SELECT REPLACE('Hello World', 'World', 'NATURE'); --would return 'Hello Universe'.

/*LTRIM: This function is used to remove leading spaces from a string. The syntax is: LTRIM(input_string).
Example:*/
select 'sanjay'

SELECT LTRIM(' Hello'); ---would return 'Hello' (without leading spaces).

/*RTRIM: This function is used to remove trailing spaces from a string. The syntax is: RTRIM(input_string).
Example:*/

SELECT RTRIM('Hello '); ---would return 'Hello' (without trailing spaces).

/*Lower: This function is used to convert a string to lowercase. The syntax is: LOWER(input_string).
Example:*/

SELECT LOWER('Hello'); ---would return 'hello'.

/*Upper: This function is used to convert a string to uppercase. The syntax is: UPPER(input_string).
Example:*/

SELECT UPPER('hello'); --would return 'HELLO'.

/*Len: This function is used to get the length of a string. The syntax is: LEN(input_string).
Example:*/
SELECT LEN('Hello ');--- would return 5.


/*DATALENGTH: This function is used to get the length in bytes of a string or binary data.
The syntax is: DATALENGTH(input_string).
Example:*/
SELECT DATALENGTH('Hello'); ---would return 10 (assuming each character takes 2 bytes of storage).

/*LEFT: This function is used to get a specified number of characters from the left side of a string. The syntax is: LEFT(input_string, num_chars).
Example:*/
SELECT LEFT('Hello',	1); --would return 'Hel'.

/*RIGHT: This function is used to get a specified number of characters from the right side of a string. The syntax is: RIGHT(input_string, num_chars).
Example:*/
SELECT RIGHT('Hello', 3);--- would return 'llo'.

/*CONCAT: This function is used to concatenate two or more strings together. The syntax is: CONCAT(string1, string2, ...).
Example:*/
SELECT concat('Hello', ' ' ,'World','_','rohan');--- would return 'Hello World'.

SELECT CONCAT_WS('*','HELLO','WORLD','SQL')

/*ASCII: This function is used to get the ASCII code value of a character. The syntax is: ASCII(input_char).
Example:*/
SELECT ASCII('t'); ---would return 65.

/*CHAR: This function is used to get the character based on an ASCII code value. The syntax is: CHAR(ascii_code).
Example:*/
SELECT CHAR(116);--- would return 'A'.

/*CHARINDEX: This function is used to find the starting position of a substring within a string.
The syntax is: CHARINDEX(substring, input_string).
Example:*/
Example: SELECT CHARINDEX('o', 'Hello');--- would return 3.

/*PATINDEX: This function is used to find the starting position of a pattern (as a wildcard expression)
within a string. The syntax is: PATINDEX(pattern, input_string).
Example:*/
SELECT PATINDEX('%or', 'Hello World'); ---would return 8.


/*REPLICATE: This function is used to repeat a string a specified number of times. 
The syntax is: REPLICATE(input_string, number_of_repetitions).
Example:*/
SELECT REPLICATE('abcd', 4); ---would return 'abcabcabc'.

/*SPACE: This function is used to generate a string with a specified number of spaces. The syntax is: SPACE(number_of_spaces).
Example:*/
SELECT SPACE(10); ---would return ' ' (five spaces).

SELECT LEN(CONCAT('SHABANA',SPACE(10),'PERWEEN'))

SELECT 

/*STUFF: This function is used to delete a specified length of characters from a string and replace
them with another string. The syntax is: STUFF(input_string, start_position, length, replacement_string).
Example:*/
SELECT STUFF('Hello World', 5, 5, 'Universe');--- would return 'Hello Universe'.

/*UNICODE: This function is used to get the Unicode code point value of a character.
The syntax is: UNICODE(input_char).
Example:*/
SELECT UNICODE('A');--- would return 65. or ASCII

/*NCHAR: This function is used to get the character based on a Unicode code point value. The syntax is: NCHAR(unicode_code).
Example:*/
SELECT NCHAR(65); --would return 'A'. or char

