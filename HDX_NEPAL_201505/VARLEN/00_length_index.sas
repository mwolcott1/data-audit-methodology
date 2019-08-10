options linesize = 90 pagesize = 60 error = 1 compress = yes;
%include "varlen.mac";

title "INDEX";

data index;
   infile '../DATA/RAW/index.csv' dsd dlm = ',' lrecl = 1000 termstr = CRLF firstobs = 2 truncover;
   input
      p_code : $400.
      vdc_name : $400.
      district : $400.
      region : $400.
      hazard_intensity
      exposure_population
      vulnerability_housing
      vulnerability_poverty
      vulnerability
      severity
      severity_normalized
      severity_category : $400.;
   %varlen (p_code);
   %varlen (vdc_name);
   %varlen (district);
   %varlen (region);
   %varlen (severity_category);
   keep l_:;
   run;

proc means data = index max maxdec = 0;
   var l_:;
   run;
