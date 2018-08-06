@echo off
for /f "tokens=1-2 delims=/" %%i in ("%1") do (
    for /f "tokens=1 delims=." %%n in ("%%j") do (
        set buildTag=%%n
        set imageName=%%i
        goto build
    )
)

:build
if %buildTag% == "" (
    set buildTag="latest"
)
echo docker run -it --rm --name %imageName%_%buildTag% %imageName%:%buildTag%
docker run -it --rm --name %imageName%_%buildTag% %imageName%:%buildTag%