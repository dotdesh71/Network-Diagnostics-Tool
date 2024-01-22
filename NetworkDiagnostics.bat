@echo off
title Network Diagnostics

echo Network Diagnostics

REM Check for administrative privileges
>nul 2>&1 net session
if %errorLevel% neq 0 (
    echo Please run this script as an administrator.
    pause
    exit /b
)

REM Display user-friendly information
echo.
echo [Step 1] Retrieving IP configuration...
ipconfig /all

REM Ping a user-specified server
set /p targetServer="Enter the IP address or hostname to ping (e.g., 8.8.8.8): "
if "%targetServer%"=="" set targetServer=8.8.8.8
echo.
echo [Step 2] Pinging %targetServer%...
ping -n 4 %targetServer%

REM Trace route to a user-specified server
set /p traceServer="Enter the IP address or hostname to trace route (e.g., 8.8.8.8): "
if "%traceServer%"=="" set traceServer=8.8.8.8
echo.
echo [Step 3] Tracing route to %traceServer%...
tracert %traceServer%

echo.
echo Network Diagnostics completed.
pause
