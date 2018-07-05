STOP

/**

AQMEN (Data Science for Social Research)

Introduction to Data Science-

An Introduction to Statistical Concepts for Data Analysis


Stata Workshop (July 2018)

A two day hands-on workshop led by 
Professor Vernon Gayle, University of Edinburgh.


		**********************************************
		* IT IS IMPORTANT THAT YOU READ THIS HANDOUT *
		* AND FOLLOW THE STATA.DO FILE LINE BY LINE! *
		**********************************************

		
Topics: 

The course introduces participants to fundamental concepts in statistics, 
rudimentary data analysis techniques and how to interpret results. 
These skills are fundamental for the successful data analysis and data science.

Rationale: 

There are many organisations that increasingly require employees to understand 
data, and to analyse data using statistical methods. 

Many employees do not have formal training in statistics. 

Some employees undertook classes at university, but for many people these 
courses are now a distant memory. 

Understanding fundamental concepts in statistics, rudimentary data analysis 
techniques, and how to interpret results are critical skills for the successful 
analysis of data, which is at the core of data science.

Many organisations report that they have an absence of data analysis skills. 
Other organisations report that some employees have skills but lack confidence
in exercising them. The lack of skills and capacity is currently a major 
obstacle to some organisations undertaking data analysis. 

This course will provide a fast-track introduction for employees wishing to 
begin to analyse data.


Please be patient. Computers often go wrong.

Please asks the tutors for help.


*******************************************************************************


Latest Update

4th July 2018 Independence Day 2018 in United States of America.

 
Previous Updates

2nd July 2018  Chris Froome: Anti-doping case against four-time 
               Tour de France winner dropped. 

29th June 2018 Ed Sheeran is being sued for $100m (£76.4m) 
               for allegedly copying parts of Marvin Gaye's 
			   Let's Get It On.
			   
20th June 2018 Train journey from London to Cumbria.

11th June 2018 Dame Millicent Garrett Fawcett's birthday 
               https://en.wikipedia.org/wiki/Millicent_Fawcett
			   
28th September 2016 My Dad was 80 today.

20th May 2015 The Soviets launch Mir space station 1986.

11th May 2015 David Cameron works on completing Cabinet reshuffle.

20th April 2015 Arsenal and Aston Villa to meet in FA Cup final.

16th April 2015 Oflag IV (Colditz) was captured by American soldiers.

15th April 2015 Sir Chris Hoy says "Sir Bradley Wiggins has 99% chance 
                  breaking the hour record".

3rd March 2014 "On this day in history...1991 Los Angeles Police beat black
                 suspect Rodney King to death".
			   
14th April 2012 "On this day in history...
                  1970 Apollo 13 suffers critical explosion".

23rd May 2013 "On this day in history... 
                1934 American bank robbers Bonnie and Clyde 
                are ambushed by police and killed in Black Lake, Louisiana".

				
********************************************************************************


WARNING!

No micro data will be distributed during this workshop.

Some additional files may be provided e.g. via github or on a memory stick.

Participants MAY NOT make copies of these files or distribute them.

The files have been sepcially created by AQMEN for training and MUST not be 
used in 'real life'.

THE DATA ARE NOT REAL! DO NOT USE THEM FOR REAL ANALYSES!

We advise that participants galvanise their training experience and
work with 'genuine' data files, there are many feely available on the internet. 

At workshops where real datasets are used participants MUST sign 
a data access agreement.


********************************************************************************


 © Vernon Gayle, University of Edinburgh.

This file has been produced for AQMEN by Professor Vernon Gayle. 

Earlier versions have had assistance from Dr Roxanne
Connelly (University of York) and Dr Chris Playford (University of Exeter).

Any material in this file must not be reproduced, 
published or used for teaching without permission from Professor Vernon Gayle. 

Many of the ideas and examples presented in this document draw heavily on
previous work (see especially www.longitudinal.stir.ac.uk). 
We are grateful for the comments and feedback from participants of 
earlier workshops. Over the last decade much of this material has been 
developed in close collaboration with Professor Paul Lambert, University of 
Stirling. However, Professor Gayle is responsible for any errors in this file.

Professor Vernon Gayle (vernon.gayle@ed.ac.uk) 


********************************************************************************


A few commands in this file write to your memory stick.

For illustration this is called "e:\" you may need to change this location.

In your work environment you will probably use a network location
such as your "M:\" drive.

When using Stata at you own organisation you will have to use the correct 
locations.

This file was initially prepared using Stata 14.0 for Windows.

Stata is continually being improved.

This means that programs and do-files written for older versions might 
stop working.

It is possible to specify the version of Stata that you are using at the 
top of programs and do-files .

e.g.  version 10


********************************************************************************

We suggest that you make a copy of this file imediately!


		**********************************************
		* IT IS IMPORTANT THAT YOU READ THIS HANDOUT *
		* AND FOLLOW THE STATA.DO FILE LINE BY LINE! *
		**********************************************


The file is sequential. 

It MUST be run line by line. 

Many of the commands will NOT run if earlier lines of commands have not been 
executed.


Anotate your new copy of the file as you work through it with your own notes 
(use "*" to comment out your notes).

There are "Questions" for you to answer and "Tasks" for you to do.


Useful Websites:

https://stats.idre.ucla.edu/stata/
https://www.stata.com
https://www.stata.com/links/resources-for-learning-stata/
http://www.restore.ac.uk/Longitudinal/


Cheat Sheets:

https://www.stata.com/links/resources-for-learning-stata/
https://geocenter.github.io/StataTraining/portfolio/01_resource/
https://www.datasciencecentral.com/group/resources/forum/  +
                                                        topics/stata-cheat-sheet


********************************************************************************
**/


