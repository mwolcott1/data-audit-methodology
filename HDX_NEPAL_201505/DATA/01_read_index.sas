libname sas "SAS_DS";
options linesize = 90 pagesize = 60 error = 1 compress = yes;

title "INDEX";

data index;
   infile 'RAW/index.csv' dsd dlm = ',' lrecl = 1000 termstr = CRLF firstobs = 2 truncover;
   input
      p_code : $12.
      vdc_name : $24.
      district : $14.
      region : $11.
      hazard_intensity
      exposure_population
      vulnerability_housing
      vulnerability_poverty
      vulnerability
      severity
      severity_normalized
      severity_category : $11.;
   run;

proc print data = index (obs = 5);
   run;

proc sort data = index out = sas.index nodupkey;
   by p_code;
   run;

proc contents data = sas.index position;
   run;
