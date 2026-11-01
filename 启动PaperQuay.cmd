@echo off
rem PaperQuay 本地启动器（生产模式：直接加载 dist，不启 Vite）
rem - 便携 Node 22：Vite 8 / Electron 42 需要 >= 22.12
rem - ELECTRON_RUN_AS_NODE 必须清空，否则 Electron 退化成纯 Node
rem - 数据/临时文件放在 .runtime\，不写 %APPDATA%
rem - 不传 --disable-gpu：默认启用硬件加速（GPU 渲染对 PDF/滚动很关键）
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
  start "" "%ROOT%node_modules\electron\dist\electron.exe" .
  exit /b 0
)
cd /d "%ROOT%"
call npm run dev