@echo off
\app\zilf\bin\zilf planetfall.zil
setlocal disableDelayedExpansion
set "_rep=	.WORD 1"
>_tmp.zap ( for /f "usebackq delims=" %%A in (planetfall.zap) do ( if "%%A" equ "	.WORD RELEASEID" (echo %_rep%) else (echo %%A) ) )
del planetfall.zap
ren _tmp.zap planetfall.zap
\app\zilf\bin\zapf planetfall.zap
start planetfall.z5