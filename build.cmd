@echo off
for /f "tokens=1-2 delims=/" %%i in ("%1") do (
    for /f "tokens=1 delims=." %%n in ("%%j") do (
        if Not "%2"=="" (
            set buildTag=%2 
        ) else (
            set buildTag=%%n
        )
        set imageName=%%i
        goto build
    )
)

:build
echo docker build -t %imageName%:%buildTag% -f %1 %imageName%
docker build -t %imageName%:%buildTag% -f %1 %imageName%