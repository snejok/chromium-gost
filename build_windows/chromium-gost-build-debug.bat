cd /d %~dp0
call chromium-gost-env.bat
set PATH=%DEPOT_TOOLS_PATH%;%PATH%
set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set GYP_MSVS_VERSION=2015

cd %CHROMIUM_PATH%
call gn gen out\DEBUG --args="is_debug=true is_component_build=true target_cpu=\"x86\" remove_webcore_debug_symbols=true"
call ninja -C out\DEBUG -j 16 mini_installer
pause