********************************************************************************
*
*                    Setting Up Stata
*
********************************************************************************

* This section is about organising preliminary settings in Stata *

* clear the computer memory *

clear


/** 

Change the working directory to your memory stick.

You can to create a directory on another drive such as the c:\  if the computer
that you are using allows you to do so - but you might have to create the
directory first.

**/

cd e:\

* display the path of the current working directory *

pwd

* start a log file *

* you might want to check which drive your memory stick is in *

capture log using e:\stata_log_20180712_v1.txt, replace text

* take a look at Stata help "help"

help

********************************************************************************


********************************************************************************
*
*                    Loading Data Files into Stata (use)
*
********************************************************************************

/**

The first file that we will use is called auto.dta produced by the US
Consumers Union in 1979.

It is a commonly used data file all about automobiles.

**/

* clear the computer memory *

clear

* the file is in the Stata system so we can use the command "sysuse" *

sysuse auto

* let us take a look at the data using the "codebook" command *

* we will look at a "compact" or small codebook *

codebook, compact

/**

Task: Take a few moments to look at the codebook.

Task: Write some notes here about the datasets.


**/


* summary statistics *

* let us try the "summarize" command *

summarize


* look at the values of variables for the first three cars *
* using the "list" command *

list in 1/3

* you can look at the data in a familiar spreadsheet format *
* browsing the data file *

browse

* it is worth closing the spreadsheet so you don't have too many windows open *


********************************************************************************


********************************************************************************
*
*                    Summary Statistics
*
********************************************************************************

* In this section we compute some summary statistics. *

count

/**

Question: How many cases are in the dataset?

**/

* let us take a look at the models of the cars *

* use the "tab" command to print a table *

tab make

* let us take a look at miles per gallon (mpg)*

tab mpg


/**

Question: What is the best (i.e. most efficient) mileage per gallon?

Question: What is the worst (i.e. least efficient) mileage per gallon?

Question: What do you think the average miles per gallon will be?

**/


* let us use the "summarize" command *

summarize mpg


/**

Task: Make some notes on these results.


**/


* let us use the "mean" command *
* the "mean" command also give us confidence intervals *

mean mpg

* the "ci" is an alternative command for confidence intervals *

ci mpg

* Question: What does the confidence interval tell us *

* let us look at the summary statistics in more "detail" *

summarize mpg, detail

/**

Question: What is the median value?

**/

* let us draw a histogram of miles per gallon(mpg)*

histogram mpg, discrete

