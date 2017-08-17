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

proc means data=College.Classification1 mean mode median min max std;
var real_earn50_p10_2011;
run;

proc plot data=College.Classification1;
  plot INEXPFTE1*real_earn50_p10_2011='*';
run;

proc corr data=College.Classification1 cov noprob outp=corrout;
  var INEXPFTE1 real_earn50_p10_2011;
run;

proc print data=corrout;
run;

proc iml;
  use corrout;
  read all var {INEXPFTE1 real_earn50_p10_2011} where(_TYPE_='COV') into S;
  read all var {INEXPFTE1 real_earn50_p10_2011} where(_TYPE_='CORR') into R;
  read all var {INEXPFTE1 real_earn50_p10_2011} where(_TYPE_='MEAN') into xbartran;
  xbar=xbartran`;
  close corrout;
  use College.Classification1;
  read all var {INEXPFTE1 bend} into X;

  detS=det(S);
  detR=det(R);
  trS=trace(S);
  trR=trace(R);

  print detS detR trS trR xbar;

  Sinv=inv(S);

  /* First compute Euclidean distances */
  ed2=sqrt((X[2,]`-xbar)`*(X[2,]`-xbar));
  ed28=sqrt((X[28,]`-xbar)`*(X[28,]`-xbar));

  /* Next compute Karl Pearson distances 
  V=j(2,2,0);
  V[1,1]=S[1,1];
  V[2,2]=S[2,2];
  Vinv=inv(V);
  kpd2=sqrt((X[2,]`-xbar)`*Vinv*(X[2,]`-xbar));
  kpd28=sqrt((X[28,]`-xbar)`*Vinv*(X[28,]`-xbar)); */

  /* Now compute Mahalanobis distances */
  md2=sqrt((X[2,]`-xbar)`*Sinv*(X[2,]`-xbar));
  md28=sqrt((X[28,]`-xbar)`*Sinv*(X[28,]`-xbar));

  print ed2 ed28;
 * print kpd2 kpd28;
  print Sinv;
  print md2 md28;


data College.Classification1;
  do j = 1 to 1220;
    phiinv = probit((j-0.5)/1220);     *the standard normal quantiles;
    output;
  end;
run;
