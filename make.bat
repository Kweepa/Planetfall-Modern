echo off
for /f "tokens=*" %%a in ('forfiles /m %1.zap /c "cmd /c echo @fdate @ftime"')  do set olddate=%%a
\app\zilf\bin\zilf planetfall.zil
for /f "tokens=*" %%a in ('forfiles /m %1.zap /c "cmd /c echo @fdate @ftime"')  do set newdate=%%a
if "%olddate%"=="%newdate%" goto error

setlocal disableDelayedExpansion
set "_rep=	.WORD 1"
>_tmp.zap ( for /f "usebackq delims=" %%A in (%1.zap) do ( if "%%A" equ "	.WORD RELEASEID" (echo %_rep%) else (echo %%A) ) )
del %1.zap
ren _tmp.zap %1.zap
\app\zilf\bin\zapf %1.zap
start %1.z5
goto end

:error
echo [31mCompiler error! Not launching.[0m

:end