/**

Question: What is the mode?

Question: Are the data positively or negatively skewed?

**/


* let us take another look at the summary statistics in more "detail" *

summarize mpg, detail

/**

Question: What is the standard deviation?

Question: What is the variance?

**/

* get a "display" of "sqrt" of the variance *
 
display sqrt(33.47205)

/**

Question: What is the relationship between the standard deviation 
          and the variance?

**/

* let us take another look at the summary statistics in more "detail" *

summarize mpg, detail

* let us now draw a box plot of miles per gallon (mpg) *

graph box mpg


/**


Question: What does the box plot summarize?


Task: Make some notes on the work that you have just completed.





**/


********************************************************************************

/**

In this sub-section we concentrate on categorical variables. 

**/


* construct a table of frequencies for the variable foreign *

tab foreign

/**

Question: What percentage of the cars are not produced in the US?

**/

* let us use the "proportion" command *

proportion foreign


* let us close the log file *

log close


/**

Task: Now go to your memory stick (or the relevant directory) and look at
      your log file (e.g. e:\stata_log_20180712_v1.txt).
	  
**/

/**

Task: Write some comments here to remind yourself of what you have done.







**/


********************************************************************************
********************************************************************************
********************************************************************************


********************************************************************************
*
*                    Correlations
*
********************************************************************************

* In this section we look at correlations. *


/**


Task: Start a new log file.


**/

clear

sysuse auto

codebook, compact

/**


Question: Is there a relationship between the weight of a car and its 
fuel efficiency (i.e. miles per gallon mpg)?


**/


tab mpg

tab weight 

/**

plot the relationship between miles per gallon "mpg" and weight "weight" 

we will use a "scatter" plot

**/


scatter mpg weight

/**

Question: What is the direction of the relationship between the weight of a car
and its fuel efficiency (i.e. miles per gallon mpg)?

**/


* using the command "cor" estimate a correlation *

cor mpg weight

/**

Question: What is the value of r ? 

Question: What is the formal name given to r ?

Question: Is the correlation weak or strong? 

**/

* we will now extend this analysis using the command "pwcorr" for a pair-wise 
* correlation and then calculate a significance test "sig"

pwcorr mpg weigh, sig

/**

Question: Is the relationship significant? 

**/


/**

plotting the relationship and fitting a line that summarizes the data 

run both of the next two lines together 

"///" is the line-join indicator - it joins lines of commands together 

**/

graph twoway (lfit mpg weigh) ///
              (scatter mpg weigh)

/**


Question: Visualising the data, does the correlation look weak?


Task: Make some notes about the work that you have just completed.


**/


********************************************************************************


/**

Spearman's Correlation.


The Human Resources (HR) Department of a company have data on employee's 
perfomance.

HR has the rank position in sales "sales" and the rank position in days lost 
to sickness "sick" for each employee.

This data will be entered manually as a block.

Highlight the lines from "clear" down to "summarize" and run them all together.

**/

clear
input id	sales	sick
1	1	28
2	2	29
3	3	30
4	4	27
5	5	26
6	6	25
7	7	24
8	8	23
9	9	15
10	10	14
11	11	22
12	12	21
13	13	20
14	14	19
15	15	18
16	16	17
17	17	16
18	18	13
19	19	10
20	20	11
21	21	12
22	22	9
23	23	7
24	24	6
25	25	8
26	26	5
27	27	4
28	28	3
29	29	2
30	30	1
end

summarize

/** 

If there is an error...

Check that you highlighted the lines from "clear" down to "summarize" 
and ran them all together.


**/


/**

plot of the relationship between the employee's rank in sales "sales" and their 
rank absence due to sickness "sick"


**/

twoway (scatter sales sick)(lfit sales sick)

/**

Question: How strong do you expect the correlation to be
          between the employee's rank in sales and their rank in sickness?

**/

* we will use the "spearman" command *

spearman sales sick

/**


Question: Interpret the relationship between sickness and sales?

Question: How strong is the correlation? *

Question: Is the relationship significant? *


**/


* now we will do a comparision with Pearson's r *

pwcorr sales sick, sig

* Question: Are the two correlation estimates similar in this instance?

