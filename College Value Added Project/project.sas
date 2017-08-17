data final;
set sepak;
INEXPFTE1=INEXPFTE+0;
Value_Skills_LinkedIN1=Value_Skills_LinkedIN+0;
run;

DATA nfinal(DROP = INEXPFTE Value_Skills_LinkedIN); 
SET final;
RUN;

data khar;
   set nfinal (obs=1220);
run;



proc standard data=khar out=outkhar replace; 
run;


proc means data=sepehr.outkhar;
var INEXPFTE1;
run;

data classification;
set sepehr.outkhar;
class=.;
IF (INEXPFTE1>8320.46) THEN class=1;
IF (INEXPFTE1<8320.46) THEN class=0;

run;

proc freq data=classification;
run;



DATA classification1(DROP = unitid); 
SET classification;
RUN;



Proc Discrim  data=sepehr.classification1 outstat=classout Pool=no listerr
            crossvalidate; /* pcov list;*/
           Class class; /* Pool=yes for equal covariances; no for
             /* unequal covariances; test for testing the equality */
        priors prop; 
        var 
Aggregated_Earnings2011
count_wne_p102011
hbcu
catholic
non_religious
pct_Treasury_Cohort2001_2002
Prime_SubBA2006
PCT_SubBA_awards2006
VA_earn2001
VA_pay
real_earn50_p10_2011
payscale_mid2015
predicted_earn2001
predicted_pay
real_fam_inc2001
first_gen2001
pct_fedloan2001
imputed_standard_score2001
grad_rate2001_2002
cur_value2006
pct_STEM2006
avgfacsal2001
VA_earn2001_XFACT
B01_Zgrad_rate2001_2002
B01_Zpct_STEM2006
B01_Zlncur_value2006
B01_Zavgfacsal2001
VA_pay_XFACT
BP_Zgrad_rate2001_2002
BP_Zpct_STEM2006
BP_Zlncur_value2006
BP_Zavgfacsal2001
NCVA_earn2001
NCVA_pay
Value_Skills_LinkedIN1; 
proc print data=classout;
run;



proc logistic data = sepehr.classification1;
  class class;
  model class = 
Aggregated_Earnings2011
count_wne_p102011
hbcu
catholic
non_religious
pct_Treasury_Cohort2001_2002
Prime_SubBA2006
PCT_SubBA_awards2006
VA_earn2001
VA_pay
real_earn50_p10_2011
payscale_mid2015
predicted_earn2001
predicted_pay
real_fam_inc2001
first_gen2001
pct_fedloan2001
imputed_standard_score2001
grad_rate2001_2002
cur_value2006
pct_STEM2006
avgfacsal2001
VA_earn2001_XFACT
B01_Zgrad_rate2001_2002
B01_Zpct_STEM2006
B01_Zlncur_value2006
B01_Zavgfacsal2001
VA_pay_XFACT
BP_Zgrad_rate2001_2002
BP_Zpct_STEM2006
BP_Zlncur_value2006
BP_Zavgfacsal2001
NCVA_earn2001
NCVA_pay
Value_Skills_LinkedIN1/ clparm=wald; 
run;

















proc standard data=outkhar MEAN=0 STD=1 OUT=TFINAL;
VAR 
unitid
Aggregated_Earnings2011
count_wne_p102011
hbcu
catholic
non_religious
pct_Treasury_Cohort2001_2002
Prime_SubBA2006
PCT_SubBA_awards2006
VA_earn2001
VA_pay
real_earn50_p10_2011
payscale_mid2015
predicted_earn2001
predicted_pay
real_fam_inc2001
first_gen2001
pct_fedloan2001
imputed_standard_score2001
grad_rate2001_2002
cur_value2006
pct_STEM2006
avgfacsal2001
VA_earn2001_XFACT
B01_Zgrad_rate2001_2002
B01_Zpct_STEM2006
B01_Zlncur_value2006
B01_Zavgfacsal2001
VA_pay_XFACT
BP_Zgrad_rate2001_2002
BP_Zpct_STEM2006
BP_Zlncur_value2006
BP_Zavgfacsal2001
NCVA_earn2001
NCVA_pay
Value_Skills_LinkedIN1
;
RUN;




proc princomp cov data=OUTKHAR out=pcscore outstat=result;

       var 

Aggregated_Earnings2011
count_wne_p102011
hbcu
catholic
non_religious
pct_Treasury_Cohort2001_2002
Prime_SubBA2006
PCT_SubBA_awards2006
VA_earn2001
VA_pay
real_earn50_p10_2011
payscale_mid2015
predicted_earn2001
predicted_pay
real_fam_inc2001
first_gen2001
pct_fedloan2001
imputed_standard_score2001
grad_rate2001_2002
cur_value2006
pct_STEM2006
avgfacsal2001
VA_earn2001_XFACT
B01_Zgrad_rate2001_2002
B01_Zpct_STEM2006
B01_Zlncur_value2006
B01_Zavgfacsal2001
VA_pay_XFACT
BP_Zgrad_rate2001_2002
BP_Zpct_STEM2006
BP_Zlncur_value2006
BP_Zavgfacsal2001
NCVA_earn2001
NCVA_pay
Value_Skills_LinkedIN1
;
proc print data=pcscore;       
      
       run;




proc princomp cov data=TFINAL out=pcscore outstat=result;

       var 
unitid
Aggregated_Earnings2011
count_wne_p102011
hbcu
catholic
non_religious
pct_Treasury_Cohort2001_2002
Prime_SubBA2006
PCT_SubBA_awards2006
VA_earn2001
VA_pay
real_earn50_p10_2011
payscale_mid2015
predicted_earn2001
predicted_pay
real_fam_inc2001
first_gen2001
pct_fedloan2001
imputed_standard_score2001
grad_rate2001_2002
cur_value2006
pct_STEM2006
avgfacsal2001
VA_earn2001_XFACT
B01_Zgrad_rate2001_2002
B01_Zpct_STEM2006
B01_Zlncur_value2006
B01_Zavgfacsal2001
VA_pay_XFACT
BP_Zgrad_rate2001_2002
BP_Zpct_STEM2006
BP_Zlncur_value2006
BP_Zavgfacsal2001
NCVA_earn2001
NCVA_pay
Value_Skills_LinkedIN1
;
proc print data=pcscore;       
      
       run;



       proc print data=pcscore;       
       var prin1 prin2 prin3;
       run;
