options linesize = 90 pagesize = 60 error = 1 compress = yes;
%include "varlen.mac";

title "POP";

data pop;
   infile '../DATA/RAW/pop.csv' dsd dlm = ',' lrecl = 100000 termstr = CRLF firstobs = 2 truncover;
   input
      p_code : $400.
      fid : $400.
      the_geom : $32767.
      area
      perimeter
      dist_id
      survey_nam : $400.
      vdc_id
      district : $400.
      vdc_name : $400.
      vdc_code
      zone_name : $400.
      region : $400.
      hhs2011
      pop_2011
      male2011
      female2011
      popden_2011;
   %varlen (p_code);
   %varlen (fid);
   %varlen (the_geom);
   %varlen (survey_nam);
   %varlen (district);
   %varlen (vdc_name);
   %varlen (zone_name);
   %varlen (region);
   keep l_:;
   run;

proc means data = pop max maxdec = 0;
   var l_:;
   run;
