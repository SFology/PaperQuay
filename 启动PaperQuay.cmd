@echo off
rem PaperQuay 本地启动器（便携模式）
rem 1) 使用 .tools\node22 里的 Node 22（Vite 8 / Electron 42 需要 >= 22.12）
rem 2) 清空 ELECTRON_RUN_AS_NODE，否则 Electron 会退化成纯 Node 运行
rem 3) 数据与临时文件都放在本目录 .runtime\ 下，不写入 %APPDATA%
setlocal
set "ROOT=%~dp0"
set "NODE22=%ROOT%..\.tools\node22"
set "PATH=%NODE22%;%PATH%"
set "ELECTRON_RUN_AS_NODE="
set "PAPERQUAY_DATA_DIR=%ROOT%.runtime\data"
set "PAPERQUAY_ELECTRON_ARGS=--no-sandbox --disable-gpu"
set "TEMP=%ROOT%.runtime\tmp"
set "TMP=%ROOT%.runtime\tmp"
if not exist "%TEMP%" mkdir "%TEMP%" 2>nul
cd /d "%ROOT%"
echo [PaperQuay] Node: && node -v
echo [PaperQuay] 数据目录: %PAPERQUAY_DATA_DIR%
echo [PaperQuay] 首次启动会编译前端，窗口出现需要 10-30 秒...
call npm run dev
