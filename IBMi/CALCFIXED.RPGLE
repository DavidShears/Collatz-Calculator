     FRESULT    UF A E             DISK
      * Parameter fields
     D Output          S             10S 0
     D WK#Result       S             10S 0
     D Remainder       S             10S 0
     D Counter         S             10S 0
     D P#Input         S             10A
      **********************************************************************
      * CALCULATION SPECS
      **********************************************************************
     C                   Move(P)   P#Input       WK#Result
     C                   Dou       Output = 1

     C                   Eval      InputNo = WK#Result

     C                   If        %REM(WK#Result:2) = 1
     C                   Eval      Output = ((WK#Result*3)+1)
     C                   Else
     C                   Eval      Output = (WK#Result/2)
     C                   EndIf

     C                   Eval      Counter = Counter + 1
     C                   Eval      WK#Result = Output
      * Output to file
     C                   Eval      OutputNo = OutPut
     C                   Eval      StepNo = Counter
     C                   Write     CALCR

     C                   EndDo

     C                   Seton                                        LR
      *
      * Initialization Subroutine
      *
     C     *INZSR        Begsr
     C     *ENTRY        PLIST
     C                   Parm                    P#Input
     C                   Endsr
