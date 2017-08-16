options pageno=1 ls=65 ps=65 nodate formdlim='*';

ods html close;
DM log "OUT;CLEAR;LOG;CLEAR;" log continue ;
DM log 'next results; clear; cancel;' whostedit continue ;
ods html newfile=none;

title 'Univariate Q-Q plot';

data cars;
  input x1 x2;
  cards;
3 2.30
5 1.90
5 1.00
7 .70
7 .30
7 1.00
8 1.05
9 .45
10 .70
11 .30
;

/* proc print data=cars;
   var x1 x2; */

proc univariate data=cars normal plot;
var x1 x2;
run;



title 'Steps to Q-Q plot';

data Radio;
  infile 'C:\wangqin\STAT 625\JW\Data\T1-7.dat';
  input symptoms  activity  sleep  eat  appetite  skinreac;

/**************IN_CLASS METHOD******************************/ 

/*  The step leading to a Q_Q plot are:
   1. Order the original observations to get x(1),...,x(n) and their 
      corresponding probability values (1-1/2)/n,...(n-1/2)/n;
   2. Calculate the standard normal quantiles q(1),...,q(n); and
   3. Plot the pairs of observations(q(1),x(1)),...,(q(n),x(n))
      and examine the "straightness" of the outcomes.           */

data inv;
  do j = 1 to 98;
    phiinv = probit((j-0.5)/98);     *the standard normal quantiles;
    output;
  end;
run;

proc sort data = Radio out = sRadio;
  by symptoms;
run;

data nRadio;
  merge sRadio inv;
run;

proc print data = nRadio;
  var symptoms phiinv;

proc plot data = nRadio;
  plot symptoms * phiinv;
run;




title 'Bivariate Chi-square plot';

data sparrow;
  infile 'C:\wangqin\STAT 625\JW\Data\sparrow.dat';
  input birdno x1 x2 x3 x4 x5;
run;

proc corr data=sparrow cov outp=corrout noprint;
  var x1 x2 x3 x4 x5;
run;

proc iml;
  use corrout;
  read all var {x1 x2 x3 x4 x5} where(_TYPE_='COV') into S;
  read all var {x1 x2 x3 x4 x5} where(_TYPE_='MEAN') into xbartran;
  xbar=xbartran`;
/*  print S; to print out S */
/*  print xbar; to print out xbar */
  Sinv=inv(S);
/* create a mean vector. commas separate rows, spaces separate columns */
  /* (only one column in this case) */
  /* xbar={157.9796, 241.3265, 31.4592, 18.4694, 20.8265}; */
  close corrout;

  use sparrow;
  read all var {x1 x2 x3 x4 x5} into X;
/* print X; */
d=J(49,1,0); /* creates a matrix of 49 rows 1 column filled with zeros */
do i=1 to 49;
    d[i]=(X[i,]`-xbar)`*Sinv*(X[i,]`-xbar);
  end;
/* print d; */
close sparrow;
  outdata=X||d;
  outnames='x1'||'x2'||'x3'||'x4'||'x5'||'djsquare';
  create dists from outdata[colname=outnames];
  append from outdata;
  run;
/* proc print data=dists;*/
proc sort data=dists;
  by djsquare;
run;
data dists;
  set dists;
  chisq=cinv(((_N_-.5)/49),5); /* cinv(x,d) returns the xth quantile of the */
run;                         /* chisquare dist'n with d degrees of freedom */
/* That is, if q=cinv(x,d), then for Y~chi^2(d), Pr(Y<q)=x */
proc gplot data=dists;
  plot djsquare*chisq;
  label djsquare='Mahalanobis d_j^2'
        chisq='Chi-Square Quantile';
run;

