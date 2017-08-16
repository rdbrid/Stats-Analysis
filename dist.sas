
options pageno=1 ls=85 ps=75 nodate formdlim='*' nodate;

data lumber;
  input stiff bend;
  cards;
  1232   4175
  1115   6652
  2205   7612
  1897  10914
  1932  10850
  1612   7627
  1598   6954
  1804   8365
  1752   9469
  2067   6410
  2365  10327
  1646   7320
  1579   8196
  1880   9709
  1773  10370
  1712   7749
  1932   6818
  1820   9307
  1900   6457
  2426  10102
  1558   7414
  1470   7556
  1858   7833
  1587   8309
  2208   9559
  1487   6255
  2206  10723
  2332   5430
  2540  12090
  2322  10072
  ;
run;

proc plot data=lumber;
  plot stiff*bend='*';
run;

proc corr data=lumber cov noprob outp=corrout;
  var stiff bend;
run;

proc print data=corrout;
run;

proc iml;
  use corrout;
  read all var {stiff bend} where(_TYPE_='COV') into S;
  read all var {stiff bend} where(_TYPE_='CORR') into R;
  read all var {stiff bend} where(_TYPE_='MEAN') into xbartran;
  xbar=xbartran`;
  close corrout;
  use lumber;
  read all var {stiff bend} into X;

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

quit;

