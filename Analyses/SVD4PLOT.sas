************************************************************************;
*     This file contains MACRO SVD4PLOT that performs Singular Value   *;
*     Decomposition for U-U plots.                                     *;
************************************************************************;

TITLE "Sigular Value Decomposition for U-U plots";

OPTIONS NODATE NOCENTER LS=72;
DATA COAL;
INPUT X1 X2 X3 Y ID $;
CARDS;
1.5 6.0 1315 243 A
1.5 6.0 1315 261 B
1.5 9.0 1890 244 C
1.5 9.0 1890 285 D
2.0 7.5 1575 202 E
2.0 7.5 1575 180 F
2.0 7.5 1575 183 G
2.0 7.5 1575 207 H
2.5 9.0 1315 216 I
2.5 9.0 1315 160 J
2.5 6.0 1890 104 K
2.5 6.0 1890 110 L
;

************************************************************************;
MACRO SVD4PLOT

PROC IML;  USE DATASET;
           READ ALL INTO X VAR {VARLIST};
           INTRCPT={INTRCEPT};
           N=NROW(X);

IF INTRCPT={YES} THEN DO;

   * * * Centering and Scaling of the variables in the VARLIST * * *;
     MEAN =X (|+, |)/N;  X=X - J(N,{1})*MEAN;  SS=X(|##, |);
     X=X*DIAG({1}/SQRT(SS`));
     ONE=J(N,1,1); X=ONE||X;
*    XNAMES={INTERCEP}||XNAMES;
     PRINT
     'The matrix X, apart from intercept, has been centered and scaled.';
     PRINT X (|FORMAT=8.5|);

   END;

ELSE IF INTRCPT={NO} THEN DO;

   * * * Scaling of the variables in the VARLIST * * *;
     SS=X(|##, |);
     X=X*DIAG({1}/SQRT(SS`));
     PRINT
     'The matrix X has been only scaled.';
     PRINT X (|FORMAT=8.5|);

   END;

* * * Singular Value Decomposition * * *;

CALL SVD(U,Q,V,X);
L=Q##2;
PRINT /;
PRINT
"U consists of eigenvectors associated with nonzero eigenvalues of XX'.";
PRINT
"           In U-U plots, I suggest to use an ID variable              ";
PRINT
"           to identify the observations with problems.                ";
PRINT U (|FORMAT=8.5|);
PRINT ' ';
PRINT "Q, a vector of singular values in descending order, contains";
PRINT "the square roots of nonzero eigenvalues of X'X and XX'.";
PRINT Q (|FORMAT=12.8|);
PRINT ' ';
PRINT "The vector L contains nonzero eigenvalues of X'X and XX'.";
PRINT L (|FORMAT=12.8|);
PRINT ' ';
PRINT "The matrix V consists of eigenvectors of X'X.";
PRINT V (|FORMAT=8.5|);
CREATE U FROM U; APPEND FROM U;

%
************************************************************************;

  MACRO VARLIST X1 X2 X3  %
  MACRO DATASET COAL %
  MACRO INTRCEPT YES %
  SVD4PLOT

DATA TWO;
     MERGE COAL U;
     RENAME COL1=U0 COL2=U1 COL3=U2 COL4=U3;
PROC PRINT;
PROC PLOT; PLOT U1*U2=ID
                U1*U3=ID
                U2*U3=ID;

**********************************;

  MACRO VARLIST X1 X2 X3 Y %
  MACRO DATASET COAL %
  MACRO INTRCEPT YES %
  SVD4PLOT

DATA ONE;
     MERGE COAL U;
     RENAME COL1=U0 COL2=U1 COL3=U2 COL4=U3 COL5=U4;

PROC PRINT;
PROC PLOT; PLOT U1*U2=ID
                U1*U3=ID
                U1*U4=ID
                U2*U3=ID
                U2*U4=ID
                U3*U4=ID;


quit;
