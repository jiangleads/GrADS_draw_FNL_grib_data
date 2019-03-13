cd /d %~dp0
@echo off
rem 此程序用于处理NECP FNL资料，并生成.ctl和.idx文件，然后使用grads绘图
:开启延迟变量
setlocal EnableDelayedExpansion
for /r  %%j in (*.ctl) do (
set var=%%j
echo -----------------------------------------------------------------------
echo 正在生成.idx索引文件，请稍后...
gribmap.exe -i !var!
  
)
pause