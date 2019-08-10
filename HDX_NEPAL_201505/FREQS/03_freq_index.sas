libname sas "../DATA/SAS_DS";
options linesize = 90 pagesize = 60 error = 1 compress = yes;
%include "pop.fmt";

title "INDEX";

ods html body = "03_freq_index.xls";
proc freq data = sas.index;
   tables
      p_code
      vdc_name
      district
      region
      hazard_intensity
      exposure_population
      vulnerability_housing
      vulnerability_poverty
      vulnerability
      severity
      severity_normalized
      severity_category
      / missing nocum;
   format p_code vdc_name $pop.
          hazard_intensity exposure_population vulnerability_housing vulnerability_poverty
          vulnerability severity severity_normalized pop.;
   run;

proc means data = sas.index nmiss mean min p1 q1 median q3 p99 max maxdec = 2;
   var hazard_intensity exposure_population vulnerability_housing vulnerability_poverty
       vulnerability severity severity_normalized;
   run;
ods html close;
