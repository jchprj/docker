@echo off
for /f "tokens=1-2 delims=/" %%i in ("%1") do (
    for /f "tokens=1-2 delims=." %%n in ("%%j") do (
        if Not "%%o"=="" (
            set buildTag=%%n
        ) else (
            set buildTag=latest
        )
        set imageName=%%i
        goto build
    )
)

:build
if %buildTag% == "" (
    set buildTag="latest"
)
echo docker run -it --privileged --rm --name %imageName%_%buildTag% %imageName%:%buildTag%
docker run -it --privileged --rm --name %imageName%_%buildTag% %imageName%:%buildTag%