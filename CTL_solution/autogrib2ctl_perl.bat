cd /d %~dp0
@echo off
rem �˳������ڴ���NECP FNL���ϣ�������.ctl��.idx�ļ���Ȼ��ʹ��grads��ͼ
:�����ӳٱ���
setlocal EnableDelayedExpansion
for /r  %%j in (*.grb) do (
set var=%%j
set var=!var:~0,-3!ctl
echo -----------------------------------------------------------------------------------
echo ��������.ctl�ļ�,Please wait ...
perl grib2ctl.pl %%j > !var!
echo -----------------------------------------------------------------------
echo ��������.idx�����ļ������Ժ�...
gribmap.exe -i !var!
  
)
pause