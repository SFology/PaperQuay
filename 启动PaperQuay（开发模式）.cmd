@echo off
rem PaperQuay 开发模式启动器：Vite 热更新（改 UI 时用这个）
rem 修改 electron/ 下主进程文件会自动重启 Electron
setlocal
set "ROOT=%~dp0"
set "PATH=%ROOT%..\.tools\node22;%PATH%"
set "ELECTRON_RUN_AS_NODE="
set "PAPERQUAY_DATA_DIR=%ROOT%.runtime\data"
set "PAPERQUAY_ELECTRON_ARGS=--no-sandbox --disable-gpu"
set "TEMP=%ROOT%.runtime\tmp"
set "TMP=%ROOT%.runtime\tmp"
if not exist "%ROOT%.runtime\tmp" mkdir "%ROOT%.runtime\tmp" 2>nul
cd /d "%ROOT%"
echo [PaperQuay] 开发模式：Vite 在 http://127.0.0.1:1420，窗口出现约需 10-40 秒
call npm run dev