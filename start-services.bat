@echo off
echo ============================================
echo   SmartHealth-Bot - Local Hosting Script
echo ============================================
echo.

REM Set base directory
cd /d "%~dp0"

REM ============================================
REM Step 1: Start AI Model Service (port 5002)
REM ============================================
echo [1/3] Starting AI Model Service on port 5002...
start "SmartHealthBot AI Model" /min cmd /c "cd /d "%cd%\ai-model" && "venv\Scripts\python.exe" app.py"
timeout /t 8 /nobreak > nul

REM ============================================
REM Step 2: Start Backend Server (port 5001)
REM ============================================
echo [2/3] Starting Backend Server on port 5001...
start "SmartHealthBot Server" /min cmd /c "cd /d "%cd%\server" && node server.js"
timeout /t 4 /nobreak > nul

REM ============================================
REM Step 3: Start Frontend Client (port 5174)
REM ============================================
echo [3/3] Starting Frontend Client on port 5174...
start "SmartHealthBot Client" /min cmd /c "cd /d "%cd%\client" && npm run dev"
timeout /t 6 /nobreak > nul

echo.
echo ============================================
echo   All services started successfully!
echo ============================================
echo   AI Model : http://localhost:5002
echo   Server   : http://localhost:5001
echo   App      : http://localhost:5174
echo ============================================
echo.
echo Opening application in browser...
start http://localhost:5174
echo.
echo To STOP all SmartHealthBot services, close the three
echo minimized windows (AI Model, Server, Client).
pause
