@echo off
REM ============================================================
REM Game Contribution Merge Tool - Interactive Batch Wrapper
REM For Windows users - just double-click this file
REM ============================================================

REM Check if Python is available
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python is not installed or not in PATH
    echo Please install Python 3.6+ from https://www.python.org/
    echo Make sure to check "Add Python to PATH" during installation
    pause
    exit /b 1
)

REM Run the interactive merge script
python "%~dp0merge_contribution_interactive.py"
pause
