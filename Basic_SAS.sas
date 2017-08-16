
options pageno=1 ls=68 ps=75 nodate formdlim='*';

* Example 1:
* calculate the mean for variable x;
data one; 
 input x; 
 cards; 
  3 
  4 
  7 
 ;


 proc means; 
  var x; 
  title 'mean of x';
 run; 




* Example 2:
* Read internal data into SAS data set uspresidents;

DATA uspresidents;
INPUT President $ Party $ Number;
CARDS;
Adams F 2
Lincoln R 16
Grant R 18
Kennedy D 35
;
RUN;

PROC PRINT DATA=uspresidents;
TITLE "US PRESIDENTS";
RUN;




* Example 3:
*  Read in the data set from an external file;
 data salary;
infile 'C:\wangqin\STAT 625\SAS_R_Program\salary.txt';
input type $ 2 id 3-8 gender $ yrstart salary;
run;

* Print the data set to make sure it has been correctly read into SAS;
proc print data=salary;
run;

* Summary statistics for variable "salary";
proc means data=salary mean mode median min max std;
var salary;
run;

* Histogram of variable "salary";
proc univariate data=salary;
var salary;
histogram salary;
title "Histogram of Salary";
run;

* Get Box-plot for 3 different groups;
proc sort data=salary;
by type;
run;

proc boxplot data=salary;
plot salary*type;
title "Side-By-Side Box-plot for 3 groups";
run;



