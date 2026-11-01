@echo off
rem 把便携版数据复制给"安装版"（安装版数据在 %APPDATA%）
rem 用法：先安装 PaperQuay-0.1.25-win-x64.exe，再双击本脚本，然后打开安装版
setlocal
set "SRC=%~dp0.runtime\data\PaperQuay"
set "DST=%APPDATA%\paperquay\PaperQuay"
if not exist "%SRC%" (
  echo [跳过] 没找到便携数据: %SRC%
  pause & exit /b 1
)
if not exist "%DST%" mkdir "%DST%"
echo 从 %SRC%
echo 复制到 %DST%
xcopy "%SRC%\*" "%DST%\" /E /I /Y >nul
if %ERRORLEVEL%==0 (echo [完成] 安装版下次启动就能看到同样的文献库/笔记) else (echo [失败] 请关闭正在运行的 PaperQuay 后重试)
pause