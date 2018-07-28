@echo off
for /f "tokens=1 delims=/" %%i in ("%1") do (
    echo docker build -t %%i:latest %%i
    docker build -t %%i:latest %%i
)