@echo off
REM ============================================================
REM Diagnostic Tool - Check Environment and Preview Merge
REM For Windows users - just double-click this file
REM ============================================================

python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python is not installed or not in PATH
    pause
    exit /b 1
)

python "%~dp0check_merge_environment.py"
pause
