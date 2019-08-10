libname sas "SAS_DS";
options linesize = 90 pagesize = 60 error = 1 compress = yes;

title "POP";

data pop;
   infile 'RAW/pop.csv' dsd dlm = ',' lrecl = 100000 termstr = CRLF firstobs = 2 truncover;
   input
      p_code : $12.
      fid : $31.
      the_geom : $32767. /* this field is corrupt - just read in and ignore */
      area
      perimeter
      dist_id
      survey_nam : $35.
      vdc_id
      district : $14.
      vdc_name : $24.
      vdc_code
      zone_name : $10.
      region : $11.
      hhs2011
      pop_2011
      male2011
      female2011
      popden_2011;
   run;

proc print data = pop (obs = 5);
   run;

proc sort data = pop out = sas.pop nodupkey;
   by p_code;
   run;

proc contents data = sas.pop position;
   run;
