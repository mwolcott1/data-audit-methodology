libname sas '../DATA/SAS_DS';
options linesize = 90 pagesize = 60 error = 1 compress = yes;
%include "pop.fmt";

title "NORMALIZED";

ods html body = "03_freq_normalized.xls";
proc freq data = sas.normalized;
   tables
      p_code
      vdc_name
      district
      region
      mmi_max
      mmi_unlog
      mmi_max_norm
      pop_2011
      pop_2011_norm
      popden_2011
      popden_2011_norm
      hse_wall_percent_high_risk
      hse_wall_percent_high_risk_norm
      hse_roof_percent_high_risk
      hse_roof_percent_high_risk_norm
      human_poverty_index
      human_poverty_index_norm
      / missing nocum;
   format p_code vdc_name $pop.
          mmi_max mmi_unlog mmi_max_norm pop_2011 pop_2011_norm popden_2011 popden_2011_norm
          hse_wall_percent_high_risk hse_wall_percent_high_risk_norm hse_roof_percent_high_risk
          hse_roof_percent_high_risk_norm human_poverty_index human_poverty_index_norm pop.;
   run;

proc means data = sas.normalized nmiss mean min p1 q1 median q3 p99 max maxdec = 2;
   var mmi_max mmi_unlog mmi_max_norm pop_2011 pop_2011_norm popden_2011 popden_2011_norm
       hse_wall_percent_high_risk hse_wall_percent_high_risk_norm hse_roof_percent_high_risk
       hse_roof_percent_high_risk_norm human_poverty_index human_poverty_index_norm;
   run;
ods html close;
