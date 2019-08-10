libname sas 'SAS_DS';
options linesize = 90 pagesize = 60 error = 1 compress = yes;

title "MMI";

data mmi;
   infile 'RAW/mmi.csv' dsd dlm = ',' lrecl = 1000 termstr = CRLF firstobs = 2 truncover;
   input
      p_code : $12.
      mmi_max
      mmi_min;
   run;

proc print data = mmi (obs = 5);
   run;

proc sort data = mmi out = sas.mmi nodupkey;
   by p_code;
   run;

proc contents data = sas.mmi position;
   run;
