libname sas 'SAS_DS';
options linesize = 90 pagesize = 60 error = 1 compress = yes;

title "NORMALIZED";

data normalized;
   infile 'RAW/normalized.csv' dsd dlm = ',' lrecl = 1000 termstr = CRLF firstobs = 2 truncover;
   input
      p_code : $12.
      vdc_name : $24.
      district : $14.
      region : $11.
      mmi_max
      mmi_unlog
      mmi_max_norm
      pop_2011
      pop_2011_norm
      popden_2011
      tmp_popden_2011_norm $ /* there are character values - turns out they are "#NUM!" */
      hse_wall_percent_high_risk
      hse_wall_percent_high_risk_norm
      hse_roof_percent_high_risk
      hse_roof_percent_high_risk_norm
      human_poverty_index
      human_poverty_index_norm;
   if tmp_popden_2011_norm = "#NUM!" then popden_2011_norm =.;
   else popden_2011_norm = input (tmp_popden_2011_norm, 8.);
   drop tmp_popden_2011_norm;
   run;

proc print data = normalized (obs = 5);
   run;

proc sort data = normalized out = sas.normalized nodupkey;
   by p_code;
   run;

proc contents data = sas.normalized position;
   run;
