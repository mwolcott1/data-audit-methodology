libname sas "../DATA/SAS_DS";
options linesize = 90 pagesize = 60 error = 1 compress = yes;

title "Test merge";

proc sort data = sas.index (keep = P_CODE) out = index nodupkey;
   by P_CODE;
   run;

proc sort data = sas.mmi (keep = P_CODE) out = mmi nodupkey;
   by P_CODE;
   run;

proc sort data = sas.normalized (keep = P_CODE) out = normalized nodupkey;
   by P_CODE;
   run;

proc sort data = sas.pop (keep = P_CODE) out = pop nodupkey;
   by P_CODE;
   run;

proc sort data = sas.vulnerability out = vulnerability nodupkey;
   by P_CODE;
   run;

data merged;
   merge index (in = a)
         mmi (in = b)
         normalized (in = c)
         pop (in = d)
         vulnerability (in = e);
   by P_CODE;
   in_index = a;
   in_mmi = b;
   in_normalized = c;
   in_pop = d;
   in_vulnerability = e;
   run;

proc datasets;
   delete index mmi normalized pop vulnerability;
   quit;

proc freq data  = merged;
   tables in_index * in_mmi * in_normalized * in_pop * in_vulnerability / list missing nocum nopercent;
   run;
