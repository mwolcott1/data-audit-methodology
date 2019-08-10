libname sas "../DATA/SAS_DS";
options linesize = 90 pagesize = 60 error = 1 compress = yes;

title "INDEX";

proc sort data = sas.index out = temp0 nodupkey;
   by _all_;
   run;

proc datasets;
   delete temp0;
   quit;

proc sort data = sas.index out = temp1 nodupkey;
   by P_CODE;
   run;

proc datasets;
   delete temp1;
   quit;

* Supposedly this is unique to VDC but duplicates exist - not appropriate as merge key;
proc sort data = sas.index out = temp2 nodupkey;
   by vdc_name;
   run;

proc datasets;
   delete temp2;
   quit;

proc sort data = sas.index out = temp3 nodupkey;
   by district;
   run;

proc datasets;
   delete temp3;
   quit;

* district should be subgroup of region;
proc sort data = sas.index out = temp31 nodupkey;
   by region district;
   run;

proc datasets;
   delete temp31;
   quit;

proc sort data = sas.index out = temp4 nodupkey;
   by region;
   run;