/**


Task: Write some comments here to remind yourself what you have done.


**/


********************************************************************************
********************************************************************************
********************************************************************************


********************************************************************************
*
*                    Comparing Means and the t-test
*
********************************************************************************


* In this section we compare means for groups and compute a t-test.*

clear

sysuse auto.dta

summarize

mean mpg

* compare foreign cars with domestic (i.e. American built)cars *

mean mpg, over(foreign)

/**
  
Question: Is the mean mpg for foreign cars different to the mean for domestic
          (i.e. American built)cars?
		  
**/

ttest mpg, by(foreign)

/**
  
Question: Is the mean mpg for foreign cars significantly different to the mean 
          for domestic cars?
		  
Question: Do the confidence intervals for the two group means overlap?

		  
**/


********************************************************************************
********************************************************************************
********************************************************************************


********************************************************************************
*
*                    Data in Tables
*
********************************************************************************


/**


This example recreates genuine data from
			Bishop, Y.M., 1969. Full contingency tables, logits, 
			and split contingency tables. Biometrics, pp.383-399.

The paper is available at
			https://www.jstor.org/stable/pdf/
			2528796.pdf?refreqid=excelsior%3Aedcb5e0f76234b247c5a00ccab056307

			
**/


clear

/**


Highlight the lines from "clear" down to "summarize" and run them all together.


**/


input clinic care survived n
0 0 0 3
0 1 0 4
0 0 1 176
0 1 1 293
1 0 0 17
1 1 0 2
1 0 1 197
1 1 1 23
end


/**

these data have been entered in 'table' format and we now need to "expand" them
so that they are a full set of data in 'record' format 

**/

expand n

* browse the data*

browse

/**

The variables we will look at are

survived:
Child died within month = 0    
Child survived at least one month = 1

care:
Mother had less than 1 month prenatal care = 0
Mother had more than 1 month prenatal care = 1


**/

* tabulate survival and prenatal care *

tab survived care

/**

now lets take a look at the table with column percentages "col" 
and no frequencies "nofreq"

**/
 
tab survived care, nofreq col

/**
		  
Question: What percentage of babies whose mother recieved less than 1 month of
          prenatal care died within a month?
		  
Question: What percentage of babies whose mother recieved more than 1 month of
          prenatal care died within a month?		
		  
Question: What can you informally infer?
		  
		  
**/


/**

now let us take a look at the table with expected frequencies "expected" 
and no observed frequencies "nofreq"

**/

tab survived care, nofreq expected

/**

now let us calculate the Chi-squared test "chi"

**/

tab survived care, chi


/**

		  
Question: Is there a significant difference between the survival of babies and
          how much care their mothers received?
		  
Question: How many degrees of fredom does the table have?

Question: What is the critical value (CV) for a 2 by 2 table?
		  
		  
**/


/**

now let us calculate Cramer's V "V"

**/

tab survived care, chi V

/**
		  
Question: How strong is the association?
	
	
**/


********************************************************************************
********************************************************************************
********************************************************************************


********************************************************************************
*
*                    Data Wrangling (Part 1)
*
********************************************************************************

/**

In this section we will begin to do some data wrangling.

There ara several ways to get data into Stata.

We will now use the High School Beyond (hsb) dataset.

Will collect the Stata .dta file from the University of California Los Angeles
UCLA website.

**/


clear

use "https://stats.idre.ucla.edu/stat/data/hsb2.dta"

summarize

/**

We will now save "save" a local copy of this file.

Use your memory stick (e.g. "e:\").

Make sure that you are saving to a directory that you can write to.

For illustration I am using C:\temp_work\

**/


save "C:\temp_work\hsb2_20180712_vg_v1.dta", replace


/**

Notice that we have used a naming protocol "hsb2_" "20180712" "_v1" ,
and have used some version control.

We use the option "replace" this tells Stata that it is okay to overwrite a file
with the same name.

**/


