libname sas "../DATA/SAS_DS";
options linesize = 90 pagesize = 60 error = 1 compress = yes;

title "POP";

proc sort data = sas.pop out = temp0 nodupkey;
   by _all_;
   run;

proc datasets;
   delete temp0;
   quit;

proc sort data = sas.pop out = temp1 nodupkey;
   by P_CODE;
   run;

proc datasets;
   delete temp1;
   quit;

proc sort data = sas.pop out = temp2 nodupkey;
   by fid;
   run;

proc datasets;
   delete temp2;
   quit;

proc sort data = sas.pop out = temp3 nodupkey;
   by vdc_code;
   run;

proc datasets;
   delete temp3;
   quit;

* Supposedly this is unique to VDC but duplicates exist - not appropriate as merge key;
proc sort data = sas.pop out = temp4 nodupkey;
   by vdc_name;
   run;

proc datasets;
   delete temp4;
   quit;

* In theory this is the same as the VDC name;
proc sort data = sas.pop out = temp5 nodupkey;
   by survey_nam;
   run;

proc datasets;
   delete temp5;
   quit;

proc sort data = sas.pop out = temp6 nodupkey;
   by district;
   run;

proc datasets;
   delete temp6;
   quit;

* district should be subgroup of region and zone;
proc sort data = sas.pop out = temp61 nodupkey;
   by region zone_name district;
   run;

proc datasets;
   delete temp61;
   quit;

proc sort data = sas.pop out = temp62 nodupkey;
   by zone_name district;
   run;

proc datasets;
   delete temp62;
   quit;

proc sort data = sas.pop out = temp63 nodupkey;
   by region district;
   run;

proc datasets;
   delete temp63;
   quit;

proc sort data = sas.pop out = temp7 nodupkey;
   by zone_name;
   run;

proc datasets;
   delete temp7;
   quit;

* zone should be subgroup of region;
proc sort data = sas.pop out = temp71 nodupkey;
   by region zone_name;
   run;

proc datasets;
   delete temp71;
   quit;

proc sort data = sas.pop out = temp8 nodupkey;
   by region;
   run;
