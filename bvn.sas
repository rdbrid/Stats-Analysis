data a;
mux = 1.0;
muy = 2.0;
s11= 2.0;
s22 = 5.0;
rho = .5;
      do x = -5 to 6 by .1 ;
      do y = -5 to 10 by .1 ;
  w=exp(-0.5/(1-rho*rho)*((((x-mux)**2)/s11)+
(((y-muy)**2)/s22)-2*rho*(((x-mux))/sqrt(s11))*(((y-muy))/sqrt(s22))));
   z = w*(7/44)/(sqrt(s11*s22*(1-rho*rho))); 
output;
end;
end;
run;
PROC G3D DATA=A ;
PLOT x*y=z /grid rotate=45  ;
title 'joint density';
FOOTNOTE 'bivariate normal, X is N(1,2), Y is N(2,5), rho=0.5';
RUN;