/**

Data in spreadsheets.

Excel files and comma-separated values (.csv) files are among the most common 
ways to store raw data in many organisations.

Many storage types are read in using a variant of the import command.

First we read in Excel files using "import excel".  

The minimum specification is just import excel and then the Excel file name 
(with path if the file is not in current directory).

Below, we load in an Excel dataset pulled from the University of California 
Los Angeles UCLA website.


**/


import excel "https://stats.idre.ucla.edu/stat/data/hsb2.xls", firstrow 


/**

"firstrow" tells Stata that the first row of the Excel file has the 
           variable names  
**/


* take a look at the data *

codebook, compact


/**
		  
Task: Make a wee note on how to import an Excel file.

Task: Make a wee note on importing from web locations.
	
	
**/


/**

It is also possible to "import" .csv files (as well as most text files 
in general), we use import "delimited" here.

**/

clear

import delimited "https://stats.idre.ucla.edu/stat/data/hsb2.csv", clear

describe

/**

Stata assumes that variable names are the first row of data in text files, 
so the "firstrow" option is not needed for "import" when the data are
"delimited".

**/


/**

Importing files in other data formats.

You may find the software StatTransfer useful
http://www.stattransfer.com/ 

StatTransfer is designed to simplify the 
transfer of statistical data between different programs.

The following formats are supported -
Access, ASCII, Excel, Gauss, LIMDEP, Matlab, Minitab, Mplus, R, 
SAS, S-PLUS, SPSS, Stata, and many others.

There is useful information on moving between formats at
		https://stats.idre.ucla.edu/other/mult-pkg/faq/ +
		how-do-i-convert-among-sas-stata-and-spss-files/

**/

/** 

Importing files from SPSS 

A simple techniques is to save your datafile within SPSS in Stata format.

Alternatively you can use a Stata user-written command called usespss.
You may have to install the usespss module on your machine first however
run the line "ssc install usespss" .

Some more recent versions of Stata can automatically open SPSS files.


**/

/**

Exporting files to SPSS
     
"dta2sav" creates SPSS syntax and a Stata data file to convert Stata data 
into SPSS data.

**/


********************************************************************************


/** 

Returning to the High School Beyond (hsb) dataset.

We will now save "use" a local copy of this file.

Use the file that you saved on your memory stick (e.g. "e:\").

For illustration I am using C:\temp_work\

**/


* first clear Stata's memory *

clear

use "C:\temp_work\hsb2_20180712_v1.dta"

/** 

if there is an error check you are identifying the file that you saved 
on your memory stick (e.g. "e:\")

**/


codebook, compact

* summarize the data *

summarize

tab female

* we will now add number labels *

numlabel _all, add

tab female

/**

"numlabel" prefixes numeric values to value labels
for example, a value mapping of 0 is now with the male category  "0. male"
 
this is often useful to easily see the codes that accompany values etc.

**/


* we will now add some labels to the variables *

tab id

* now we add a variable label to the id variable *

label variable id "student identification number"

tab id


tab female

* add a variable label to the female variable *

label variable female "female"

tab female

* add a variable label to the race variable *

tab race

label variable race "ethnicity of student"

tab race

* rename the race variable "ethnicity" *

rename race ethnicity

* the old variable race has now gone *

tab race

* notice that Stata tells you 'variable race not found' *

tab ethnicity


* create a block of dummy variables indicating the ethnicity groups

tabulate ethnic, gen(ethnic)

* notice that four new variables are now in the dataset *

tab1 ethnic1 ethnic2 ethnic3 ethnic4

* now rename these variables so that they are more meaningful *

rename  ethnic1 hispanic
rename ethnic2 asian
rename ethnic3 africam
rename ethnic4 white

tab1 hispanic asian africam white

* deleting (i.e. dropping a variable) *

drop ses

* the ses variable has been droped *

summarize		  

* keep a slected subset of variables *

keep id female read math

* keep a subset of cases *

tab female

* keep only the males in the dataset *

keep if female==0

* notice that 109 observations (females) have now been dropped *

/**

2 + 2 = 4 that is 2 plus 2 becomes 4 

in maths the single equal " = " sign means becomes 

the double equals sign " == " means equivalent to 

**/

tab female

* drop (i.e. delete) cases where the math score is less than 60 *

summarize math

drop if math<60

