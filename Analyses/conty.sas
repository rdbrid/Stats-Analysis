
* goptions device=lj3sips gsfname=t1 gsfmode=replace;

data a;
mux = 1.0;
muy = 2.0;
s11= 2.0;
s22 = 5.0;
rho = 0.5;
      do x = -2 to 3 by .1 ;
      do y = -2 to 3 by .1 ;
  w=exp(-0.5/(1-rho*rho)*((((x-mux)**2)/s11)+
(((y-muy)**2)/s22)-2*rho*(((x-mux))/sqrt(s11))*(((y-muy))/sqrt(s22))));
   f = w*(7/44)/(sqrt(s11*s22*(1-rho*rho))); 
output;
end;
end;
run;
PROC gcontour DATA=A ;
PLOT x*y=f / levels = 0.0552809 ;
title 'contour plots for the joint density';
FOOTNOTE 'bivariate normal, X is N(1,2), Y is N(2,5), rho= 0.5';
RUN;

PROC gcontour DATA=A ;
PLOT x*y=f ;
title 'contour plots for the joint density';
FOOTNOTE 'bivariate normal, X is N(1,2), Y is N(2,5), rho= 0.5';
RUN;
