@echo off
rem PaperQuay 本地启动器
rem - 便携 Node 22（Vite 8 / Electron 42 需要 >= 22.12）
rem - 清空 ELECTRON_RUN_AS_NODE，否则 Electron 会退化成纯 Node
rem - 数据/临时文件落在 .runtime\，不写 %APPDATA%
rem - 有 dist 产物就走生产模式（秒开、无热更新进程）；没有则回退到 npm run dev
setlocal
set "ROOT=%~dp0"
set "PATH=%ROOT%..\.tools\node22;%PATH%"
set "ELECTRON_RUN_AS_NODE="
set "PAPERQUAY_DATA_DIR=%ROOT%.runtime\data"
set "TEMP=%ROOT%.runtime\tmp"
set "TMP=%ROOT%.runtime\tmp"
if not exist "%ROOT%.runtime\data" mkdir "%ROOT%.runtime\data" 2>nul
if not exist "%ROOT%.runtime\tmp" mkdir "%ROOT%.runtime\tmp" 2>nul
if exist "%ROOT%dist\index.html" (
  cd /d "%ROOT%"
  start "" "%ROOT%node_modules\electron\dist\electron.exe" . --no-sandbox --disable-gpu
  exit /b 0
)
cd /d "%ROOT%"
call npm run dev