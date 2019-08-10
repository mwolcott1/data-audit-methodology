options linesize = 90 pagesize = 60 error = 1 compress = yes;
%include "varlen.mac";

title "MMI";

data mmi;
   infile '../DATA/RAW/mmi.csv' dsd dlm = ',' lrecl = 1000 termstr = CRLF firstobs = 2 truncover;
   input
      p_code : $400.
      mmi_max
      mmi_min;
   %varlen (p_code);
   keep l_:;
   run;

proc means data = mmi max maxdec = 0;
   var l_:;
   run;
