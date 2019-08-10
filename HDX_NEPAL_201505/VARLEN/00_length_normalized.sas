options linesize = 90 pagesize = 60 error = 1 compress = yes;
%include "varlen.mac";

title "NORMALIZED";

data normalized;
   infile '../DATA/RAW/normalized.csv' dsd dlm = ',' lrecl = 1000 termstr = CRLF firstobs = 2 truncover;
   input
      p_code : $400.
      vdc_name : $400.
      district : $400.
      region : $400.
      mmi_max
      mmi_unlog
      mmi_max
      pop_2011
      pop_2011_norm
      popden_2011
      tmp_popden_2011_norm : $400. /* there are character values - turns out they are "#NUM!" */
      hse_wall_percent_high_risk
      hse_wall_percent_high_risk_norm
      hse_roof_percent_high_risk
      hse_roof_percent_high_risk_norm
      human_poverty_index
      human_poverty_index_norm;
   %varlen (p_code);
   %varlen (vdc_name);
   %varlen (district);
   %varlen (region);
   %varlen (tmp_popden_2011_norm);
   keep l_:;
   run;

proc means data = normalized max maxdec = 0;
   var l_:;
   run;
