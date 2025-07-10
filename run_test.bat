@echo off
REM Lấy thời gian hiện tại để tạo tên thư mục
for /f %%i in ('powershell -Command "Get-Date -Format yyyy-MM-dd_HH-mm-ss"') do set TIMESTAMP=%%i

REM Tạo thư mục report
set REPORT_DIR=reports\%TIMESTAMP%
mkdir %REPORT_DIR%

REM Chạy robot framework
robot -d %REPORT_DIR% login_test.robot

REM Thông báo
echo  Report saved at: %REPORT_DIR%
pause
