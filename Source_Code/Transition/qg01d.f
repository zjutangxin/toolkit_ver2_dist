* COPYRIGHT (c) 1974 AEA Technology
*######DATE 20 April 1994
C       Toolpack tool decs employed.
C       Arg dimensions made *.
C
C** QG01AD - A FUNCTION ROUTINE TO INTEGRATE A CUBIC SPLINE
C** BETWEEN LIMITS WHICH ARE KNOT POINTS.  DOUBLE PRECISION
C** ARITHEMATIC IS USED THROUGHOUT.
C**
      DOUBLE PRECISION FUNCTION QG01AD(K1,K2,N,X,S,D)
C     .. Scalar Arguments ..
      INTEGER K1,K2,N
C     ..
C     .. Array Arguments ..
      DOUBLE PRECISION D(*),S(*),X(*)
C     ..
C     .. Local Scalars ..
      DOUBLE PRECISION H,R,SGN,SIXTH
      INTEGER I,K,L,L1
C     ..
C     .. Intrinsic Functions ..
      INTRINSIC MAX0,MIN0
C     ..
C     .. Executable Statements ..
C**
C** K1 AND K2 DEFINE THE LOWER AND UPPER LIMITS OF THE INTEGRATION
C**           I.E. THE INTEGRAL IS EVALUATED FROM THE KNOT POINT
C**           X(K1) TO THE KNOT POINT X(K2).
C** N, X, S AND D DEFINE THE SPLINE AND ARE THE NUMBER OF KNOTS,
C**           THE KNOTS, THE SPLINE VALUES AT THE KNOTS AND THE
C**           FIRST DERIVATIVE VALUES AT THE KNOTS, RESPECTIVELY.
C** QG01AD     WILL BE RETURNED SET TO THE DOUBLE PRECISION VALUE
C**           OF THE INTEGRAL.  THE USER MAY DEFINE QG01AD TO BE
C**           EITHER REAL*4 OR REAL*8.
C**
C**                            12TH MARCH 1974
C**
C**
C**  MAKE SURE WE INTEGRATE OVER INCREASING X
      K = MAX0(MIN0(K1,K2),1)
      L = MIN0(MAX0(K1,K2),N)
      SGN = 1D0
      IF (K1.GT.K2) SGN = -1D0
C**
      SIXTH = 1D0/6D0
      R = 0D0
      IF (K.GE.L) GO TO 2
      L1 = L - 1
C**
C**  ACCUMULATE INTEGRAL DOUBLE PRECISION
      DO 1 I = K,L1
        H = X(I+1) - X(I)
    1 R = R + H* (S(I+1)+S(I)-H* (D(I+1)-D(I))*SIXTH)
C**
C** SET VALUE OF INTEGRAL
      QG01AD = .5D0*R*SGN
      
    2 RETURN

      END
