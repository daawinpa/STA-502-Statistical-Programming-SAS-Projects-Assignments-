
/************************************************************************************  
   Age CLassification : 04sept2015.sas

   Author :     Palma Daawin
   Purpose:     This progam  inputs the fitness data from a text file and creates an
                indicator variable Younger that is true (i.e., its value is 1) 
			    when age is less than 50 and is false (value 0) otherwise and provides a 
			    summary of the categorization of the data using the MEANS procedure. 
 
   Directory:   Program file: "SASPrograms\SAShomework\ageclassification.sas"
   				Data file:    set macro variable FITNESSFILE below 
   				Output file:  set macro variable SUMSTATFILE below
  
  ************************************************************************************/

 * this is where  data is located;
%LET fitnessfile = C:\Users\Palma\Desktop\SASPrograms\SAShomework\aerobicfitness.txt;
  * this is where I would like my analysis sent (Word document);
%LET sumstatfile = C:\Users\Palma\Desktop\SASPrograms\SAShomework\age-classification.rtf;


/* DATA step obtains and prepares the data * */
data fitness_2categories;
	 /* using this data file for input */
 	  infile "&fitnessfile";
  
	  /* indicate what to expect on each line of data */
	  input age weight oxygenrate runtime heartrestrate heartrunrate maximumheartrate @@ ;

	  if age<50  then Younger = "1";    *creates a variable Younger(1) if age is less than 50;
	  if age >= 50 then Younger = "0" ; *creates a variable Younger(0) if age is greater or equal to 50;
	  
run;

/*prints the data*/
 proc print data=fitness_2categories;
run;

/* send output generated below to this file (RTF = Word document) */
ods rtf file="&sumstatfile" ;

/* provides a summary of the categorization of the data using MEANS procedure */
proc means data=fitness_2categories;
     class Younger;
     title'Numerical summary of the fitness data, grouped according two age categories';
run;

ods rtf close;
