@echo off
for /f "tokens=1 delims=/" %%i in ("%1") do (
    echo docker build -t %%i:%2 -f %1 %%i
    docker build -t %%i:%2 -f %1 %%i
)