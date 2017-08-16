OPTIONS NODATE LS=80;
TITLE 'COLLEGE DATA';
DATA College.Classification1;
INPUT
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
INEXPFTE1
Value_Skills_LinkedIN1
;



PROC REG Data = College.Classification1;
	MODEL real_earn50_p10_2011 = 
count_wne_p102011
hbcu
catholic
non_religious
pct_Treasury_Cohort2001_2002
Prime_SubBA2006
PCT_SubBA_awards2006
real_fam_inc2001
first_gen2001
pct_fedloan2001
imputed_standard_score2001
grad_rate2001_2002
pct_STEM2006
avgfacsal2001
INEXPFTE1;

RUN;

