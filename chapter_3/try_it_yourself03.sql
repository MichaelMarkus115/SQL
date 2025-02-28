--(QUESTION 1)
-- 1.	Your company delivers fruit and vegetables to local grocery stores, and
-- you need to track the mileage driven by each driver each day to a tenth
-- of a mile. Assuming no driver would ever travel more than 999 miles in a
-- day, what would be an appropriate data type for the mileage column in
-- your table? Why?

--I would use "numeric" or "decimal". This allows you to specify how many deciamls you want to store 
--after the comma. This will be more precise than a "real" or "double precision" where you cannot specify
--how many decimals you would want to add. 


--(QUESTION 2)
--2.	In the table listing each driver in your company, what are appropriate
-- data types for the drivers’ first and last names? Why is it a good idea to
-- separate first and last names into two columns rather than having one
-- larger name column?

--I would use varchar because you can set a maximum length of characters allowed. Varchar also will 
--"fill in" the blank spaces (remove them) when/if the name and surename of the person is not that
--specified length. This is ideal for names and surenames because not all names and surenames are the
--same length

--(QUESTION 3)
-- 3.	Assume you have a text column that includes strings formatted as dates.
-- One of the strings is written as '4//2017'. What will happen when you try
-- to convert that string to the timestamp data type?

--It will thow an error mentioning the format that the date is written in as well as the fact that the
--month is not present in the the date