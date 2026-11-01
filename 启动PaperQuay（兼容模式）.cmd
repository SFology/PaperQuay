@echo off
rem PaperQuay 兼容模式：禁用 GPU + 关闭沙箱
rem 仅在正常启动白屏/花屏/闪退时使用（会明显变慢，别日常用）
setlocal
set "ROOT=%~dp0"
set "PATH=%ROOT%..\.tools\node22;%PATH%"
set "ELECTRON_RUN_AS_NODE="
set "PAPERQUAY_DATA_DIR=%ROOT%.runtime\data"
set "TEMP=%ROOT%.runtime\tmp"
set "TMP=%ROOT%.runtime\tmp"
cd /d "%ROOT%"
start "" "%ROOT%node_modules\electron\dist\electron.exe" . --no-sandbox --disable-gpu