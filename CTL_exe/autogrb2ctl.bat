cd /d %~dp0
@echo off
rem 此程序用于处理NECP FNL资料，并生成.ctl和.idx文件，然后使用grads绘图
:开启延迟变量
setlocal EnableDelayedExpansion
for /r  %%j in (*.grb) do (
set var=%%j
set var=!var:~0,-3!ctl
echo -----------------------------------------------------------------------------------
echo 正在生成.ctl文件,Please wait ...
grib2ctl.exe %%j > !var!
echo -----------------------------------------------------------------------
echo 正在生成.idx索引文件，请稍后...
gribmap.exe -i !var!
  
)
pause