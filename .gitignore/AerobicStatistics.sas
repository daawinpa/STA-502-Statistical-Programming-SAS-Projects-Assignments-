/*****************************************************************************************
   AerobicStatistics= 28aug2015.sas

   Author : Palma Daawin
   Purpose: To produce summary statistics is for each of the data variables

   Description of data: These measurements were made on men involved in a physical fitness course at N.C.
  State University.The variables are Age (years), Weight (kg), Oxygen intake rate (ml per kg body weight per minute),
  time to run 1.5 miles (minutes),heart rate while resting, heart rate while running (same time Oxygen rate measured),
  and maximum heart rate recorded while running.  

   Directory
   Program file: "SASPrograms\SAShomework\AerobicStatistics.sas"
   Data file: set macro variable FITNESSFILE below 
   Output file: set macro variable SUMSTATFILE below
   
  *****************************************************************************************/

/* User should set these values... */
  * this is where  data is located;
%LET fitnessfile = C:\Users\Palma\Desktop\SASPrograms\SAShomework\aerobicfitness.txt;
  * this is where you'd like your analysis sent (Word document);
%LET sumstatfile = C:\Users\Palma\Desktop\SASPrograms\SAShomework\summary-output.rtf;

title 'Aerobic Fitness Summary Information';

/* DATA step obtains and prepares the data */
data aerobicfitness;

  	 /* using this data file for input */
 	 infile "&fitnessfile";

  	 /* indicate what to expect on each line of data */
  	 input age weight oxygenrate runtime heartrestrate heartrunrate  maximumheartrate @@ ;

run;

/* PROC PRINT - show the data */
proc print data=aerobicfitness;
run;

/* send output generated below to this file (RTF = Word document) */
ods rtf file="&sumstatfile" 
run;
/* PROC UNIVARIATE - provides a summary analysis of the data */
proc univariate data=aerobicfitness;
run;


/* close the file in SAS so we can open it in Word */
ods rtf close;