summarize math

* we will call this the "swotty-boys" datasets.

* Task: Save this dataset with an appropriate new name. *

clear 

* Task: Open (use) the "swotty-boys" datasets. from your drive. *

/**

Taks: Write some comments here to remind yourself of what you have done.


**/


********************************************************************************
********************************************************************************
********************************************************************************


********************************************************************************
*
*                    Data Wrangling (Part 2)
*
********************************************************************************

/**

Generating a new variable.

**/


clear
input id units
001 2.3
002 2
003 3
004 4
005 5.5
006 6
007 7
008 7.5
009 7.8
010 8
end 

generate units_squared=(units*units)
graph twoway (scatter units_squared units) 


/**

Generating other new variables.

**/

clear

sysuse auto

summarize length

* the length of the cars is in inches *

* generating "generate" a new variable length in feet *

generate len_ft = length / 12 

* take a look at the new variable *

tab len_ft

graph twoway (scatter length len_ft) 


/**

Now let us convert mpg into three distinctive categories 

18 miles per gallon and under
19 - 23 miles per gallon
24 + miles per gallon

**/

* first we "generate" and empty variable

generate mpg3    = .   

* now we replace "replace" the empty variable with new values *

replace  mpg3    = 1 if (mpg <= 18) 
replace  mpg3    = 2 if (mpg >= 19) & (mpg <=23) 
replace  mpg3    = 3 if (mpg >= 24) 

tab  mpg mpg3


********************************************************************************


/**

Handling Missing Values.

**/

* here is a small dataset with missing values for the "age" variable *

clear
input id age 
001 22
002 23
003 -99
004 24
005 25
006 23
007 23
008 23
009 23
010 -99
end 

summarize

mean age

/**

Question: What is the mean age?

**/

tab age

/**

Question: How many cases have missing values?

**/

mean age if age!=-99

* here we use the code "!=" to represent not equal to *

/**

Question: What is the real mean age (for the complete records)?

**/

/**

decode the missing values (-99) with the "mvdecode" command

"mvdecode" is missing values "mv" and decode "decode"

**/

mvdecode age, mv(-99)

browse

* notice that the missing values have been replaced by "." *

tab age, missing

* now calculate the mean *

mean age


/**

Question: What is the mean age now that the missing values have been decoded?

**/


* we can now encode the missing values (-999) with the "mvencode" command *

mvencode age, mv(-999)
tab age, missing

/**


Task: Make some notes on the data wrangling that you have undertaken.


**/


********************************************************************************
********************************************************************************
********************************************************************************


********************************************************************************
*
*                    Making a near-perfect Yorkshire pudding
*
********************************************************************************

* 3 eggs *
* 115g plain flour *
* 285ml milk *
* 12 tablespoons vegetable oil / I prefer beef dripping *

/** 

1. Whisk the eggs, flour, salt, and milk together really well in a bowl 
to make your batter. 

2. Pour the batter into a jug, and let it sit for 30 minutes before you use it. 

3. Turn your oven up to the highest setting and place the baking tray in the 
oven to heat up for 5 minutes. 

4. Place 1 table spoon of beef dripping into each indentation, 
and put the tray back into the oven and heat until oil is very hot.
 
5. Open oven door, slide the tray out, and carefully pour the batter in. 

6. Close the door and cook for 15 minutes without opening the oven door. 

Serve immediately with roast beef (or similar) veg and gravy.


**/


********************************************************************************
********************************************************************************
********************************************************************************


********************************************************************************
*
*                    Data Visualisation 
*
********************************************************************************


* the now famous auto dataset *

sysuse auto.dta, clear

* add number labels *

numlabel _all, add

summarize

* a simple pie chart *

graph pie, over(rep78)

graph pie, over(rep78) pie(2, explode)

* a simple bar chart *

graph bar (mean)mpg, over(foreign)

* an alternative version of the bar chart *

graph hbar (mean)mpg, over(foreign)

* a simple histogramm *

histogram mpg


/**


Task: Write some notes on these simple visualisations.


**/


