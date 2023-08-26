/*IMPORT DATA*/
proc import datafile="/home/u62868661/Datasets/Descriptives/Sleep.csv"
dbms=csv
out=df
replace;
run;

/*DESCRIPTIVE TABLE*/
proc means data=df chartype mean std min max median n range vardef=df clm 
		alpha=0.05 q1 q3 qrange qmethod=os;
	var extra;
	class group;
run;

/*HISTOGRAMS*/
proc univariate data=df vardef=df noprint;
	var extra;
	class group;
	histogram extra / normal(noprint) kernel;
	inset mean std min max median n q1 q3 qrange / position=nw;;
run;

/*BOXPLOT*/
proc boxplot data=df;
	plot (extra)*group / boxstyle=schematic;
	insetgroup mean stddev min max n q1 q2 q3 range;
run;