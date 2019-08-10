libname sas "../DATA/SAS_DS";
options linesize = 90 pagesize = 60 error = 1 compress = yes;
%include "pop.fmt";

title "POP";

ods html body = "03_freq_pop.xls";
proc freq data = sas.pop;
   tables
      p_code
      fid
      the_geom
      area
      perimeter
      dist_id
      survey_nam
      vdc_id
      district
      vdc_name
      vdc_code
      zone_name
      region
      hhs2011
      pop_2011
      male2011
      female2011
      popden_2011
      / missing nocum;
   format p_code fid the_geom survey_nam vdc_name $pop.
          area perimeter vdc_code hhs2011 pop_2011 male2011 female2011 popden_2011 pop.;
   run;

proc means data = sas.pop nmiss mean min p1 q1 median q3 p99 max maxdec = 2;
   var area perimeter hhs2011 pop_2011 male2011 female2011 popden_2011;
   run;
ods html close;
