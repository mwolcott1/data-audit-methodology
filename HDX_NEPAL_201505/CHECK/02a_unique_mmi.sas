libname sas '../DATA/SAS_DS';
options linesize = 90 pagesize = 60 error = 1 compress = yes;

title "MMI";

proc sort data = sas.mmi out = temp0 nodupkey;
   by _all_;
   run;

proc datasets;
   delete temp0;
   quit;

proc sort data = sas.mmi out = temp1 nodupkey;
   by p_code;
   run;
