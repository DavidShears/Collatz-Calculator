        Dcl-F RESULT Usage(*Update:*Delete:*Output);
        //Parameter fields
        Dcl-S Output       Zoned(10:0);
        Dcl-S WK#Result    Zoned(10:0);
        Dcl-S Remainder    Zoned(10:0);
        Dcl-S Counter      Zoned(10:0);
        Dcl-S P#Input      Char(10);
        //*********************************************************************
        //CALCULATION SPECS
        //*********************************************************************
        WK#Result = %dec(P#Input:10:0);
        DOU Output = 1;

          InputNo = WK#Result;

          IF %REM(WK#Result:2) = 1;
            Output = ((WK#Result*3)+1);
          ELSE;
            Output = (WK#Result/2);
          ENDIF;

          Counter = Counter + 1;
          WK#Result = Output;
          //Output to file
          OutputNo = OutPut;
          StepNo = Counter;
          WRITE CALCR;

        ENDDO;

        *InLR = *On;
      *
      * Initialization Subroutine
      *
     C     *INZSR        Begsr
     C     *ENTRY        PLIST
     C                   Parm                    P#Input
     C                   Endsr