/**


A real example from a research study.

Employment Status, Young People (age 16 -19) Great Britain 1974-81 
General Household Survey, Source Payne, Payne and Heath 1994 Table 3.1.


**/


* input the data *
clear
input year quals percent
1974 0 8
1974 1 5
1975 0 13
1975 1 7
1976 0 21
1976 1 8
1977 0 24
1977 1 8
1978 0 23
1978 1 9
1979 0 19
1979 1 8
1980 0 27
1980 1 12
1981 0 39
1981 1 16
end


* adding labels to the dataset *

label variable year "Year"
label variable quals "Qualifications"
label variable percent "Percentage Unemployed"
label define qual1 0 "None" 1 "Some"
label values quals  qual1
numlabel _all, add

* view the data *

summarize

* a simple table of percentage unemployed by year and qualifications *

tab year qual [fweight=percent]

* graphing the trend in youth unemployment *


* highlight and the run all of these line together*

#delimit ;

graph twoway (scatter percent year if quals==1, msymbol(circle)) 
             (scatter percent year if quals==0, msymbol(diamond)) , 
			 title("Percentage Unemployed by Qualifications and Year", 
			 size(large) justification(center) )
             subtitle(
			 "Young people (age 16-19) Great Britain 1974-81 GHS", 
			 size(medsmall) justification(left) ) 
             note("Calculated from Payne, Payne and Heath 1994 Table 3.1" 
             "", 
             justification(left) ) 
             legend( order(1 2)   
            label(1 "Qualifications") label(2 "No Qualifications") ) 
			scheme(s1mono);

delimit cr

/**

Task: Interpret the graph.

**/


/** 

a further thought about delimit

the #delimit command resets the character that marks the end of a command

in this case the semicolon ";"

"delimit cr" changes the back to the default i.e. carriage return

alternatively we could use the familiar line join " /// "

but this has to be done at the end of each line


**/


********************************************************************************


/**


Well Done!

Good luck with future data analyses using Stata.

**/


********************************************************************************


********************************************************************************
********************************************************************************
********************************************************************************


********************************************************************************
*
*                    Exercise
*
********************************************************************************

/**

1. Load your local copy of the hsb2 datasets 
(e.g. use "C:\temp_work\hsb2_20180712_v1.dta").

2. Construct a codebook.

3. Add labels to the variables id, female, race.

4. Rename the race "ethnicity".

5. Produce a scatter plot of reading test score "read" and writing test score
"write" and draw a line "lfit" summarizing the relationship.

6. What is the correlation between read and write?

7. Is the correlation between read and write significant?

8. Calculate the mean math test score.

9. Calculate the mean math test score for males and females.

10.Calculate a t-test for mean math test score by gender "female".

11. Add a variable label to the variable ses "socio-economic status".

12. Create a new variable for above and below average score in the math test.

13. Investigate the relationship between above and below average score 
in the math test and ses.

14. Load the data from Bishop (1969) from above.

15. Expand the data "expand n".

16. Browse the data...


The variables we will look at are

survived:
Child died within month = 0    
Child survived at least one month = 1

clinic:
Clinic A = 0
Clinic B = 1


17. Tabulate survival and clinic.

18. Is the clinic effect significant?
		  
19. What is the level of association between clinic and survival?

20. What have you learned from this exercise?		  
		  
**/


********************************************************************************
/**


Congratulations!


********************************************************************************

© Vernon Gayle, University of Edinburgh.

This file has been produced for AQMEN by Professor Vernon Gayle. 

Earlier versions have had assistance from Dr Roxanne
Connelly (University of York) and Dr Chris Playford (University of Exeter).

Any material in this file must not be reproduced, 
published or used for teaching without permission from Professor Vernon Gayle. 

Many of the ideas and examples presented in this document draw heavily on
previous work (see especially www.longitudinal.stir.ac.uk). 
We are grateful for the comments and feedback from participants of 
earlier workshops. Over the last decade much of this material has been 
developed in close collaboration with Professor Paul Lambert, University of 
Stirling. However, Professor Gayle is responsible for any errors in this file.

Professor Vernon Gayle (vernon.gayle@ed.ac.uk) 


********************************************************************************


**/

* End of file *






