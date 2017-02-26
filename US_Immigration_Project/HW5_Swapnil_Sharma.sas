/*SwapnilSharma*/
/*Proc univariate for each file is run*/
proc import datafile="/home/sharmsp0/sasuser.v94/SQLSheet.xlsx" out=DM replace dbms=xlsx;
sheet=country;
getnames=yes;
run;
proc univariate data=DM;
run;

proc import datafile="/home/sharmsp0/sasuser.v94/SQLSheet.xlsx" out=DM1 replace dbms=xlsx;
sheet=pivot;
getnames=yes;
run;
proc univariate data=DM1;
run;

proc import datafile="/home/sharmsp0/sasuser.v94/SQLSheet.xlsx" out=DM2 replace dbms=xlsx;
sheet=classification;
getnames=yes;
run;
proc univariate data=DM2;
run;


proc import datafile="/home/sharmsp0/sasuser.v94/SQLSheet.xlsx" out=DM3 replace dbms=xlsx;
sheet=adoption;
getnames=yes;
run;
proc univariate data=DM3;
run;