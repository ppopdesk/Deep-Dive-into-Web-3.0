This code written in python uses brute force approach to calculate the value of Hash obtained and converts that hexadecimal string into it's integer value and as soon as a desired string is obtained, it esits from the loop and prints it's value.
To calculate the amount of time elapsed during this execution, I have used "datetime" library and calculated the time before execution and after execution their meanwhile their difference gives the value of time elapsed.I have imported "hashlib" library  to use already written SHA256 algorithim.
It's flow is as follows:-
1. Taking the string given originally in the task and converting it into hash followed by storing the the hash converted to decimal into target variable.
2. Taking string input from the user and appending integers and evaluating the value of hash obtained of this string.
3. exiting loop as soon as a string is found.
