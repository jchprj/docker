@echo off
set buildTag=latest
set imageName=
if "%2"=="1" goto build1
if "%2"=="2" goto build2
if Not "%2"=="" (
    set buildTag=%2 
    goto build1
)
goto exit

:build1
for /f "tokens=1 delims=/" %%i in ("%1") do (
    set imageName=%%i
    goto build
)

:build2
for /f "tokens=1-2 delims=/" %%i in ("%1") do (
    for /f "tokens=1 delims=." %%n in ("%%j") do (
        set buildTag=%%n
        set imageName=%%i
        goto build
    )
)

:build
echo docker build -t %imageName%:%buildTag% -f %1 %imageName%
REM docker build -t %%i:%buildTag% -f %1 %%i

:exit