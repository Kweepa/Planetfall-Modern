@echo off
if "%~1"=="" goto usage
for /f "tokens=*" %%a in ('forfiles /m %1.zap /c "cmd /c echo @fdate @ftime"')  do set olddate=%%a
\app\zilf\bin\zilf planetfall.zil
for /f "tokens=*" %%a in ('forfiles /m %1.zap /c "cmd /c echo @fdate @ftime"')  do set newdate=%%a
if "%olddate%"=="%newdate%" goto error

\app\zilf\bin\zapf %1.zap
start %1.z5
goto end

:usage
echo [31mUsage error! make [gamename].[0m
goto end

:error
echo [31mCompiler error! Not launching.[0m
goto end

:end